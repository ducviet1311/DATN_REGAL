import { useState, useEffect } from "react";
import ReactPaginate from "react-paginate";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { getMethod, postMethodPayload, deleteMethod } from "../../services/request";
import Swal from "sweetalert2";
import * as XLSX from "xlsx";
import { saveAs } from "file-saver";

const AdminKichCo = () => {
    const [items, setItems] = useState([]);
    const [item, setItem] = useState(null);
    const [searchTerm, setSearchTerm] = useState("");
    const [currentPage, setCurrentPage] = useState(0);
    const [pageCount, setPageCount] = useState(0);
    const size = 5;

    useEffect(() => {
        fetchKichCo(currentPage, searchTerm);
    }, [currentPage, searchTerm]);

    const fetchKichCo = async (page, search) => {
        let url = `/api/kich-co/all?size=${size}&sort=id,desc&page=${page}`;
        if (search.trim() !== "") {
            url += `&tenKichCo=${search}`; // Giả sử backend hỗ trợ tìm kiếm theo tên
        }
        const response = await getMethod(url);
        const result = await response.json();
        setItems(result.content);
        setPageCount(result.totalPages);
    };

    const exportToExcel = () => {
        const worksheet = XLSX.utils.json_to_sheet(items);
        const workbook = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(workbook, worksheet, "Sheet1");
        const excelBuffer = XLSX.write(workbook, {
            bookType: "xlsx",
            type: "array",
        });
        const blob = new Blob([excelBuffer], { type: "application/octet-stream" });
        saveAs(blob, `DanhSachKichCo.xlsx`);
    };

    async function saveData(event) {
        event.preventDefault();

        const kichCo = event.target.elements.catename.value.trim();
        const status = parseInt(document.querySelector('input[name="status"]:checked').value, 10);
        const user = JSON.parse(localStorage.getItem("user"));

        if (!kichCo) {
            toast.error("Kích cỡ không được để trống.");
            return;
        }
        const kichCoNumber = parseInt(kichCo, 10);
        if (isNaN(kichCoNumber)) {
            toast.error("Kích cỡ phải là số nguyên.");
            return;
        }
        if (kichCoNumber < 35 || kichCoNumber > 45) {
            toast.error("Kích cỡ phải nằm trong khoảng từ 35 đến 45.");
            return;
        }

        const checkResponse = await getMethod(`/api/kich-co/check?tenKichCo=${kichCo}`);
        if (checkResponse.status < 300) {
            const isDuplicate = await checkResponse.json();
            if (isDuplicate && (!item || item.tenKichCo !== kichCo)) {
                toast.error("Kích cỡ đã tồn tại.");
                return;
            }
        }

        const payload = {
            tenKichCo: kichCo,
            nguoiTao: user.maNhanVien,
            nguoiCapNhat: user.maNhanVien,
            trangThai: status,
        };

        if (item != null) {
            payload.nguoiTao = item.nguoiTao;
        }

        var url = "/api/kich-co";
        if (item != null) {
            url += "/" + item.id;
        }

        const res = await postMethodPayload(url, payload);

        if (res.status < 300) {
            toast.success("Thêm Kích Cỡ Thành Công!");
            await new Promise((resolve) => setTimeout(resolve, 1000));
            fetchKichCo(currentPage, searchTerm); // Cập nhật danh sách sau khi thêm/cập nhật
            document.querySelector(".btn-close").click(); // Đóng modal
        } else if (res.status === 417) {
            const result = await res.json();
            toast.error(result.defaultMessage);
        } else if (res.status > 300) {
            const result = await res.json();
            toast.error(result.message);
        }
    }

    async function deleteData(id) {
        Swal.fire({
            title: "Xác nhận xóa",
            text: "Bạn có chắc chắn muốn xóa mục này không?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "Xóa",
            cancelButtonText: "Hủy",
            reverseButtons: true,
        }).then(async (result) => {
            if (result.isConfirmed) {
                const response = await deleteMethod("/api/kich-co/" + id);
                if (response.status < 300) {
                    toast.success("Xóa thành công!");
                    fetchKichCo(currentPage, searchTerm);
                } else if (response.status === 417) {
                    const result = await response.json();
                    toast.warning(result.defaultMessage);
                } else {
                    toast.warning("Xóa thất bại");
                }
            }
        });
    }

    function handleSearchClick() {
        setCurrentPage(0); // Reset về trang đầu khi tìm kiếm
        fetchKichCo(0, searchTerm);
    }

    function handleShowAllClick() {
        setSearchTerm("");
        setCurrentPage(0);
        fetchKichCo(0, "");
    }

    function clearInput() {
        setItem(null);
    }

    const handlePageClick = (data) => {
        const selectedPage = data.selected;
        setCurrentPage(selectedPage);
    };

    return (
        <>
            <div className="headerpageadmin d-flex justify-content-between align-items-center p-3 bg-light border">
                <strong className="text-left">
                    <i className="fa fa-list"></i> Quản lý kích cỡ
                </strong>
                <div className="search-wrapper d-flex align-items-center justify-content-between">
                    <div className="search-container d-flex align-items-center bg-light p-2 rounded shadow-sm">
                        <input
                            type="text"
                            placeholder="Tìm kiếm theo tên"
                            className="form-control border-0 shadow-none"
                            value={searchTerm}
                            onChange={(e) => setSearchTerm(e.target.value)}
                            style={{ flex: 1 }}
                        />
                        <button className="btn btn-primary ms-2" onClick={handleSearchClick}>
                            <i className="fa fa-search"></i> Tìm kiếm
                        </button>
                        <button className="btn btn-secondary ms-2" onClick={handleShowAllClick}>
                            <i className="fa fa-list"></i> Làm mới
                        </button>
                    </div>
                    <button
                        onClick={() => clearInput()}
                        data-bs-toggle="modal"
                        data-bs-target="#addcate"
                        className="btn btn-success ms-3"
                    >
                        <i className="fa fa-plus"></i> Thêm mới
                    </button>
                </div>
            </div>
            <div className="tablediv">
                <div className="headertable">
                    <span className="lbtable">Danh sách kích cỡ</span>
                </div>
                <div className="divcontenttable">
                    <table id="example" className="table table-bordered">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên kích cỡ</th>
                            <th>Người tạo</th>
                            <th>Người cập nhật</th>
                            <th>Trạng thái</th>
                            <th className="sticky-col">Hành động</th>
                        </tr>
                        </thead>
                        <tbody>
                        {items.map((item, index) => {
                            const stt = currentPage * size + index + 1;
                            return (
                                <tr key={item.id}>
                                    <td>{stt}</td>
                                    <td>{item.tenKichCo}</td>
                                    <td>{item.nguoiTao}</td>
                                    <td>{item.nguoiCapNhat}</td>
                                    <td
                                        style={{
                                            textAlign: "center",
                                            color: item.trangThai === 0 ? "#6c757d" : "#155724",
                                        }}
                                    >
                                        {item.trangThai === 0 ? "Không sử dụng" : "Đang sử dụng"}
                                    </td>
                                    <td
                                        className="sticky-col"
                                        style={{ display: "flex", justifyContent: "center", alignItems: "center" }}
                                    >
                                        <a
                                            onClick={() => setItem(item)}
                                            data-bs-toggle="modal"
                                            data-bs-target="#addcate"
                                            className="edit-btn"
                                        >
                                            <i className="fa fa-edit"></i>
                                        </a>
                                        {/*<button onClick={() => deleteData(item.id)} className="delete-btn">*/}
                                        {/*    <i className="fa fa-trash"></i>*/}
                                        {/*</button>*/}
                                    </td>
                                </tr>
                            );
                        })}
                        </tbody>
                    </table>
                    <div style={{ display: "flex", justifyContent: "center", alignItems: "center" }}>
                        <ReactPaginate
                            marginPagesDisplayed={2}
                            pageCount={pageCount}
                            onPageChange={handlePageClick}
                            containerClassName={"pagination"}
                            pageClassName={"page-item"}
                            pageLinkClassName={"page-link"}
                            previousClassName="page-item"
                            previousLinkClassName="page-link"
                            nextClassName="page-item"
                            nextLinkClassName="page-link"
                            breakClassName="page-item"
                            breakLinkClassName="page-link"
                            previousLabel="Trang trước"
                            nextLabel="Trang sau"
                            activeClassName="active"
                            forcePage={currentPage}
                        />
                    </div>
                </div>
            </div>

            <div className="modal fade" id="addcate" tabIndex="-1" aria-labelledby="exampleModalLabel" aria-hidden="false">
                <div className="modal-dialog modal-lg">
                    <div className="modal-content">
                        <div className="modal-header">
                            <h5 className="modal-title">
                                {item ? 'Cập nhật kích cỡ' : 'Thêm mới kích cỡ'}
                            </h5>
                            <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div className="modal-body">
                            <form className="col-sm-5 marginauto" onSubmit={saveData} method="post">
                                <label>Tên kích cỡ</label>
                                <input
                                    defaultValue={item?.tenKichCo || ""}
                                    name="catename"
                                    id="catename"
                                    type="text"
                                    className="form-control"
                                />
                                <br />
                                <label>Trạng thái</label>
                                <div className="form-check">
                                    <input
                                        className="form-check-input"
                                        type="radio"
                                        name="status"
                                        id="status1"
                                        value="1"
                                        defaultChecked={item?.trangThai === 1 || !item}
                                    />
                                    <label className="form-check-label" htmlFor="status1">
                                        Đang sử dụng
                                    </label>
                                </div>
                                <div className="form-check">
                                    <input
                                        className="form-check-input"
                                        type="radio"
                                        name="status"
                                        id="status0"
                                        value="0"
                                        defaultChecked={item?.trangThai === 0}
                                    />
                                    <label className="form-check-label" htmlFor="status0">
                                        Không sử dụng
                                    </label>
                                </div>
                                <br />
                                <button type="submit" className="btn btn-success form-control action-btn">
                                    {item ? "Cập nhật" : "Thêm mới"}
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </>
    );
};

export default AdminKichCo;