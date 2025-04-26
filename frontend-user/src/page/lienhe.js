import React from "react";

function ContactPage() {
    return (
        <div style={{ marginTop: "50px", padding: "60px 20px", fontFamily: "'Segoe UI', sans-serif"}}>
            <div style={{ maxWidth: "1200px", margin: "0 auto" }}>
                {/* Tiêu đề */}
                <h1 style={{
                    fontSize: "32px",
                    fontWeight: "700",
                    color: "#333",
                    marginBottom: "10px",
                    textAlign: "center"
                }}>
                    Liên hệ với chúng tôi
                </h1>
                <p style={{ textAlign: "center", color: "#666", fontSize: "16px", marginBottom: "50px" }}>
                    Chúng tôi luôn sẵn sàng hỗ trợ bạn bất cứ lúc nào!
                </p>

                {/* Khối chính chia 2 cột */}
                <div style={{
                    display: "flex",
                    flexWrap: "wrap",
                    gap: "40px",
                    justifyContent: "space-between"
                }}>
                    {/* Thông tin liên hệ */}
                    <div style={{
                        flex: "1 1 45%",
                        backgroundColor: "#fff",
                        borderRadius: "12px",
                        boxShadow: "0 4px 12px rgba(0,0,0,0.1)",
                        padding: "30px",
                        minWidth: "300px"
                    }}>
                        <h3 style={{ fontSize: "22px", fontWeight: "600", marginBottom: "20px", color: "#222" }}>Thông tin liên hệ</h3>
                        <ul style={{ listStyle: "none", padding: 0, lineHeight: "2", fontSize: "16px", color: "#444" }}>
                            <li><strong>📞 Hotline:</strong> 0854.759.387</li>
                            <li><strong>🏢 Địa chỉ:</strong> Số 386, TVB, Nam Từ Liêm, Hà Nội</li>
                            <li><strong>📧 Email:</strong> <a href="mailto:qtvducviet131@gmail.com" style={{ color: "#e60023" }}>qtvducviet131@gmail.com</a></li>
                            <li><strong>🕐 Giờ mở cửa:</strong><br />
                                Thứ 2 - Thứ 7: 09:00 - 22:00<br />
                                Chủ nhật: 10:00 - 20:00
                            </li>
                        </ul>
                    </div>

                    {/* Bản đồ + hỗ trợ */}
                    <div style={{
                        flex: "1 1 45%",
                        backgroundColor: "#fff",
                        borderRadius: "12px",
                        boxShadow: "0 4px 12px rgba(0,0,0,0.1)",
                        padding: "30px",
                        minWidth: "300px",
                        display: "flex",
                        flexDirection: "column",
                        justifyContent: "space-between"
                    }}>
                        <h3 style={{ fontSize: "22px", fontWeight: "600", marginBottom: "20px", color: "#222" }}>Kết nối với chúng tôi</h3>

                        <div style={{ display: "flex", flexDirection: "column", gap: "20px" }}>
                            <button
                                style={{
                                    backgroundColor: "#007bff",
                                    color: "#fff",
                                    border: "none",
                                    padding: "14px",
                                    borderRadius: "8px",
                                    fontWeight: "600",
                                    fontSize: "16px",
                                    cursor: "pointer",
                                    transition: "0.3s"
                                }}
                                onClick={() => window.open("https://www.google.com/maps", "_blank")}
                            >
                                📍 Xem bản đồ Google
                            </button>

                            <button
                                style={{
                                    backgroundColor: "#e60023",
                                    color: "#fff",
                                    border: "none",
                                    padding: "14px",
                                    borderRadius: "8px",
                                    fontWeight: "600",
                                    fontSize: "16px",
                                    cursor: "pointer",
                                    transition: "0.3s"
                                }}
                            >
                                💬 Liên hệ hỗ trợ
                            </button>
                        </div>
                    </div>
                </div>

                {/* Tiện ích */}
                <div style={{ marginTop: "60px" }}>
                    <h3 style={{
                        fontSize: "24px",
                        fontWeight: "700",
                        color: "#333",
                        marginBottom: "20px",
                        borderBottom: "2px solid #e60023",
                        display: "inline-block",
                        paddingBottom: "6px"
                    }}>
                        Tiện ích tại cửa hàng
                    </h3>
                    <div style={{
                        display: "grid",
                        gridTemplateColumns: "repeat(auto-fit, minmax(220px, 1fr))",
                        gap: "20px",
                        marginTop: "20px"
                    }}>
                        {[
                            "🚀 Giao hàng toàn quốc",
                            "📶 Wifi miễn phí",
                            "🔄 Đổi trả trong 7 ngày",
                            "🎁 Ưu đãi thành viên",
                            "💬 Tư vấn 24/7"
                        ].map((item, i) => (
                            <div key={i} style={{
                                backgroundColor: "#fff",
                                padding: "20px",
                                borderRadius: "10px",
                                boxShadow: "0 2px 10px rgba(0,0,0,0.05)",
                                textAlign: "center",
                                fontSize: "16px",
                                color: "#444",
                                fontWeight: "500"
                            }}>
                                {item}
                            </div>
                        ))}
                    </div>
                </div>
            </div>
        </div>
    );
}

export default ContactPage;
