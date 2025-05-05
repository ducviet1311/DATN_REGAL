import { useState, useEffect } from "react";
import ReactPaginate from "react-paginate";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import {
  getMethod,
  postMethodPayload,
  deleteMethod,
} from "../../services/request";
import { formatMoney } from "../../services/money";
import Swal from "sweetalert2";
import * as XLSX from "xlsx";
import { saveAs } from "file-saver";

var size = 10;
var url = "/api/phieu-giam-gia/all?&size=" + size + "&sort=id,desc&page=";
const AdminPhieuGiamGia = () => {
  const [items, setItems] = useState([]);
  const [searchTerm, setSearchTerm] = useState("");
  const [currentPage, setCurrentPage] = useState(0);
  const [pageCount, setPageCount] = useState(0);
  const [selectedStatus, setSelectedStatus] = useState("");

  useEffect(() => {
    getPGG();
  }, []);

  async function getPhieuGiamGia() {
    var response = await getMethod("/api/phieu-giam-gia");
    var result = await response.json();
    setItems(result);
  }

  const handleStatusFilter = (e) => {
    setSelectedStatus(e.target.value); // Lưu trạng thái được chọn
  };

  const filteredItems = items.filter((item) => {
    if (selectedStatus === "") return true; // Nếu không chọn trạng thái, hiển thị tất cả
    return selectedStatus === "1"
        ? item.trangThai !== 0 // Lọc "Đang hoạt động"
        : item.trangThai === 0; // Lọc "Không hoạt động"
  });

  function trangThai(tt) {
    switch (tt) {
      case 1:
        return "Đang hoạt động";
      case 2:
        return "Hết phiếu giảm giá";
      case 3:
        return "Đã hết hạn";
      default:
        return "Không hoạt động";
    }
  }

  const getPGG = async () => {
    var response = await getMethod(
        "/api/phieu-giam-gia/all?&size=" + size + "&sort=id,desc&page=" + 0
    );
    var result = await response.json();
    setItems(result.content);
    setPageCount(result.totalPages);
    url = "/api/phieu-giam-gia/all?&size=" + size + "&sort=id,desc&page=";
  };

  const updateTrangThai = async (item) => {
    var user = JSON.parse(localStorage.getItem("user"));

    const payload = {
      maCode: item.maCode,
      tenPhieu: item.tenPhieu,
      giaTriGiamToiDa: item.giaTriGiamToiDa,
      giaTriGiam: item.giaTriGiam,
      donToiThieu: item.donToiThieu,
      soLuong: item.soLuong,
      loaiPhieu: item.loaiPhieu,
      ngayBatDau: new Date(item.ngayBatDau),
      ngayKetThuc: new Date(item.ngayKetThuc),
      nguoiTao: user.maNhanVien,
      nguoiCapNhat: user.maNhanVien,
      trangThai: 0,
    };

    try {
      const response = await postMethodPayload(
          `/api/phieu-giam-gia/${item.id}`,
          payload
      );
      if (response.status < 300) {
        toast.success("Cập nhật trạng thái thành công!");
        getPGG(); // Tải lại danh sách để đồng bộ dữ liệu
      } else {
        toast.error("Cập nhật thất bại!");
      }
    } catch (error) {
      console.error("Lỗi khi cập nhật trạng thái:", error);
      toast.error("Đã xảy ra lỗi trong quá trình cập nhật!");
    }
  };

  const handlePageClick = async (data) => {
    const currentPage = data.selected;
    const response = await getMethod(
        `/api/phieu-giam-gia/all?size=${size}&sort=id,desc&page=${currentPage}`
    );
    const result = await response.json();
    setItems(result.content);
    setPageCount(result.totalPages);
    setCurrentPage(currentPage);
  };

  useEffect(() => {
    if (items.length === 0) return; // Kiểm tra nếu items trống

    const now = new Date();
    let hasUpdate = false;
  //set time HA
    const updatedItems = items.map((item) => {
      const ngayKetThuc = new Date(item.ngayKetThuc);
      // Kiểm tra nếu số lượng = 0 hoặc ngày kết thúc đã qua và trạng thái không phải 0
      if ((item.soLuong === 0 || ngayKetThuc < now) && item.trangThai !== 0) {
        updateTrangThai(item); // Gọi hàm cập nhật trạng thái
        hasUpdate = true;
        return {
          ...item,
          trangThai: 0, // Cập nhật trạng thái thành 0
        };
      }
      return item;
    });

    if (hasUpdate) {
      setItems(updatedItems); // Cập nhật lại state chỉ khi có thay đổi
    }
  }, [items]);

  return (
      <>
        <div className="headerpageadmin d-flex justify-content-between align-items-center p-3 bg-light border">
          <strong className="text-left">
            <i className="fa fa-list"></i> Quản Lý Phiếu Giảm Giá
          </strong>
          <div className="search-wrapper d-flex align-items-center">
            <div className="search-container"></div>
            <a href="add-khuyen-mai" className="btn btn-primary ms-2">
              <i className="fa fa-plus"></i>
            </a>
            <select
                className="form-select ms-2"
                value={selectedStatus}
                onChange={handleStatusFilter}
            >
              <option value="">Tất cả trạng thái</option>
              <option value="1">Đang hoạt động</option>
              <option value="0">Không hoạt động</option>
            </select>
          </div>
        </div>
        <div className="tablediv">
          <div className="headertable">
            <span className="lbtable">Danh sách phiếu giảm giá</span>
          </div>
          <div className="divcontenttable">
            <table id="example" className="table table-bordered">
              <thead>
              <tr>
                <th>STT</th>
                <th>Mã code</th>
                <th>Tên phiếu</th>
                <th>Giảm tối đa</th>
                <th>Giá trị giảm</th>
                <th>Đơn tối thiểu</th>
                <th>Số lượng</th>
                <th>Loại phiếu</th>
                <th>Thời gian</th>
                <th>Trạng thái</th>
                <th className="sticky-col">Hành động</th>
              </tr>
              </thead>
              <tbody>
              {filteredItems.map((item, index) => {
                const stt = currentPage * size + index + 1;
                return (
                    <tr key={item.id}>
                      <td>{stt}</td>
                      <td>{item.maCode}</td>
                      <td>{item.tenPhieu}</td>
                      <td>
                        {item.loaiPhieu === false
                            ? formatMoney(item.giaTriGiamToiDa)
                            : ""}
                      </td>
                      <td>
                        {item.loaiPhieu === true
                            ? formatMoney(item.giaTriGiam)
                            : item.giaTriGiam + "%"}
                      </td>
                      <td>{formatMoney(item.donToiThieu)}</td>
                      <td>{item.soLuong}</td>
                      <td>{item.loaiPhieu === true ? "Giảm tiền" : "Giảm %"}</td>
                      <td>
                        {item.ngayBatDau} - {item.ngayKetThuc}
                      </td>
                      <td
                          style={{
                            textAlign: "center",
                            color: item.trangThai === 0 ? "#6c757d" : "#155724",
                          }}
                      >
                        {item.trangThai === 0
                            ? "Không hoạt động"
                            : "Đang hoạt động"}
                      </td>
                      <td
                          className="sticky-col"
                          style={{
                            display: "flex",
                            justifyContent: "center",
                            alignItems: "center",
                          }}
                      >
                        <a
                            href={"add-khuyen-mai?id=" + item.id}
                            className="edit-btn"
                        >
                          <i className="fa fa-edit"></i>
                        </a>
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
      </>
  );
};

export default AdminPhieuGiamGia;