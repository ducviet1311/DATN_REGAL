import React from 'react';
import { toast } from 'react-toastify';
import { postMethodPayload } from '../../services/request';
import Swal from 'sweetalert2';

function QuenMatKhau() {
    async function handleQuenPass(event) {
        event.preventDefault();
        const res = await postMethodPayload('/api/v1/auth/public/quen-mat-khau?email=' + event.target.elements.email.value);
        var result = await res.json()
        if (res.status == 417) {
            toast.warning(result.defaultMessage);
        }
        if (res.status < 300) {
            Swal.fire({
                title: "Thông báo",
                text: "Mật khẩu đã được gửi về email của bạn!",
                preConfirm: () => {
                    window.location.href = 'login'
                }
            });
        }
    };

    return (
        <>
            {/*<style jsx>{`*/}
            {/*    .login-container {*/}
            {/*      display: flex;*/}
            {/*      justify-content: center;*/}
            {/*      align-items: center;*/}
            {/*      min-height: 100vh;*/}
            {/*      padding: 20px;*/}
            {/*    }*/}
            {/*    */}
            {/*    .login-card {*/}
            {/*      background: #ffffff;*/}
            {/*      border-radius: 10px;*/}
            {/*      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);*/}
            {/*      width: 100%;*/}
            {/*      max-width: 400px;*/}
            {/*      padding: 30px;*/}
            {/*      animation: fadeIn 0.5s ease-in-out;*/}
            {/*    }*/}
            {/*    */}
            {/*    .login-header {*/}
            {/*      text-align: center;*/}
            {/*      margin-bottom: 30px;*/}
            {/*    }*/}
            {/*    */}
            {/*    .login-header h2 {*/}
            {/*      color: #000000;*/}
            {/*      font-size: 24px;*/}
            {/*      font-weight: 700;*/}
            {/*    }*/}
            {/*    */}
            {/*    .login-form {*/}
            {/*      display: flex;*/}
            {/*      flex-direction: column;*/}
            {/*      gap: 20px;*/}
            {/*    }*/}
            {/*    */}
            {/*    .form-group {*/}
            {/*      position: relative;*/}
            {/*    }*/}
            {/*    */}
            {/*    .form-input {*/}
            {/*      width: 100%;*/}
            {/*      padding: 12px 15px;*/}
            {/*      border: 1px solid #ccc;*/}
            {/*      border-radius: 6px;*/}
            {/*      font-size: 14px;*/}
            {/*      background-color: #f5f5f5;*/}
            {/*      transition: all 0.3s ease;*/}
            {/*    }*/}
            {/*    */}
            {/*    .form-input:focus {*/}
            {/*      outline: none;*/}
            {/*      border-color: #e50914;*/}
            {/*      box-shadow: 0 0 0 2px rgba(229, 9, 20, 0.2);*/}
            {/*      background-color: white;*/}
            {/*    }*/}
            {/*    */}
            {/*    .login-button {*/}
            {/*      width: 100%;*/}
            {/*      padding: 12px;*/}
            {/*      background: linear-gradient(to right, #e50914, #000000);*/}
            {/*      color: white;*/}
            {/*      border: none;*/}
            {/*      border-radius: 6px;*/}
            {/*      font-size: 16px;*/}
            {/*      font-weight: 500;*/}
            {/*      cursor: pointer;*/}
            {/*      transition: opacity 0.3s ease;*/}
            {/*    }*/}
            {/*    */}
            {/*    .login-button:hover {*/}
            {/*      opacity: 0.9;*/}
            {/*    }*/}
            {/*    */}
            {/*    .forgot-password {*/}
            {/*      text-align: center;*/}
            {/*      margin-top: 10px;*/}
            {/*    }*/}
            {/*    */}
            {/*    .forgot-password a {*/}
            {/*      color: #666;*/}
            {/*      font-size: 13px;*/}
            {/*      text-decoration: none;*/}
            {/*      transition: color 0.3s ease;*/}
            {/*    }*/}
            {/*    */}
            {/*    .forgot-password a:hover {*/}
            {/*      color: #e50914;*/}
            {/*    }*/}
            {/*    */}
            {/*    @keyframes fadeIn {*/}
            {/*      from {*/}
            {/*        opacity: 0;*/}
            {/*        transform: translateY(20px);*/}
            {/*      }*/}
            {/*      to {*/}
            {/*        opacity: 1;*/}
            {/*        transform: translateY(0);*/}
            {/*      }*/}
            {/*    }*/}
            {/*`}</style>*/}

            <div className="login-container">
                <div className="login-card">
                    <div className="login-header">
                        <h2>Quên Mật Khẩu</h2>
                        <p style={{ fontSize: '14px', color: '#7f8c8d', marginTop: '8px' }}>
                            Nhập email để lấy lại mật khẩu
                        </p>
                    </div>
                    <form onSubmit={handleQuenPass} className="login-form">
                        <div className="form-group">
                            <input
                                name='email'
                                type="email"
                                placeholder="Email đăng ký"
                                required
                                className="form-input"
                            />
                        </div>
                        <div className="form-actions">
                            <button type="submit" className="login-button">Xác nhận</button>
                        </div>
                        <div className="forgot-password">
                            <a href="login">Quay lại đăng nhập</a>
                        </div>
                    </form>
                </div>
            </div>
        </>
    );
}

export default QuenMatKhau;
