import { useState, useEffect, useRef } from "react";
import ReactPaginate from "react-paginate";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import {
  getMethod,
  deleteMethod,
  uploadSingleFile,
  postMethod,
} from "../../services/request";
import Swal from "sweetalert2";
import { formatMoney } from "../../services/money";
import Select from "react-select";
import * as XLSX from "xlsx";
import { saveAs } from "file-saver";
import Invoice2 from "./invoice2"; // Import component Invoice2
import { jsPDF } from "jspdf"; // Import jsPDF để tạo PDF
import html2canvas from "html2canvas"; // Import html2canvas để chụp ảnh HTML

var size = 8;
var url = "";
const AdminDonHang = () => {
  const [trangThai, setTrangThai] = useState([]);
  const [selectTrangThai, setSelectTrangThai] = useState(null);
  const [pageCount, setPageCount] = useState(0);
  const [items, setItems] = useState([]);
  const [item, setItem] = useState(null);
  const [chiTietDonHang, setChiTietDonHang] = useState([]);
  const [lichSuHoaDon, setLichSuHoaDon] = useState([]);
  const [keyword, setKeyword] = useState("");
  const [loaiHoaDonOptions, setLoaiHoaDonOptions] = useState([]);
  const [selectedLoaiHoaDon, setSelectedLoaiHoaDon] = useState(null);
  const [dataInvoice, setDataInvoice] = useState(null); // State để lưu dữ liệu hóa đơn trước khi in
  const invoiceRef = useRef(null); // Ref để tham chiếu đến component Invoice2

  useEffect(() => {
    getStatusInvoice();
    getLoaiHoaDonOptions();
    searchDonHang(0);
  }, []);

  const getStatusInvoice = async () => {
    var response = await getMethod("/api/v1/hoa-don/danh-sach-trang-thai");
    var list = await response.json();
    setTrangThai(list);
  };

  const getLoaiHoaDonOptions = async () => {
    var response = await getMethod("/api/v1/hoa-don/loai-hoa-don-options");
    var result = await response.json();
    setLoaiHoaDonOptions(result.map(item => ({
      value: item.value,
      label: item.label
    })));
  };

  const searchDonHang = async (page, trangThaiFilter = selectTrangThai, loaiHoaDonFilter = selectedLoaiHoaDon?.value) => {
    let searchUrl = `/api/v1/hoa-don/search?size=${size}&sort=id,desc&page=${page}`;
    if (keyword) searchUrl += `&keyword=${encodeURIComponent(keyword)}`;
    if (trangThaiFilter !== null) searchUrl += `&trangthai=${trangThaiFilter}`;
    if (loaiHoaDonFilter !== null && loaiHoaDonFilter !== undefined) searchUrl += `&loaiHoaDon=${loaiHoaDonFilter}`;

    var response = await getMethod(searchUrl);
    var result = await response.json();
    setItems(result.content);
    setPageCount(result.totalPages);
    url = searchUrl.split('&page=')[0] + "&page=";
  };

  const handleSearch = () => {
    searchDonHang(0);
  };

  const handleReset = () => {
    setKeyword("");
    setSelectTrangThai(null);
    setSelectedLoaiHoaDon(null);
    searchDonHang(0, null, null);
  };

  const handlePageClick = async (data) => {
    var currentPage = data.selected;
    searchDonHang(currentPage);
  };

  const locDonHang = async (value) => {
    setSelectTrangThai(value);
    searchDonHang(0, value);
  };

  const handleLoaiHoaDonChange = (selectedOption) => {
    setSelectedLoaiHoaDon(selectedOption);
    searchDonHang(0, selectTrangThai, selectedOption?.value);
  };

  function getTrangThai(tt) {
    const trangThaiMap = {
      1: "Chờ xác nhận",
      2: "Đã xác nhận",
      3: "Đang chờ đơn vị vận chuyển",
      4: "Đơn hàng đã được gửi đi",
      5: "Đã nhận",
      6: "Hủy đơn",
      7: "Không nhận hàng",
      8: "Đã hoàn thành"
    };
    return trangThaiMap[tt] || "Không xác định";
  }

  function getNextTrangThai(tt) {
    const nextTrangThaiMap = {
      0: "Chờ vận chuyển",
      1: "Đã xác nhận",
      2: "Đang chờ đơn vị vận chuyển",
      3: "Đơn hàng đã được gửi đi",
      4: "Đã nhận",
      5: "Đã hoàn thành",
    };
    return nextTrangThaiMap[tt] || null;
  }

  // Hàm chuẩn bị dữ liệu hóa đơn để in
  const prepareInvoiceData = async (item) => {
    var response = await getMethod(
        "/api/hoa-don-chi-tiet/find-by-hoa-don?hoaDonId=" + item.id
    );
    var result = await response.json();

    const invoiceData = {
      maVanDon: item.maVanDon || "SPEVN202511993",
      maDonHang: item.maHoaDon || "2008318CTVTDA0",
      nguoiNhan: item.tenKhachHang || (item.khachHang ? item.khachHang.hoVaTen : "Khách lẻ"),
      diaChi: item.diaChi || "Mua hàng tại quầy",
      soDienThoai: item.soDienThoai || (item.khachHang ? item.khachHang.soDienThoai : "Khách lẻ"),
      email: item.email || (item.khachHang ? item.khachHang.email : "Khách lẻ"),
      khoiLuongToiDa: "500g",
      ghiChuGiaoHang: "- Không dùng lót\n- Ở đâu thì lấy số S thì 15N phút\n- Lọc lấy cái để đi E nữa",
      xacNhanNguonVan: "mọipmoe, bẹDV6",
      phiVanChuyen: item.phiVanChuyen || 0,
      items: result.map((chiTiet) => ({
        name: chiTiet.sanPhamChiTiet?.sanPham.tenSanPham || "N/A",
        thuongHieu: chiTiet.sanPhamChiTiet?.sanPham.thuongHieu.tenThuongHieu || "",
        mauSac: chiTiet.sanPhamChiTiet?.mauSac.tenMauSac || "",
        kichCo: chiTiet.sanPhamChiTiet?.kichCo.tenKichCo || "",
        quantity: chiTiet.soLuong,
        price: chiTiet.giaSanPham,
      })),
    };

    setDataInvoice(invoiceData);
  };

  // Hàm in hóa đơn
  const handlePDF = async () => {
    const element = invoiceRef.current;
    if (!element) return;

    const canvas = await html2canvas(element, { scale: 3 });
    const imgData = canvas.toDataURL("image/png");
    const pdf = new jsPDF("p", "mm", "a4");
    const pdfWidth = pdf.internal.pageSize.getWidth();
    const pdfHeight = (canvas.height * pdfWidth) / canvas.width;

    pdf.addImage(imgData, "PNG", 0, 0, pdfWidth, pdfHeight);

    const fileName = `hoa_don_${new Date()
        .toLocaleDateString("vi-VN")
        .replace(/\//g, "-")}.pdf`;
    pdf.save(fileName);
  };

  async function capNhatTrangThai(iddonhang, trangthai) {
    var con = window.confirm("Xác nhận cập nhật trạng thái");
    if (con == false) {
      return;
    }
    if (trangthai < 6) {
      var ttup = Number(trangthai) + Number(1);
      if (trangthai == 5) {
        ttup = 8;
      }
      var res = await postMethod(
          "/api/v1/hoa-don/update-trang-thai?hoaDonId=" +
          iddonhang +
          "&trangThai=" +
          ttup
      );
      if (res.status < 300) {
        toast.success("Thành công");
        searchDonHang(0);

        // Nếu trạng thái chuyển sang "Đã xác nhận" (từ 1 sang 2), in hóa đơn
        if (trangthai == 1) {
          const item = items.find((i) => i.id === iddonhang);
          if (item) {
            await prepareInvoiceData(item); // Chuẩn bị dữ liệu hóa đơn
            setTimeout(() => handlePDF(), 500); // Đợi một chút để đảm bảo Invoice2 được render trước khi in
          }
        }
      }
      if (res.status == 417) {
        var result = await res.json();
        toast.error(result.defaultMessage);
      }
      if (res.status > 300) {
        var result = await res.json();
        toast.error(result.message);
      }
    }
  }

  async function capNhatTT(iddonhang, trangthai) {
    Swal.fire({
      title: "Thông báo",
      text: "Chọn hành động bên dưới!",
      icon: "warning",
      showCancelButton: true,
      showDenyButton: true,
      confirmButtonText: "Không nhận hàng",
      cancelButtonText: "Hủy đơn",
      denyButtonText: "Đóng",
      reverseButtons: true,
    }).then((result) => {
      if (result.isConfirmed) {
        if (trangthai !== 4) {
          toast.error("Chỉ áp dụng cho đơn đã gửi đi");
          return;
        }
        chuyenTrangThai(iddonhang, 7);
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        if (trangthai > 3) {
          toast.error("Chỉ có thể hủy đơn chưa gửi đi");
          return;
        }
        chuyenTrangThai(iddonhang, 6);
      }
    });
  }

  async function chuyenTrangThai(iddonhang, trangthai) {
    var res = await postMethod(
        "/api/v1/hoa-don/update-trang-thai?hoaDonId=" +
        iddonhang +
        "&trangThai=" +
        trangthai
    );
    if (res.status < 300) {
      toast.success("Thành công");
      searchDonHang(0);
    }
    if (res.status == 417) {
      var result = await res.json();
      toast.error(result.defaultMessage);
    }
    if (res.status > 300) {
      var result = await res.json();
      toast.error(result.message);
    }
  }

  async function getChiTietDonHang(item) {
    var response = await getMethod(
        "/api/hoa-don-chi-tiet/find-by-hoa-don?hoaDonId=" + item.id
    );
    var result = await response.json();
    setChiTietDonHang(result);
    var response = await getMethod(
        "/api/lich-su-hoa-don/find-by-hoa-don?hoaDonId=" + item.id
    );
    var result = await response.json();
    setLichSuHoaDon(result);
  }

  const exportToExcel = () => {
    const worksheet = XLSX.utils.json_to_sheet(items);
    const workbook = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(workbook, worksheet, "Sheet1");
    const excelBuffer = XLSX.write(workbook, {
      bookType: "xlsx",
      type: "array",
    });
    const blob = new Blob([excelBuffer], { type: "application/octet-stream" });
    saveAs(blob, `data.xlsx`);
  };

  return (
      <>
        <div className="headerpageadmin d-flex justify-content-between align-items-center p-3 bg-light border">
          <strong className="text-left">
            <i className="fa fa-list"></i> Quản Lý Đơn Hàng
          </strong>
          <a
              href="#"
              onClick={() => exportToExcel()}
              className="btn btn-primary ms-2"
          >
            <i className="fa fa-file-excel"></i>
          </a>
        </div>
        <div className="headerpageadmin d-flex justify-content-between align-items-center p-3 bg-light border">
          <div className="trangthailist">
            <div
                onClick={() => locDonHang(null)}
                className={`trangthaiitem ${!selectTrangThai && "selected"}`}
            >
              Tất Cả
            </div>
            {trangThai &&
            trangThai.map((a, index) => (
                <div
                    key={index}
                    onClick={() => locDonHang(a.value)}
                    className={`trangthaiitem ${a.value === selectTrangThai && "selected"}`}
                >
                  {a.tenTrangThai}
                </div>
            ))}
          </div>
        </div>
        <div className="tablediv">
          <div className="headertable d-flex justify-content-between align-items-center">
            <span className="lbtable">Danh sách đơn hàng</span>
            <div className="d-flex align-items-center">
              <Select
                  options={loaiHoaDonOptions}
                  value={selectedLoaiHoaDon}
                  onChange={handleLoaiHoaDonChange}
                  placeholder="Loại hóa đơn"
                  className="me-2"
                  isClearable
                  styles={{ container: (base) => ({ ...base, width: 200 }) }}
              />
              <div className="input-group me-2" style={{ width: "300px" }}>
                <input
                    type="text"
                    className="form-control"
                    placeholder="Tìm theo mã HĐ, tên KH, SĐT"
                    value={keyword}
                    onChange={(e) => setKeyword(e.target.value)}
                    onKeyPress={(e) => e.key === 'Enter' && handleSearch()}
                />
                <button
                    className="btn btn-outline-secondary"
                    onClick={handleSearch}
                >
                  <i className="fa fa-search"></i>
                </button>
              </div>
              <button
                  className="btn btn-outline-primary"
                  onClick={handleReset}
                  title="Làm mới"
              >
                <i className="fa fa-refresh"></i>
              </button>
            </div>
          </div>
          <div className="divcontenttable">
            <table id="example" className="table table-bordered">
              <thead>
              <tr>
                <th>STT</th>
                <th>Mã hóa đơn</th>
                <th>Tên khách hàng</th>
                <th>Số điện thoại</th>
                <th>Tổng tiền</th>
                <th>Loại hóa đơn</th>
                <th>Phương thức thanh toán</th>
                <th>Ngày tạo</th>
                <th>Trạng thái</th>
                <th className="sticky-col">Cập nhật trạng thái</th>
              </tr>
              </thead>
              <tbody>
              {items.map((item, index) => (
                  <tr key={index}>
                    <td>{index + 1}</td>
                    <td
                        onClick={() => getChiTietDonHang(item)}
                        data-bs-toggle="modal"
                        data-bs-target="#addcate"
                        className="pointer"
                        style={{ color: "blue", fontWeight: "bold" }}
                    >
                      {item.maHoaDon}
                    </td>
                    <td>{item.khachHang === null ? "Khách lẻ" : item.khachHang.hoVaTen}</td>
                    <td>{item.khachHang === null ? "Khách lẻ" : item.khachHang.soDienThoai}</td>
                    <td>{formatMoney(item.tongTien)}</td>
                    <td>{item.loaiHoaDon ? "Đặt hàng online" : "Thanh toán tại quầy"}</td>
                    <td>{item.daThanhToan ? "Đã thanh toán" : "Thanh toán khi nhận hàng"}</td>
                    <td>{item.ngayTao}</td>
                    <td>
                                        <span className={`status-label status-${item.trangThai}`}>
                                            {getTrangThai(item.trangThai)}
                                        </span>
                    </td>
                    <td>
                      <div className="d-flex">
                        {item.trangThai < 6 && (
                            <button
                                onClick={() => capNhatTrangThai(item.id, item.trangThai)}
                                className={`edit-btn status-next-${item.trangThai < 5 ? item.trangThai + 1 : 8}`}
                            >
                              {getNextTrangThai(item.trangThai)} <i className="fa fa-arrow-right"></i>
                            </button>
                        )}
                        {item.trangThai < 5 && (
                            <button
                                onClick={() => capNhatTT(item.id, item.trangThai)}
                                className="delete-btn"
                            >
                              Hủy <i className="fa fa-times-circle"></i>
                            </button>
                        )}
                      </div>
                    </td>
                  </tr>
              ))}
              </tbody>
            </table>
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
            />
          </div>
        </div>

        {/* Modal chi tiết đơn hàng */}
        <div
            className="modal fade"
            id="addcate"
            tabIndex="-1"
            aria-labelledby="exampleModalLabel"
            aria-hidden="false"
        >
          <div className="modal-dialog modal-lg">
            <div className="modal-content">
              <div className="modal-header">
                <h5 className="modal-title" id="exampleModalLabel">
                  Thông tin đơn hàng
                </h5>
                <button
                    type="button"
                    className="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
              </div>
              <div className="modal-body">
                <h5 className="section-title customer-title">
                  <i className="fa fa-user me-2"></i> Thông tin người nhận
                </h5>
                <div className="customer-info">
                  <div className="info-row">
                    <span className="info-label">Tên người nhận:</span>
                    <span className="info-value">
                                        {chiTietDonHang[0]?.hoaDon?.tenKhachHang || "Khách lẻ"}
                                    </span>
                  </div>
                  <div className="info-row">
                    <span className="info-label">Số điện thoại:</span>
                    <span className="info-value">
                                        {chiTietDonHang[0]?.hoaDon?.soDienThoai || "Khách lẻ"}
                                    </span>
                  </div>
                  <div className="info-row">
                    <span className="info-label">Email:</span>
                    <span className="info-value">
                                        {chiTietDonHang[0]?.hoaDon?.email || "Khách lẻ"}
                                    </span>
                  </div>
                  <div className="info-row">
                    <span className="info-label">Địa chỉ:</span>
                    <span className="info-value">
                                        {chiTietDonHang[0]?.hoaDon?.diaChi || "Mua hàng tại quầy"}
                                    </span>
                  </div>
                </div>
                <br />
                <h5 className="section-title order-title">
                  <i className="fa fa-shopping-cart me-2"></i> Chi tiết đơn hàng
                </h5>
                <table className="table table-cart table-order" id="detailInvoice">
                  <caption style={{ textAlign: "left", fontWeight: "bold", captionSide: "top" }}>
                    Ngày tạo: {chiTietDonHang[0]?.hoaDon?.ngayTao || "N/A"}
                  </caption>
                  <thead className="thead-default theaddetail">
                  <tr>
                    <th>Mã sản phẩm</th>
                    <th>Ảnh</th>
                    <th>Tên sản phẩm</th>
                    <th>Màu sắc</th>
                    <th>Kích cỡ</th>
                    <th>Thương hiệu</th>
                    <th>Số lượng</th>
                    <th>Đơn giá</th>
                  </tr>
                  </thead>
                  <tbody>
                  {chiTietDonHang.map((item, index) => (
                      <tr key={index}>
                        <td>{item.sanPhamChiTiet.maSanPhamChiTiet}</td>
                        <td>
                          <img
                              src={
                                item.sanPhamChiTiet.anhs.length > 0
                                    ? item.sanPhamChiTiet.anhs[0].tenAnh
                                    : ""
                              }
                              className="imgtable"
                              alt="Ảnh sản phẩm"
                          />
                        </td>
                        <td>{item.sanPhamChiTiet.sanPham.tenSanPham}</td>
                        <td>{item.sanPhamChiTiet.mauSac.tenMauSac}</td>
                        <td>{item.sanPhamChiTiet.kichCo.tenKichCo}</td>
                        <td>{item.sanPhamChiTiet.sanPham.thuongHieu.tenThuongHieu}</td>
                        <td>{item.soLuong}</td>
                        <td>{formatMoney(item.giaSanPham)}</td>
                      </tr>
                  ))}
                  </tbody>
                  <tfoot>
                  <tr>
                    <td colSpan="7" className="footer-label">Phí vận chuyển:</td>
                    <td className="footer-value">
                      {formatMoney(chiTietDonHang[0]?.hoaDon?.phiVanChuyen || 0)}
                    </td>
                  </tr>
                  <tr>
                    <td colSpan="7" className="footer-label total-label">Tổng tiền:</td>
                    <td className="footer-value total-value">
                      {formatMoney(chiTietDonHang[0]?.hoaDon?.tongTien || 0)}
                    </td>
                  </tr>
                  </tfoot>
                </table>
                <br />
              </div>
            </div>
          </div>
        </div>

        {/* Component Invoice2 ẩn để in hóa đơn */}
        <div
            style={{
              position: "absolute",
              top: "-9999px",
              left: "-9999px",
            }}
        >
          <Invoice2
              ref={invoiceRef}
              invoiceData={dataInvoice}
              giamgia={{ loaiPhieu: false, giaTriGiam: 0 }} // Giả sử không có giảm giá
          />
        </div>

        <style jsx>{`
                .status-label {
                    padding: 4px 8px;
                    border-radius: 12px;
                    color: white;
                    font-weight: bold;
                    display: inline-block;
                    text-align: center;
                }
                .status-0 { background-color: #808080; } /* Chờ xác nhận */
                .status-1 { background-color: #FFA500; } /* Đã xác nhận */
                .status-2 { background-color: #1E90FF; } /* Đang chờ vận chuyển */
                .status-3 { background-color: #FFD700; } /* Đơn hàng đã được gửi đi */
                .status-4 { background-color: #32CD32; } /* Đã giao */
                .status-5 { background-color: #8e4585; } /* Đã nhận */
                .status-6 { background-color: #FF0000; } /* Hủy đơn */
                .status-7 { background-color: #DC143C; } /* Không nhận hàng */
                .status-8 { background-color: #228B22; } /* Hoàn Thành */

                .customer-info {
                    background-color: #f9f9f9;
                    padding: 15px;
                    border-radius: 8px;
                    margin-bottom: 20px;
                }
                .info-row {
                    display: flex;
                    justify-content: space-between;
                    padding: 8px 0;
                    border-bottom: 1px solid #eee;
                }
                .info-row:last-child {
                    border-bottom: none;
                }
                .info-label {
                    color: #555;
                    font-size: 14px;
                    width: 30%;
                    font-weight: 500;
                }
                .info-value {
                    color: #333;
                    font-size: 14px;
                    width: 70%;
                    text-align: left;
                    word-break: break-word;
                }

                .footer-label {
                    text-align: right;
                    color: #555;
                    font-size: 14px;
                    padding: 8px;
                }
                .footer-value {
                    text-align: right;
                    color: #333;
                    font-size: 14px;
                    padding: 8px;
                }
                .total-label {
                    font-weight: 600;
                    color: #000;
                }
                .total-value {
                    font-weight: 600;
                    color: #d32f2f;
                }

                .section-title {
                    font-size: 18px;
                    font-weight: 600;
                    padding: 10px 15px;
                    margin-bottom: 15px;
                    border-radius: 5px;
                    display: flex;
                    align-items: center;
                }
                .customer-title {
                    background-color: #e3f2fd;
                    color: #1976d2;
                    border-left: 4px solid #1976d2;
                }
                .order-title {
                    background-color: #f1f8e9;
                    color: #388e3c;
                    border-left: 4px solid #388e3c;
                }
                .edit-btn {
                    padding: 6px 12px;
                    border: none;
                    border-radius: 12px;
                    color: white;
                    font-weight: bold;
                    cursor: pointer;
                    margin-right: 5px;
                    transition: background-color 0.3s;
                }

                .edit-btn.status-next-1 { background-color: #FFA500; }
                .edit-btn.status-next-2 { background-color: #1E90FF; }
                .edit-btn.status-next-3 { background-color: #FFD700; }
                .edit-btn.status-next-4 { background-color: #32CD32; }
                .edit-btn.status-next-5 { background-color: #8e4585; }
                .edit-btn.status-next-8 { background-color: #228B22; }

                .edit-btn:hover {
                    opacity: 0.9;
                }

                .delete-btn {
                    padding: 6px 12px;
                    border: none;
                    border-radius: 12px;
                    color: white;
                    font-weight: bold;
                    cursor: pointer;
                    background-color: #FF0000;
                }

                .delete-btn:hover {
                    opacity: 0.9;
                }
            `}</style>
      </>
  );
};

export default AdminDonHang;