import layoutLogin from '../layout/loginlayout/login'

//public
import LoginPage from "../page/login";
import Home from "../page/home";
import ChiTietSanPham from "../page/chitietsanpham";
import GioHang from "../page/giohang";
import TaiKhoan from "../page/taikhoan";
import Payment from "../page/payment";
import Product from "../page/product";
import DangKy from "../page/dangky";
import QuenMatKhau from "../page/quenmatkhau";
import AboutUs from "../page/aboutus";
import LienHe from "../page/lienhe";

import { components } from 'react-select';

const publicRoutes = [
    {path: "/login", component: LoginPage, layout: layoutLogin },
    {path: "/", component: Home},
    {path: "/chitietsanpham", component: ChiTietSanPham  },
    {path: "/giohang", component: GioHang, authen:true  },
    {path: "/taikhoan", component: TaiKhoan, authen:true  },
    {path: "/payment", component: Payment, authen:true  },
    {path: "/product", component: Product },
    {path: "/regis", component: DangKy },
    {path: "/forgot", component: QuenMatKhau },
    {path: "/lienhe", component: LienHe},  
    {
        path: "/vechungtoi",
        component: AboutUs,
        layout: null, // hoặc DefaultLayout
        authen: false, // Nếu không cần kiểm tra xác thực
      },
      
];


export {publicRoutes};
