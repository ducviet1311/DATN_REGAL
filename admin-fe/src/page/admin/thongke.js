import { useState, useEffect, useRef } from "react";import ReactPaginate from "react-paginate";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import {
  getMethod,
  postMethodPayload,
  deleteMethod,
} from "../../services/request";
import Swal from "sweetalert2";
import Chart from "chart.js/auto";
import * as XLSX from "xlsx";

const AdminThongKe = () => {
  const [thongKe, setThongKe] = useState(null);
  const [topSanPham, setTopSanPham] = useState([]);
  const [loadingTopSP, setLoadingTopSP] = useState(false);
  const [errorTopSP, setErrorTopSP] = useState(null);
  const [tongDoanhThuNam, setTongDoanhThuNam] = useState(null);
  const [selectedYear, setSelectedYear] = useState(new Date().getFullYear());
  const pieChartRef = useRef(null);

  useEffect(() => {
    revenueYear(new Date().getFullYear());
    getMauSac();
    getThongKe();
    veBieuDoTron();
    getTopSanPhamBanChay();
  }, []);
  async function revenueYear(nam) {
    if (nam < 2000) {
      nam = new Date().getFullYear();
    }
    const response = await getMethod(
        "/api/thong-ke/admin/doanhthuall?nam=" + nam
    );
    var list = await response.json();
    console.log(list);
    var main = "";
    for (var i = 0; i < list.length; i++) {
      if (list[i] == null) {
        list[i] = 0;
      }
    }

    var lb = "doanh thu năm " + nam;
    const ctx = document.getElementById("chart").getContext("2d");
    let chartStatus = Chart.getChart("chart"); // <canvas> id
    if (chartStatus != undefined) {
      chartStatus.destroy(); // Hủy biểu đồ cũ nếu có
    }
    var myChart = new Chart(ctx, {
      type: "bar",
      data: {
        labels: [
          "tháng 1",
          "tháng 2",
          "tháng 3",
          "tháng 4",
          "tháng 5",
          "tháng 6",
          "tháng 7",
          "tháng 8",
          "tháng 9",
          "tháng 10",
          "tháng 11",
          "tháng 12",
        ],
        datasets: [
          {
            label: lb,
            backgroundColor: "rgba(161, 198, 247, 1)",
            borderColor: "rgb(47, 128, 237)",
            data: list,
          },
        ],
      },
      options: {
        scales: {
          yAxes: [
            {
              ticks: {
                callback: function (value) {
                  return formatmoney(value);
                },
              },
            },
          ],
        },
      },
    });
  }

  async function getTongDoanhThuNam(nam) {
    try {
      const response = await getMethod(`/api/thong-ke/doanh-thu-nam?nam=${nam}`);

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      const result = await response.text();
      setTongDoanhThuNam(result);
    } catch (error) {
      console.error("Lỗi khi lấy tổng doanh thu:", error);
      setTongDoanhThuNam("Không thể lấy dữ liệu doanh thu");
    }
  }
  async function getTopSanPhamBanChay() {
    setLoadingTopSP(true);
    setErrorTopSP(null);

    try {
      console.log("[DEBUG] Đang gọi API /api/thong-ke/top5-ban-chay...");

      // 1. Gọi API
      const response = await getMethod("/api/thong-ke/top5-ban-chay");

      // 2. Kiểm tra HTTP status
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      // 3. Parse JSON
      const result = await response.json();
      console.log("[DEBUG] Dữ liệu nhận được:", result);

      // 4. Validate dữ liệu
      if (!result) {
        throw new Error("Không có dữ liệu trả về");
      }

      let products = [];

      // 5. Xử lý nhiều định dạng response khác nhau
      if (Array.isArray(result)) {
        products = result.slice(0, 5); // Lấy top 5
      } else if (typeof result === 'object' && result !== null) {
        // Nếu là object, chuyển thành mảng
        products = Object.values(result).slice(0, 5);
      } else {
        throw new Error("Định dạng dữ liệu không hợp lệ");
      }

      // 6. Kiểm tra cấu trúc từng item
      const validatedProducts = products.map(item => ({
        id: item?.id || 0,
        tenSanPham: item?.tenSanPham || item?.productName || "Không có tên",
        tongSoLuongBan: item?.tongSoLuongBan || item?.totalSold || 0
      }));

      console.log("[DEBUG] Dữ liệu đã xử lý:", validatedProducts);
      setTopSanPham(validatedProducts);

    } catch (error) {
      console.error("[ERROR] Lỗi khi lấy top sản phẩm:", error);
      setErrorTopSP(error.message);
      setTopSanPham([]); // Reset về mảng rỗng nếu có lỗi
    } finally {
      setLoadingTopSP(false);
    }
  }
  async function revenueTheoThuTrongTuan() {
    const response = await getMethod(
        "/api/thong-ke/admin/doanhthuthutrongtuan"
    );
    const data = await response.json();
    console.log("thutrongtuan", data);

    if (Array.isArray(data)) {
      var doanhThuTheoThu = Array(7).fill(0);

      data.forEach((item) => {
        var thu = item[0];
        var doanhThu = item[1];

        doanhThuTheoThu[thu % 7] = doanhThu;
      });

      const labels = [
        "Thứ Hai",
        "Thứ Ba",
        "Thứ Tư",
        "Thứ Năm",
        "Thứ Sáu",
        "Thứ Bảy",
        "Chủ Nhật",
      ];

      // Vẽ biểu đồ
      const ctx = document.getElementById("chartTuan").getContext("2d");
      let chartStatus = Chart.getChart("chartTuan");
      if (chartStatus != undefined) {
        chartStatus.destroy();
      }

      var myChart = new Chart(ctx, {
        type: "bar",
        data: {
          labels: labels,
          datasets: [
            {
              label: "Doanh thu theo thứ trong tuần",
              backgroundColor: "rgba(161, 198, 247, 1)",
              borderColor: "rgb(47, 128, 237)",
              data: doanhThuTheoThu,
            },
          ],
        },
        options: {
          scales: {
            yAxes: [
              {
                ticks: {
                  callback: function (value) {
                    return formatmoney(value);
                  },
                },
              },
            ],
          },
        },
      });
    } else {
      console.error("Dữ liệu trả về không phải là mảng:", data);
    }
  }

  async function revenueTheoGioTrongNgay() {
    const response = await getMethod("/api/thong-ke/admin/doanhthungay");
    const data = await response.json();
    console.log("gingay", data);

    if (!Array.isArray(data)) {
      console.error("Dữ liệu không phải là mảng:", data);
      return;
    }

    var doanhThuTheoGio = Array(24).fill(0); // Khởi tạo mảng với 24 phần tử (1 cho mỗi giờ trong ngày)

    data.forEach((item) => {
      var gio = item[0];
      var doanhThu = item[1];
      doanhThuTheoGio[gio] = doanhThu;
    });
  }

  async function getThongKe() {
    const response = await getMethod("/api/thong-ke/admin/thong-ke-tong-quat");
    var result = await response.json();
    setThongKe(result);
  }

  function loadByNam() {
    const nam = document.getElementById("nams").value;
    setSelectedYear(nam);
    revenueYear(nam);
    getTongDoanhThuNam(nam); // Gọi hàm mới
  }

  const VND = new Intl.NumberFormat("vi-VN", {
    style: "currency",
    currency: "VND",
  });

  function formatmoney(money) {
    return VND.format(money);
  }

  function getMauSac() {
    var arr = [
      "#4e73df",
      "#1cc88a",
      "#36b9cc",
      "#eb9534",
      "#ed00c6",
      "#edd500",
    ];
    var act = document.getElementsByClassName("border-left");
    var lbcard = document.getElementsByClassName("lbcard");
    for (var i = 0; i < act.length; i++) {
      act[i].style.borderLeft = ".25rem solid " + arr[i];
    }
    for (var i = 0; i < lbcard.length; i++) {
      lbcard[i].style.color = arr[i];
    }
  }

  async function veBieuDoTron() {
    try {
      // 1. Gọi API lấy dữ liệu
      const response = await getMethod("/api/thong-ke/admin/thong-ke-trang-thai");

      // 2. Kiểm tra response
      if (!response.ok) {
        throw new Error(`Lỗi HTTP: ${response.status}`);
      }

      const result = await response.json();
      console.log("Dữ liệu biểu đồ tròn:", result);

      // 3. Kiểm tra ref và canvas
      if (!pieChartRef.current) {
        throw new Error("Không tìm thấy canvas cho biểu đồ tròn");
      }

      const ctx = pieChartRef.current.getContext("2d");
      if (!ctx) {
        throw new Error("Không thể lấy context từ canvas");
      }

      // 4. Chuẩn bị dữ liệu
      const arrTen = Object.keys(result);
      const arrValue = Object.values(result);

      // 5. Kiểm tra và hủy biểu đồ cũ nếu có
      const existingChart = Chart.getChart(pieChartRef.current);
      if (existingChart) {
        existingChart.destroy();
      }

      // 6. Tạo màu sắc động nếu cần
      const backgroundColors = [
        "rgba(255, 99, 132, 0.6)",
        "rgba(54, 162, 235, 0.6)",
        "rgba(255, 206, 86, 0.6)",
        "rgba(75, 192, 192, 0.6)",
        "rgba(153, 102, 255, 0.6)",
        "rgba(255, 159, 64, 0.6)",
        "rgba(199, 199, 199, 0.6)",
        "rgba(83, 102, 255, 0.6)"
      ];

      // 7. Tạo biểu đồ mới
      new Chart(ctx, {
        type: "pie",
        data: {
          labels: arrTen,
          datasets: [{
            label: "Số lượng đơn hàng",
            data: arrValue,
            backgroundColor: backgroundColors.slice(0, arrTen.length),
            borderWidth: 1
          }]
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          plugins: {
            legend: {
              position: "right",
              labels: {
                padding: 20,
                font: {
                  size: 12
                }
              }
            },
            tooltip: {
              callbacks: {
                label: function(context) {
                  const label = context.label || '';
                  const value = context.raw || 0;
                  const total = context.dataset.data.reduce((a, b) => a + b, 0);
                  const percentage = Math.round((value / total) * 100);
                  return `${label}: ${value} (${percentage}%)`;
                }
              }
            }
          }
        }
      });

    } catch (error) {
      console.error("Lỗi khi vẽ biểu đồ tròn:", error);
      toast.error(`Lỗi khi tải biểu đồ: ${error.message}`);
    }
  }

  useEffect(() => {
    revenueTheoGioTrongNgay();
    revenueTheoThuTrongTuan();
  }, []);

  const exportToExcel = () => {
    if (!thongKe) {
      toast.error("Không có dữ liệu để xuất.");
      return;
    }


    const data = [
      { "Thống kê": "Số đơn hôm nay", "Giá trị": thongKe.soDonTrongNgay },
      { "Thống kê": "Số đơn tuần này", "Giá trị": thongKe.soDonTuanNay },
      { "Thống kê": "Số đơn tháng này", "Giá trị": thongKe.soDonThangNay },

    ];


    const ws = XLSX.utils.json_to_sheet(data);

    // Tạo workbook từ sheet
    const wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, "Thống Kê");

    // Xuất file Excel
    XLSX.writeFile(wb, "ThongKe.xlsx");
  };
  return (
      <div>
        <div className="card-container">
          <div class="card-day">
            <div class="col-xl-3 col-md-6 mb-4 card-view">
              <div class="card border-left shadow h-100 py-2">
                <span class="lbcard">Số đơn hôm nay</span>
                <span class="solieudoanhthu" id="soDonTrongNgay">
                {thongKe?.soDonTrongNgay}
              </span>
              </div>
            </div>
            <div class="col-xl-3 col-md-6 mb-4 card-view">
              <div class="card border-left shadow h-100 py-2">
                <span class="lbcard">Số đơn tuân này</span>
                <span class="solieudoanhthu" id="soDonTuanNay">
                {thongKe?.soDonTuanNay}
              </span>
              </div>
            </div>
            <div class="col-xl-3 col-md-6 mb-4 card-view">
              <div class="card border-left shadow h-100 py-2">
                <span class="lbcard">Số đơn tháng này</span>
                <span class="solieudoanhthu" id="soDonThangNay">
                {thongKe?.soDonThangNay}
              </span>
              </div>
            </div>
          </div>
        </div>

        <div className="export-excel-button">
          <button onClick={exportToExcel} className="btn btn-success">
            Xuất Excel
          </button>
        </div>
        <br></br>
        <div className="row mt-4">
          {/* Cột phải - Biểu đồ tròn */}
          <div className="col-md-6">
            <div className="top-products-card">
              <div className="card-header">
                <h5>Thống kê trạng thái đơn hàng</h5>
              </div>
              <div className="card-body">
                <div className="chart-container" style={{ height: '300px' }}>
                  <canvas ref={pieChartRef}></canvas>
                </div>
              </div>
            </div>
          </div>
          {/* Cột trái - Top 5 sản phẩm */}
          <div className="col-md-6">
            <div className="top-products-card">
              <div className="card-header">
                <h5>Top 5 sản phẩm bán chạy</h5>
              </div>
              <div className="card-body">
                <table className="table table-striped table-hover">
                  <thead className="table-primary">
                  <tr>
                    <th>STT</th>
                    <th>Tên sản phẩm</th>
                    <th>Số lượng bán</th>
                  </tr>
                  </thead>
                  <tbody>
                  {topSanPham.map((item, index) => (
                      <tr key={`product-${index}`}>
                        <td>{index + 1}</td>
                        <td>{item.tenSanPham}</td>
                        <td>{item.tongSoLuongBan.toLocaleString()}</td>
                      </tr>
                  ))}
                  </tbody>
                </table>
              </div>
            </div>
          </div>


        </div>

        <div class="col-sm-12 header-sp row ">
          <div class="col-md-3">
            <label class="lbbooking">Chọn năm cần xem</label>
            <select id="nams" class="form-control">
              <option id="2024">2024</option>
              <option id="2025">2025</option>
              <option id="2026">2026</option>
              <option id="2027">2027</option>
              <option id="2028">2028</option>
            </select>
          </div>
          <div class="col-md-2">
            <label
                class="lbbooking whitespace"
                dangerouslySetInnerHTML={{ __html: "<span>&ThinSpace;</span>" }}
            ></label>
            <button
                onClick={() => loadByNam()}
                class="btn btn-primary form-control"
            >
              <i class="fa fa-filter"></i> Lọc
            </button>
          </div>
        </div>

        {/* Thêm phần hiển thị tổng doanh thu */}
        {tongDoanhThuNam && (
            <div className="tong-doanh-thu-nam mt-3 mb-3">
              <h5>
                Tổng doanh thu năm {selectedYear} là: <strong>{tongDoanhThuNam}</strong>
              </h5>
            </div>
        )}
        <div className="cot-container">
          <div className="cot">
            <div class="col-sm-12 divtale">
              <div class="card chart-container divtale">
                <canvas id="chart"></canvas>
              </div>
            </div>
          </div>
          <div className="cot">
            <div class="col-sm-12 divtale">
              <div class="card chart-container divtale">
                <canvas id="chartTuan"></canvas>
              </div>
            </div>
          </div>
        </div>
      </div>
  );
};

export default AdminThongKe;
