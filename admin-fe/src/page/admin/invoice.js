import React, {forwardRef} from "react";
import {formatMoney} from "../../services/money";

// Sử dụng forwardRef để truyền ref từ component cha
const Invoice = forwardRef(({invoiceData, giamgia}, ref) => {
    return (
        <div
            ref={ref}
            className="invoice-container"
            style={{
                fontFamily: "Arial, sans-serif",
                width: "210mm",
                margin: "0 auto",
                padding: "20px",
                border: "1px solid #ddd",
            }}
        >
            {/* Header */}
            <div style={{textAlign: "center", marginBottom: "20px"}}>
                <h2 style={{margin: "0"}}>CỬA HÀNG REGAL</h2>
                <h3 style={{marginTop: "20px"}}>HÓA ĐƠN BÁN LẺ</h3>
            </div>

            {/* Thông tin khách hàng */}
            <div style={{marginBottom: "20px"}}>
                <p>
                    <b>Mã hóa đơn:</b>{" "}
                    <span style={{fontSize: "1.2em", fontWeight: "normal"}}>
                        {invoiceData?.maHoaDon || "_______________________"}
                    </span>
                </p>
                <p>
                    <b>Ngày tạo:</b>{" "}
                    <span style={{fontSize: "1.2em", fontWeight: "normal"}}>
                        {invoiceData?.date || "_______________________"}
                    </span>
                </p>
                <p>
                    <b>Người tạo hóa đơn:</b>{" "}
                    <span style={{fontSize: "1.2em", fontWeight: "normal"}}>
                        {invoiceData?.nguoitao || "Nhân Viên"}
                    </span>
                </p>
                <p>
                    <b>Khách hàng:</b>{" "}
                    <span style={{fontSize: "1.2em", fontWeight: "normal"}}>
                        {invoiceData?.customerName || "_______________________"}
                    </span>
                </p>
                <p>
                    <b>SĐT:</b>{" "}
                    <span style={{fontSize: "1.2em", fontWeight: "normal"}}>
                        {invoiceData?.soDienThoai || "_______________________"}
                    </span>
                </p>
            </div>


            {/* Bảng sản phẩm */}
            <table
                style={{
                    width: "100%",
                    borderCollapse: "collapse",
                    marginBottom: "20px",
                }}
            >
                <thead>
                <tr>
                    <th
                        style={{
                            border: "1px solid black",
                            padding: "5px",
                            textAlign: "center",
                        }}
                    >
                        STT
                    </th>
                    <th
                        style={{
                            border: "1px solid black",
                            padding: "5px",
                            textAlign: "center",
                        }}
                    >
                        Tên hàng
                    </th>
                    <th
                        style={{
                            border: "1px solid black",
                            padding: "5px",
                            textAlign: "center",
                        }}
                    >
                        Màu sắc
                    </th>
                    <th
                        style={{
                            border: "1px solid black",
                            padding: "5px",
                            textAlign: "center",
                        }}
                    >
                        Kích cỡ
                    </th>
                    <th
                        style={{
                            border: "1px solid black",
                            padding: "5px",
                            textAlign: "center",
                        }}
                    >
                        Thương hiệu
                    </th>
                    <th
                        style={{
                            border: "1px solid black",
                            padding: "5px",
                            textAlign: "center",
                        }}
                    >
                        Số Lượng
                    </th>
                    <th
                        style={{
                            border: "1px solid black",
                            padding: "5px",
                            textAlign: "center",
                        }}
                    >
                        Đơn Giá
                    </th>
                    <th
                        style={{
                            border: "1px solid black",
                            padding: "5px",
                            textAlign: "center",
                        }}
                    >
                        Thành Tiền
                    </th>
                </tr>
                </thead>
                <tbody>
                {invoiceData?.items.map((item, index) => (
                    <tr key={index}>
                        <td
                            style={{
                                border: "1px solid black",
                                padding: "5px",
                                textAlign: "center",
                            }}
                        >
                            {index + 1}
                        </td>
                        <td style={{border: "1px solid black", padding: "5px"}}>
                            {item.name}
                        </td>
                        <td
                            style={{
                                border: "1px solid black",
                                padding: "5px",
                                textAlign: "center",
                            }}
                        >
                            {item.mauSac}
                        </td>
                        <td
                            style={{
                                border: "1px solid black",
                                padding: "5px",
                                textAlign: "center",
                            }}
                        >
                            {item.kichCo}
                        </td>
                        <td
                            style={{
                                border: "1px solid black",
                                padding: "5px",
                                textAlign: "center",
                            }}
                        >
                            {item.thuongHieu}
                        </td>
                        <td
                            style={{
                                border: "1px solid black",
                                padding: "5px",
                                textAlign: "center",
                            }}
                        >
                            {item.quantity}
                        </td>
                        <td
                            style={{
                                border: "1px solid black",
                                padding: "5px",
                                textAlign: "center",
                            }}
                        >
                            {item.price}
                        </td>
                        <td
                            style={{
                                border: "1px solid black",
                                padding: "5px",
                                textAlign: "center",
                            }}
                        >
                            {item.quantity * item.price}
                        </td>
                    </tr>
                ))}
                </tbody>
            </table>

            {/* Tổng cộng */}
            <div style={{ textAlign: "right", marginTop: "20px" }}>
                <div style={{
                    display: "grid",
                    gridTemplateColumns: "80px 110px", /* Đảm bảo độ rộng cố định */
                    gap: "10px",
                    justifyContent: "end" /* Căn phải toàn bộ */
                }}>
                    <span style={{ textAlign: "left", fontWeight: "bold" }}>Tổng cộng:</span>
                    <span style={{ minWidth: "70px", textAlign: "right" }}>
                        {formatMoney(Number(invoiceData?.total)) || "________________"}
                    </span>

                    <span style={{ textAlign: "left", fontWeight: "bold" }}>Giảm giá:</span>
                    <span style={{ minWidth: "70px", textAlign: "right" }}>
                        {giamgia.loaiPhieu
                            ? formatMoney(giamgia.giaTriGiam)
                            : `${giamgia.giaTriGiam} %` || "________________"}
                    </span>

                    <span style={{ textAlign: "left", fontWeight: "bold" }}>Thành tiền:</span>
                    <span style={{ minWidth: "70px", textAlign: "right" }}>
                        {formatMoney(
                            Number(invoiceData?.total) -
                            Number(
                                giamgia.loaiPhieu
                                    ? giamgia.giaTriGiam
                                    : (invoiceData?.total * giamgia.giaTriGiam) / 100
                            )
                        ) || "________________"}
                    </span>
                </div>
            </div>


            {/* Footer */}
            <div
                style={{
                    display: "flex",
                    justifyContent: "space-between",
                    marginTop: "40px",
                }}
            >
                <div style={{textAlign: "center"}}>
                    {/* <p>
            <b>Khách hàng</b>
          </p>
          <p>(Ký và ghi rõ họ tên)</p> */}
                </div>
                <div style={{textAlign: "center"}}>
                    <p>{/* <b>Người viết hóa đơn</b> */}</p>
                    {/* <p>(Ký và ghi rõ họ tên)</p> */}
                </div>
            </div>
        </div>
    );
});

export default Invoice;
