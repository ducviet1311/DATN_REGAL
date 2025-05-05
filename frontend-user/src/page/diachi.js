import { useState, useEffect } from "react";
import ReactPaginate from "react-paginate";
import {
  getMethod,
  deleteMethod,
  uploadMultipleFile,
  postMethodPayload,
  postMethod,
} from "../services/request";
import { formatMoney } from "../services/money";
import Select from "react-select";
import { toast } from "react-toastify";

function DiaChi() {
  const [diaChis, setDiaChis] = useState([]);
  const [tinh, setTinh] = useState([]);
  const [huyen, setHuyen] = useState([]);
  const [xa, setXa] = useState([]);
  const [selecttinh, setselecttinh] = useState(null);
  const [selecthuyen, setselecthuyen] = useState(null);
  const [selectxa, setselectxa] = useState(null);
  const [errors, setErrors] = useState({}); // State để lưu lỗi validate

  useEffect(() => {
    getDiaChi();
    getTinh();
  }, []);

  const getDiaChi = async () => {
    var response = await getMethod("/api/dia-chi");
    var list = await response.json();
    setDiaChis(list);
  };

  const getTinh = async () => {
    var response = await getMethod("/api/shipping/public/province");
    var list = await response.json();
    setTinh(list.data);
    if (list.data.length > 0) {
      loadHuyen(list.data[0]);
    }
  };

  async function loadHuyen(item) {
    setselecttinh(item);
    var response = await getMethod(
        "/api/shipping/public/district?provinceId=" + item.ProvinceID
    );
    var list = await response.json();
    setHuyen(list.data);
    if (list.data.length > 0) {
      loadXa(list.data[0]);
    } else {
      setselecthuyen(null);
      setXa([]);
      setselectxa(null);
    }
  }

  async function loadXa(item) {
    setselecthuyen(item);
    var response = await getMethod(
        "/api/shipping/public/wards?districtId=" + item.DistrictID
    );
    var list = await response.json();
    setXa(list.data);
    if (list.data.length > 0) {
      setselectxa(list.data[0]);
    } else {
      setselectxa(null);
    }
  }

  async function handleAddDiaChi(event) {
    event.preventDefault();

    // Thu thập dữ liệu từ form
    const tenNguoiNhan = event.target.elements.fullnameadd.value;
    const sdtNguoiNhan = event.target.elements.phoneadd.value;
    const tenDuong = event.target.elements.stressadd.value;

    // Validate các trường
    const newErrors = {};
    if (!tenNguoiNhan.trim()) {
      newErrors.tenNguoiNhan = "Họ tên không được để trống";
    }
    if (!sdtNguoiNhan.trim()) {
      newErrors.sdtNguoiNhan = "Số điện thoại không được để trống";
    } else if (!/^\d{10,11}$/.test(sdtNguoiNhan)) {
      newErrors.sdtNguoiNhan = "Số điện thoại không hợp lệ";
    }
    if (!tenDuong.trim()) {
      newErrors.tenDuong = "Tên đường không được để trống";
    }
    if (!selecttinh) {
      newErrors.tinhThanhPho = "Vui lòng chọn tỉnh/thành phố";
    }
    if (!selecthuyen) {
      newErrors.quanHuyen = "Vui lòng chọn quận/huyện";
    }
    if (!selectxa) {
      newErrors.xaPhuong = "Vui lòng chọn phường/xã";
    }

    // Nếu có lỗi, hiển thị toast và cập nhật state errors
    if (Object.keys(newErrors).length > 0) {
      setErrors(newErrors);
      toast.error("Vui lòng điền đầy đủ và đúng thông tin");
      return;
    }

    // Xóa lỗi nếu validate thành công
    setErrors({});

    const payload = {
      tenDuong: tenDuong,
      xaPhuong: selectxa.WardCode + "?" + selectxa.WardName,
      quanHuyen: selecthuyen.DistrictID + "?" + selecthuyen.DistrictName,
      tinhThanhPho: selecttinh.ProvinceID + "?" + selecttinh.ProvinceName,
      tenNguoiNhan: tenNguoiNhan,
      sdtNguoiNhan: sdtNguoiNhan,
    };

    const res = await postMethodPayload("/api/dia-chi", payload);
    if (res.status < 300) {
      toast.success("Thêm mới địa chỉ thành công!");
      await new Promise((resolve) => setTimeout(resolve, 1000));
      window.location.reload();
    } else if (res.status === 417) {
      var result = await res.json();
      toast.error(result.defaultMessage);
    } else {
      toast.error("Có lỗi xảy ra, vui lòng thử lại");
    }
  }

  async function deleteDiaChi(id) {
    var con = window.confirm("Bạn có muốn xóa địa chỉ này không?");
    if (!con) {
      return;
    }
    const response = await deleteMethod("/api/dia-chi/" + id);
    if (response.status < 300) {
      toast.success("Xóa thành công!");
      getDiaChi();
    } else {
      var result = await response.json();
      toast.warning(result.message || "Xóa không thành công!");
    }
  }

  return (
      <>
        <div className="headeraccount">
          <p className="fontyel">Địa chỉ của bạn</p>
          <div className="right_flex">
            <button
                onClick={() => setErrors({})} // Xóa lỗi khi mở modal
                data-bs-toggle="modal"
                data-bs-target="#modaladd"
                className="btnsuathongtin"
            >
              + Thêm địa chỉ mới
            </button>
          </div>
        </div>
        <div className="contentacc" id="listaddacc">
          {diaChis.map((item) => {
            return (
                <div className="row singleadd" key={item.id}>
                  <div className="col-lg-11 col-md-11 col-sm-12 col-12">
                    <table className="table tableadd">
                      <tr>
                        <td className="tdleft">Họ tên:</td>
                        <td className="tdright">{item.tenNguoiNhan}</td>
                      </tr>
                      <tr>
                        <td className="tdleft">Địa chỉ:</td>
                        <td className="tdright">
                          {item.tenDuong} , {item.xaPhuong.split("?")[1]},{" "}
                          {item.quanHuyen.split("?")[1]},{" "}
                          {item.tinhThanhPho.split("?")[1]}
                        </td>
                      </tr>
                      <tr>
                        <td className="tdleft">Số điện thoại:</td>
                        <td className="tdright">{item.sdtNguoiNhan}</td>
                      </tr>
                      <tr>
                        <td className="tdleft">Ngày tạo:</td>
                        <td className="tdright">{item.ngayTao}</td>
                      </tr>
                    </table>
                  </div>
                  <div className="col-lg-1 col-md-1 col-sm-12 col-12">
                <span
                    onClick={() => deleteDiaChi(item.id)}
                    className="actionacc acdel"
                    style={{
                      color: "#d0021b",
                      fontWeight: "bold",
                      cursor: "pointer",
                      textDecoration: "underline",
                    }}
                >
                  Xóa
                </span>
                  </div>
                </div>
            );
          })}
        </div>

        <div
            className="modal fade"
            id="modaladd"
            tabIndex="-1"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true"
        >
          <div className="modal-dialog modal-lg modal-fullscreen-sm-down modeladdres">
            <div className="modal-content">
              <div className="modal-header">
                <h5 className="modal-title" id="exampleModalLabel">
                  Thêm địa chỉ mới
                </h5>
                <button
                    type="button"
                    className="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
              </div>
              <form onSubmit={handleAddDiaChi} className="modal-body">
                <div className="row">
                  <div className="col-lg-6 col-md-6 col-sm-12 col-12 formadd">
                    <input
                        name="fullnameadd"
                        className="form-control fomd"
                        placeholder="Họ tên"
                    />
                    {errors.tenNguoiNhan && (
                        <span style={{ color: "red", fontSize: "12px" }}>
                      {errors.tenNguoiNhan}
                    </span>
                    )}
                  </div>
                  <div className="col-lg-6 col-md-6 col-sm-12 col-12 formadd">
                    <input
                        name="phoneadd"
                        className="form-control fomd"
                        placeholder="Số điện thoại"
                    />
                    {errors.sdtNguoiNhan && (
                        <span style={{ color: "red", fontSize: "12px" }}>
                      {errors.sdtNguoiNhan}
                    </span>
                    )}
                  </div>
                  <div className="col-lg-12 col-md-12 col-sm-12 col-12 formadd">
                    <input
                        name="stressadd"
                        className="form-control fomd"
                        placeholder="Tên đường, số nhà"
                    />
                    {errors.tenDuong && (
                        <span style={{ color: "red", fontSize: "12px" }}>
                      {errors.tenDuong}
                    </span>
                    )}
                  </div>
                  <div className="col-lg-4 col-md-4 col-sm-12 col- mercurio col-12 formadd">
                    <label className="lbsatop">Tỉnh thành</label>
                    <Select
                        className="select-container"
                        options={tinh}
                        value={selecttinh}
                        onChange={loadHuyen}
                        getOptionLabel={(option) => option.ProvinceName}
                        getOptionValue={(option) => option.ProvinceID}
                        name="tinh"
                        placeholder="Chọn tỉnh"
                    />
                    {errors.tinhThanhPho && (
                        <span style={{ color: "red", fontSize: "12px" }}>
                      {errors.tinhThanhPho}
                    </span>
                    )}
                  </div>
                  <div className="col-lg-4 col-md-4 col-sm-12 col-12 formadd">
                    <label className="lbsatop">Quận/ huyện</label>
                    <Select
                        className="select-container"
                        options={huyen}
                        value={selecthuyen}
                        onChange={loadXa}
                        getOptionLabel={(option) => option.DistrictName}
                        getOptionValue={(option) => option.DistrictID}
                        name="huyen"
                        placeholder="Chọn huyện"
                    />
                    {errors.quanHuyen && (
                        <span style={{ color: "red", fontSize: "12px" }}>
                      {errors.quanHuyen}
                    </span>
                    )}
                  </div>
                  <div className="col-lg-4 col-md-4 col-sm-12 col-12 formadd">
                    <label className="lbsatop">Phường/ xã</label>
                    <Select
                        className="select-container"
                        options={xa}
                        value={selectxa}
                        onChange={setselectxa}
                        getOptionLabel={(option) => option.WardName}
                        getOptionValue={(option) => option.WardCode}
                        name="xa"
                        placeholder="Chọn xã"
                    />
                    {errors.xaPhuong && (
                        <span style={{ color: "red", fontSize: "12px" }}>
                      {errors.xaPhuong}
                    </span>
                    )}
                  </div>
                </div>
                <div className="col-lg-6 col-md-6">
                  <button type="submit" className="btntt">
                    LƯU
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </>
  );
}

export default DiaChi;