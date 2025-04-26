import React from "react";

const AboutUs = () => {
  const styles = {
    container: {
      fontFamily: "'Segoe UI', Tahoma, Geneva, Verdana, sans-serif",
      padding: "40px 20px",
      maxWidth: "1200px",
      margin: "0 auto",
      backgroundColor: "#fff",
      borderRadius: "12px",
      boxShadow: "0 8px 30px rgba(0, 0, 0, 0.08)",
      lineHeight: "1.6",
      color: "#000",
    },
    heroSection: {
      background: "linear-gradient(135deg, #fff 0%, #f0f0f0 100%)",
      padding: "60px 20px",
      borderRadius: "12px",
      marginBottom: "40px",
      textAlign: "center",
    },
    title: {
      fontSize: "2.8rem",
      fontWeight: "700",
      marginBottom: "20px",
      backgroundImage: "linear-gradient(90deg, #e50914, #000000)",
      backgroundClip: "text",
      WebkitBackgroundClip: "text",
      color: "transparent",
      WebkitTextFillColor: "transparent",
      display: "inline-block",
    },

    subtitle: {
      fontSize: "1.4rem",
      color: "#555",
      fontWeight: "400",
      marginBottom: "30px",
    },
    sectionTitle: {
      fontSize: "1.8rem",
      color: "#000",
      fontWeight: "600",
      margin: "40px 0 20px",
      borderBottom: "2px solid #e50914",
      paddingBottom: "10px",
      display: "inline-block",
    },
    description: {
      fontSize: "1.1rem",
      color: "#333",
      lineHeight: "1.8",
      marginBottom: "30px",
    },
    highlight: {
      color: "#e50914",
      fontWeight: "600",
    },
    missionVision: {
      display: "flex",
      flexWrap: "wrap",
      gap: "30px",
      margin: "40px 0",
    },
    card: {
      flex: "1",
      minWidth: "300px",
      background: "#fff",
      borderRadius: "10px",
      padding: "30px",
      boxShadow: "0 5px 15px rgba(0, 0, 0, 0.05)",
      borderTop: "4px solid #e50914",
    },
    cardTitle: {
      fontSize: "1.4rem",
      color: "#000",
      fontWeight: "600",
      marginBottom: "15px",
    },
    teamSection: {
      margin: "60px 0",
    },
    teamGrid: {
      display: "grid",
      gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))",
      gap: "30px",
      marginTop: "30px",
    },
    teamMember: {
      background: "#fff",
      borderRadius: "10px",
      overflow: "hidden",
      boxShadow: "0 5px 15px rgba(0, 0, 0, 0.05)",
      transition: "transform 0.3s ease",
    },
    memberImage: {
      height: "200px",
      background: "#f5f5f5",
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
      color: "#999",
      fontSize: "3rem",
    },
    memberInfo: {
      padding: "20px",
    },
    memberName: {
      fontSize: "1.2rem",
      fontWeight: "600",
      color: "#000",
      marginBottom: "5px",
    },
    memberPosition: {
      fontSize: "0.9rem",
      color: "#e50914",
      marginBottom: "15px",
    },
    valuesList: {
      display: "grid",
      gridTemplateColumns: "repeat(auto-fill, minmax(250px, 1fr))",
      gap: "20px",
      margin: "30px 0",
    },
    valueItem: {
      display: "flex",
      alignItems: "flex-start",
      gap: "15px",
    },
    valueIcon: {
      color: "#e50914",
      fontSize: "1.5rem",
      marginTop: "3px",
    },
    contactInfo: {
      display: "flex",
      flexWrap: "wrap",
      gap: "30px",
      margin: "40px 0",
    },
    contactCard: {
      flex: "1",
      minWidth: "250px",
      background: "#f9f9f9",
      borderRadius: "10px",
      padding: "25px",
      display: "flex",
      alignItems: "center",
      gap: "15px",
    },
    contactIcon: {
      fontSize: "1.8rem",
      color: "#e50914",
    },
  };

  return (
      <div style={styles.container}>
        <div style={styles.heroSection}>
          <h1 style={styles.title}>Về Regal</h1>
          <p style={styles.subtitle}>Đồng hành cùng đam mê bóng đá của bạn</p>
        </div>

        <section>
          <h2 style={styles.sectionTitle}>Câu Chuyện Của Chúng Tôi</h2>
          <p style={styles.description}>
            <span style={styles.highlight}>Regal</span> được thành lập với sứ mệnh mang đến những đôi giày đá bóng chất lượng cao,
            kết hợp giữa công nghệ hiện đại và thiết kế tinh tế. Xuất phát từ tình yêu bóng đá và thấu hiểu nhu cầu của các cầu thủ,
            chúng tôi đã không ngừng phát triển để trở thành thương hiệu được tin dùng hàng đầu Việt Nam.
          </p>
        </section>

        <div style={styles.missionVision}>
          <div style={styles.card}>
            <h3 style={styles.cardTitle}>Sứ Mệnh</h3>
            <p style={styles.description}>
              Cung cấp những sản phẩm giày bóng đá chất lượng cao, đa dạng về mẫu mã và phù hợp với mọi điều kiện sân bãi,
              giúp người chơi thể hiện tốt nhất phong độ của mình.
            </p>
          </div>
          <div style={styles.card}>
            <h3 style={styles.cardTitle}>Tầm Nhìn</h3>
            <p style={styles.description}>
              Trở thành thương hiệu giày thể thao hàng đầu Đông Nam Á vào năm 2030, đồng thời phát triển hệ sinh thái
              toàn diện cho cộng đồng yêu bóng đá với các sản phẩm và dịch vụ chất lượng cao.
            </p>
          </div>
        </div>

        <section>
          <h2 style={styles.sectionTitle}>Giá Trị Cốt Lõi</h2>
          <div style={styles.valuesList}>
            <div style={styles.valueItem}>
              <div style={styles.valueIcon}>✓</div>
              <div>
                <h4>Chất Lượng Vượt Trội</h4>
                <p>Cam kết sử dụng vật liệu cao cấp và quy trình sản xuất nghiêm ngặt</p>
              </div>
            </div>
            <div style={styles.valueItem}>
              <div style={styles.valueIcon}>✓</div>
              <div>
                <h4>Công Nghệ Tiên Tiến</h4>
                <p>Áp dụng công nghệ mới nhất trong thiết kế và sản xuất giày thể thao</p>
              </div>
            </div>
            <div style={styles.valueItem}>
              <div style={styles.valueIcon}>✓</div>
              <div>
                <h4>Dịch Vụ Tận Tâm</h4>
                <p>Đội ngũ tư vấn chuyên nghiệp, am hiểu sản phẩm và nhu cầu người chơi</p>
              </div>
            </div>
            <div style={styles.valueItem}>
              <div style={styles.valueIcon}>✓</div>
              <div>
                <h4>Bền Vững</h4>
                <p>Hướng đến sản xuất xanh và thân thiện với môi trường</p>
              </div>
            </div>
          </div>
        </section>

        <section style={styles.teamSection}>
          <h2 style={styles.sectionTitle}>Đội Ngũ Của Chúng Tôi</h2>
          <p style={styles.description}>
            Regal tự hào có đội ngũ nhân viên tài năng, nhiệt huyết và giàu kinh nghiệm trong ngành thể thao.
          </p>
          <div style={styles.teamGrid}>
            <div style={styles.teamMember}>
              <div style={styles.memberImage}>👔</div>
              <div style={styles.memberInfo}>
                <h3 style={styles.memberName}>Nguyễn Đức Lương</h3>
                <p style={styles.memberPosition}>Giám đốc điều hành</p>
                <p>Nhiều năm kinh nghiệm trong ngành thể thao, cựu cầu thủ chuyên nghiệp</p>
              </div>
            </div>
            <div style={styles.teamMember}>
              <div style={styles.memberImage}>🔧</div>
              <div style={styles.memberInfo}>
                <h3 style={styles.memberName}>Bùi Đức Việt</h3>
                <p style={styles.memberPosition}>Trưởng phòng kỹ thuật</p>
                <p>Chuyên gia về công nghệ sản xuất giày thể thao</p>
              </div>
            </div>
            <div style={styles.teamMember}>
              <div style={styles.memberImage}>👟</div>
              <div style={styles.memberInfo}>
                <h3 style={styles.memberName}>Nhóm Phát Triển Sản Phẩm</h3>
                <p style={styles.memberPosition}>Đội ngũ thiết kế</p>
                <p>Luôn sáng tạo để mang đến những mẫu giày tốt nhất</p>
              </div>
            </div>
          </div>
        </section>
      </div>
  );
};

export default AboutUs;