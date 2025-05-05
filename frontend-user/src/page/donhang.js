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

  useEffect(() => {
    getStatusInvoice();
    getDonHang();
  }, []);

  const getStatusInvoice = async () => {
    var response = await getMethod("/api/v1/hoa-don/danh-sach-trang-thai");
    var list = await response.json();
    setTrangThai(list);
  };

  const getDonHang = async () => {
    var response = await getMethod("/api/v1/hoa-don/hoa-don-cua-toi");
    var list = await response.json();
    console.log("Danh sách đơn hàng:", list);
    setDonHang(list);
  };

  function getTrangThai(tt) {
    for (var i = 0; i < trangThai.length; i++) {
      if (trangThai[i].value == tt) {
        return trangThai[i].tenTrangThai;
      }
    }
    return "Không xác định";
  }

  const getInvoiceDetail = async (item) => {
    var response = await getMethod(
        "/api/hoa-don-chi-tiet/find-by-hoa-don?hoaDonId=" + item.id
    );
    var list = await response.json();
    console.log("Chi tiết hóa đơn:", list);
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
          getDonHang();
        }
        if (response.status == 417) {
          var result = await response.json();
          toast.error(result.defaultMessage);
        }
      }
    });
  };

  return (
      <>
        <div className="headeraccount">
          <p className="fontyel">Đơn hàng của tôi</p>
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
            {donhang.map((item) => {
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
                  <div className="col-lg-6 col-md-6 col-sm-12 col-12">
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