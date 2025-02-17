import { useState, useEffect } from "react";
import ReactPaginate from "react-paginate";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import {
  getMethod,
  deleteMethod,
  postMethodPayload,
  uploadMultipleFile,
} from "../../services/request";
import Swal from "sweetalert2";
import { formatMoney } from "../../services/money";
import Select from "react-select";
import * as XLSX from "xlsx";
import { saveAs } from "file-saver";

const AdminSanPhamChiTiet = () => {
  const [items, setItems] = useState([]);
  const [kichco, setKichCo] = useState([]);
  const [mausac, setMauSac] = useState([]);
  const [selectedKichCo, setSelectedKichCo] = useState([]);
  const [updateKichCo, setUpdateKichCo] = useState(null);

  const [selectIdKichCo, setSelectIdKichCo] = useState([]);

  const [selectedMauSac, setSelectedMauSac] = useState(null);
  const [sanpham, setSanPham] = useState(null);
  const [item, setItem] = useState(null);
  const [maSptc, setMaSptc] = useState("");
  const [isUpdate, setIsUpdate] = useState(false);
  useEffect(() => {
    getChiTietSanPham();
    getSanPham();
    getSelect();
  }, []);

  const genId = async (id) => {
    try {
      var uls = new URL(document.URL);
      var sanpham = uls.searchParams.get("sanpham");
      if (sanpham == null) {
        window.location.href = "product";
      }
      var response = await getMethod(
        "/api/san-pham-chi-tiet/findBySanPham?sanpham=" + sanpham
      );
      const listResult = await response.json();
      console.log("sdgshgsdhgshs", listResult);

      const maMoi = `${id}-${String(
        Number(listResult.length) + 1
      ).padStart(3, "0")}`;

      setMaSptc(maMoi);
      // setProduct((prev) => ({ ...prev, maSanPham: maMoi }));
    } catch (error) {
      toast.error("Không thể tạo mã sản phẩm mới.");
    }
  };
  const exportToExcel = () => {
    const worksheet = XLSX.utils.json_to_sheet(items);
    const workbook = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(workbook, worksheet, "Sheet1");
    const excelBuffer = XLSX.write(workbook, {
      bookType: "xlsx",
      type: "array",
    });
    const blob = new Blob([excelBuffer], { type: "application/octet-stream" });
    saveAs(blob, `SanPhamChiTiet.xlsx`);
  };

  async function getChiTietSanPham() {
    var uls = new URL(document.URL);
    var sanpham = uls.searchParams.get("sanpham");
    if (sanpham == null) {
      window.location.href = "product";
    }
    var response = await getMethod(
      "/api/san-pham-chi-tiet/findBySanPham?sanpham=" + sanpham
    );
    var result = await response.json();

    setItems(result);
  }

  async function getSanPham() {
    var uls = new URL(document.URL);
    var sanpham = uls.searchParams.get("sanpham");
    var response = await getMethod("/api/san-pham/" + sanpham);
    var result = await response.json();
    console.log("sanpham", result);

    setSanPham(result);
  }

  const getSelect = async () => {
    var response = await getMethod("/api/mau-sac");
    var list = await response.json();
    setMauSac(list);
    var response = await getMethod("/api/kich-co");
    var list = await response.json();
    setKichCo(list);
  };

  function setItemSelect(item) {
    setIsUpdate(true);
    setSelectedKichCo(item.kichCo);
    setSelectedMauSac(item.mauSac);
    setItem(item);
  }

  async function deleteChiTiet(id) {
    Swal.fire({
      title: "Xác nhận xóa",
      text: "Bạn có chắc chắn muốn xóa mục này không?",
      icon: "warning",
      showCancelButton: true,
      confirmButtonText: "Xóa",
      cancelButtonText: "Hủy",
      reverseButtons: true,
    }).then(async (result) => {
      if (result.isConfirmed) {
        const response = await deleteMethod("/api/san-pham-chi-tiet/" + id); // Cập nhật lại đường dẫn API nếu cần
        if (response.status < 300) {
          toast.success("Xóa thành công!");
          getChiTietSanPham(); // Cập nhật lại hàm lấy dữ liệu nếu cần
        } else if (response.status === 417) {
          const result = await response.json();
          toast.warning(result.defaultMessage);
        } else {
          toast.warning("Xóa thất bại");
        }
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        console.log("Hủy thao tác xóa.");
      }
    });
  }

  const handleChangeSize = (selectedOptions) => {
    if (isUpdate) {
      setUpdateKichCo(selectedOptions);
    } else {
      const ids = selectedOptions.map((option) => option.id); // Lấy mảng id
      setSelectedKichCo(selectedOptions);
      setSelectIdKichCo(ids);

      console.log("Selected Kích Cỡ IDs:", selectedOptions);
    }
  };

  async function saveData(event) {
    event.preventDefault();
    setIsUpdate(false);

    // Lấy thông tin người dùng từ localStorage
    const user = JSON.parse(localStorage.getItem("user"));
    if (!user) {
      toast.error("Người dùng không hợp lệ.");
      return;
    }

    // Lấy các giá trị từ form
    const maSanPhamChiTiet = maSptc.trim();
    const soLuong = parseInt(event.target.elements.soLuong.value, 10);
    const giaTien = parseFloat(event.target.elements.giaTien.value);
    const trangThai = event.target.elements.trangThai.value; // Lấy giá trị từ radio button

    // Kiểm tra giá trị nhập vào
    if (!maSanPhamChiTiet) {
      toast.error("Mã sản phẩm chi tiết không được để trống.");
      return;
    }
    if (isNaN(soLuong) || soLuong <= 0 || soLuong >= 1000000) {
      toast.error(
        "Số lượng phải là một số hợp lệ và lớn hơn 0 và nhỏ hơn 1.000.000"
      );
      return;
    }
    if (isNaN(giaTien) || giaTien <= 0 || giaTien >= 1000000000) {
      toast.error(
        "Giá tiền phải là một số hợp lệ và lớn hơn 0 và nhỏ hơn 1.000.000.000"
      );
      return;
    }
    if (!trangThai || (trangThai !== "1" && trangThai !== "2")) {
      toast.error(
        "Trạng thái không hợp lệ. Vui lòng chọn Còn hàng hoặc Hết hàng."
      );
      return;
    }
    if (!selectIdKichCo) {
      toast.error("Vui lòng chọn kích cỡ.");
      return;
    }
    if (!selectedMauSac?.id) {
      toast.error("Vui lòng chọn màu sắc.");
      return;
    }

    // Tạo payload
    const payload = {
      maSanPhamChiTiet,
      soLuong,
      giaTien,
      idSanPham: sanpham.id,
      idKichCo: selectIdKichCo,
      idMauSac: selectedMauSac.id,
      trangThai: parseInt(trangThai, 10), // Chuyển thành số nguyên
      nguoiTao: user.maNhanVien,
      nguoiCapNhat: user.maNhanVien,
    };

    // Nếu đang cập nhật, giữ nguyên người tạo ban đầu
    if (item != null) {
      payload.nguoiTao = item.nguoiTao;
    }

    // Xác định URL
    let url = "/api/san-pham-chi-tiet";
    if (item != null) {
      url += "/" + item.id;
    }

    // Gửi payload qua API
    const res = await postMethodPayload(url, payload);

    // Xử lý phản hồi
    if (res.status < 300) {
      toast.success("Thành công!");
      await new Promise((resolve) => setTimeout(resolve, 1000));
      window.location.reload();
    } else if (res.status === 417) {
      const result = await res.json();
      toast.error(result.defaultMessage);
    } else if (res.status > 300) {
      const result = await res.json();
      toast.error(result.message);
    }
  }

  async function updateData(event) {
    event.preventDefault();

    // Lấy thông tin người dùng từ localStorage
    const user = JSON.parse(localStorage.getItem("user"));
    if (!user) {
      toast.error("Người dùng không hợp lệ.");
      return;
    }

    // Lấy các giá trị từ form
    const maSanPhamChiTiet =
      event.target.elements.maSanPhamChiTiet.value.trim();
    const soLuong = parseInt(event.target.elements.soLuong.value, 10);
    const giaTien = parseFloat(event.target.elements.giaTien.value);
    const trangThai = event.target.elements.trangThai.value; // Lấy giá trị từ radio button

    // Kiểm tra giá trị nhập vào
    if (!maSanPhamChiTiet) {
      toast.error("Mã sản phẩm chi tiết không được để trống.");
      return;
    }
    if (isNaN(soLuong) || soLuong <= 0 || soLuong >= 1000000) {
      toast.error(
        "Số lượng phải là một số hợp lệ và lớn hơn 0 và nhỏ hơn 1.000.000"
      );
      return;
    }
    if (isNaN(giaTien) || giaTien <= 0 || giaTien >= 1000000000) {
      toast.error(
        "Giá tiền phải là một số hợp lệ và lớn hơn 0 và nhỏ hơn 1.000.000.000"
      );
      return;
    }
    if (!trangThai || (trangThai !== "1" && trangThai !== "2")) {
      toast.error(
        "Trạng thái không hợp lệ. Vui lòng chọn Còn hàng hoặc Hết hàng."
      );
      return;
    }
    if (!selectIdKichCo) {
      toast.error("Vui lòng chọn kích cỡ.");
      return;
    }
    if (!selectedMauSac?.id) {
      toast.error("Vui lòng chọn màu sắc.");
      return;
    }

    // Tạo payload
    const payload = {
      maSanPhamChiTiet,
      soLuong,
      giaTien,
      idSanPham: sanpham.id,
      idKichCo: updateKichCo.id,
      idMauSac: selectedMauSac.id,
      trangThai: parseInt(trangThai, 10), // Chuyển thành số nguyên
      nguoiTao: user.maNhanVien,
      nguoiCapNhat: user.maNhanVien,
    };

    // Nếu đang cập nhật, giữ nguyên người tạo ban đầu
    if (item != null) {
      payload.nguoiTao = item.nguoiTao;
    }

    // Xác định URL
    let url = "/api/san-pham-chi-tiet/update";
    // if (item != null) {
    url += "/" + item.id;
    // }

    // Gửi payload qua API
    const res = await postMethodPayload(url, payload);

    // Xử lý phản hồi
    if (res.status < 300) {
      toast.success("Thành công!");
      await new Promise((resolve) => setTimeout(resolve, 1000));
      window.location.reload();
    } else if (res.status === 417) {
      const result = await res.json();
      toast.error(result.defaultMessage);
    } else if (res.status > 300) {
      const result = await res.json();
      toast.error(result.message);
    }
  }

  async function uploadAnh(item) {
    var listFile = [];
    var files = document.getElementById("choosefile" + item.id).files;
    for (var i = 0; i < files.length; i++) {
      listFile.push(files[i]);
    }
    console.log(listFile);

    var listLink = await uploadMultipleFile(listFile);
    const res = await postMethodPayload(
      "/api/anh?chiTietSanPhamId=" + item.id,
      listLink
    );
    if (res.status < 300) {
      toast.success("upload ảnh thành công");
      getChiTietSanPham();
    }
    if (res.status == 417) {
      var result = await res.json();
      toast.error(result.defaultMessage);
    }
    if (res.status > 300) {
      var result = await res.json();
      toast.error(result.message);
    }
  }
  function trangThai(tt) {
    switch (tt) {
      case 1:
        return "Còn hàng";
      case 2:
        return "Hết hàng";
    }
  }

  return (
    <>
      <div class="headerpageadmin d-flex justify-content-between align-items-center p-3 bg-light border">
        <strong class="text-left">
          <i className="fa fa-list"></i> Quản Lý Sản Phẩm Chi tiết -{" "}
          {sanpham?.tenSanPham} - {sanpham?.maSanPham}
        </strong>
        <div class="search-wrapper d-flex align-items-center">
          <div class="search-container"></div>
          <button
            onClick={() => {
              genId(sanpham.maSanPham);

              setIsUpdate(false);
              setItem(null);
            }}
            data-bs-toggle="modal"
            data-bs-target="#addcate"
            class="btn btn-primary ms-2"
          >
            <i className="fa fa-plus"></i>
          </button>
          <a
            href="#"
            onClick={() => exportToExcel()}
            className="btn btn-success ms-2"
          >
            <i className="fa fa-excel-o"></i>Excel
          </a>
        </div>
      </div>
      <div class="tablediv">
        <div class="headertable">
          <span class="lbtable">Danh sách sản phẩm chi tiết</span>
        </div>
        <div class="divcontenttable">
          <table id="example" class="table table-bordered">
            <thead>
              <tr>
                <th>STT</th>
                <th>Ảnh</th>
                <th>Mã chi tiết</th>
                <th>Kích cỡ</th>
                <th>Màu sắc</th>
                <th>Số lượng</th>
                <th>Gía tiền</th>
                <th>Ngày tạo</th>
                <th>Người tạo</th>
                <th>Người cập nhật</th>
                <th>Trạng thái</th>
                <th class="sticky-col">Hành động</th>
              </tr>
            </thead>
            <tbody>
              {items.map((item,index) => {
                const trangThaiHienTai = item.soLuong === 0 ? "Hết hàng" : trangThai(item.trangThai);
                return (
                  <tr>
                    <td>{index +1}</td>
                    <td>
                      {item.anhs.length == 0 ? (
                        ""
                      ) : (
                        <img src={item.anhs[0].tenAnh} className="imgtable" />
                      )}
                    </td>
                    <td>{item.maSanPhamChiTiet}</td>
                    <td>{item.kichCo?.tenKichCo}</td>
                    <td>{item.mauSac?.tenMauSac}</td>
                    <td>{item.soLuong}</td>
                    <td>{formatMoney(item.giaTien)}</td>
                    <td>{item.ngayTao}</td>
                    <td>{item.nguoiTao}</td>
                    <td>{item.nguoiCapNhat}</td>
                    <td>{trangThaiHienTai}</td>
                    <td class="sticky-col">
                      <button
                        onClick={() => setItemSelect(item)}
                        data-bs-toggle="modal"
                        data-bs-target="#addcate"
                        class="edit-btn"
                      >
                        <i className="fa fa-edit"></i>
                      </button>
                      <button
                        onClick={() => deleteChiTiet(item.id)}
                        class="delete-btn"
                      >
                        <i className="fa fa-trash"></i>
                      </button>
                      <input
                        onChange={() => uploadAnh(item)}
                        multiple={true}
                        id={"choosefile" + item.id}
                        type="file"
                        style={{ display: "none" }}
                      />
                      <button
                        onClick={() =>
                          document
                            .getElementById("choosefile" + item.id)
                            .click()
                        }
                        class="edit-btn"
                      >
                        <i className="fa fa-image"></i>
                      </button>
                    </td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>
      </div>

      <div
        class="modal fade"
        id="addcate"
        tabindex="-1"
        aria-labelledby="exampleModalLabel"
        aria-hidden="false"
      >
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">
                Thêm hoặc cập nhật màu sắc
              </h5>{" "}
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-body">
              <form
                class="col-sm-5 marginauto"
                onSubmit={isUpdate ? updateData : saveData}
                method="post"
              >
                <label class="lb-form">Mã sản phẩm chi tiết</label>
                <input
                  value={maSptc || "q"}
                  name="maSanPhamChiTiet"
                  type="text"
                  class="form-control"
                  disabled
                />
                <label class="lb-form">Số lượng</label>
                <input
                  defaultValue={item?.soLuong}
                  name="soLuong"
                  type="text"
                  class="form-control"
                />
                <label class="lb-form">Giá tiền</label>
                <input
                  defaultValue={item?.giaTien}
                  name="giaTien"
                  type="text"
                  class="form-control"
                />
                <label className="lb-form">Trạng thái</label>
                <div>
                  <label>
                    <input
                      type="radio"
                      name="trangThai"
                      value="1"
                      defaultChecked={!item?.trangThai || item?.trangThai === 1}
                    />
                    Còn hàng
                  </label>
                  {/*<label style={{ marginLeft: "10px" }}>*/}
                  {/*  <input*/}
                  {/*    type="radio"*/}
                  {/*    name="trangThai"*/}
                  {/*    value="2"*/}
                  {/*    defaultChecked={item?.trangThai === 2}*/}
                  {/*  />*/}
                  {/*  Hết hàng*/}
                  {/*</label>*/}
                </div>

                <label class="lb-form">Màu sắc</label>
                <Select
                  className="select-container"
                  options={mausac.filter((option) => option.trangThai === 1)}
                  value={selectedMauSac}
                  onChange={setSelectedMauSac}
                  getOptionLabel={(option) => option.tenMauSac}
                  getOptionValue={(option) => option.id}
                  name="mausac"
                  placeholder="Chọn màu sắc"
                />
                <label class="lb-form">Kích cỡ</label>
                <Select
                  className="select-container"
                  options={kichco.filter((option) => option.trangThai === 1)}
                  value={isUpdate ? updateKichCo : selectedKichCo}
                  onChange={handleChangeSize}
                  getOptionLabel={(option) => option.tenKichCo}
                  getOptionValue={(option) => option.id}
                  name="kichco"
                  isMulti={isUpdate ? false : true}
                  placeholder="Chọn kích cỡ"
                />
                <br />
                <br />
                <button class="btn btn-success form-control action-btn">
                  Xác nhận
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default AdminSanPhamChiTiet;
