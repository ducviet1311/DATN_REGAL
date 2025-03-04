import React from "react";

const AboutUs = () => {
  const styles = {
    container: {
      fontFamily: "'Arial', sans-serif",
      padding: "20px",
      maxWidth: "800px",
      margin: "0 auto",
      backgroundColor: "#f9f9f9",
      borderRadius: "10px",
      boxShadow: "0 2px 10px rgba(0, 0, 0, 0.1)",
    },
    title: {
      fontSize: "2rem",
      color: "#333",
      textAlign: "center",
      marginBottom: "20px",
    },
    description: {
      fontSize: "1.2rem",
      color: "#555",
      lineHeight: "1.8",
      textAlign: "justify",
    },
    teamSection: {
      marginTop: "30px",
    },
    teamTitle: {
      fontSize: "1.5rem",
      color: "#333",
      marginBottom: "10px",
    },
    teamMember: {
      fontSize: "1rem",
      color: "#666",
      marginBottom: "5px",
    },
  };

  return (
    <div style={styles.container}>
        <br></br>
        <br></br>


      <h1 style={styles.title}>Về Chúng Tôi</h1>
      <p style={styles.description}>
        Chào mừng bạn đến với trang web của chúng tôi! Chúng tôi là một đội ngũ
        đam mê công nghệ, sáng tạo và cam kết mang đến cho khách hàng những giải
        pháp tốt nhất. Với sự tập trung vào chất lượng và sự hài lòng của khách
        hàng, chúng tôi không ngừng cải tiến để đáp ứng nhu cầu của thị trường
        hiện đại.
      </p>
      <div style={styles.teamSection}>
        <h2 style={styles.teamTitle}>Đội Ngũ Của Chúng Tôi</h2>
        <p style={styles.teamMember}>- Nguyễn Văn A: Giám đốc điều hành</p>
        <p style={styles.teamMember}>- Trần Thị B: Trưởng phòng kỹ thuật</p>
        <p style={styles.teamMember}>- Lê Văn C: Chuyên viên phát triển sản phẩm</p>
      </div>
    </div>
  );
};

export default AboutUs;
