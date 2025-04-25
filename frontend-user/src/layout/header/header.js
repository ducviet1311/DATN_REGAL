import styles from "./header.scss";
import logo from "../../assest/images/logo-4.jpg";
import { useState, useEffect } from "react";
import { getMethod } from "../../services/request";
import cart from "../../assest/images/cart.png";
import user from "../../assest/images/user.png";

import AboutUs from "../../page/aboutus";
import React, { createContext, useContext } from "react";
export const HeaderContext = createContext();

var token = localStorage.getItem("token");
function Header() {
  var [numCart, setNumCart] = useState(0);

  useEffect(() => {
    const getNumCart = async () => {
      const response = await getMethod("/api/gio-hang/count");
      if (response.status > 300) {
        setNumCart(0);
        return;
      }
      var numc = await response.text();
      setNumCart(numc);
    };
    if (token != null) {
      getNumCart();
    }
  }, []);

  function logout() {
    localStorage.removeItem("token");
    localStorage.removeItem("user");
    window.location.replace("login");
  }

  var token = localStorage.getItem("token");
  var authen = (
      <div className="itemiconheader">
        <a href="login" className="txtheader">
          <span className="text-bg">Đăng nhập</span>
        </a>
      </div>
  );
  if (token != null) {
    authen = (
        <div className="itemiconheader">
        <span className="nav-item dropdown txtheader">
          <a
              className="nav-link txtheader"
              href="#"
              id="navbarDropdown"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
          >
            <div className="icon">
              <img src={user} alt="User icon"></img>
            </div>
          </a>
          <ul className="dropdown-menu" aria-labelledby="navbarDropdown">
            <li>
              <a className="dropdown-item" href="taikhoan">
                Tài khoản
              </a>
            </li>
            <li>
              <hr className="dropdown-divider" />
            </li>
            <li>
              <a className="dropdown-item" href="#" onClick={() => logout()}>
                Đăng xuất
              </a>
            </li>
          </ul>
        </span>
        </div>
    );
  }
  return (
      <div id="menumain">
        <div className="topbar-content text-center bg-black">
          <p className="mb-0 bg-dark text-white p-2" >Chào mừng bạn đến với website Regal! Chúng tôi hân hạnh được đồng hành cùng bạn.</p>
        </div>
        <div className="containercustom container">
          <nav className="navbar navbar-expand-lg">
            <div className="container-fluid">
              <a className="navbar-brand tagaheadersdt" href="/">
                <img src={logo} className="logoheader" alt="Logo" />
                <span className="brand-name">REGAL</span>
              </a>
              <button
                  className="navbar-toggler"
                  type="button"
                  data-bs-toggle="collapse"
                  data-bs-target="#navbarSupportedContent"
                  aria-controls="navbarSupportedContent"
                  aria-expanded="false"
                  aria-label="Toggle navigation"
              >
                <span className="navbar-toggler-icon"></span>
              </button>
              <div
                  className="collapse navbar-collapse justify-content-end"
                  id="navbarSupportedContent"
              >
                <div className="d-flex menu-header">
                  <div className="itemiconheader">
                    <a href="/" className="txtheader">
                      <span className="text-bg">Trang Chủ</span>
                    </a>
                  </div>
                  <div className="itemiconheader">
                    <a href="product" className="txtheader">
                      <span className="text-bg">Sản phẩm</span>
                    </a>
                  </div>
                  <div className="itemiconheader">
                    <a href="/vechungtoi" className="txtheader">
                      <span className="text-bg">Về Chúng Tôi</span>
                    </a>
                  </div>
                  <div className="itemiconheader">
                    <a href="lienhe" className="txtheader">
                      <span className="text-bg">Liên Hệ</span>
                    </a>
                  </div>

                  <form className="mb-3 d-flex" action="product" style={{ marginTop: "11px" }}>
                    <input
                        className="form-control me-2"
                        type="search"
                        name="search"
                        placeholder="⌕ Tìm kiếm sản phẩm"
                        aria-label="Search"
                    />
                    <button className="btn btn-light" type="submit">
                      🔍
                    </button>
                  </form>


                  <div className="itemiconheader">
                    <a href="giohang">
                      <div className="icon">
                        <img src={cart} alt="Cart icon"></img>
                        {numCart != 0 && (
                            <div className="quantitycartheader" id="totalcartheader">
                              {numCart}
                            </div>
                        )}
                      </div>
                    </a>
                  </div>
                  {authen}
                </div>
              </div>
            </div>
          </nav>
        </div>
      </div>
  );
}

export default Header;
