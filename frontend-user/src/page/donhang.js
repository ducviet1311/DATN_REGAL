import { useState, useEffect } from "react";
import ReactPaginate from "react-paginate";
import {
  getMethod,
  deleteMethod,
  uploadMultipleFile,
  postMethodPayload,
  postMethod,
} from "../services/request";
import { formatMoney } from "../services/money";
import Select from "react-select";
import { toast } from "react-toastify";
import Swal from "sweetalert2";

function DonHang() {
  const [donhang, setDonHang] = useState([]);
  const [trangThai, setTrangThai] = useState([]);
  const [itemDetail, setItemDetail] = useState([]);
  const [item, setItem] = useState(null);
  const [searchTerm, setSearchTerm] = useState("");
  const [selectedStatus, setSelectedStatus] = useState("");
  const [currentPage, setCurrentPage] = useState(0);
  const [pageCount, setPageCount] = useState(0);
  const size = 5; // Số lượng đơn hàng mỗi trang (đổi từ 10 thành 5)

  useEffect(() => {
    getStatusInvoice();
    getDonHang(0);
  }, []);

  const getStatusInvoice = async () => {
    var response = await getMethod("/api/v1/hoa-don/danh-sach-trang-thai");
    var list = await response.json();
    setTrangThai(list);
  };

  const getDonHang = async (page = 0) => {
    const searchParam = searchTerm ? `&maHoaDon=${searchTerm}` : "";
    const statusParam = selectedStatus ? `&trangThai=${selectedStatus}` : "";
    const response = await getMethod(
        `/api/v1/hoa-don/hoa-don-cua-toi?size=${size}&page=${page}${searchParam}${statusParam}`
    );
    const result = await response.json();
    setDonHang(result.content || result); // Xử lý nếu API trả về mảng hoặc object phân trang
    setPageCount(result.totalPages || 1); // Mặc định 1 trang nếu không có phân trang
    setCurrentPage(page);
  };

  function getTrangThai(tt) {
    const statusMap = {
      1: "Chờ xác nhận",
      2: "Đã xác nhận",
      3: "Đang chờ đơn vị vận chuyển",
      4: "Đơn hàng đã được gửi đi",
      5: "Đã nhận",
      6: "Hủy đơn",
      7: "Không nhận hàng",
      8: "Đã hoàn thành",
    };
    return statusMap[tt] || "Không xác định";
  }

  const getInvoiceDetail = async (item) => {
    var response = await getMethod(
        "/api/hoa-don-chi-tiet/find-by-hoa-don?hoaDonId=" + item.id
    );
    var list = await response.json();
    setItemDetail(list);
    setItem(item);
  };

  const huydonhang = async (id) => {
    Swal.fire({
      title: "Xác nhận",
      text: "Bạn muốn hủy đơn hàng chứ?",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Có",
      cancelButtonText: "Không",
    }).then(async (result) => {
      if (result.isConfirmed) {
        var response = await postMethod(
            "/api/v1/hoa-don/huy-don-hang?hoaDonId=" + id
        );
        if (response.status < 300) {
          toast.success("Hủy đơn hàng thành công");
          getDonHang(currentPage); // Tải lại trang hiện tại
        }
        if (response.status == 417) {
          var result = await response.json();
          toast.error(result.defaultMessage);
        }
      }
    });
  };

  const handlePageClick = (data) => {
    const selectedPage = data.selected;
    getDonHang(selectedPage);
  };

  const handleSearch = (e) => {
    setSearchTerm(e.target.value);
    setCurrentPage(0); // Reset về trang đầu khi tìm kiếm
    getDonHang(0);
  };

  const handleStatusFilter = (e) => {
    setSelectedStatus(e.target.value);
    setCurrentPage(0); // Reset về trang đầu khi lọc trạng thái
    getDonHang(0);
  };

  const handleReset = () => {
    setSearchTerm("");
    setSelectedStatus("");
    setCurrentPage(0);
    getDonHang(0);
  };

  const filteredDonHang = donhang.filter((item) => {
    const matchesSearch = item.maHoaDon
        .toLowerCase()
        .includes(searchTerm.toLowerCase());
    const matchesStatus =
        selectedStatus === "" || item.trangThai.toString() === selectedStatus;
    return matchesSearch && matchesStatus;
  });

  return (
      <>
        <div className="headeraccount">
          <p className="fontyel">Đơn hàng của tôi</p>
          <div className="search-wrapper d-flex align-items-center">
            <input
                type="text"
                className="form-control me-2"
                placeholder="Tìm kiếm theo mã hóa đơn"
                value={searchTerm}
                onChange={handleSearch}
            />
            <select
                className="form-select me-2"
                value={selectedStatus}
                onChange={handleStatusFilter}
            >
              <option value="">Tất cả trạng thái</option>
              <option value="1">Chờ xác nhận</option>
              <option value="2">Đã xác nhận</option>
              <option value="3">Đang chờ đơn vị vận chuyển</option>
              <option value="4">Đơn hàng đã được gửi đi</option>
              <option value="5">Đã nhận</option>
              <option value="6">Hủy đơn</option>
              <option value="7">Không nhận hàng</option>
              <option value="8">Đã hoàn thành</option>
            </select>
            <button className="btn btn-secondary" onClick={handleReset}>
              Reset
            </button>
          </div>
        </div>
        <div className="contentacc" id="listaddacc">
          <table className="table table-bordered">
            <thead>
            <tr>
              <th>Mã hóa đơn</th>
              <th>Người nhận</th>
              <th>Địa chỉ</th>
              <th>Tổng tiền</th>
              <th>Phí vận chuyển</th>
              <th>Loại hóa đơn</th>
              <th>Ngày tạo</th>
              <th>Trạng thái</th>
              <th>Hành động</th>
            </tr>
            </thead>
            <tbody>
            {filteredDonHang.map((item) => {
              return (
                  <tr key={item.id}>
                    <td
                        className="pointer text-blue"
                        onClick={() => getInvoiceDetail(item)}
                        data-bs-toggle="modal"
                        data-bs-target="#modaldeail"
                    >
                      {item.maHoaDon}
                    </td>
                    <td>
                      Họ tên: {item.tenKhachHang}
                      <br />
                      Số điện thoại: {item.soDienThoai}
                    </td>
                    <td>{item.diaChi}</td>
                    <td>{formatMoney(item.tongTien)}</td>
                    <td>{formatMoney(item.phiVanChuyen)}</td>
                    <td>
                      {item.loaiHoaDon === true
                          ? "Đặt hàng online"
                          : "Thanh toán tại quầy"}
                    </td>
                    <td>{item.ngayTao}</td>
                    <td>{getTrangThai(item.trangThai)}</td>
                    <td>
                      <button
                          onClick={() => {
                            huydonhang(item.id);
                          }}
                          className="delete-btn"
                      >
                        <i className="fa fa-times-circle"></i>
                      </button>
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

        <div
            className="modal fade"
            id="modaldeail"
            tabIndex="-1"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true"
        >
          <div className="modal-dialog modal-lg">
            <div className="modal-content">
              <div className="modal-header">
                <h5 className="modal-title">Chi tiết đơn hàng</h5>
                <button
                    type="button"
                    className="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
              </div>
              <div className="modal-body">
                <div className="row shipinfor">
                  <div className="col-lg-6 col-md-6 col-sm-12 col-12">
                    <span className="ttshipinfor">Địa chỉ nhận</span>
                    <div className="blockinfor">
                      <p className="reciverName">{item?.tenKhachHang}</p>
                      <span>
                      Địa chỉ nhận hàng: <span>{item?.diaChi}</span>
                    </span>
                      <br />
                      <span>
                      Số điện thoại: <span>{item?.soDienThoai}</span>
                    </span>
                    </div>
                  </div>
                  <div className="col-lg-3 col-md-3 col-sm-12 col-12">
                    <span className="ttshipinfor">Thanh toán</span>
                    <div className="blockinfor">
                    <span id="loaithanhtoan">
                      {item?.phuongThucThanhToans.length > 0
                          ? "Đã thanh toán"
                          : "Thanh toán khi nhận hàng"}
                    </span>
                    </div>
                  </div>
                  <div className="col-lg-3 col-md-3 col-sm-12 col-12">
                    <span className="ttshipinfor">Ghi chú</span>
                    <div className="blockinfor">
                      <span id="ghichunh">{item?.ghiChu}</span>
                    </div>
                  </div>
                </div>
                <br />
                <h5>Trạng thái đơn hàng</h5>
                <table className="table table-bordered">
                  <thead>
                  <tr>
                    <th>Trạng thái</th>
                    <th>Ngày tạo</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td>Ngày đặt</td>
                    <td>{item?.ngayTao}</td>
                  </tr>
                  {item?.ngayXacNhan && (
                      <tr>
                        <td>Ngày xác nhận</td>
                        <td>{item.ngayXacNhan}</td>
                      </tr>
                  )}
                  {item?.ngayVanChuyen && (
                      <tr>
                        <td>Ngày vận chuyển</td>
                        <td>{item.ngayVanChuyen}</td>
                      </tr>
                  )}
                  {item?.ngayNhanHang && (
                      <tr>
                        <td>Ngày nhận hàng</td>
                        <td>{item.ngayNhanHang}</td>
                      </tr>
                  )}
                  {item?.ngayHoanThanh && (
                      <tr>
                        <td>Ngày hoàn thành</td>
                        <td>{item.ngayHoanThanh}</td>
                      </tr>
                  )}
                  </tbody>
                </table>
                <table className="table table-cart table-order" id="detailInvoice">
                  <thead className="thead-default theaddetail">
                  <tr>
                    <th>Ảnh</th>
                    <th>Tên sản phẩm</th>
                    <th>Giá tiền</th>
                    <th>Số lượng</th>
                  </tr>
                  </thead>
                  <tbody>
                  {itemDetail.map((item, index) => {
                    return (
                        <tr key={index}>
                          <td>
                            <img
                                src={item.sanPhamChiTiet.anhs[0].tenAnh}
                                className="imgtable"
                                alt="Ảnh sản phẩm"
                            />
                          </td>
                          <td>{item.sanPhamChiTiet.sanPham.tenSanPham}</td>
                          <td>{formatMoney(item.sanPhamChiTiet.giaTien)}</td>
                          <td>{item.soLuong}</td>
                        </tr>
                    );
                  })}
                  </tbody>
                </table>
                <br />
              </div>
            </div>
          </div>
        </div>
      </>
  );
}

export default DonHang;