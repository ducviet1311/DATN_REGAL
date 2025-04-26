import { useState, useEffect } from "react";
import ReactPaginate from "react-paginate";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { getMethod, deleteMethod } from "../../services/request";
import Swal from "sweetalert2";
import { formatMoney } from "../../services/money";
import * as XLSX from "xlsx";
import { saveAs } from "file-saver";

const AdminProduct = () => {
    const [items, setItems] = useState([]);
    const [searchTerm, setSearchTerm] = useState("");
    const [currentPage, setCurrentPage] = useState(0);
    const [pageCount, setPageCount] = useState(0);
    const size = 5;

    useEffect(() => {
        fetchProducts(currentPage, searchTerm);
    }, [currentPage, searchTerm]);

    const fetchProducts = async (page, search) => {
        let url = `/api/san-pham/public/all?size=${size}&sort=id,desc&page=${page}`;
        if (search.trim() !== "") {
            url = `/api/san-pham/public/tim-theo-ten?search=${search}&size=${size}&sort=id,desc&page=${page}`;
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
        saveAs(blob, `DanhSachSanPham.xlsx`);
    };

    async function deleteProduct(id) {
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
                const response = await deleteMethod("/api/san-pham/" + id);
                if (response.status < 300) {
                    toast.success("Xóa thành công!");
                    fetchProducts(currentPage, searchTerm);
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
        fetchProducts(0, searchTerm);
    }

    function handleShowAllClick() {
        setSearchTerm("");
        setCurrentPage(0);
        fetchProducts(0, "");
    }

    const handlePageClick = (data) => {
        const selectedPage = data.selected;
        setCurrentPage(selectedPage);
    };

    return (
        <>
            <div className="headerpageadmin d-flex justify-content-between align-items-center p-3 bg-light border">
                <strong className="text-left">
                    <i className="fa fa-list"></i> Quản Lý Sản Phẩm
                </strong>
                <div className="search-wrapper d-flex align-items-center">
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
                    <a href="add-product" className="btn btn-primary ms-2">
                        <i className="fa fa-plus"></i>
                    </a>
                    {/*<a href="#" onClick={exportToExcel} className="btn btn-success ms-2">*/}
                    {/*    <i className="fa fa-excel-o"></i> Excel*/}
                    {/*</a>*/}
                </div>
            </div>
            <div className="tablediv">
                <div className="headertable">
                    <span className="lbtable">List product</span>
                </div>
                <div className="divcontenttable">
                    <table id="example" className="table table-bordered">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Mã sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Thương hiệu</th>
                            <th>Chất liệu</th>
                            <th>Đế giày</th>
                            <th>Ngày tạo</th>
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
                                    <td>{item.maSanPham}</td>
                                    <td>{item.tenSanPham}</td>
                                    <td>{item.thuongHieu?.tenThuongHieu}</td>
                                    <td>{item.chatLieu?.tenChatLieu}</td>
                                    <td>{item.deGiay?.tenDeGiay}</td>
                                    <td>{item.ngayTao}</td>
                                    <td>{item.nguoiTao}</td>
                                    <td>{item.nguoiCapNhat}</td>
                                    <td>{item.trangThai==1?"Còn hàng":"Hết hàng"}</td>
                                    <td className="sticky-col">
                                        <a href={"add-product?id=" + item.id} className="edit-btn">
                                            <i className="fa fa-edit"></i>
                                        </a>
                                        <a
                                            // target="_blank"
                                            href={"sanphamchitiet?sanpham=" + item.id}
                                            className="edit-btn"
                                        >
                                            <i className="fa fa-eye"></i>
                                        </a>
                                        <button onClick={() => deleteProduct(item.id)} className="delete-btn">
                                            <i className="fa fa-trash"></i>
                                        </button>
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
        </>
    );
};

export default AdminProduct;