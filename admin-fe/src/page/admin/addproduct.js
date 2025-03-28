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
      <div>
        <div class="col-sm-12 header-sps">
          <div class="title-add-admin">
            <h4>{label}</h4>
          </div>
        </div>
        <div class="col-sm-12">
          <div class="form-add">
            <form class="row" onSubmit={handleAddSanPham} method="post">
              <div class="col-md-5 col-sm-12 col-12">
                <label class="lb-form">Mã sản phẩm</label>
                <input
                    name="masp"
                    value={product?.maSanPham || ""}
                    class="form-control"
                    disabled
                />
                <label class="lb-form">Tên sản phẩm</label>
                <input
                    name="tensp"
                    defaultValue={product?.tenSanPham || ""}
                    class="form-control"
                />
                <label className="lb-form">Trạng thái</label>
                <div>
                  <label className="lb-form">
                    <input
                        type="radio"
                        name="trangThai"
                        value="1"
                        defaultChecked={!product?.trangThai || product?.trangThai === 1}
                    />
                    Còn hàng
                  </label>
                  <label className="lb-form">
                    <input
                        type="radio"
                        name="trangThai"
                        value="2"
                        defaultChecked={product?.trangThai === 2}
                    />
                    Hết hàng
                  </label>
                </div>
                <label dangerouslySetInnerHTML={{ __html: "&ThinSpace;" }}></label>
                <button class="btn btn-primary form-control">{label}</button>
              </div>
              <div class="col-md-5 col-sm-12 col-12">
                <label class="lb-form">Thương hiệu</label>
                <Select
                    className="select-container"
                    options={thuonghieu.filter((option) => option.trangThai === 1)}
                    value={selectedThuongHieu || null}
                    onChange={setSelectedThuongHieu}
                    getOptionLabel={(option) => option.tenThuongHieu}
                    getOptionValue={(option) => option.id}
                    name="thuonghieu"
                    placeholder="Chọn thương hiệu"
                />
                <label class="lb-form">Chất liệu</label>
                <Select
                    className="select-container"
                    options={chatlieu.filter((option) => option.trangThai === 1)}
                    value={selectedChatLieu || null}
                    onChange={setSelectedChatLieu}
                    getOptionLabel={(option) => option.tenChatLieu}
                    getOptionValue={(option) => option.id}
                    name="chatlieu"
                    placeholder="Chọn chất liệu"
                />
                <label class="lb-form">Đế giày</label>
                <Select
                    className="select-container"
                    options={degiay.filter((option) => option.trangThai === 1)}
                    value={selectedDeGiay || null}
                    onChange={setSelectedDeGiay}
                    getOptionLabel={(option) => option.tenDeGiay}
                    getOptionValue={(option) => option.id}
                    name="degiay"
                    placeholder="Chọn đế giày"
                />
              </div>
            </form>
          </div>
        </div>
      </div>
  );
};

export default AdminAddProduct;