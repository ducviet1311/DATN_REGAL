import { useState, useEffect, useRef } from "react";
import { toast } from "react-toastify";
import {
    getMethod,
    deleteMethod,
    postMethodPayload,
    postMethod,
} from "../../services/request";
import Swal from "sweetalert2";
import Select from "react-select";
import giotrong from "../../assest/images/no-cart.png";
import qrthanhtoan from "../../assest/images/qrthanhtoan.jpg";
import timo from "../../assest/images/timo.jpg";
import nodata from "../../assest/images/no-data4.png";
import React from "react";
import "bootstrap/dist/css/bootstrap.min.css";
import { formatMoney } from "../../services/money";
import { Modal, Button } from "react-bootstrap";
import { Nav } from "react-bootstrap";
import { FaTimesCircle, FaCreditCard } from "react-icons/fa";
import { InputGroup, Form } from "react-bootstrap";
import Invoice from "./invoice";
import { jsPDF } from "jspdf";
import html2canvas from "html2canvas";

const AdminDatTaiQuay = () => {
    const [hoaDonCho, sethoaDonCho] = useState([]);
    const [khachHang, setKhachHang] = useState([]);
    const [chiTietSanPham, setChiTietSanPham] = useState([]);
    const [selectHoaDonCho, setSelectHoaDonCho] = useState(null);
    const [selectKhachHang, setselectKhachHang] = useState({
        id: -1,
        hoVaTen: "Khách lẻ",
        soDienThoai: "",
    });
    const [isChonPGG, setIsChonPGG] = useState(false);
    const [soTienThanhToan, setSoTienThanhToan] = useState(0);
    const [tienThua, setTienThua] = useState(0);
    const [showModal, setShowModal] = useState(false);
    const [showDeleteModal, setShowDeleteModal] = useState(false);
    const [hoaDonToDelete, setHoaDonToDelete] = useState(null);
    const [selectSoluong, setselectSoluong] = useState(0);
    const [selectDotGiamGia, setSelecDotGiamGia] = useState({});
    const [dotGiamGia, setdotGiamGia] = useState({});
    const [thuongHieu, setThuongHieu] = useState([]);
    const [deGiay, setDeGiay] = useState([]);
    const [chatlieu, setChatLieu] = useState([]);
    const [kichThuoc, setKichThuoc] = useState([]);
    const [mauSac, setMauSac] = useState([]);
    const [selectThuongHieu, setselectThuongHieu] = useState(null);
    const [selectDeGiay, setselectDeGiay] = useState(null);
    const [selectChatlieu, setselectChatlieu] = useState(null);
    const [selectkichThuoc, setselectkichThuoc] = useState(null);
    const [selectmauSac, setselectmauSac] = useState(null);
    const [tongTien, setTongTien] = useState(0);
    const [tongTienNew, setTongTienNew] = useState(0);
    const [searchKeyword, setSearchKeyword] = useState("");
    const [filteredSanPham, setFilteredSanPham] = useState([]);
    const [dataInvoice, setDataInvoice] = useState();
    const [orders, setOrders] = useState([]);
    const [activeOrder, setActiveOrder] = useState(null);
    const [paymentMethod, setPaymentMethod] = useState("");
    const [soTienKhachDua, setSoTienKhachDua] = useState(0);
    const invoiceRef = useRef(null);

    const tienThieu = tongTien - (soTienKhachDua ? parseInt(soTienKhachDua, 10) : 0);

    const handleShowDeleteModal = (hoaDonId) => {
        setHoaDonToDelete(hoaDonId);
        setShowDeleteModal(true);
    };

    const handleCloseDeleteModal = () => {
        setShowDeleteModal(false);
        setHoaDonToDelete(null);
    };

    const resetPaymentInfo = () => {
        setPaymentMethod("");
        setSoTienKhachDua(0);
        setSoTienThanhToan(0);
        setTienThua(0);
    };

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

    useEffect(() => {
        const filtered = chiTietSanPham.filter(
            (item) =>
                item.soLuong > 0 &&
                item.sanPham?.tenSanPham
                    ?.toLowerCase()
                    .includes(searchKeyword.toLowerCase())
        );
        setFilteredSanPham(filtered);
    }, [searchKeyword, chiTietSanPham]);

    const resetFilters = () => {
        setselectThuongHieu(null);
        setselectChatlieu(null);
        setselectDeGiay(null);
        setselectmauSac(null);
        setselectkichThuoc(null);
        setSearchKeyword("");
    };

    useEffect(() => {
        getHoaDonCho();
        getKhachHang();
        getSelect();
        getChiTietSanPham();
    }, []);

    useEffect(() => {
        if (hoaDonCho.length != 0) {
            let id = document.getElementById("an");
            id.style.display = "block";
            let anh = document.getElementById("anh");
            anh.style.display = "none";
        } else {
            let id = document.getElementById("an");
            id.style.display = "none";
            let anh = document.getElementById("anh");
            anh.style.display = "block";
        }
    }, [hoaDonCho]);

    async function getSelect() {
        var response = await getMethod("/api/thuong-hieu");
        setThuongHieu(await response.json());
        var response = await getMethod("/api/de-giay");
        setDeGiay(await response.json());
        var response = await getMethod("/api/chat-lieu");
        setChatLieu(await response.json());
        var response = await getMethod("/api/kich-co");
        setKichThuoc(await response.json());
        var response = await getMethod("/api/mau-sac");
        setMauSac(await response.json());
    }

    async function getHoaDonCho() {
        var response = await getMethod("/api/v1/hoa-don/hoa-don-cho");
        var list = await response.json();
        sethoaDonCho(list);
        if (list.length > 0) {
            loadChiTietHdCho(list[0]);
        }
    }

    async function taoHoaDonCho() {
        var res = await postMethod("/api/v1/hoa-don/tao-hoa-don-cho");

        if (res.status < 300) {
            if (orders.length < 5) {
                const newOrder = {
                    id: `order${orders.length + 1}`,
                    name: `Đơn hàng ${orders.length + 1}`,
                };

                setOrders((prevOrders) => {
                    const updatedOrders = [...prevOrders, newOrder];
                    setActiveOrder(newOrder.id);
                    return updatedOrders;
                });

                Swal.fire({
                    title: "Thông báo",
                    text: "Tạo hóa đơn chờ thành công!",
                    icon: "success",
                }).then(() => {
                    window.location.reload();
                });
            } else {
                toast.warn("Tối đa 5 hoá đơn");
            }
        } else if (res.status === 417) {
            const result = await res.json();
            toast.warning(result.defaultMessage);
        }
    }

    async function deleteHoaDon() {
        if (!hoaDonToDelete) return;

        const response = await deleteMethod(
            "/api/v1/hoa-don/xoa-don-cho?idHoaDon=" + hoaDonToDelete
        );
        if (response.status < 300) {
            toast.success("Xóa thành công!");
            window.location.reload();
        } else if (response.status === 417) {
            const result = await response.json();
            toast.warning(result.defaultMessage);
        }

        handleCloseDeleteModal();
    }

    async function loadDotGiamGia(hoadoncho) {
        var response = await getMethod("/api/phieu-giam-gia");
        var result = await response.json();

        var responseHoaDon = await getMethod("/api/v1/hoa-don/hoa-don-cho");
        var list = await responseHoaDon.json();

        const defaultDiscount = {
            tenPhieu: "Chọn phiếu giảm giá",
            id: 0,
            loaiPhieu: false,
            giaTriGiam: 0,
        };

        const discountList = [
            defaultDiscount,
            ...result.filter((x) => x.trangThai === 1),
        ];
        setdotGiamGia(discountList);

        if (selectHoaDonCho == null) {
            if (list.length > 0) {
                if (list[0].phieuGiamGia != null) {
                    setSelecDotGiamGia(list[0].phieuGiamGia);
                } else {
                    setSelecDotGiamGia(defaultDiscount);
                }
            }
        }

        if (hoadoncho != null) {
            if (hoadoncho.phieuGiamGia != null) {
                setSelecDotGiamGia(hoadoncho.phieuGiamGia);
            } else {
                setSelecDotGiamGia(defaultDiscount);
            }
        }
    }

    async function loadChiTietHdCho(item) {
        try {
            const response = await getMethod("/api/v1/hoa-don/find-by-id?id=" + item.id);
            const result = await response.json();
            setSelectHoaDonCho(result);

            resetPaymentInfo();

            const invoiceData = {
                maHoaDon: result.maHoaDon,
                nguoitao: result.nguoiTao,
                date: result.ngayTao,
                soDienThoai: result.khachHang?.soDienThoai || "",
                customerName: result.khachHang ? result.khachHang.hoVaTen : "Khách Lẻ",
                items: result.hoaDonChiTiets.map((item) => ({
                    name: item.sanPhamChiTiet?.sanPham.tenSanPham || "",
                    thuongHieu: item.sanPhamChiTiet?.sanPham.thuongHieu.tenThuongHieu || "",
                    mauSac: item.sanPhamChiTiet?.mauSac.tenMauSac || "",
                    kichCo: item.sanPhamChiTiet?.kichCo.tenKichCo || "",
                    quantity: item.soLuong,
                    price: item.giaSanPham,
                })),
                total: result.hoaDonChiTiets.reduce((total, item) => {
                    return total + Number(item.soLuong) * Number(item.giaSanPham);
                }, 0),
            };

            console.log("Invoice Data:", invoiceData);
            setDataInvoice(invoiceData);

            if (result.khachHang) {
                setselectKhachHang(result.khachHang);
            } else {
                setselectKhachHang({ id: -1, hoVaTen: "Khách lẻ", soDienThoai: "" });
            }

            const tong = result.hoaDonChiTiets.reduce((total, item) => {
                return total + Number(item.soLuong) * Number(item.giaSanPham);
            }, 0);

            loadDotGiamGia(result);
            setTongTienNew(tong);
            setTongTien(tong);

            console.log("Item:", item);
        } catch (error) {
            console.error("Lỗi khi tải chi tiết hóa đơn:", error);
            toast.error("Không thể tải chi tiết hóa đơn");
        }
    }

    async function getKhachHang() {
        try {
            const response = await getMethod("/api/khachhang");
            const list = await response.json();
            const arr = [{ id: -1, hoVaTen: "Khách lẻ", soDienThoai: "" }].concat(list);
            setKhachHang(arr);
        } catch (error) {
            console.error("Lỗi khi tải danh sách khách hàng:", error);
            toast.error("Không thể tải danh sách khách hàng");
        }
    }

    async function CapNhatKhachHang() {
        if (!selectHoaDonCho || !selectHoaDonCho.id) {
            toast.error("Vui lòng chọn hóa đơn trước!");
            return;
        }
        if (!selectKhachHang || selectKhachHang.id === undefined) {
            toast.error("Vui lòng chọn khách hàng!");
            return;
        }

        try {
            const res = await postMethod(
                "/api/v1/hoa-don/cap-nhat-khach-hang?idKhachHang=" +
                selectKhachHang.id +
                "&idHoaDon=" +
                selectHoaDonCho.id
            );
            if (res.status < 300) {
                toast.success("Cập nhật khách hàng thành công");
                loadChiTietHdCho(selectHoaDonCho);
            } else {
                const errorData = await res.json();
                toast.error(errorData.message || "Cập nhật thất bại");
            }
        } catch (error) {
            console.error("Lỗi khi cập nhật khách hàng:", error);
            toast.error("Có lỗi xảy ra khi cập nhật khách hàng");
        }
    }

    async function getChiTietSanPham() {
        var payload = {
            thuongHieuId: selectThuongHieu == null ? null : selectThuongHieu.id,
            chatLieuId: selectChatlieu == null ? null : selectChatlieu.id,
            deGiayId: selectDeGiay == null ? null : selectDeGiay.id,
            mauSacId: selectmauSac == null ? null : selectmauSac.id,
            kichThuocId: selectkichThuoc == null ? null : selectkichThuoc.id,
        };
        var response = await postMethodPayload(
            "/api/san-pham-chi-tiet/public/loc-chi-tiet-san-pham-list",
            payload
        );
        setChiTietSanPham(await response.json());
    }

    async function handleAddChiTietHoaDon(event) {
        event.preventDefault();
        var soluong = event.target.elements.soluong.value;
        var chitietsp = event.target.elements.chitietsp.value;
        const res = await postMethod(
            "/api/hoa-don-chi-tiet/them-vao-hoa-don?hoaDonId=" +
            selectHoaDonCho.id +
            "&chiTietSp=" +
            chitietsp +
            "&soLuong=" +
            soluong
        );
        if (res.status < 300) {
            toast.success("Thành công!");
            loadChiTietHdCho(selectHoaDonCho);
            var response = await getMethod(
                "/api/v1/hoa-don/find-by-id?id=" + selectHoaDonCho.id
            );
            var result = await response.json();
            setSelectHoaDonCho(result);
        }
        if (res.status == 417) {
            var result = await res.json();
            toast.error(result.defaultMessage);
        }
    }

    async function deleteChiTiet(id) {
        const response = await deleteMethod(
            "/api/hoa-don-chi-tiet/xoa-chi-tiet-don-cho?id=" + id
        );
        if (response.status < 300) {
            resetPaymentInfo();
            toast.success("Xóa thành công!");
            loadChiTietHdCho(selectHoaDonCho);
        }
        if (response.status == 417) {
            var result = await response.json();
            toast.warning(result.defaultMessage);
        }
    }

    const [showConfirmModal, setShowConfirmModal] = useState(false);

    const handleXacNhanDatHang = () => {
        setShowConfirmModal(true);
    };

    const handleCloseConfirmModal = () => {
        setShowConfirmModal(false);
    };

    const handleConfirmPayment = () => {
        if (paymentMethod === "tienMat") {
            if (!soTienKhachDua || soTienKhachDua <= 0) {
                toast.error("Vui lòng nhập số tiền khách đưa!");
                return;
            }
            if (soTienKhachDua < tongTien) {
                toast.error("Số tiền khách đưa không đủ để thanh toán!");
                return;
            }
            setSoTienThanhToan(soTienKhachDua);
            const tienThuaTinh = soTienKhachDua - tongTien;
            setTienThua(tienThuaTinh > 0 ? tienThuaTinh : 0);
        } else if (paymentMethod === "timo") {
            setSoTienThanhToan(tongTien);
            setTienThua(0);
        } else {
            toast.error("Vui lòng chọn phương thức thanh toán!");
            return;
        }

        setShowModal(false);
    };

    const handleFinalConfirm = async () => {
        try {
            const response2 = await postMethod(
                "/api/v1/hoa-don/cap-nhat-phieu-giam-gia?idPGG=" +
                selectDotGiamGia.id +
                "&idHoaDon=" +
                selectHoaDonCho.id
            );
            if (response2.status < 300) {
                Swal.fire({
                    title: "Thông báo",
                    text: "Thành công!",
                    icon: "success",
                    preConfirm: () => {
                        resetPaymentInfo();
                        window.location.reload();
                    },
                });
                toast.success("Đã xuất hóa đơn");
            } else if (response2.status === 417) {
                toast.error("Phiếu giảm giá đã hết hiệu lực, vui lòng chọn phiếu khác!");
                return;
            }

            const response = await postMethod(
                "/api/v1/hoa-don/xac-nhan-dat-tai-quay?idHoaDon=" + selectHoaDonCho.id
            );
            if (response.status < 300) {
                Swal.fire({
                    title: "Thông báo",
                    text: "Thành công!",
                    icon: "success",
                    preConfirm: () => {
                        resetPaymentInfo();
                        window.location.reload();
                    },
                });
            } else if (response.status === 417) {
                const result = await response.json();
                toast.warning(result.defaultMessage);
            }

            handlePDF();
        } catch (error) {
            console.error("Lỗi khi xác nhận đặt hàng", error);
            toast.error("Có lỗi xảy ra khi xác nhận đặt hàng");
        }

        setShowConfirmModal(false);
    };

    async function change_value(quality, hdct) {
        const response = await postMethod(
            "/api/hoa-don-chi-tiet/updateSoLuong?id=" + hdct + "&soLuong=" + quality
        );
        if (response.status < 300) {
            getHoaDonCho();
        }
        if (response.status == 417) {
            var result = await response.json();
            toast.warning(result.defaultMessage);
        }
    }

    async function change_value_enter(quality, hdct, sl_old, sl, idsp) {
        let quality_sp = document.getElementById(idsp).value;

        if (quality == "") {
            deleteChiTiet(hdct);
            return;
        }
        if (quality > sl) {
            toast.warning("Số lượng không đủ");
            return;
        }
        const response = await postMethod(
            "/api/hoa-don-chi-tiet/updateSoLuongEnter?id=" +
            hdct +
            "&soLuong=" +
            quality +
            "&slold=" +
            sl_old
        );
        if (response.status < 300) {
            getHoaDonCho();
        }
        if (response.status == 417) {
            var result = await response.json();
            toast.warning(result.defaultMessage);
        }
    }

    function handleIncrease(idsp, quality, hdct) {
        let quality_sp = document.getElementById(idsp).value;
        if (Number(quality_sp) + Number(quality) === 0) {
            deleteChiTiet(hdct);
            return;
        }
        document.getElementById(idsp).value = String(
            Number(quality_sp) + Number(quality)
        );
        change_value(quality, hdct);
    }

    function handleDecrease(idsp, quality, hdct, sl) {
        let quality_sp = document.getElementById(idsp).value;
        if (Number(quality_sp) >= sl) {
            toast.warning("Số lượng không đủ");
            return;
        }
        document.getElementById(idsp).value = String(
            Number(quality_sp) + Number(quality)
        );
        change_value(quality, hdct);
    }

    function change_dotGiamGia(e) {
        setSelecDotGiamGia(e);
        capNhapPhieuGiamGia(e);
    }

    async function capNhapPhieuGiamGia(phigg) {
        if (selectHoaDonCho !== null) {
            let tongt = selectHoaDonCho.hoaDonChiTiets.reduce(
                (tong, sanPham) => tong + sanPham.giaSanPham * sanPham.soLuong,
                0
            );

            let pgg = phigg;
            if (selectHoaDonCho.hoaDonChiTiets != null) {
                if (tongt >= pgg.donToiThieu) {
                    if (pgg.loaiPhieu) {
                        setTongTien(tongt - Number(pgg.giaTriGiam));
                    } else {
                        let tong_tien_toi_da = tongt * (pgg.giaTriGiam / 100);
                        let tong_tien =
                            tong_tien_toi_da > pgg.giaTriGiamToiDa
                                ? tongt - pgg.giaTriGiamToiDa
                                : tongt - tong_tien_toi_da;
                        setTongTien(tong_tien);
                    }
                }
                const response2 = await postMethod(
                    "/api/v1/hoa-don/cap-nhat-phieu-giam-gia-hd?idPGG=" +
                    phigg.id +
                    "&idHoaDon=" +
                    selectHoaDonCho.id
                );
            }
        } else {
            toast.error("Vui lòng chọn hóa đơn để cập nhật phiếu giảm giá");
        }
    }

    return (
        <div style={{ marginBottom: "150px", boxSizing: "border-box" }}>
            <div
                className="headerpageadmin d-flex justify-content-between align-items-center p-3 bg-light border"
                style={{ boxSizing: "border-box" }}
            >
                <strong className="text-left">
                    <i className="fa fa-list"></i> Bán hàng tại quầy
                </strong>
                <div className="search-wrapper d-flex align-items-center">
                    <div className="search-container"></div>
                    <Button className="btn btn-primary" onClick={taoHoaDonCho}>
                        + Tạo hoá đơn
                    </Button>
                </div>
            </div>

            <Nav variant="tabs">
                {hoaDonCho.map((item, index) => (
                    <Nav.Item key={item.id}>
                        <Nav.Link
                            eventKey={item.id}
                            active={activeOrder === item.id}
                            onClick={(e) => {
                                if (e.target !== e.currentTarget) return;
                                setActiveOrder(item.id);
                                loadChiTietHdCho(item);
                            }}
                            style={{
                                fontWeight: activeOrder === item.id ? "bold" : "normal",
                                color: activeOrder === item.id ? "black" : "gray",
                                display: "flex",
                                alignItems: "center",
                            }}
                        >
                            {`Đơn hàng ${index + 1} + HĐ ${item.id}`}
                            <FaTimesCircle
                                style={{ marginLeft: "10px", color: "red", cursor: "pointer" }}
                                onClick={(e) => {
                                    e.stopPropagation();
                                    handleShowDeleteModal(item.id);
                                }}
                            />
                        </Nav.Link>
                    </Nav.Item>
                ))}
            </Nav>
            <hr />

            <div
                id="anh"
                style={{
                    margin: "12.5rem",
                    marginLeft: "30rem",
                }}
            >
                <img className="divrong" src={nodata} />
            </div>

            <div id="an">
                <div className="dssanphamhoadon">
                    <div className="d-flex">
                        <strong>Thông tin sản phẩm</strong>
                        <strong className="mahdcho">{selectHoaDonCho?.maHoaDon}</strong>
                        <strong className="mahdcho">{selectHoaDonCho?.ngayTao}</strong>
                        <button
                            data-bs-toggle="modal"
                            data-bs-target="#addcate"
                            className="btn btn-primary btnthemsanphamhd"
                        >
                            Chọn sản phẩm
                        </button>
                    </div>
                </div>
                <div className="listSpChon">
                    {selectHoaDonCho?.hoaDonChiTiets.length == 0 ? (
                        <div className="divrong">
                            <img className="imganhgiohangrong" src={giotrong} />
                        </div>
                    ) : (
                        <div className="divlistspct">
                            <table className="table table-borderd">
                                <tr>
                                    <th>STT</th>
                                    <th>Ảnh</th>
                                    <th>Sản phẩm</th>
                                    <th>Số lượng</th>
                                    <th>Đơn giá</th>
                                    <th>Tổng tiền</th>
                                    <th>Thao tác</th>
                                </tr>
                                {selectHoaDonCho?.hoaDonChiTiets.map((item, index) => {
                                    return (
                                        <tr>
                                            <td>{index + 1}</td>
                                            <td>
                                                <img
                                                    src={
                                                        item.sanPhamChiTiet.anhs.length > 0
                                                            ? item.sanPhamChiTiet.anhs[0].tenAnh
                                                            : item.sanPhamChiTiet.sanPham.anh
                                                    }
                                                    className="imgtable"
                                                />
                                            </td>
                                            <td>
                                                {item.sanPhamChiTiet.sanPham?.maSanPham} -{" "}
                                                {item.sanPhamChiTiet.sanPham?.tenSanPham}
                                                <br />
                                                Chất liệu:{" "}
                                                {item.sanPhamChiTiet.sanPham.chatLieu.tenChatLieu}
                                                <br />
                                                Đế giày: {item.sanPhamChiTiet.sanPham.deGiay.tenDeGiay}
                                                <br />
                                                Thương hiệu:{" "}
                                                {item.sanPhamChiTiet.sanPham.thuongHieu.tenThuongHieu}
                                                <br />
                                                Kích thước: {item.sanPhamChiTiet.kichCo.tenKichCo}
                                                <br />
                                                Màu sắc: {item.sanPhamChiTiet.mauSac.tenMauSac}
                                                <span
                                                    class="square"
                                                    style={{
                                                        background: item.sanPhamChiTiet.mauSac.maMauSac,
                                                    }}
                                                ></span>
                                                <br />
                                                {item.sanPhamChiTiet.soLuong}
                                            </td>
                                            <td>
                                                <div
                                                    style={{
                                                        display: "flex",
                                                        alignItems: "center",
                                                        justifyContent: "center",
                                                        gap: "5px",
                                                    }}
                                                >
                                                    <button
                                                        onClick={(e) =>
                                                            handleIncrease(
                                                                item.sanPhamChiTiet.id,
                                                                -1,
                                                                item.id
                                                            )
                                                        }
                                                        style={{
                                                            padding: "5px 10px",
                                                            backgroundColor: "#f0f0f0",
                                                            border: "1px solid #ccc",
                                                            borderRadius: "4px",
                                                            color: "#333",
                                                            cursor: "pointer",
                                                            fontSize: "14px",
                                                        }}
                                                    >
                                                        -
                                                    </button>
                                                    <input
                                                        onChange={(e) =>
                                                            change_value_enter(
                                                                e.target.value,
                                                                item.id,
                                                                item.soLuong,
                                                                item.sanPhamChiTiet.soLuong,
                                                                item.sanPhamChiTiet.id
                                                            )
                                                        }
                                                        value={item.soLuong}
                                                        id={item.sanPhamChiTiet.id}
                                                        className="inputtaiquay"
                                                        type="text"
                                                        min={1}
                                                        style={{
                                                            width: "50px",
                                                            textAlign: "center",
                                                            border: "1px solid #ccc",
                                                            borderRadius: "4px",
                                                            padding: "5px",
                                                            fontSize: "14px",
                                                        }}
                                                    />
                                                    <button
                                                        onClick={(e) =>
                                                            handleDecrease(
                                                                item.sanPhamChiTiet.id,
                                                                1,
                                                                item.id,
                                                                item.sanPhamChiTiet.soLuong
                                                            )
                                                        }
                                                        style={{
                                                            padding: "5px 10px",
                                                            backgroundColor: "#f0f0f0",
                                                            border: "1px solid #ccc",
                                                            borderRadius: "4px",
                                                            color: "#333",
                                                            cursor: "pointer",
                                                            fontSize: "14px",
                                                        }}
                                                    >
                                                        +
                                                    </button>
                                                </div>
                                            </td>
                                            <td>{formatMoney(item.sanPhamChiTiet.giaTien)}</td>
                                            <td>
                                                {formatMoney(
                                                    item.sanPhamChiTiet.giaTien * item.soLuong
                                                )}
                                            </td>
                                            <td>
                                                <button
                                                    onClick={() => deleteChiTiet(item.id)}
                                                    style={{
                                                        backgroundColor: "#dc3545",
                                                        color: "#fff",
                                                        border: "none",
                                                        borderRadius: "4px",
                                                        padding: "6px 10px",
                                                        display: "flex",
                                                        alignItems: "center",
                                                        justifyContent: "center",
                                                        cursor: "pointer",
                                                        transition: "background-color 0.3s ease",
                                                    }}
                                                    onMouseEnter={(e) =>
                                                        (e.target.style.backgroundColor = "#c82333")
                                                    }
                                                    onMouseLeave={(e) =>
                                                        (e.target.style.backgroundColor = "#dc3545")
                                                    }
                                                >
                                                    <i
                                                        className="fa fa-trash"
                                                        style={{ fontSize: "14px" }}
                                                    ></i>
                                                </button>
                                            </td>
                                        </tr>
                                    );
                                })}
                            </table>
                        </div>
                    )}
                </div>
                <hr />

                <div
                    className="row"
                    style={{
                        display: "flex",
                        justifyContent: "space-between",
                        alignItems: "flex-start",
                    }}
                >
                    <div
                        className="col-sm-6"
                        style={{
                            display: "flex",
                            flexDirection: "column",
                            justifyContent: "flex-start",
                        }}
                    >
                        <div className="dssanphamhoadon" style={{ padding: "10px" }}>
                            <div
                                className="d-flex"
                                style={{
                                    display: "flex",
                                    justifyContent: "space-between",
                                    alignItems: "center",
                                }}
                            >
                                <strong>Thông tin khách hàng</strong>
                                <div>
                                    <strong className="mahdcho">
                                        {selectKhachHang?.hoVaTen}
                                    </strong>
                                    <strong className="mahdcho">
                                        {selectKhachHang?.soDienThoai}
                                    </strong>
                                </div>
                            </div>
                            <div className="row mt-3" style={{ marginTop: "1rem" }}>
                                <div className="col-sm-7">
                                    <Select
                                        className="select-container selectheader"
                                        options={khachHang}
                                        value={selectKhachHang}
                                        onChange={setselectKhachHang}
                                        getOptionLabel={(option) =>
                                            option.hoVaTen + " - " + option.soDienThoai
                                        }
                                        getOptionValue={(option) => option.id}
                                        placeholder="Chọn khách hàng"
                                    />
                                </div>
                                <div className="col-sm-5">
                                    <button
                                        onClick={() => CapNhatKhachHang()}
                                        className="btn btn-primary w-100"
                                        style={{ marginTop: "1px" }}
                                    >
                                        Chọn khách hàng
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div
                        className="col-sm-6"
                        style={{
                            display: "flex",
                            flexDirection: "column",
                            justifyContent: "flex-start",
                        }}
                    >
                        <div className="dssanphamhoadon" style={{ padding: "10px" }}>
                            <div
                                className="d-flex"
                                style={{
                                    display: "flex",
                                    justifyContent: "space-between",
                                    alignItems: "center",
                                }}
                            >
                                <strong>Thông tin thanh toán</strong>
                            </div>
                            <table
                                className="table mt-3"
                                style={{ marginTop: "10px", width: "100%" }}
                            >
                                <tbody>
                                <tr>
                                    <th style={{ width: "30%" }}>Tiền hàng</th>
                                    <td>
                                        {formatMoney(
                                            selectHoaDonCho != null
                                                ? selectHoaDonCho.hoaDonChiTiets.reduce(
                                                (tong, sanPham) =>
                                                    tong + sanPham.giaSanPham * sanPham.soLuong,
                                                0
                                                )
                                                : 0
                                        )}
                                    </td>
                                </tr>
                                <tr>
                                    <th style={{ width: "30%" }}>Tổng tiền</th>
                                    <td>
                                        {formatMoney(
                                            Math.max(
                                                tongTien -
                                                (selectDotGiamGia && selectDotGiamGia.giamGia
                                                    ? selectDotGiamGia.giamGia
                                                    : 0),
                                                0
                                            )
                                        )}
                                    </td>
                                </tr>
                                <tr>
                                    <th style={{ width: "30%" }}>
                                        Thanh toán
                                        <FaCreditCard
                                            style={{
                                                fontSize: "18px",
                                                cursor: "pointer",
                                                marginLeft: "10px",
                                            }}
                                            onClick={() => setShowModal(true)}
                                        />
                                    </th>
                                    <td>{formatMoney(soTienThanhToan)}</td>
                                </tr>
                                <tr>
                                    <th style={{ width: "30%" }}>Tiền thừa</th>
                                    <td>
                                        {tienThua > 0 ? (
                                            <span>{formatMoney(tienThua)}</span>
                                        ) : (
                                            "0 ₫"
                                        )}
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <button
                                onClick={handleXacNhanDatHang}
                                disabled={soTienThanhToan <= 0}
                                className="btn btn-primary w-20"
                                style={{
                                    marginTop: "10px",
                                    opacity: soTienThanhToan > 0 ? 1 : 0.5,
                                    cursor: soTienThanhToan > 0 ? "pointer" : "not-allowed",
                                }}
                            >
                                Xác nhận đặt hàng
                            </button>
                            <div
                                style={{
                                    position: "absolute",
                                    top: "-9999px",
                                    left: "-9999px",
                                }}
                            >
                                <Invoice
                                    ref={invoiceRef}
                                    invoiceData={dataInvoice}
                                    giamgia={selectDotGiamGia}
                                />
                            </div>
                        </div>
                    </div>
                </div>

                <Modal show={showConfirmModal} onHide={handleCloseConfirmModal} centered>
                    <Modal.Header closeButton>
                        <Modal.Title>Xác nhận đặt hàng</Modal.Title>
                    </Modal.Header>
                    <Modal.Body>
                        Bạn có chắc chắn muốn xác nhận đặt hàng không? <br />
                        <strong>Hành động này không thể quay lại!</strong>
                    </Modal.Body>
                    <Modal.Footer>
                        <Button variant="secondary" onClick={handleCloseConfirmModal}>
                            Hủy
                        </Button>
                        <Button variant="primary" onClick={handleFinalConfirm}>
                            Xác nhận
                        </Button>
                    </Modal.Footer>
                </Modal>

                <div
                    class="modal fade"
                    id="addcate"
                    tabindex="-1"
                    aria-labelledby="exampleModalLabel"
                    aria-hidden="false"
                >
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">
                                    Chọn sản phẩm{" "}
                                    <strong className="mahdcho">
                                        Mã HD: {selectHoaDonCho?.maHoaDon}
                                    </strong>
                                    <strong className="mahdcho">
                                        {selectHoaDonCho?.ngayTao}
                                    </strong>
                                </h5>
                                <button
                                    type="button"
                                    class="btn-close"
                                    data-bs-dismiss="modal"
                                    aria-label="Close"
                                ></button>
                            </div>
                            <div className="modal-body">
                                <div
                                    className="row"
                                    style={{
                                        display: "flex",
                                        flexWrap: "wrap",
                                        gap: "10px",
                                        justifyContent: "space-between",
                                    }}
                                >
                                    <div style={{ flex: "1 1 calc(20% - 10px)" }}>
                                        <label className="lb-form">Chọn thương hiệu</label>
                                        <Select
                                            options={thuongHieu}
                                            value={selectThuongHieu}
                                            onChange={setselectThuongHieu}
                                            getOptionLabel={(option) => option.tenThuongHieu}
                                            getOptionValue={(option) => option.id}
                                        />
                                    </div>
                                    <div style={{ flex: "1 1 calc(20% - 10px)" }}>
                                        <label className="lb-form">Chọn chất liệu</label>
                                        <Select
                                            options={chatlieu}
                                            value={selectChatlieu}
                                            onChange={setselectChatlieu}
                                            getOptionLabel={(option) => option.tenChatLieu}
                                            getOptionValue={(option) => option.id}
                                        />
                                    </div>
                                    <div style={{ flex: "1 1 calc(20% - 10px)" }}>
                                        <label className="lb-form">Chọn đế giày</label>
                                        <Select
                                            options={deGiay}
                                            value={selectDeGiay}
                                            onChange={setselectDeGiay}
                                            getOptionLabel={(option) => option.tenDeGiay}
                                            getOptionValue={(option) => option.id}
                                        />
                                    </div>
                                    <div style={{ flex: "1 1 calc(20% - 10px)" }}>
                                        <label className="lb-form">Chọn màu sắc</label>
                                        <Select
                                            options={mauSac}
                                            value={selectmauSac}
                                            onChange={setselectmauSac}
                                            getOptionLabel={(option) => option.tenMauSac}
                                            getOptionValue={(option) => option.id}
                                        />
                                    </div>
                                    <div style={{ flex: "1 1 calc(20% - 10px)" }}>
                                        <label className="lb-form">Chọn kích thước</label>
                                        <Select
                                            options={kichThuoc}
                                            value={selectkichThuoc}
                                            onChange={setselectkichThuoc}
                                            getOptionLabel={(option) => option.tenKichCo}
                                            getOptionValue={(option) => option.id}
                                        />
                                    </div>
                                    <div style={{ flex: "1 1 20%", maxWidth: "500px" }}>
                                        <label className="lb-form">Tìm kiếm sản phẩm</label>
                                        <InputGroup style={{ display: "flex", alignItems: "center" }}>
                                            <Form.Control
                                                style={{ flex: "1", padding: "0.375rem 0.75rem" }}
                                                placeholder="Nhập từ khóa tìm kiếm"
                                                value={searchKeyword}
                                                onChange={(e) => setSearchKeyword(e.target.value)}
                                            />
                                        </InputGroup>
                                    </div>
                                </div>
                                <div
                                    className="row"
                                    style={{
                                        display: "flex",
                                        justifyContent: "flex-start",
                                        marginTop: "20px",
                                    }}
                                >
                                    <div style={{ flex: "0 0 15%" }}>
                                        <button
                                            onClick={getChiTietSanPham}
                                            className="btn btn-primary form-control"
                                        >
                                            Lọc sản phẩm
                                        </button>
                                    </div>
                                    <div style={{ flex: "0 0 10%" }}>
                                        <button
                                            onClick={resetFilters}
                                            className="btn btn-secondary form-control"
                                        >
                                            Làm mới
                                        </button>
                                    </div>
                                </div>

                                <br />
                                <div className="dsChitietsp">
                                    <table className="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Ảnh</th>
                                            <th>Sản phẩm</th>
                                            <th>Giá bán</th>
                                            <th>Hành động</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        {filteredSanPham.length > 0 ? (
                                            filteredSanPham.map((item, index) => (
                                                <tr key={index}>
                                                    <td>{index + 1}</td>
                                                    <td>
                                                        <img
                                                            src={item.anhs[0].tenAnh}
                                                            className="imgtable"
                                                        />
                                                    </td>
                                                    <td>
                                                        {item.sanPham?.maSanPham} -{" "}
                                                        {item.sanPham?.tenSanPham}
                                                        <br />
                                                        Chất liệu: {item.sanPham.chatLieu.tenChatLieu}
                                                        <br />
                                                        Đế giày: {item.sanPham.deGiay.tenDeGiay}
                                                        <br />
                                                        Thương hiệu:{" "}
                                                        {item.sanPham.thuongHieu.tenThuongHieu}
                                                        <br />
                                                        Kích thước: {item.kichCo.tenKichCo}
                                                        <br />
                                                        Màu sắc: {item.mauSac.tenMauSac}
                                                        <span
                                                            className="square"
                                                            style={{ background: item.mauSac.maMauSac }}
                                                        ></span>
                                                        <br />
                                                        Số lượng: {item.soLuong}
                                                    </td>
                                                    <td>{formatMoney(item.giaTien)}</td>
                                                    <td>
                                                        <form onSubmit={handleAddChiTietHoaDon}>
                                                            <input
                                                                name="chitietsp"
                                                                type="hidden"
                                                                value={item.id}
                                                            />
                                                            <input
                                                                name="soluong"
                                                                defaultValue={1}
                                                                min={1}
                                                                max={item.soLuong}
                                                                type="number"
                                                                className="inputtaiquay"
                                                            />
                                                            <button className="btn btn-primary btnthemhdct">
                                                                Thêm
                                                            </button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            ))
                                        ) : (
                                            <tr>
                                                <td colSpan="4" className="text-center">
                                                    Không có sản phẩm nào phù hợp.
                                                </td>
                                            </tr>
                                        )}
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <Modal show={showDeleteModal} onHide={handleCloseDeleteModal} centered>
                    <Modal.Header closeButton>
                        <Modal.Title>Xác nhận xóa</Modal.Title>
                    </Modal.Header>
                    <Modal.Body>Bạn có chắc chắn muốn xóa hóa đơn này không?</Modal.Body>
                    <Modal.Footer>
                        <Button variant="secondary" onClick={handleCloseDeleteModal}>
                            Hủy
                        </Button>
                        <Button variant="danger" onClick={deleteHoaDon}>
                            Xóa
                        </Button>
                    </Modal.Footer>
                </Modal>

                <Modal show={showModal} onHide={() => setShowModal(false)} centered>
                    <Modal.Header closeButton>
                        <Modal.Title style={{ textAlign: "center", width: "100%" }}>
                            Thanh toán hóa đơn
                        </Modal.Title>
                    </Modal.Header>
                    <Modal.Body>
                        <div
                            style={{
                                textAlign: "center",
                                marginBottom: "20px",
                                fontSize: "18px",
                                fontWeight: "bold",
                            }}
                        >
                            Tổng tiền:{" "}
                            <span style={{ color: "red" }}>
                                {Math.max(tongTien, 0).toLocaleString()} VNĐ
                            </span>
                        </div>

                        <p
                            style={{
                                textAlign: "center",
                                fontSize: "16px",
                                fontWeight: "500",
                            }}
                        >
                            Vui lòng chọn phương thức thanh toán:
                        </p>
                        <div
                            style={{
                                display: "flex",
                                justifyContent: "space-between",
                                marginBottom: "20px",
                            }}
                        >
                            <div
                                style={{
                                    display: "flex",
                                    flexDirection: "column",
                                    alignItems: "center",
                                    cursor: "pointer",
                                    width: "45%",
                                    padding: "10px",
                                    border: "1px solid #ccc",
                                    borderRadius: "8px",
                                    backgroundColor: paymentMethod === "tienMat" ? "#d4edda" : "#f8f9fa",
                                }}
                                onClick={() => setPaymentMethod("tienMat")}
                            >
                                <img
                                    src="https://cdn-icons-png.flaticon.com/512/2382/2382461.png"
                                    alt="Tiền mặt"
                                    style={{
                                        width: "50px",
                                        height: "50px",
                                        marginBottom: "10px",
                                    }}
                                />
                                <span>Tiền mặt</span>
                            </div>
                            <div
                                style={{
                                    display: "flex",
                                    flexDirection: "column",
                                    alignItems: "center",
                                    cursor: "pointer",
                                    width: "45%",
                                    padding: "10px",
                                    border: "1px solid #ccc",
                                    borderRadius: "8px",
                                    backgroundColor: paymentMethod === "timo" ? "#d4edda" : "#f8f9fa",
                                }}
                                onClick={() => setPaymentMethod("timo")}
                            >
                                <img
                                    src={timo}
                                    alt="MB Bank"
                                    style={{
                                        width: "50px",
                                        height: "50px",
                                        marginBottom: "10px",
                                    }}
                                />
                                <span>MB Bank</span>
                            </div>
                        </div>

                        {paymentMethod === "timo" && (
                            <div style={{ textAlign: "center", marginBottom: "20px" }}>
                                <img
                                    src={qrthanhtoan}
                                    alt="QR Code"
                                    style={{
                                        width: "150px",
                                        height: "150px",
                                        marginBottom: "10px",
                                    }}
                                />
                                <p>Quét mã QR để thanh toán</p>
                            </div>
                        )}

                        {paymentMethod === "tienMat" && (
                            <div style={{ marginBottom: "20px" }}>
                                <p
                                    style={{
                                        fontSize: "16px",
                                        fontWeight: "500",
                                        marginBottom: "10px",
                                    }}
                                >
                                    Tiền khách đưa:
                                </p>
                                <input
                                    type="text"
                                    placeholder="Nhập số tiền khách đưa"
                                    value={soTienKhachDua ? soTienKhachDua.toLocaleString() : ""}
                                    onChange={(e) => {
                                        const value = e.target.value.replace(/\D/g, "");
                                        setSoTienKhachDua(value ? parseInt(value, 10) : "");
                                    }}
                                    style={{
                                        width: "100%",
                                        padding: "10px",
                                        fontSize: "16px",
                                        borderRadius: "8px",
                                        border: "1px solid #ccc",
                                    }}
                                />
                            </div>
                        )}

                        {paymentMethod === "tienMat" && soTienKhachDua > 0 && (
                            <div
                                style={{
                                    textAlign: "center",
                                    marginBottom: "20px",
                                    fontSize: "16px",
                                    fontWeight: "500",
                                }}
                            >
                                {tienThieu > 0 ? (
                                    <>
                                        Tiền thiếu:{" "}
                                        <span style={{ color: "red" }}>
                                            {tienThieu.toLocaleString()} VNĐ
                                        </span>
                                    </>
                                ) : tienThieu === 0 ? (
                                    <>Đủ tiền</>
                                ) : (
                                    <>
                                        Tiền thừa:{" "}
                                        <span style={{ color: "green" }}>
                                            {Math.abs(tienThieu).toLocaleString()} VNĐ
                                        </span>
                                    </>
                                )}
                            </div>
                        )}

                        <button
                            style={{
                                width: "100%",
                                padding: "10px",
                                fontSize: "16px",
                                fontWeight: "bold",
                                borderRadius: "8px",
                                border: "none",
                                backgroundColor:
                                    paymentMethod === "timo" || (paymentMethod === "tienMat" && tienThieu <= 0)
                                        ? "#28a745"
                                        : "#ccc",
                                color: "#fff",
                                cursor:
                                    paymentMethod === "timo" || (paymentMethod === "tienMat" && tienThieu <= 0)
                                        ? "pointer"
                                        : "not-allowed",
                            }}
                            disabled={paymentMethod !== "timo" && tienThieu > 0}
                            onClick={handleConfirmPayment}
                        >
                            XÁC NHẬN
                        </button>
                    </Modal.Body>
                </Modal>
            </div>
        </div>
    );
};

export default AdminDatTaiQuay;