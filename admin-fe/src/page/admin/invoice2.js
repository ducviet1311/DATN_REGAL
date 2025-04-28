import React, { forwardRef } from "react";
import { formatMoney } from "../../services/money";

const Invoice2 = forwardRef(({ invoiceData, giamgia }, ref) => {
    if (!invoiceData) {
        return (
            <div ref={ref}>
                <p>Không có dữ liệu hóa đơn để hiển thị.</p>
            </div>
        );
    }

    const tongTienHang = invoiceData.items?.reduce((total, item) => {
        return total + Number(item.quantity) * Number(item.price);
    }, 0) || 0;

    const soTienGiam = giamgia?.loaiPhieu
        ? Number(giamgia.giaTriGiam) || 0
        : (tongTienHang * (Number(giamgia?.giaTriGiam) || 0)) / 100;

    const phiVanChuyen = Number(invoiceData.phiVanChuyen) || 0;
    const tongTienSauGiam = Math.max(tongTienHang - soTienGiam, 0) + phiVanChuyen;

    return (
        <div
            ref={ref}
            style={{
                fontFamily: "Arial, sans-serif",
                width: "80mm",
                margin: "0 auto",
                fontSize: "8px",
                lineHeight: "1.2",
                padding: "5px",
            }}
        >
            {/* Tiêu đề */}
            <div style={{ fontWeight: "bold", fontSize: "10px", textAlign: "center", marginBottom: "4px" }}>
                PHIẾU GỬI HÀNG
            </div>

            {/* Mã đơn */}
            <div style={{ display: "flex", justifyContent: "space-between", marginBottom: "4px" }}>
                <div style={{ display: "flex", alignItems: "center" }}>
                    <img
                        src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Shopee_logo.svg/1200px-Shopee_logo.svg.png"
                        alt="Shopee Logo"
                        style={{ height: "10px", marginRight: "3px" }}
                    />
                    <img
                        src="https://upload.wikimedia.org/wikipedia/commons/1/14/Ninja_van_logo.png"
                        alt="Ninja Van Logo"
                        style={{ height: "9px" }}
                    />
                </div>
                <div style={{ textAlign: "right", fontSize: "7px" }}>
                    <div><b>Mã vận đơn:</b><br />{invoiceData.maVanDon || "SPEVN202511993"}</div>
                    <div style={{ marginTop: "2px" }}><b>Mã đơn hàng:</b><br />{invoiceData.maDonHang || "2008318CTVTDA0"}</div>
                </div>
            </div>

            <div style={{ borderTop: "1px dashed black", margin: "3px 0" }}></div>

            {/* Từ - Đến */}
            <div style={{ display: "flex", justifyContent: "space-between", marginBottom: "4px" }}>
                <div style={{ width: "48%", fontSize: "7px" }}>
                    <b>Từ:</b><br />
                    REGAL STORE<br />
                    386 TVB, Nam Từ Liêm, HN<br />
                    0854759387
                </div>
                <div style={{ width: "48%", textAlign: "right", fontSize: "7px" }}>
                    <b>Đến:</b><br />
                    {invoiceData.nguoiNhan || "Khách lẻ"}<br />
                    {invoiceData.diaChi || "Mua hàng tại quầy"}<br />
                    {invoiceData.soDienThoai || "Không có SĐT"}
                </div>
            </div>

            <div style={{ borderTop: "1px dashed black", margin: "3px 0" }}></div>

            {/* Nội dung hàng */}
            <div style={{ fontSize: "7px", marginBottom: "3px" }}>
                <b>Nội dung hàng:</b> (Tổng SL: {invoiceData.items?.length || 0})<br />
                {invoiceData.items?.map((item, idx) => (
                    <div key={idx}>{idx + 1}. {item.name} - SL: {item.quantity}</div>
                ))}
            </div>

            <div style={{ fontStyle: "italic", fontSize: "6px", marginBottom: "3px" }}>
                * Một số sản phẩm có thể bị ẩn hư đơn hàng.
            </div>

            <div style={{ textAlign: "right", fontSize: "6px", marginBottom: "3px" }}>
                Khối lượng tối đa: {invoiceData.khoiLuongToiDa || "300g"}
            </div>

            <div style={{ borderTop: "1px dashed black", margin: "3px 0" }}></div>

            {/* Tiền + chỉ dẫn */}
            <div style={{ display: "flex", justifyContent: "space-between", marginBottom: "3px", fontSize: "7px" }}>
                <div>
                    <b>Tiền thu Người nhận:</b><br />
                    <span style={{ fontSize: "9px", fontWeight: "bold" }}>{formatMoney(tongTienSauGiam)} VND</span><br />
                    <b>Chỉ dẫn giao hàng:</b><br />
                    {invoiceData.ghiChuGiaoHang || (
                        <>
                            - Không đóng lót<br />
                            - Ở đâu thì lấy số ở đó<br />
                            - Lọc lấy cái dễ đi
                        </>
                    )}
                </div>
                <div style={{ textAlign: "right" }}>
                    <b>Chữ ký người nhận</b><br />
                    Xác nhận nguyên vẹn,<br />
                    {invoiceData.xacNhanNguonVan || "không móp/méo, bể vỡ"}
                </div>
            </div>

            <div style={{ textAlign: "center", marginTop: "4px", fontSize: "7px", fontStyle: "italic", color: "#999" }}>
                Regal Store
            </div>
        </div>
    );
});

export default Invoice2;
