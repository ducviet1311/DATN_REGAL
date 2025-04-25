import { useState, useEffect } from "react";
import ReactPaginate from "react-paginate";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import {
  getMethod,
  postMethodPayload,
  deleteMethod,
} from "../../services/request";
import Swal from "sweetalert2";
import * as XLSX from "xlsx";
import { saveAs } from "file-saver";

var size = 5;
var url = "/api/chat-lieu/all?&size=" + size + "&sort=id,desc&page=";
const AdminDeGiay = () => {
  const [items, setItems] = useState([]);
  const [item, setItem] = useState(null);
  const [searchTerm, setSearchTerm] = useState("");
  const [pageCount, setPageCount] = useState(0);
  const [currentPage, setCurrentPage] = useState(0);

  useEffect(() => {
    getDeGiay();
  }, []);

  const exportToExcel = () => {
    const worksheet = XLSX.utils.json_to_sheet(items);
    const workbook = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(workbook, worksheet, "Sheet1");
    const excelBuffer = XLSX.write(workbook, {
      bookType: "xlsx",
      type: "array",
    });
    const blob = new Blob([excelBuffer], { type: "application/octet-stream" });
    saveAs(blob, `DanhSachChatLieu.xlsx`);
  };

  async function handleSubmit(event) {
    event.preventDefault();
    const form = event.target;
    const catename = form.catename.value.trim();
    const status = parseInt(form.status.value);

    // Validate chung
    if (!catename) {
      toast.error("Tên Chất Liệu không được để trống.");
      return;
    }
    if (catename.length > 255) {
      toast.error("Tên Chất Liệu không được quá 255 ký tự.");
      return;
    }

    // Kiểm tra trùng tên
    const isDuplicate = items.some(i =>
        i.tenChatLieu.toLowerCase() === catename.toLowerCase() &&
        (!item || i.id !== item.id)
    );

    if (isDuplicate) {
      toast.error("Tên Chất Liệu đã tồn tại");
      return;
    }

    const user = JSON.parse(localStorage.getItem("user"));
    const payload = {
      tenChatLieu: catename,
      trangThai: status,
      nguoiCapNhat: user.maNhanVien
    };

    // Nếu là cập nhật (có item)
    if (item) {
      payload.nguoiTao = item.nguoiTao; // Giữ nguyên người tạo
      var url = `/api/chat-lieu/${item.id}`;
    } else {
      payload.nguoiTao = user.maNhanVien; // Thêm người tạo mới
      var url = '/api/chat-lieu';
    }

    try {
      const res = await postMethodPayload(url, payload);

      if (res.status < 300) {
        toast.success(item ? "Cập nhật thành công!" : "Thêm mới thành công!");
        await new Promise(resolve => setTimeout(resolve, 1000));
        window.location.reload();
      } else {
        const result = await res.json();
        toast.error(result.message || result.defaultMessage || "Có lỗi xảy ra");
      }
    } catch (error) {
      toast.error("Lỗi kết nối đến server");
      console.error(error);
    }
  }

  async function getData(searchTerm = "") {
    const response = await getMethod("/api/chat-lieu");
    let result = await response.json();
    if (searchTerm.trim() !== "") {
      result = result.filter((item) =>
          item.tenChatLieu.toLowerCase().includes(searchTerm.toLowerCase())
      );
    }
    setItems(result);
  }

  const getDeGiay = async () => {
    var response = await getMethod(
        "/api/chat-lieu/all?&size=" + size + "&sort=id,desc&page=" + 0
    );
    var result = await response.json();
    console.log(result);
    setItems(result.content);
    setPageCount(result.totalPages);
    url = "/api/chat-lieu/all?&size=" + size + "&sort=id,desc&page=";
  };

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
        const response = await deleteMethod("/api/chat-lieu/" + id);
        if (response.status < 300) {
          toast.success("Xóa thành công!");
          getData();
        } else if (response.status === 417) {
          const result = await response.json();
          toast.warning(result.defaultMessage);
        } else {
          toast.warning("Xóa thất bại");
        }
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        console.log("Hủy thao tác xóa.");
      }
    });
  }
  function handleShowAllClick() {
    setSearchTerm(""); // Đặt lại từ khóa tìm kiếm
    setCurrentPage(0);
    getDeGiay(); // Lấy lại toàn bộ dữ liệu
  }
  function handleSearchClick() {
    if (searchTerm.trim() === "") {
      toast.warning("Vui lòng nhập từ khóa để tìm kiếm."); // Hiển thị thông báo nếu không có từ khóa
    } else {
      getData(searchTerm); // Gọi API với từ khóa tìm kiếm
    }
  }

  function clearInput() {
    setItem(null);
  }

  const handlePageClick = async (data) => {
    var currentPage = data.selected;
    var response = await getMethod(url + currentPage);
    var result = await response.json();
    setItems(result.content);
    setPageCount(result.totalPages);
    setCurrentPage(currentPage);
  };

  return (
      <>
        <div className="headerpageadmin d-flex justify-content-between align-items-center p-3 bg-light border">
          <strong class="text-left">
            <i className="fa fa-list"></i> Quản lý Chất Liệu
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
              <button
                  className="btn btn-primary ms-2"
                  onClick={handleSearchClick}
              >
                <i className="fa fa-search"></i> Tìm kiếm
              </button>
              <button
                  className="btn btn-secondary ms-2"
                  onClick={handleShowAllClick}
              >
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
            {/*<a*/}
            {/*  href="#"*/}
            {/*  onClick={() => exportToExcel()}*/}
            {/*  className="btn btn-success ms-2"*/}
            {/*>*/}
            {/*  <i className="fa fa-excel-o"></i>Excel*/}
            {/*</a>*/}
          </div>
        </div>
        <div class="tablediv">
          <div class="headertable">
            <span class="lbtable">Danh sách chất liệu</span>
          </div>
          <div class="divcontenttable">
            <table id="example" class="table table-bordered">
              <thead>
              <tr>
                <th>STT</th>
                <th>Tên chất liệu</th>
                <th>Người tạo</th>
                <th>Người cập nhật</th>
                <th>Trạng thái</th>
                <th class="sticky-col">Hành động</th>
              </tr>
              </thead>
              <tbody>
              {items.map((item, index) => {
                const stt = currentPage * size + index + 1;
                return (
                    <tr>
                      <td>{stt}</td>
                      <td>{item.tenChatLieu}</td>
                      <td>{item.nguoiTao}</td>
                      <td>{item.nguoiCapNhat}</td>
                      <td
                          style={{
                            textAlign: "center",
                            color: item.trangThai === 0 ? "#6c757d" : "#155724", // Xám đậm hoặc Xanh đậm
                          }}
                      >
                        {item.trangThai === 0 ? "Không sử dụng" : "Đang sử dụng"}
                      </td>

                      <td
                          class="sticky-col"
                          style={{
                            display: "flex",
                            justifyContent: "center",
                            alignItems: "center",
                          }}
                      >
                        <a
                            onClick={() => setItem(item)}
                            data-bs-toggle="modal"
                            data-bs-target="#addcate"
                            class="edit-btn"
                        >
                          <i className="fa fa-edit"></i>
                        </a>
                        {/*<button onClick={() => deleteData(item.id)} class="delete-btn"><i*/}
                        {/*    className='fa fa-trash'></i></button>*/}
                      </td>
                    </tr>
                );
              })}
              </tbody>
            </table>
            <div
                style={{
                  display: "flex",
                  justifyContent: "center",
                  alignItems: "center",
                }}
            >
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

        <div
            class="modal fade"
            id="addcate"
            tabindex="-1"
            aria-labelledby="exampleModalLabel"
            aria-hidden="false"
        >
          <div class="modal-dialog modal-lg">
            <div className="modal-content">
              <div className="modal-header">
                <h5 className="modal-title">
                  {item ? 'Cập nhật chất liệu' : 'Thêm mới chất liệu'}
                </h5>
                <button
                    type="button"
                    className="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
              </div>
              <div className="modal-body">
                <form
                    className="col-sm-5 marginauto"
                    onSubmit={handleSubmit}
                    method="post"
                >
                  <label>Tên</label>
                  <input
                      defaultValue={item?.tenChatLieu || ""}
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

export default AdminDeGiay;
