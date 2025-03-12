import React from "react";

function ContactPage() {
  return (
    <div style={{ fontFamily: "Arial, sans-serif", margin: "30px auto", maxWidth: "800px" }}>
        <br>
        </br>
        <h1 style={{ fontSize: "26px", fontWeight: "bold", color: "#333" }}>
            Liên hệ</h1>
        <h1 style={{ fontSize: "16px", fontWeight: "bold", color: "#333" }}>
            Hotline: <span style={{ color: "#000" }}>0854.759.387</span></h1>
      <p style={{ fontSize: "16px", color: "#555", lineHeight: "1.6" }}>
        <strong> Địa chỉ: <span style={{ color: "#000" }}>Số 386, TVB, Nam Từ Liêm, Hà nội</span></strong>
      </p>
      <p style={{ fontSize: "17px", color: "#555", lineHeight: "1.6" }}>
        Email: <a href="regalstore@gmail.com" style={{ textDecoration: "none", color: "#007BFF" }}>qtvducviet131@gmail.com
      </a>
      </p>
      <p>Giờ mở cửa:</p>
      <ul style={{ marginLeft: "20px", color: "#555" }}>
        <li>Thứ 2 - Thứ 7: 09:00 - 22:00</li>
        <li>Chủ nhật: 10:00 - 20:00</li>
      </ul>

      <div style={{ margin: "20px 0" }}>
        <button
          style={{
            backgroundColor: "#00A8E8",
            color: "#fff",
            padding: "10px 20px",
            border: "none",
            cursor: "pointer",
            marginRight: "10px",
            borderRadius: "5px",
          }}
          onClick={() => window.open("https://www.google.com/maps", "_blank")}
        >
          Google Map
        </button>
        <button
          style={{
            backgroundColor: "#3B82F6",
            color: "#fff",
            padding: "10px 20px",
            border: "none",
            cursor: "pointer",
            borderRadius: "5px",
          }}
        >
          Liên hệ hỗ trợ
        </button>
      </div>

      <h3 style={{ fontSize: "20px", color: "#333" }}>CÁC TIỆN ÍCH TẠI CỬA HÀNG:</h3>
      <ul style={{ marginLeft: "20px", color: "#555" }}>
        <li>Wifi miễn phí.</li>
        <li>Hỗ trợ đổi trả trong 7 ngày nếu sản phẩm lỗi do nhà sản xuất.</li>
        <li>Chương trình thành viên với nhiều ưu đãi hấp dẫn.</li>
        <li>Giao hàng tận nơi trên toàn quốc.</li>
        <li>Hỗ trợ đặt hàng và tư vấn trực tuyến 24/7.</li>
      </ul>
    </div>
  );
}

export default ContactPage;
