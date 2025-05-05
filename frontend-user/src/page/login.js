import React from 'react';
import { toast } from 'react-toastify';
import { postMethodPayload } from '../services/request';
import Swal from 'sweetalert2';
import 'react-toastify/dist/ReactToastify.css'; // Đảm bảo import CSS

function Login() {
    async function getKhachHang(token) {
        try {
            const res = await fetch('http://localhost:8080/api/khach-hang/dang-dang-nhap', {
                method: 'POST',
                headers: new Headers({
                    'Authorization': 'Bearer ' + token,
                }),
            });
            // if (res.status >= 300) {
            //     throw new Error('Lỗi khi lấy thông tin khách hàng');
            // }
            const result = await res.json();
            localStorage.setItem('user', JSON.stringify(result));
        } catch (error) {
            toast.error('Lỗi khi lấy thông tin khách hàng');
            console.error(error);
        }
    }

    async function handleLogin(event) {
        event.preventDefault();
        const payload = {
            email: event.target.elements.email.value,
            password: event.target.elements.password.value,
        };

        try {
            const res = await postMethodPayload('/api/v1/auth/public/login', payload);
            const result = await res.json();

            if (res.status === 417) {
                toast.warning(result.defaultMessage);
                return;
            }

            if (res.status < 300) {
                if (result.role !== 'ROLE_CUSTOMER') {
                    toast.warning('Chỉ hỗ trợ đăng nhập tài khoản khách hàng');
                    return;
                }

                // Hiển thị thông báo và chờ 1.5 giây
                toast.success('Đăng nhập thành công!', {
                    autoClose: 1500, // Thông báo hiển thị trong 1.5 giây
                });

                // Lưu token và lấy thông tin khách hàng
                localStorage.setItem('token', result.token);
                await getKhachHang(result.token);

                // Chờ 1.5 giây trước khi chuyển trang
                await new Promise((resolve) => setTimeout(resolve, 1500));
                window.location.href = '/';
            }
        } catch (error) {
            toast.error('Đã xảy ra lỗi khi đăng nhập');
            console.error(error);
        }
    }

    return (
        <div className="contentweb">
            <div className="container">
                <div className="dangnhapform">
                    <div className="divctlogin">
                        <p className="labeldangnhap">Đăng Nhập</p>
                        <form onSubmit={handleLogin} autoComplete="off">
                            <label className="lbform">Tên tài khoản</label>
                            <input required name="email" type="email" className="inputlogin" />
                            <label className="lbform">Mật khẩu</label>
                            <input required name="password" type="password" id="password" className="inputlogin" />
                            <button className="btndangnhap">ĐĂNG NHẬP</button>
                            <button
                                type="button"
                                onClick={() => (window.location.href = 'regis')}
                                className="btndangky"
                            >
                                ĐĂNG KÝ
                            </button>
                        </form>
                        <br />
                        <br />
                        <br />
                        <hr />
                        <p className="quenmk">
                            <a href="forgot">Quên mật khẩu ?</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default Login;