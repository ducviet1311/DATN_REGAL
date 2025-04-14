import { useState, useEffect } from "react";
import { toast } from "react-toastify";
import {
  getMethod,
  uploadSingleFile,
  postMethodPayload,
} from "../../services/request";
import Swal from "sweetalert2";

var token = localStorage.getItem("token");
var linkbanner = "";

const AdminAddKhachHang = () => {
  const [item, setItem] = useState(null);
  const [label, setLabel] = useState("Thêm khách hàng");
  const [gender, setGender] = useState(true);
  const [newMaKhachHang, setNewMaKhachHang] = useState("");

  useEffect(() => {
    const fetchInitialData = async () => {
      var uls = new URL(document.URL);
      var id = uls.searchParams.get("id");

      if (id != null) {
        setLabel("Cập nhật thông tin khách hàng");
        var response = await getMethod('/api/khachhang/' + id);
        var result = await response.json();
        setItem(result);
        setGender(result.gioiTinh);
        linkbanner = result.anh;
      } else {
        // Nếu là thêm mới, lấy danh sách khách hàng và tạo mã KH mới
        try {
          const listResponse = await getMethod('/api/khachhang');
          const listResult = await listResponse.json();

          // Tính toán mã khách hàng mới
          const maxMaKhachHang = listResult
              .map(kh => parseInt(kh.maKhachHang.replace("KH", ""), 10))
              .filter(num => !isNaN(num)) // Loại bỏ các mã không hợp lệ
              .reduce((max, current) => Math.max(max, current), 0);

          const maMoi = `KH${String(maxMaKhachHang + 1)}`;
          setNewMaKhachHang(maMoi);
        } catch (error) {
          toast.error("Không thể tạo mã khách hàng.");
        }
      }
    };

    fetchInitialData();
  }, []);


  async function handleAddKhachHang(event) {
    event.preventDefault();

    // Lấy dữ liệu từ form
    const maKhachHang = event.target.elements.makh.value.trim();
    const hoVaTen = event.target.elements.hoten.value.trim();
    const gioiTinh = gender;
    const ngaySinh = event.target.elements.ngsinh.value;
    const soDienThoai = event.target.elements.Sdt.value.trim();
    const email = event.target.elements.email.value.trim();

    // Kiểm tra trống từng trường
    if (!maKhachHang) {
      toast.error("Mã KH Không đc để trống");
      return;
    }
    if (!hoVaTen) {
      toast.error("Họ tên không được để trống");
      return;
    }
    if (!ngaySinh) {
      toast.error("Ngày sinh không được để trống");
      return;
    }

    // Validate ngày sinh phải là ngày quá khứ
    const selectedDate = new Date(ngaySinh);
    const currentDate = new Date();
    if (selectedDate >= currentDate) {
      toast.error("Ngày sinh phải là ngày quá khứ.");
      return;
    }

    if (!soDienThoai) {
      toast.error("Sđt không được để trống");
      return;
    }
    // Validate số điện thoại
    const phoneRegex = /^(09|08|05|02|03|01)\d{7,9}$/; // Đầu số (09, 08, 05, 02, 03) + 9-11 số
    if (!phoneRegex.test(soDienThoai)) {
      toast.error(
          "Số điện thoại không đúng định dạng. Đầu số hợp lệ: 09, 08, 05, 02, 03, 01 và độ dài từ 9-11 số."
      );
      return;
    }

    if (!email) {
      toast.error("Email không được để trống");
      return;
    }
    // Validate email đúng định dạng
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      toast.error(
          "Email không đúng định dạng. Đảm bảo email có ký tự '@' và '.'"
      );
      return;
    }

    // Kiểm tra trùng số điện thoại và email qua API
    try {
      const phoneExistsResponse = await getMethod(
          `/api/khachhang/exists/soDienThoai?soDienThoai=${soDienThoai}`
      );
      const emailExistsResponse = await getMethod(
          `/api/khachhang/exists/email?email=${email}`
      );

      const phoneExists = await phoneExistsResponse.json();
      const emailExists = await emailExistsResponse.json();

      if (phoneExists && (!item || item?.soDienThoai !== soDienThoai)) {
        toast.error("Số điện thoại đã tồn tại.");
        return;
      }

      if (emailExists && (!item || item?.email !== email)) {
        toast.error("Email đã tồn tại.");
        return;
      }
    } catch (error) {
      toast.error("Lỗi khi kiểm tra thông tin khách hàng.");
      return;
    }

    var user = JSON.parse(localStorage.getItem("user"));
    var ims = await uploadSingleFile(document.getElementById("imgbanner"));
    if (ims != null) {
      linkbanner = ims;
    }
    const payload = {
      maKhachHang: maKhachHang,
      anh: linkbanner,
      hoVaTen: hoVaTen,
      ngaySinh: ngaySinh,
      soDienThoai: soDienThoai,
      gioiTinh: gioiTinh,
      email: email,
      nguoiTao: user.maNhanVien,
      nguoiCapNhat: user.maNhanVien,
      trangThai: 1, // Mặc định trạng thái là "Đang hoạt động"
    };
    if (item != null) {
      payload.nguoiTao = item.nguoiTao;
    }
    var url = "/api/khachhang";
    if (item != null) {
      url += "/" + item.id;
    }
    const res = await postMethodPayload(url, payload);
    if (res.status < 300) {
      toast.success("Thêm thành công!");
      await new Promise((resolve) => setTimeout(resolve, 1000));
      window.location.href = "khach-hang";
    }
    if (res.status == 417) {
      var result = await res.json();
      toast.error(result.defaultMessage);
    }
    if (res.status > 300) {
      toast.error("Thất bại");
    }
  }

  return (
      <div className="container-fluid py-4">
        <div className="top-products-card shadow-lg">
          <div className="card-header bg-primary text-white">
            <h4 className="mb-0">{label}</h4>
          </div>
          <div className="card-body">
            <form onSubmit={handleAddKhachHang}>
              <div className="row">
                {/* Cột trái */}
                <div className="col-md-6">
                  <div className="mb-3">
                    <label className="form-label fw-bold">Mã khách hàng</label>
                    <input
                        name="makh"
                        value={item?.maKhachHang || newMaKhachHang}
                        className="form-control bg-light"
                        readOnly
                    />
                  </div>

                  <div className="mb-3">
                    <label className="form-label fw-bold">Họ tên</label>
                    <input
                        name="hoten"
                        defaultValue={item?.hoVaTen}
                        className="form-control"
                        placeholder="Nhập họ tên đầy đủ"
                    />
                  </div>

                  <div className="mb-3">
                    <label className="form-label fw-bold">Giới tính</label>
                    <div className="d-flex gap-4">
                      <div className="form-check">
                        <input
                            className="form-check-input"
                            type="radio"
                            name="gioitinh"
                            id="male"
                            checked={gender === true}
                            onChange={() => setGender(true)}
                        />
                        <label className="form-check-label" htmlFor="male">
                          Nam
                        </label>
                      </div>
                      <div className="form-check">
                        <input
                            className="form-check-input"
                            type="radio"
                            name="gioitinh"
                            id="female"
                            checked={gender === false}
                            onChange={() => setGender(false)}
                        />
                        <label className="form-check-label" htmlFor="female">
                          Nữ
                        </label>
                      </div>
                    </div>
                  </div>

                  <div className="mb-3">
                    <label className="form-label fw-bold">Ngày sinh</label>
                    <input
                        name="ngsinh"
                        defaultValue={item?.ngaySinh}
                        type="date"
                        className="form-control"
                    />
                  </div>
                </div>

                {/* Cột phải */}
                <div className="col-md-6">
                  <div className="mb-3">
                    <label className="form-label fw-bold">Ảnh đại diện</label>
                    <input
                        id="imgbanner"
                        type="file"
                        className="form-control"
                        accept="image/*"
                    />
                  </div>

                  <div className="mb-3">
                    <label className="form-label fw-bold">Số điện thoại</label>
                    <input
                        name="Sdt"
                        defaultValue={item?.soDienThoai}
                        className="form-control"
                        placeholder="Nhập số điện thoại"
                    />
                  </div>

                  <div className="mb-3">
                    <label className="form-label fw-bold">Email</label>
                    <input
                        name="email"
                        defaultValue={item?.email}
                        className="form-control"
                        placeholder="Nhập email"
                        type="email"
                    />
                  </div>
                </div>
              </div>

              <div className="d-flex justify-content-end mt-4">
                <button type="submit" className="btn btn-primary px-4 py-2">
                  {label}
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
  );
};

export default AdminAddKhachHang;
