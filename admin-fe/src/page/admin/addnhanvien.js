import { useState, useEffect } from 'react'
import { toast } from 'react-toastify';
import { getMethod, uploadSingleFile, uploadMultipleFile, postMethodPayload } from '../../services/request';
import Swal from 'sweetalert2';
import Select from 'react-select';
import { Editor } from '@tinymce/tinymce-react';
import React, { useRef } from 'react';


var token = localStorage.getItem("token");

var linkbanner = '';
const AdminAddNhanVien = () => {
    const [item, setItem] = useState(null);
    const [label, setLabel] = useState("Thêm nhân viên");
    const [gender, setGender] = useState(true);
    const [role, setRole] = useState(1);
    const [newMaNhanVien, setNewMaNhanVien] = useState("");

    useEffect(() => {
        const getNhanVien = async () => {
            var uls = new URL(document.URL)
            var id = uls.searchParams.get("id");
            if (id != null) {
                setLabel("Cập nhật thông tin nhân viên")
                var response = await getMethod('/api/nhan-vien/' + id);
                var result = await response.json();
                setItem(result)
                setGender(result.gioiTinh);
                setRole(result.vaiTro);
                linkbanner = result.anh
            }else {
                // Tạo mã nhân viên mới khi thêm
                try {
                    const listResponse = await getMethod('/api/nhan-vien/all?size=1000');
                    const listResult = await listResponse.json();
                    console.log('sdgshgsdhgshs', listResult);


                    const maMoi = `NV${String(Number(listResult.totalElements) + 1).padStart(3, '0')}`;
                    setItem(prev => ({ ...prev, maNhanVien: maMoi }));
                } catch (error) {
                    toast.error("Không thể tạo mã nhân viên mới.");
                }
            }
        };
        getNhanVien();
    }, []);

    async function handleAddNhanVien(event) {
        event.preventDefault();

        // Lấy dữ liệu từ form
        const maNhanVien = event.target.elements.manv.value.trim();
        const hoVaTen = event.target.elements.hoten.value.trim();
        const gioiTinh = gender;
        const ngaySinh = event.target.elements.ngsinh.value;
        const queQuan = event.target.elements.queQuan.value.trim();
        const cccd = event.target.elements.cccd.value.trim();
        const soDienThoai = event.target.elements.Sdt.value.trim();
        const email = event.target.elements.email.value.trim();
        const password = event.target.elements.password.value;
        const repassword = event.target.elements.repassword.value;

        // Kiểm tra trống từng trường
        if (!maNhanVien) {
            toast.error("Mã nhân viên không được để trống");
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

        if (!queQuan) {
            toast.error("Quê quán không được để trống");
            return;
        }
        if (!cccd) {
            toast.error("Căn cước công dân không được để trống");
            return;
        }
        //cccd phải bắt đầu bằng "0" và có 12 chữ số
        const cccdRegex = /^0\d{11}$/;
        if (!cccdRegex.test(cccd)) {
            toast.error("Căn cước công dân phải bắt đầu bằng số 0 và có 12 chữ số.");
            return;
        }

        if (!soDienThoai) {
            toast.error("Số điện thoại không được để trống");
            return;
        }
        // Validate số điện thoại
        const phoneRegex = /^(09|08|05|02|03|01)\d{7,9}$/; // Đầu số (09, 08, 05, 02, 03) + 9-11 số
        if (!phoneRegex.test(soDienThoai)) {
            toast.error("Số điện thoại không đúng định dạng. Đầu số hợp lệ: 09, 08, 05, 02, 03, 01 và độ dài từ 9-11 số.");
            return;
        }

        if (!email) {
            toast.error("Email không được để trống");
            return;
        }
        // Validate email đúng định dạng
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            toast.error("Email không đúng định dạng. Đảm bảo email có ký tự '@' và '.'");
            return;
        }
        // Kiểm tra khớp mật khẩu
        if (password !== repassword) {
            toast.error("Mật khẩu không trùng khớp");
            return;
        }

        // Kiểm tra trùng số điện thoại và email qua API
        try {
            const phoneExistsResponse = await getMethod(`/api/nhan-vien/exists/soDienThoai?soDienThoai=${soDienThoai}`);
            const emailExistsResponse = await getMethod(`/api/nhan-vien/exists/email?email=${email}`);

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
            toast.error("Lỗi khi kiểm tra thông tin nhân viên.");
            return;
        }

        event.preventDefault();
        if (event.target.elements.password.value != event.target.elements.repassword.value) {
            toast.error("Mật khẩu không trùng khớp");
            return;
        }
        var user = JSON.parse(localStorage.getItem("user"))
        var ims = await uploadSingleFile(document.getElementById("imgbanner"))
        if (ims != null) {
            linkbanner = ims
        }
        const payload = {
            maNhanVien: event.target.elements.manv.value,
            anh: linkbanner,
            hoVaTen: event.target.elements.hoten.value,
            ngaySinh: event.target.elements.ngsinh.value,
            gioiTinh: gioiTinh,
            queQuan: event.target.elements.queQuan.value,
            cccd: event.target.elements.cccd.value,
            soDienThoai: event.target.elements.Sdt.value,
            email: event.target.elements.email.value,
            matKhau: event.target.elements.password.value,
            vaiTro: role,
            nguoiTao: user.maNhanVien,
            nguoiCapNhat: user.maNhanVien,
            trangThai: 1,
        };
        if (item.hoVaTen != null) {
            payload.nguoiTao = item.nguoiTao
        }
        var url = '/api/nhan-vien';
        if (item.hoten != null) {
            url += '/' + item.id
        }
        const res = await postMethodPayload(url, payload)
        if (res.status < 300) {
            toast.success('Thêm thành công!');
            await new Promise(resolve => setTimeout(resolve, 1000));
            window.location.href = 'user'
        }
        if (res.status == 417) {
            var result = await res.json()
            toast.error(result.defaultMessage);
        }
        if (res.status > 300) {
            toast.error("Thất bại");
        }
    };

    return (
        <div className="container-fluid py-4">
            <div className="top-products-card shadow-lg">
                <div className="card-header bg-primary text-white">
                    <h4 className="mb-0">{label}</h4>
                </div>
                <div className="card-body">
                    <form onSubmit={handleAddNhanVien}>
                        <div className="row">
                            {/* Cột trái */}
                            <div className="col-md-6">
                                <div className="mb-3">
                                    <label className="form-label fw-bold">Mã nhân viên</label>
                                    <input
                                        name="manv"
                                        defaultValue={item?.maNhanVien}
                                        className="form-control"
                                        disabled
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

                                <div className="mb-3">
                                    <label className="form-label fw-bold">Quê quán</label>
                                    <input
                                        name="queQuan"
                                        defaultValue={item?.queQuan}
                                        className="form-control"
                                        placeholder="Nhập quê quán"
                                    />
                                </div>

                                <div className="mb-3">
                                    <label className="form-label fw-bold">Căn cước công dân</label>
                                    <input
                                        name="cccd"
                                        defaultValue={item?.cccd}
                                        className="form-control"
                                        placeholder="Nhập số CCCD"
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
                                    <label className="form-label fw-bold">Email</label>
                                    <input
                                        name="email"
                                        defaultValue={item?.email}
                                        className="form-control"
                                        placeholder="Nhập email"
                                        type="email"
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
                                    <label className="form-label fw-bold">Vai trò</label>
                                    <div className="d-flex gap-4">
                                        <div className="form-check">
                                            <input
                                                className="form-check-input"
                                                type="radio"
                                                name="vaiTro"
                                                id="admin"
                                                checked={role === 1}
                                                onChange={() => setRole(1)}
                                            />
                                            <label className="form-check-label" htmlFor="admin">
                                                Admin
                                            </label>
                                        </div>
                                        {/*<div className="form-check">*/}
                                        {/*    <input*/}
                                        {/*        className="form-check-input"*/}
                                        {/*        type="radio"*/}
                                        {/*        name="vaiTro"*/}
                                        {/*        id="staff"*/}
                                        {/*        checked={role === 0}*/}
                                        {/*        onChange={() => setRole(0)}*/}
                                        {/*    />*/}
                                        {/*    <label className="form-check-label" htmlFor="staff">*/}
                                        {/*        Nhân viên*/}
                                        {/*    </label>*/}
                                        {/*</div>*/}
                                    </div>
                                </div>

                                <div className="mb-3">
                                    <label className="form-label fw-bold">Mật khẩu</label>
                                    <input
                                        name="password"
                                        required
                                        id="pass"
                                        type="password"
                                        className="form-control"
                                        placeholder="Nhập mật khẩu"
                                    />
                                </div>

                                <div className="mb-3">
                                    <label className="form-label fw-bold">Nhập lại mật khẩu</label>
                                    <input
                                        name="repassword"
                                        required
                                        id="repass"
                                        type="password"
                                        className="form-control"
                                        placeholder="Nhập lại mật khẩu"
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
}


export default AdminAddNhanVien;