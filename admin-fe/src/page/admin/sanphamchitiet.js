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

  const imageMagicNumbers = {
    jpeg: [0xFF, 0xD8, 0xFF], // JPEG/JPG
    png: [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A], // PNG
    gif: [0x47, 0x49, 0x46, 0x38], // GIF (GIF87a/GIF89a)
    webp: [0x52, 0x49, 0x46, 0x46], // WEBP (RIFF)
  };
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
  async function checkMagicNumber(file) {
    return new Promise((resolve) => {
      const reader = new FileReader();
      reader.onload = (e) => {
        const buffer = new Uint8Array(e.target.result);
        let isImage = false;

        // Kiểm tra từng loại ảnh
        for (const [format, magic] of Object.entries(imageMagicNumbers)) {
          const match = magic.every((byte, i) => buffer[i] === byte);
          if (match) {
            isImage = true;
            break;
          }
        }
        resolve(isImage);
      };
      reader.readAsArrayBuffer(file.slice(0, 16)); // Đọc 16 byte đầu
    });
  }
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
    setUpdateKichCo(item.kichCo); // Thiết lập kích cỡ hiện tại của CTSP
    setSelectedKichCo(item.kichCo);
    setSelectedMauSac(item.mauSac);
    setItem(item);
    setMaSptc(item.maSanPhamChiTiet); // Thêm dòng này
    console.log("item.kichCo:", item.kichCo); // Kiểm tra giá trị kích cỡ
    setIsUpdate(true);
    setUpdateKichCo(item.kichCo);
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

    // Validate user
    const user = JSON.parse(localStorage.getItem("user"));
    if (!user) {
      toast.error("Người dùng không hợp lệ.");
      return;
    }

    // Get form values
    const maSanPhamChiTiet = maSptc.trim();
    const soLuong = parseInt(event.target.elements.soLuong.value, 10);
    const giaTien = parseFloat(event.target.elements.giaTien.value);
    const trangThai = event.target.elements.trangThai.value;

    // Validate inputs
    const errors = [];
    if (!maSanPhamChiTiet) errors.push("Mã sản phẩm chi tiết không được để trống");
    if (isNaN(soLuong) || soLuong <= 0 || soLuong >= 1000000) {
      errors.push("Số lượng phải là số hợp lệ (0 < số lượng < 1.000.000)");
    }
    if (isNaN(giaTien) || giaTien <= 0 || giaTien >= 1000000000) {
      errors.push("Giá tiền phải là số hợp lệ (0 < giá < 1.000.000.000)");
    }
    if (!trangThai || !["1","2"].includes(trangThai)) {
      errors.push("Vui lòng chọn trạng thái hợp lệ");
    }
    if (!selectedMauSac?.id) errors.push("Vui lòng chọn màu sắc");
    if (!selectIdKichCo || selectIdKichCo.length === 0) {
      errors.push("Vui lòng chọn kích cỡ.");
    }
    if (errors.length > 0) {
      errors.forEach(err => toast.error(err));
      return;
    }

    // Check duplicate (only for new items)
    if (item == null) {
      try {
        const checkUrl = `/api/san-pham-chi-tiet/check-exist?idSanPham=${sanpham.id}&mauSacId=${selectedMauSac.id}&kichCoId=${selectIdKichCo}`;
        const checkRes = await getMethod(checkUrl);
        const checkData = await checkRes.json(); // Parse JSON response

        if (checkData.exists) { // Kiểm tra trường exists trong response
          toast.error("Đã tồn tại màu sắc và kích cỡ này");
          return;
        }
      } catch (error) {
        console.error("Lỗi kiểm tra trùng lặp:", error);
        toast.error("Lỗi hệ thống khi kiểm tra trùng lặp");
        return;
      }
    }

    // Tạo payload
    const payload = {
      maSanPhamChiTiet,
      soLuong,
      giaTien,
      idSanPham: sanpham.id,
      idKichCo: selectIdKichCo,
      idMauSac: selectedMauSac.id,
      trangThai: parseInt(trangThai, 10),
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
    if (!updateKichCo?.id) {
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
    const files = document.getElementById("choosefile" + item.id).files;

    // Kiểm tra không có file nào được chọn
    if (files.length === 0) {
      toast.error("Vui lòng chọn ít nhất một file ảnh");
      return;
    }

    // Kiểm tra từng file
    for (const file of files) {
      // Nếu file.type không bắt đầu bằng "image/" => Kiểm tra Magic Number
      if (!file.type.startsWith("image/")) {
        const isImage = await checkMagicNumber(file);
        if (!isImage) {
          toast.error(`File "${file.name}" không phải là ảnh hợp lệ!`);
          return;
        }
      }
    }

    // Nếu tất cả file hợp lệ => Upload
    try {
      const listFile = Array.from(files);
      const listLink = await uploadMultipleFile(listFile);
      const res = await postMethodPayload(
          "/api/anh?chiTietSanPhamId=" + item.id,
          listLink
      );

      if (res.status < 300) {
        toast.success("Upload ảnh thành công!");
        getChiTietSanPham();
      } else if (res.status === 417) {
        const result = await res.json();
        toast.error(result.defaultMessage);
      } else {
        const result = await res.json();
        toast.error(result.message);
      }
    } catch (error) {
      console.error("Lỗi khi upload ảnh:", error);
      toast.error("Đã xảy ra lỗi khi upload ảnh");
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
                  genId(sanpham.maSanPham); // Tạo mã mới
                  setIsUpdate(false); // Chuyển sang chế độ thêm mới
                  setItem(null); // Xóa dữ liệu item hiện tại
                  setSelectedKichCo([]); // Reset kích cỡ về mảng rỗng
                  setSelectedMauSac(null); // Reset màu sắc về null
                  setMaSptc(""); // Reset mã CTSP (sẽ được genId cập nhật sau)
                }}
                data-bs-toggle="modal"
                data-bs-target="#addcate"
                className="btn btn-primary ms-2"
            >
              <i className="fa fa-plus"></i>
            </button>
            {/*<a*/}
            {/*    href="#"*/}
            {/*    onClick={() => exportToExcel()}*/}
            {/*    className="btn btn-success ms-2"*/}
            {/*>*/}
            {/*  <i className="fa fa-excel-o"></i>Excel*/}
            {/*</a>*/}
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
                <h5 className="modal-title">
                  {item ? 'Cập nhật sản phẩm chi tiết' : 'Thêm mới sản phẩm chi tiết'}
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
                      value={isUpdate ? item?.maSanPhamChiTiet : maSptc}
                      name="maSanPhamChiTiet"
                      type="text"
                      className="form-control"
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
                  <button className="btn btn-success form-control action-btn">
                    {isUpdate ? "Cập nhật" : "Thêm mới"}
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
