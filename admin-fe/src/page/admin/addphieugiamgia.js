import { useState, useEffect } from "react";
import { toast } from "react-toastify";
import { getMethod, postMethodPayload } from "../../services/request";
const AdminAddPhieuGiamGia = () => {
  const [item, setItem] = useState(null);
  const [label, setLabel] = useState("Thêm phiếu giảm giá");
  const [formData, setFormData] = useState({
    loaiPhieu: true,
    giaTriGiamToiDa: "",
    giaTriGiam: "",
    trangThai: 1
  });

  useEffect(() => {
    const getPhieuGiamGia = async () => {
      const uls = new URL(document.URL);
      const id = uls.searchParams.get("id");
      if (id) {
        setLabel("Cập nhật phiếu giảm giá");
        const response = await getMethod("/api/phieu-giam-gia/" + id);
        const result = await response.json();
        setItem(result);
        setFormData({
          loaiPhieu: result.loaiPhieu,
          giaTriGiamToiDa: result.giaTriGiamToiDa,
          giaTriGiam: result.giaTriGiam,
          trangThai: result.trangThai
        });
      }
    };
    getPhieuGiamGia();
  }, []);

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setFormData({
      ...formData,
      [name]: value
    });
  };

  const handleSelectChange = (e) => {
    const { name, value } = e.target;
    setFormData({
      ...formData,
      [name]: value === "true"
    });
    // Ẩn/hiện trường giá trị giảm tối đa
    document.getElementById("gia_tri_giam_toi_da").style.display =
        value === "true" ? "none" : "block";
  };

  async function handleAddPhieuGG(event) {
    event.preventDefault();
    const user = JSON.parse(localStorage.getItem("user"));
    const form = event.target;

    const payload = {
      maCode: form.maCode.value,
      tenPhieu: form.tenPhieu.value,
      giaTriGiamToiDa: form.giaTriGiamToiDa.value,
      giaTriGiam: form.giaTriGiam.value,
      donToiThieu: form.donToiThieu.value,
      soLuong: form.soLuong.value,
      loaiPhieu: formData.loaiPhieu,
      ngayBatDau: form.ngayBatDau.value,
      ngayKetThuc: form.ngayKetThuc.value,
      nguoiTao: user.maNhanVien,
      nguoiCapNhat: user.maNhanVien,
      trangThai: formData.trangThai
    };

    // Validate các trường
    if (!payload.maCode) {
      toast.error("Mã code không được để trống.");
      return;
    }

    // ... (các validate khác giữ nguyên)

    const url = item ? `/api/phieu-giam-gia/${item.id}` : "/api/phieu-giam-gia";
    const res = await postMethodPayload(url, payload);

    if (res.status < 300) {
      toast.success(`${label} thành công!`);
      setTimeout(() => window.location.href = "khuyen-mai", 1000);
    } else if (res.status === 417) {
      const result = await res.json();
      toast.error(result.defaultMessage);
    } else {
      toast.error("Thao tác thất bại");
    }
  }

  return (
      <div className="container-fluid p-4">
        <div className="top-products-card shadow-sm">
          <div className="card-header bg-primary text-white">
            <h4 className="mb-0">
              <i className="fas fa-ticket-alt me-2"></i>
              {label}
            </h4>
          </div>

          <div className="card-body">
            <form onSubmit={handleAddPhieuGG} className="row g-3">
              {/* Cột trái */}
              <div className="col-md-6">
                <div className="mb-3">
                  <label className="form-label fw-bold">Mã code <span className="text-danger">*</span></label>
                  <input
                      name="maCode"
                      defaultValue={item?.maCode}
                      className="form-control form-control-lg"
                      placeholder="VD: SUMMER2023"
                      required
                  />
                </div>

                <div className="mb-3">
                  <label className="form-label fw-bold">Tên phiếu <span className="text-danger">*</span></label>
                  <input
                      name="tenPhieu"
                      defaultValue={item?.tenPhieu}
                      className="form-control form-control-lg"
                      placeholder="VD: Giảm giá mùa hè"
                      required
                  />
                </div>

                <div className="mb-3">
                  <label className="form-label fw-bold">Loại phiếu <span className="text-danger">*</span></label>
                  <select
                      name="loaiPhieu"
                      className="form-select form-select-lg"
                      onChange={handleSelectChange}
                      value={formData.loaiPhieu.toString()}
                      required
                  >
                    <option value="true">Giảm tiền</option>
                    <option value="false">Giảm %</option>
                  </select>
                </div>

                <div
                    id="gia_tri_giam_toi_da"
                    className="mb-3"
                    style={{ display: formData.loaiPhieu ? "none" : "block" }}
                >
                  <label className="form-label fw-bold">Giá trị giảm tối đa <span className="text-danger">*</span></label>
                  <div className="input-group">
                    <input
                        name="giaTriGiamToiDa"
                        defaultValue={item?.giaTriGiamToiDa}
                        className="form-control form-control-lg"
                        placeholder="Nhập số tiền tối đa"
                        type="number"
                        min="0"
                        required={!formData.loaiPhieu}
                    />
                    <span className="input-group-text">VNĐ</span>
                  </div>
                </div>

                <div className="mb-3">
                  <label className="form-label fw-bold">
                    {formData.loaiPhieu ? "Số tiền giảm" : "Phần trăm giảm"}
                    <span className="text-danger">*</span>
                  </label>
                  <div className="input-group">
                    <input
                        name="giaTriGiam"
                        defaultValue={item?.giaTriGiam}
                        className="form-control form-control-lg"
                        placeholder={formData.loaiPhieu ? "Nhập số tiền" : "Nhập phần trăm"}
                        type="number"
                        min="0"
                        max={formData.loaiPhieu ? "" : "100"}
                        required
                    />
                    <span className="input-group-text">
                                        {formData.loaiPhieu ? "VNĐ" : "%"}
                                    </span>
                  </div>
                </div>
              </div>

              {/* Cột phải */}
              <div className="col-md-6">
                <div className="mb-3">
                  <label className="form-label fw-bold">Đơn tối thiểu <span className="text-danger">*</span></label>
                  <div className="input-group">
                    <input
                        name="donToiThieu"
                        defaultValue={item?.donToiThieu}
                        className="form-control form-control-lg"
                        placeholder="Nhập số tiền tối thiểu"
                        type="number"
                        min="0"
                        required
                    />
                    <span className="input-group-text">VNĐ</span>
                  </div>
                </div>

                <div className="mb-3">
                  <label className="form-label fw-bold">Số lượng <span className="text-danger">*</span></label>
                  <input
                      name="soLuong"
                      defaultValue={item?.soLuong}
                      className="form-control form-control-lg"
                      placeholder="Nhập số lượng phiếu"
                      type="number"
                      min="1"
                      required
                  />
                </div>

                <div className="mb-3">
                  <label className="form-label fw-bold">Ngày bắt đầu <span className="text-danger">*</span></label>
                  <input
                      name="ngayBatDau"
                      defaultValue={item?.ngayBatDau}
                      type="datetime-local"
                      className="form-control form-control-lg"
                      required
                  />
                </div>

                <div className="mb-3">
                  <label className="form-label fw-bold">Ngày kết thúc <span className="text-danger">*</span></label>
                  <input
                      name="ngayKetThuc"
                      defaultValue={item?.ngayKetThuc}
                      type="datetime-local"
                      className="form-control form-control-lg"
                      required
                  />
                </div>

                <div className="mb-3">
                  <label className="form-label fw-bold">Trạng thái</label>
                  <select
                      name="trangThai"
                      className="form-select form-select-lg"
                      value={formData.trangThai}
                      onChange={(e) => setFormData({
                        ...formData,
                        trangThai: parseInt(e.target.value)
                      })}
                  >
                    <option value="1">Đang hoạt động</option>
                    <option value="0">Ngừng hoạt động</option>
                  </select>
                </div>
              </div>

              <div className="col-12 mt-4">
                <button type="submit" className="btn btn-primary btn-lg px-4">
                  <i className="fas fa-save me-2"></i>
                  {label}
                </button>
                <a href="khuyen-mai" className="btn btn-outline-secondary btn-lg ms-2">
                  <i className="fas fa-times me-2"></i>
                  Hủy bỏ
                </a>
              </div>
            </form>
                <style jsx>{`
                        /* Card styling */
      .card {
        border-radius: 10px;
        overflow: hidden;
      }

      .card-header {
        padding: 1.25rem 1.5rem;
      }

      .card-body {
        padding: 2rem;
      }

      /* Form styling */
      .form-label {
        margin-bottom: 0.5rem;
        color: #495057;
      }

      .form-control-lg, .form-select-lg {
        padding: 0.75rem 1rem;
        font-size: 1rem;
        border-radius: 0.5rem;
        border: 1px solid #ced4da;
        transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
      }

      .form-control-lg:focus, .form-select-lg:focus {
        border-color: #86b7fe;
        box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
      }

      /* Button styling */
      .btn-lg {
        padding: 0.5rem 1.5rem;
        font-size: 1.1rem;
        border-radius: 0.5rem;
      }

      .btn-primary {
        background-color: #0d6efd;
        border-color: #0d6efd;
      }

      .btn-primary:hover {
        background-color: #0b5ed7;
        border-color: #0a58ca;
      }

      /* Input group styling */
      .input-group-text {
        background-color: #f8f9fa;
        border: 1px solid #ced4da;
        font-weight: 500;
      }

      /* Responsive adjustments */
      @media (max-width: 768px) {
        .card-body {
            padding: 1.5rem;
        }
        
        .btn-lg {
            width: 100%;
            margin-bottom: 0.5rem;
        }
        
        .ms-2 {
            margin-left: 0 !important;
        }
      }
      `}</style>
          </div>
        </div>
      </div>
  );
};
export default AdminAddPhieuGiamGia;