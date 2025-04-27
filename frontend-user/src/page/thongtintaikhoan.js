import React, { useState, useEffect } from "react";
import { toast } from "react-toastify"; // Dùng để hiển thị thông báo popup
import { postMethodPayload, postMethod } from "../services/request"; // Hàm gọi API POST
import Swal from "sweetalert2"; // Thư viện alert,

function ThongTinTaiKhoan() {
  const [user, setUser] = useState(null); // Lưu thông tin người dùng từ server
  const [gioitinh, setgioitinh] = useState(null);

  // useEffect sẽ chạy một lần sau khi component mount để lấy dữ liệu người dùng
  useEffect(() => {
    getUser();
  }, []);

  // Hàm xử lý khi người dùng nhấn nút "Cập nhật thông tin"
  // const getUser = async () => {
  //   var response = await postMethod("/api/khachhang/dang-dang-nhap");
  //   var result = await response.json();
  //   console.log(result);
  //
  //   setUser(result);
  // };

  async function handleChangeInfor(event) {
    event.preventDefault();
    const payload = {  // Tạo payload từ dữ liệu nhập trong form
      hoVaTen: event.target.elements.hoten.value,
      ngaySinh: event.target.elements.ngsinh.value,
      gioiTinh: event.target.elements.gioitinh.value,
      soDienThoai: event.target.elements.sdt.value,
    };
    console.log(payload);
    const res = await postMethodPayload("/api/khachhang/update-infor", payload);
    if (res.status < 300) {
      toast.success("Success!");
      await new Promise((resolve) => setTimeout(resolve, 1000));
      window.location.reload();
    }
    if (res.status == 417) {
      var result = await res.json();
      toast.error(result.defaultMessage);
    }
  }

  return (
      <>
        <div class="headeraccount">
          <h4>Thông tin tài khoản của bạn</h4>
        </div>
        <div class="col-lg-6 col-md-8 col-sm-12 col-12 passacc">
          <form onSubmit={handleChangeInfor} autocomplete="off">
            <table className="table ">
              <tr>
                <th>Họ và tên</th>
                <td>
                  <input
                      name="hoten"
                      defaultValue={user?.hoVaTen}
                      className="form-control"
                  />
                </td>
              </tr>
              <tr>
                <th>Ngày sinh</th>
                <td>
                  <br />
                  <input
                      name="ngsinh"
                      defaultValue={user?.ngaySinh}
                      className="form-control"
                      type="date"
                  />
                </td>
              </tr>
              <tr>
                <th>giới tính</th>
                <td>
                  <br />
                  <div className="d-flex">
                    <label class="radiocustom">
                      {" "}
                      Nam
                      <input
                          type="radio"
                          name="gioitinh"
                          defaultChecked={true}
                          value={true}
                      />
                      <span class="checkmark"></span>
                    </label>
                    <label class="radiocustom" style={{ marginLeft: "20px" }}>
                      {" "}
                      Nữ
                      <input type="radio" name="gioitinh" value={false} />
                      <span class="checkmark"></span>
                    </label>
                  </div>
                </td>
              </tr>
              <tr>
                <th>Số điện thoại</th>
                <td>
                  <br />
                  <input
                      name="sdt"
                      defaultValue={user?.soDienThoai}
                      className="form-control"
                  />
                </td>
              </tr>
              <tr>
                <td></td>
                <td>
                  <br />
                  <button className="btn btn-primary form-control">
                    Cập nhật thông tin
                  </button>
                </td>
              </tr>
            </table>
          </form>
        </div>
      </>
  );
}
export default ThongTinTaiKhoan;
