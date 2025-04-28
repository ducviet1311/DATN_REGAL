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
                lineHeight: "1.4",
                padding: "8px",
            }}
        >
            {/* Tiêu đề */}
            <div style={{ fontWeight: "bold", fontSize: "14px", textAlign: "center", marginBottom: "8px" }}>
                PHIẾU GỬI HÀNG
            </div>

            {/* Mã đơn */}
            <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: "8px" }}>
                <div style={{ display: "flex", alignItems: "center" }}>
                    <img
                        src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Shopee_logo.svg/1200px-Shopee_logo.svg.png"
                        alt="Shopee Logo"
                        style={{ height: "12px", marginRight: "5px" }}
                    />
                    <img
                        src="https://upload.wikimedia.org/wikipedia/commons/1/14/Ninja_van_logo.png"
                        alt="Ninja Van Logo"
                        style={{ height: "10px" }}
                    />
                </div>
                <div style={{ textAlign: "right", fontSize: "8px" }}>
                    <div><b style={{ fontSize: "8px" }}>Mã vận đơn:</b> {invoiceData.maVanDon || "SPEVN202511993"}</div>
                    <div><b style={{ fontSize: "8px" }}>Mã đơn hàng:</b> {invoiceData.maDonHang || "2008318CTVTDA0"}</div>
                </div>
            </div>
            <div style={{ borderTop: "1px dashed black", margin: "6px 0" }}></div>
            {/* Từ - Đến */}
            <div style={{ display: "flex", justifyContent: "space-between", marginBottom: "8px" }}>
                <div style={{ width: "48%", fontSize: "8px" }}>
                    <b style={{ fontSize: "8px" }}>TỪ</b><br />
                    REGAL STORE<br />
                    Số 386, TVB, Nam Từ Liêm, Hà nội<br />
                    0854759387
                </div>
                <div style={{ width: "48%", textAlign: "right", fontSize: "8px" }}>
                    <b style={{ fontSize: "8px" }}>ĐẾN</b><br />
                    {invoiceData.nguoiNhan || "Khách lẻ"}<br />
                    {invoiceData.diaChi || " "}<br />
                    {invoiceData.soDienThoai || " "}
                </div>
            </div>
            <div style={{ borderTop: "1px dashed black", margin: "6px 0" }}></div>
            {/* Nội dung hàng */}
            <div style={{ fontSize: "8px", marginBottom: "6px" }}>
                <b style={{ fontSize: "8px" }}>Nội dung hàng (Tổng SL: {invoiceData.items?.length || 0})</b><br />
                {invoiceData.items?.map((item, idx) => (
                    <div key={idx}>{idx + 1}. {item.name} - SL: {item.quantity}</div>
                ))}
            </div>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <div style={{ textAlign: "right", fontSize: "8px", marginBottom: "6px" }}>
                Khối lượng tối đa: {invoiceData.khoiLuongToiDa || "300g"}
            </div>

            <div style={{ borderTop: "1px dashed black", margin: "6px 0" }}></div>

            {/* Tiền + chỉ dẫn */}
            <div style={{ display: "flex", justifyContent: "space-between", fontSize: "8px" }}>
                <div style={{ width: "55%" }}>
                    <b style={{ fontSize: "8px" }}>TIỀN THU NGƯỜI NHẬN:</b><br />
                    <span style={{ fontSize: "12px", fontWeight: "bold" }}>{formatMoney(tongTienSauGiam)} VND</span><br />
                    <b style={{ fontSize: "8px" }}>Chỉ dẫn giao hàng</b><br />
                    {invoiceData.ghiChuGiaoHang || (
                        <>
                            - Không đóng lót<br />
                            - Ở đâu thì lấy số ở đó<br />
                            - Lọc lấy cái dễ đi
                        </>
                    )}
                </div>
                <div style={{ width: "35%", textAlign: "right", whiteSpace: "normal" }}>
                    <b style={{ fontSize: "8px" }}>Chữ ký người nhận</b><br />
                    <span style={{ display: "inline-block", marginTop: "2px", marginBottom: "2px", width: "50px", height: "15px", border: "1px solid black" }}></span><br />
                    Xác nhận nguyên vẹn.<br />
                </div>
            </div>

            <div style={{ textAlign: "right", marginTop: "8px" }}>
                <img
                    src="https://i.ibb.co/5xX2kKk/duynguyen-logo.png"
                    alt="Duy Nguyen Logo"
                    style={{ height: "12px" }}
                />
            </div>
        </div>
    );
});

export default Invoice2;