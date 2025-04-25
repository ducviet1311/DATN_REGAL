import { useState, useEffect } from 'react'
import ReactPaginate from 'react-paginate';
import {toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { getMethod ,postMethodPayload, deleteMethod} from '../../services/request';
import Swal from 'sweetalert2';
import * as XLSX from "xlsx";
import { saveAs } from 'file-saver';

const AdminTrademark = ()=>{
    const size = 5;
    const [items, setItems] = useState([]);
    const [cate, setCate] = useState(null);
    const [searchTerm, setSearchTerm] = useState('');
    const [pageCount, setPageCount] = useState(0);
    const [currentPage, setCurrentPage] = useState(0);
    const [url, setUrl] = useState(`/api/thuong-hieu/all?&size=${size}&sort=id,desc&page=`);

    useEffect(()=>{
        getThuongHieu();
    }, []);

    const exportToExcel = () => {
        const worksheet = XLSX.utils.json_to_sheet(items);
        const workbook = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(workbook, worksheet, 'Sheet1');
        const excelBuffer = XLSX.write(workbook, {
            bookType: 'xlsx',
            type: 'array',
        });
        const blob = new Blob([excelBuffer], { type: 'application/octet-stream' });
        saveAs(blob, `DanhSachThuongHieu.xlsx`);
    };

    async function saveCategory(event) {
        event.preventDefault();
        const id = event.target.elements.idcate.value;
        const brandName = event.target.elements.catename.value;
        const status = parseInt(event.target.elements.status.value);

        // Validate input
        if (!brandName.trim()) {
            toast.error("Tên thương hiệu không được để trống.");
            return;
        }
        if (brandName.length > 255) {
            toast.error("Tên thương hiệu không được quá 255 ký tự.");
            return;
        }

        const user = JSON.parse(localStorage.getItem("user"));
        if (!user) {
            toast.error("Không thể xác thực người dùng.");
            return;
        }

        const payload = {
            tenThuongHieu: brandName,
            nguoiTao: user.maNhanVien,
            nguoiCapNhat: user.maNhanVien,
            trangThai: status,
        };

        // Keep original creator when updating
        if (id) {
            payload.nguoiTao = cate.nguoiTao;
        }

        const apiUrl = id ? `/api/thuong-hieu/${id}` : '/api/thuong-hieu';

        try {
            const res = await postMethodPayload(apiUrl, payload);

            if (res.status < 300) {
                toast.success(id ? 'Cập nhật thành công!' : 'Thêm mới thành công!');
                setTimeout(() => window.location.reload(), 1000);
            } else if (res.status === 417) {
                const result = await res.json();
                toast.error(result.defaultMessage);
            } else {
                const result = await res.json();
                toast.error(result.message || "Đã xảy ra lỗi");
            }
        } catch (error) {
            toast.error("Đã xảy ra lỗi khi kết nối với server.");
        }
    }

    const getThuongHieu = async(page = 0) =>{
        try {
            const response = await getMethod(`${url}${page}`);
            const result = await response.json();
            setItems(result.content);
            setPageCount(result.totalPages);
        } catch (error) {
            toast.error("Lỗi khi tải dữ liệu thương hiệu");
        }
    };

    async function deleteCategory(id){
        const result = await Swal.fire({
            title: 'Xác nhận xóa?',
            text: "Bạn có chắc chắn muốn xóa thương hiệu này?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Xóa',
            cancelButtonText: 'Hủy'
        });

        if (result.isConfirmed) {
            const response = await deleteMethod(`/api/thuong-hieu/${id}`);
            if (response.status < 300) {
                toast.success("Xóa thành công!");
                getThuongHieu(currentPage);
            } else if (response.status === 417) {
                const result = await response.json();
                toast.warning(result.defaultMessage);
            }
        }
    }

    async function getData(searchTerm = '') {
        try {
            const response = await getMethod('/api/thuong-hieu');
            let result = await response.json();
            if (searchTerm.trim() !== '') {
                result = result.filter(item =>
                    item.tenThuongHieu.toLowerCase().includes(searchTerm.toLowerCase())
                );
            }
            setItems(result);
        } catch (error) {
            toast.error("Lỗi khi tìm kiếm dữ liệu");
        }
    }

    function handleShowAllClick() {
        setSearchTerm('');
        setCurrentPage(0);
        getThuongHieu();
    }

    function handleSearchClick() {
        if (searchTerm.trim() === '') {
            toast.warning("Vui lòng nhập từ khóa để tìm kiếm");
        } else {
            getData(searchTerm);
        }
    }

    function clearInput(){
        setCate(null);
    }

    const handlePageClick = async (data) => {
        const newPage = data.selected;
        await getThuongHieu(newPage);
        setCurrentPage(newPage);
    }

    return (
        <>
            <div className="headerpageadmin d-flex justify-content-between align-items-center p-3 bg-light border">
                <strong className="text-left"><i className='fa fa-list'></i> Quản lý thương hiệu</strong>
                <div className="search-wrapper d-flex align-items-center justify-content-between">
                    <div className="search-container d-flex align-items-center bg-light p-2 rounded shadow-sm">
                        <input
                            type="text"
                            placeholder="Tìm kiếm theo tên"
                            className="form-control border-0 shadow-none"
                            value={searchTerm}
                            onChange={(e) => setSearchTerm(e.target.value)}
                            onKeyPress={(e) => e.key === 'Enter' && handleSearchClick()}
                            style={{flex: 1}}
                        />
                        <button className="btn btn-primary ms-2" onClick={handleSearchClick}>
                            <i className="fa fa-search"></i> Tìm kiếm
                        </button>
                        <button className="btn btn-secondary ms-2" onClick={handleShowAllClick}>
                            <i className="fa fa-list"></i> Làm Mới
                        </button>
                    </div>
                    <button onClick={clearInput} data-bs-toggle="modal" data-bs-target="#addcate"
                            className="btn btn-success ms-3">
                        <i className='fa fa-plus'></i> Thêm mới
                    </button>
                </div>
            </div>

            <div className="tablediv">
                <div className="headertable">
                    <span className="lbtable">Danh sách thương hiệu</span>
                </div>
                <div className="divcontenttable">
                    <table className="table table-bordered">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên thương hiệu</th>
                            <th>Người tạo</th>
                            <th>Người cập nhật</th>
                            <th>Trạng thái</th>
                            <th className="sticky-col">Hành động</th>
                        </tr>
                        </thead>
                        <tbody>
                        {items.map((item, index) => {
                            const stt = currentPage * size + index + 1;
                            const statusColor = item.trangThai === 0 ? "#6c757d" : "#155724";
                            const statusText = item.trangThai === 0 ? "Không sử dụng" : "Đang sử dụng";

                            return (
                                <tr key={item.id}>
                                    <td>{stt}</td>
                                    <td>{item.tenThuongHieu}</td>
                                    <td>{item.nguoiTao}</td>
                                    <td>{item.nguoiCapNhat}</td>
                                    <td style={{ textAlign: "center", color: statusColor }}>
                                        {statusText}
                                    </td>
                                    <td className="sticky-col" style={{ display: 'flex', justifyContent: 'center' }}>
                                        <button
                                            onClick={() => setCate(item)}
                                            data-bs-toggle="modal"
                                            data-bs-target="#addcate"
                                            className="edit-btn"
                                        >
                                            <i className='fa fa-edit'></i>
                                        </button>
                                        {/*<button*/}
                                        {/*    onClick={() => deleteCategory(item.id)}*/}
                                        {/*    className="delete-btn ms-2"*/}
                                        {/*>*/}
                                        {/*    <i className='fa fa-trash'></i>*/}
                                        {/*</button>*/}
                                    </td>
                                </tr>
                            );
                        })}
                        </tbody>
                    </table>

                    {pageCount > 1 && (
                        <div className="d-flex justify-content-center">
                            <ReactPaginate
                                marginPagesDisplayed={2}
                                pageCount={pageCount}
                                onPageChange={handlePageClick}
                                containerClassName={'pagination'}
                                pageClassName={'page-item'}
                                pageLinkClassName={'page-link'}
                                previousClassName='page-item'
                                previousLinkClassName='page-link'
                                nextClassName='page-item'
                                nextLinkClassName='page-link'
                                breakClassName='page-item'
                                breakLinkClassName='page-link'
                                previousLabel='Trang trước'
                                nextLabel='Trang sau'
                                activeClassName='active'
                                forcePage={currentPage}
                            />
                        </div>
                    )}
                </div>
            </div>

            <div className="modal fade" id="addcate" tabIndex="-1" aria-hidden="true">
                <div className="modal-dialog modal-lg">
                    <div className="modal-content">
                        <div className="modal-header">
                            <h5 className="modal-title">
                                {cate ? 'Cập nhật thương hiệu' : 'Thêm mới thương hiệu'}
                            </h5>
                            <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div className="modal-body">
                            <form className="col-sm-5 marginauto" onSubmit={saveCategory}>
                                <input type="hidden" name="idcate" value={cate?.id || ''} />

                                <div className="mb-3">
                                    <label className="form-label">Tên thương hiệu</label>
                                    <input
                                        type="text"
                                        className="form-control"
                                        name="catename"
                                        defaultValue={cate?.tenThuongHieu || ''}
                                        required
                                    />
                                </div>

                                <div className="mb-3">
                                    <label className="form-label">Trạng thái</label>
                                    <div className="form-check">
                                        <input
                                            className="form-check-input"
                                            type="radio"
                                            name="status"
                                            id="status1"
                                            value="1"
                                            defaultChecked={!cate || cate?.trangThai === 1}
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
                                            defaultChecked={cate?.trangThai === 0}
                                        />
                                        <label className="form-check-label" htmlFor="status0">
                                            Không sử dụng
                                        </label>
                                    </div>
                                </div>

                                <button type="submit" className="btn btn-success w-100">
                                    {cate ? 'Cập nhật' : 'Thêm mới'}
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </>
    );
}

export default AdminTrademark;