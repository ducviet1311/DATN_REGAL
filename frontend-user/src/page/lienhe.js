import React from "react";

function ContactPage() {
  return (
    <div style={{ fontFamily: "Arial, sans-serif", margin: "30px auto", maxWidth: "800px" }}>
        <br>
        </br>
      <h1 style={{ fontSize: "24px", fontWeight: "bold", color: "#333" }}>Hotline: <span style={{ color: "#000" }}>0903.150.443</span></h1>
      <p style={{ fontSize: "16px", color: "#555", lineHeight: "1.6" }}>
        <strong>Số 386, TVB, Nam Từ Liêm, Hà nội</strong>
      </p>
      <p>
        Email: <a href="studio.berryfoto@gmail.com" style={{ textDecoration: "none", color: "#007BFF" }}>studio.berryfoto@gmail.com</a>
      </p>
      <p>Mở cửa:</p>
      <ul style={{ marginLeft: "20px", color: "#555" }}>
        <li>T2 - T7: 11:00 ~ 21:00</li>
        <li>CN: 14:00 ~ 20:00</li>
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
        <li>Chấp nhận thanh toán bằng: Thẻ tín dụng Visa, Master Card, thẻ ngân hàng nội địa ATM, Samsung pay, Momo.</li>
        <li>Có chỗ đỗ xe máy, xe hơi.</li>
      </ul>
    </div>
  );
}

export default ContactPage;
