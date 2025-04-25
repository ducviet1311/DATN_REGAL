import { useState, useEffect } from "react";
import { toast } from "react-toastify";
import {
  getMethod,
  uploadSingleFile,
  postMethodPayload,
} from "../../services/request";
import Swal from "sweetalert2";
import Select from "react-select";

const AdminAddProduct = () => {
  const [product, setProduct] = useState({});
  const [thuonghieu, setThuongHieu] = useState([]);
  const [chatlieu, setChatLieu] = useState([]);
  const [degiay, setDeGiay] = useState([]);
  const [selectedThuongHieu, setSelectedThuongHieu] = useState(null);
  const [selectedChatLieu, setSelectedChatLieu] = useState(null);
  const [selectedDeGiay, setSelectedDeGiay] = useState(null);
  const [label, setLabel] = useState("Thêm sản phẩm");
  const [isUpdate, setIsUpdate] = useState(false); // Thêm state để xác định cập nhật hay thêm mới

  useEffect(() => {
    const fetchProductData = async () => {
      var uls = new URL(document.URL);
      var id = uls.searchParams.get("id");

      if (id != null) {
        setLabel("Cập nhật sản phẩm");
        setIsUpdate(true); // Đánh dấu là cập nhật
        const response = await getMethod("/api/san-pham/" + id);
        const result = await response.json();
        setProduct(result);
        setSelectedThuongHieu(result.thuongHieu);
        setSelectedChatLieu(result.chatLieu);
        setSelectedDeGiay(result.deGiay);
      } else {
        // Tạo mã sản phẩm mới khi thêm sản phẩm
        try {
          const listResponse = await getMethod("/api/san-pham");
          const listResult = await listResponse.json();
          const maMoi = `SP${String(Number(listResult.length) + 1).padStart(3, "0")}`;
          setProduct((prev) => ({ ...prev, maSanPham: maMoi }));
        } catch (error) {
          toast.error("Không thể tạo mã sản phẩm mới.");
        }
      }
    };

    const fetchSelectData = async () => {
      const responseDeGiay = await getMethod("/api/de-giay");
      setDeGiay(await responseDeGiay.json());
      const responseThuongHieu = await getMethod("/api/thuong-hieu");
      setThuongHieu(await responseThuongHieu.json());
      const responseChatLieu = await getMethod("/api/chat-lieu");
      setChatLieu(await responseChatLieu.json());
    };

    fetchProductData();
    fetchSelectData();
  }, []);

  async function handleAddSanPham(event) {
    event.preventDefault();

    var user = JSON.parse(localStorage.getItem("user"));
    if (!user) {
      toast.error("Người dùng không hợp lệ.");
      return;
    }

    const masp = event.target.elements.masp.value;
    const tensp = event.target.elements.tensp.value.trim();
    const trangThai = event.target.elements.trangThai.value;

    // Kiểm tra hợp lệ
    if (!masp) {
      toast.error("Mã sản phẩm không được để trống.");
      return;
    }
    if (!tensp) {
      toast.error("Tên sản phẩm không được để trống.");
      return;
    }
    if (!trangThai || (trangThai !== "1" && trangThai !== "2")) {
      toast.error("Trạng thái không hợp lệ. Vui lòng chọn Còn hàng hoặc Hết hàng.");
      return;
    }

    // Tạo payload
    const payload = {
      maSanPham: masp || null,
      tenSanPham: tensp || null,
      idThuongHieu: selectedThuongHieu?.id || null,
      idChatLieu: selectedChatLieu?.id || null,
      idDeGiay: selectedDeGiay?.id || null,
      nguoiTao: isUpdate ? product.nguoiTao : user.maNhanVien, // Giữ nguyên người tạo khi cập nhật
      nguoiCapNhat: user.maNhanVien,
      trangThai: parseInt(trangThai),
    };

    if (!payload.idThuongHieu) {
      toast.error("Vui lòng chọn thương hiệu.");
      return;
    }
    if (!payload.idChatLieu) {
      toast.error("Vui lòng chọn chất liệu.");
      return;
    }
    if (!payload.idDeGiay) {
      toast.error("Vui lòng chọn đế giày.");
      return;
    }

    // Xác định URL dựa trên isUpdate
    var url = "/api/san-pham";
    if (isUpdate) {
      url += "/" + product.id;
    }

    const res = await postMethodPayload(url, payload);

    if (res.status < 300) {
      toast.success(isUpdate ? "Cập nhật sản phẩm thành công!" : "Thêm sản phẩm thành công!");
      await new Promise((resolve) => setTimeout(resolve, 1000));
      window.location.href = "product";
    } else if (res.status === 417) {
      const result = await res.json();
      toast.error(result.defaultMessage);
    } else if (res.status > 300) {
      const result = await res.json();
      toast.error(result.message);
    }
  }

  return (
      <div className="container-fluid py-4">
        <div className="top-products-card shadow-lg">
          <div className="card-header bg-primary text-white">
            <h4 className="mb-0">{label}</h4>
          </div>
          <div className="card-body">
            <form onSubmit={handleAddSanPham}>
              <div className="row">
                <div className="col-md-6">
                  <div className="mb-4">
                    <label className="form-label fw-bold">Mã sản phẩm</label>
                    <input
                        name="masp"
                        value={product?.maSanPham || ""}
                        className="form-control p-3"
                        disabled
                        style={{ backgroundColor: "#f8f9fa" }}
                    />
                  </div>

                  <div className="mb-4">
                    <label className="form-label fw-bold">Tên sản phẩm</label>
                    <input
                        name="tensp"
                        defaultValue={product?.tenSanPham || ""}
                        className="form-control p-3"
                        placeholder="Nhập tên sản phẩm"
                    />
                  </div>

                  <div className="mb-4">
                    <label className="form-label fw-bold">Trạng thái</label>
                    <div className="d-flex gap-4 mt-2">
                      <div className="form-check">
                        <input
                            className="form-check-input"
                            type="radio"
                            name="trangThai"
                            value="1"
                            id="status1"
                            defaultChecked={!product?.trangThai || product?.trangThai === 1}
                        />
                        <label className="form-check-label" htmlFor="status1">
                          Còn hàng
                        </label>
                      </div>
                      <div className="form-check">
                        <input
                            className="form-check-input"
                            type="radio"
                            name="trangThai"
                            value="2"
                            id="status2"
                            defaultChecked={product?.trangThai === 2}
                        />
                        <label className="form-check-label" htmlFor="status2">
                          Hết hàng
                        </label>
                      </div>
                    </div>
                  </div>
                </div>

                <div className="col-md-6">
                  <div className="mb-4">
                    <label className="form-label fw-bold">Thương hiệu</label>
                    <Select
                        className="select-container"
                        classNamePrefix="select"
                        options={thuonghieu.filter((option) => option.trangThai === 1)}
                        value={selectedThuongHieu || null}
                        onChange={setSelectedThuongHieu}
                        getOptionLabel={(option) => option.tenThuongHieu}
                        getOptionValue={(option) => option.id}
                        name="thuonghieu"
                        placeholder="Chọn thương hiệu..."
                        noOptionsMessage={() => "Không có thương hiệu nào"}
                        styles={{
                          control: (base) => ({
                            ...base,
                            minHeight: '50px',
                            border: '2px solid #dee2e6',
                            '&:hover': {
                              borderColor: '#86b7fe'
                            }
                          })
                        }}
                    />
                  </div>

                  <div className="mb-4">
                    <label className="form-label fw-bold">Chất liệu</label>
                    <Select
                        className="select-container"
                        classNamePrefix="select"
                        options={chatlieu.filter((option) => option.trangThai === 1)}
                        value={selectedChatLieu || null}
                        onChange={setSelectedChatLieu}
                        getOptionLabel={(option) => option.tenChatLieu}
                        getOptionValue={(option) => option.id}
                        name="chatlieu"
                        placeholder="Chọn chất liệu..."
                        noOptionsMessage={() => "Không có chất liệu nào"}
                        styles={{
                          control: (base) => ({
                            ...base,
                            minHeight: '50px',
                            border: '2px solid #dee2e6',
                            '&:hover': {
                              borderColor: '#86b7fe'
                            }
                          })
                        }}
                    />
                  </div>

                  <div className="mb-4">
                    <label className="form-label fw-bold">Đế giày</label>
                    <Select
                        className="select-container"
                        classNamePrefix="select"
                        options={degiay.filter((option) => option.trangThai === 1)}
                        value={selectedDeGiay || null}
                        onChange={setSelectedDeGiay}
                        getOptionLabel={(option) => option.tenDeGiay}
                        getOptionValue={(option) => option.id}
                        name="degiay"
                        placeholder="Chọn đế giày..."
                        noOptionsMessage={() => "Không có đế giày nào"}
                        styles={{
                          control: (base) => ({
                            ...base,
                            minHeight: '50px',
                            border: '2px solid #dee2e6',
                            '&:hover': {
                              borderColor: '#86b7fe'
                            }
                          })
                        }}
                    />
                  </div>
                </div>
              </div>

              <div className="d-flex justify-content-end mt-4">
                <button
                    type="submit"
                    className="btn btn-primary px-4 py-2 fw-bold"
                    style={{ minWidth: '150px' }}
                >
                  {label}
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
  );
};

export default AdminAddProduct;