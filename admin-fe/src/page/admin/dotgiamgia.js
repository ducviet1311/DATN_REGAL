import { useState, useEffect } from "react";
import ReactPaginate from "react-paginate";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import Swal from "sweetalert2";
import {
  getMethod,
  postMethodPayload,
  deleteMethod,
  postMethod,
} from "../../services/request";
import { formatMoney } from "../../services/money";
import * as XLSX from "xlsx";
import { saveAs } from "file-saver";

var size = 5;
var url = "/api/dot-giam-gia/all?&size=" + size + "&sort=id,desc&page=";
const AdminDotGiamGia = () => {
  const [items, setItems] = useState([]);
  const [selectedStatus, setSelectedStatus] = useState("");
  useEffect(() => {
    getDotGiamGia();
  }, []);
  useEffect(() => {
    // Tự động cập nhật trạng thái đợt giảm giá sau khi lấy dữ liệu
    const now = new Date();
    let hasUpdate = false; // Biến kiểm tra xem có thay đổi hay không

    const updatedItems = items.map((item) => {
      const ngayKetThuc = new Date(item.ngayKetThuc);
      if (ngayKetThuc < now && item.trangThai === 1) {
        // Cập nhật trạng thái thành "Đã kết thúc" nếu ngày kết thúc đã qua
        ketThuc(item.id, true);
        hasUpdate = true;
        return {
          ...item,
          trangThai: 0,
        };
      }
      return item;
    });

    if (hasUpdate) {
      setItems(updatedItems); // Cập nhật lại state chỉ khi có thay đổi
    }
  }, [items]); // Dùng items làm dependency để chỉ chạy lại khi items thay đổi
  const getDotGiamGia = async () => {
    var response = await getMethod("/api/dot-giam-gia");
    var result = await response.json();
    setItems(result);
  };
  const handleStatusFilter = (e) => {
    setSelectedStatus(e.target.value); // Lưu trạng thái được chọn
  };

  const filteredItems = items.filter((item) => {
    if (selectedStatus === "") return true; // Nếu không chọn trạng thái, hiển thị tất cả
    return selectedStatus === "1"
        ? item.trangThai !== 0 // Lọc "Đang hoạt động"
        : item.trangThai === 0; // Lọc "Không hoạt động"
  });
  async function ketThuc(id, auto) {
    if (!auto) {
      // Hiển thị Swal khi `auto` là false
      Swal.fire({
        title: "Xác nhận kết thúc",
        text: "Bạn có chắc chắn muốn kết thúc mục này không?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "Kết thúc",
        cancelButtonText: "Hủy",
        reverseButtons: true,
      }).then(async (result) => {
        if (result.isConfirmed) {
          // Nếu người dùng xác nhận
          await handleKetThuc(id);
        } else if (result.dismiss === Swal.DismissReason.cancel) {
          console.log("Hủy thao tác kết thúc.");
        }
      });
    } else {
      // Nếu `auto` là true, thực hiện luôn
      await handleKetThuc(id);
    }
  }

// Hàm xử lý logic chính để tránh lặp mã
  async function handleKetThuc(id) {
    const response = await postMethod("/api/dot-giam-gia/ket-thuc?id=" + id);
    if (response.status < 300) {
      const result = await response.text();
      toast.success(result);
      getDotGiamGia(); // Gọi lại hàm lấy dữ liệu
    } else if (response.status === 417) {
      const result = await response.json();
      toast.warning(result.defaultMessage);
    } else {
      toast.warning("Kết thúc thất bại");
    }
  }


  async function deleteDotGiamGia(id) {
    Swal.fire({
      title: "Xác nhận xóa",
      text: "Bạn có chắc chắn muốn xóa đợt giảm giá này không?",
      icon: "warning",
      showCancelButton: true,
      confirmButtonText: "Xóa",
      cancelButtonText: "Hủy",
      reverseButtons: true,
    }).then(async (result) => {
      if (result.isConfirmed) {
        // Nếu người dùng xác nhận xóa
        const response = await deleteMethod("/api/dot-giam-gia/xoa?id=" + id);
        if (response.status < 300) {
          const result = await response.text();
          toast.success(result); // Hiển thị thông báo thành công
          getDotGiamGia(); // Gọi lại hàm lấy danh sách đợt giảm giá
        } else if (response.status === 417) {
          const result = await response.json();
          toast.warning(result.defaultMessage); // Hiển thị thông báo lỗi cụ thể
        } else {
          toast.warning("Xóa thất bại"); // Thông báo lỗi chung
        }
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        console.log("Hủy thao tác xóa.");
      }
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
    saveAs(blob, `PhieuGiamGia.xlsx`);
  };
  return (
      <>
        <div class="headerpageadmin d-flex justify-content-between align-items-center p-3 bg-light border">
          <strong class="text-left">
            <i className="fa fa-ticket"></i> Quản lý đợt giảm giá
          </strong>
          <div class="search-wrapper d-flex align-items-center">
            <div class="search-container"></div>
            <a href="add-dot-giam-gia" class="btn btn-primary ms-2">
              <i className="fa fa-plus"></i>
            </a>
            <a
                href="#"
                onClick={() => exportToExcel()}
                className="btn btn-success ms-2"
            >
              <i className="fa fa-excel-o"></i>Excel
            </a>
            <select
                className="form-select ms-2"
                value={selectedStatus}
                onChange={handleStatusFilter}
            >
              <option value="">Tất cả trạng thái</option>
              <option value="0">Đã kết thúc</option>
              <option value="1">Không hoạt động</option>
            </select>
          </div>
        </div>
        <div class="tablediv">
          <div class="headertable">
            <span class="lbtable">Danh sách đợt giảm giá</span>
          </div>
          <div class="divcontenttable">
            <table id="example" class="table table-bordered">
              <thead>
              <tr>
                <th>STT</th>
                <th>Giá trị giảm</th>
                <th>Ngày bắt đầu</th>
                <th>Ngày kết thúc</th>
                <th>Trạng thái</th>
                <th>Ngày tạo</th>
                <th>Hành động</th>
              </tr>
              </thead>
              <tbody>
              {filteredItems.map((item,index) => {
                return (
                    <tr>
                      <td>{index+1}</td>
                      <td>{formatMoney(item.giaTriGiam)}</td>
                      <td>{item.ngayBatDau}</td>
                      <td>{item.ngayKetThuc}</td>
                      <td>
                        {item.trangThai == 1 ? "Đang hoạt động" : "Đã kết thúc"}
                      </td>
                      <td>{item.ngayTao}</td>
                      <td class="sticky-col">
                        {item.trangThai == 1 ? (
                            <button
                                onClick={() => ketThuc(item.id)}
                                className="edit-btn"
                            >
                              Kết thúc
                            </button>
                        ) : (
                            ""
                        )}
                        <button
                            onClick={() => deleteDotGiamGia(item.id)}
                            className="delete-btn"
                        >
                          <i className="fa fa-trash"></i>
                        </button>
                        <a
                            href={"update-dot-giam-gia?id=" + item.id}
                            className="edit-btn"
                        >
                          <i className="fa fa-edit"></i>
                        </a>
                      </td>
                    </tr>
                );
              })}
              </tbody>
            </table>
          </div>
        </div>
      </>
  );
};

export default AdminDotGiamGia;
