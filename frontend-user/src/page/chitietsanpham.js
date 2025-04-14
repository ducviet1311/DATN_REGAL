import { useState, useEffect } from "react";
import { Swiper, SwiperSlide } from "swiper/react";
import "swiper/css";
import "swiper/css/navigation";
import "swiper/css/pagination";
import { Navigation, Pagination } from "swiper/modules";
import {
  getMethod,
  uploadSingleFile,
  uploadMultipleFile,
  postMethodPayload,
} from "../services/request";
import { formatMoney } from "../services/money";
import { toast } from "react-toastify";
import { colors } from "@mui/material";

function ChiTietSanPham() {
  const [product, setProduct] = useState(null);
  const [selectChiTiet, setSelectChiTiet] = useState(null);
  const [indexmausac, setIndexmausac] = useState(-1);
  const [indexkichthuoc, setindexkichthuoc] = useState(-1);
  const [sanPhamChiTiet, setSanPhamChiTiet] = useState([]);
  const [kichthuoc, setKichthuoc] = useState([]);
  const [mausac, setMauSac] = useState([]);
  const [anhs, setAnhs] = useState([]);
  const [sanPhamLienQuan, setsanPhamLienQuan] = useState([]);
  const [giaTien, setGiaTien] = useState("");
  const [productAnh, setProductAnh] = useState("");
  const [quantity, setQuantity] = useState(1);

  useEffect(() => {
    getProduct();
    getChiTietSanPham();
    getProductLienQuan();
  }, []);

  const getProduct = async () => {
    var uls = new URL(document.URL);
    var id = uls.searchParams.get("id");
    if (id != null) {
      var response = await getMethod("/api/san-pham/" + id);
      var result = await response.json();

      setProduct(result);
    }
  };

  const getProductLienQuan = async () => {
    var uls = new URL(document.URL);
    var id = uls.searchParams.get("id");
    if (id != null) {
      var response = await getMethod(
          "/api/san-pham/san-pham-lien-quan?id=" + id
      );
      var result = await response.json();
      var responseLq = await getMethod(
          "/api/san-pham-chi-tiet/findBySanPham?sanpham=" + id
      );
      var resultLq = await responseLq.json();
      if (resultLq.length > 0) {
        const minGiaTien = Math.min(...resultLq.map((item) => item.giaTien));
        result = result.map((item) => ({
          ...item,
          giaBan: minGiaTien,
        }));
      }
      setsanPhamLienQuan(result);
    }
  };

  async function getChiTietSanPham() {
    var uls = new URL(document.URL);
    var id = uls.searchParams.get("id");
    var response = await getMethod(
        "/api/san-pham-chi-tiet/findBySanPham?sanpham=" + id
    );
    var result = await response.json();
    setSanPhamChiTiet(result);
    if (result.length > 0) {
      const minGiaTien = Math.min(...result.map((item) => item.giaTien));
      setGiaTien(minGiaTien);
    }

    var listmausac = [];
    var listAnh = [];
    for (var i = 0; i < result.length; i++) {
      var checked = false;
      for (var j = 0; j < listmausac.length; j++) {
        if (listmausac[j].mauSac.id == result[i].mauSac.id) {
          checked = true;
        }
      }
      if (checked == false) {
        listmausac.push(result[i]);
      }
      listAnh = listAnh.concat(result[i].anhs);
    }
    setMauSac(listmausac);
    setAnhs(listAnh);
    if (listAnh.length > 0) {
      setProductAnh(listAnh[0].tenAnh);
    }
  }

  function loadKichThuoc(item, index) {
    setGiaTien(item.giaTien);
    setIndexmausac(index);
    var listkichthuoc = [];
    for (var i = 0; i < sanPhamChiTiet.length; i++) {
      if (sanPhamChiTiet[i].mauSac.id == item.mauSac.id) {
        listkichthuoc.push(sanPhamChiTiet[i]);
      }
    }
    setKichthuoc(listkichthuoc);
    setindexkichthuoc(-1);

    setSelectChiTiet(null);
    console.log("ksdf", listkichthuoc);
  }

  function setChiTietSpChon(item, index) {
    setindexkichthuoc(index);
    setSelectChiTiet(item);
  }

  async function addToCart() {
    var sl = document.getElementById("soluongaddgiohang").value;
    if (sl > selectChiTiet.soLuong) {
      toast.warning(
          "Số lượng thêm không được vượt quá " + selectChiTiet.soLuong
      );
      return;
    }
    console.log("id", selectChiTiet.id);
    const res = await postMethodPayload(
        `/api/gio-hang/add?idChiTietSanPham=${selectChiTiet.id}&soLuong=${sl}`
    );
    if (res.status < 300) {
      toast.success("Đã thêm sản phẩm vào giỏ gàng!");
    }
    if (res.status == 417) {
      var result = await res.json();
      toast.error(result.defaultMessage);
    }
  }

  function upDownQuantity(value) {
    var sl = document.getElementById("soluongaddgiohang").value;
    sl = Number(sl) + Number(value);
    if (sl < 1) {
      toast.warning("Số lượng nhỏ nhất là 1");
      return;
    }
    document.getElementById("soluongaddgiohang").value = sl;
  }
  function checkSoLuong() {
    var sl = document.getElementById("soluongaddgiohang").value;
    if (isNumeric(sl) == false) {
      toast.warning("Số không được nhập kiểu ký tự");
      document.getElementById("soluongaddgiohang").value = 1;
      return;
    }
  }

  function isNumeric(value) {
    return !isNaN(value) && !isNaN(parseFloat(value));
  }

  return (
      <div className="maincontentweb">
        <div className="containercustom container">
          <div className="container-fluid">
            <div className="bgwhite">
              <div className="row">
                <div className="col-sm-12">
                  <div className="row">
                    <div className="col-sm-7">
                      {/* Phần carousel ảnh (giữ nguyên) */}
                      <div id="carouselExampleControls" className="carousel slide bannerindex" data-bs-ride="carousel">
                        <div className="carousel-inner carousel-chitiet">
                          {/* Ảnh đầu tiên từ productAnh, có class 'active' */}
                          <div className="carousel-item active">
                            <img src={productAnh} className="d-block w-100" alt="..."/>
                          </div>

                          {/* Các ảnh khác từ anhs.map() */}
                          {anhs
                              .filter((item) => item.tenAnh !== productAnh) // Lọc tránh ảnh trùng
                              .map((item, index) => (
                                  <div className="carousel-item" key={index}>
                                    <img src={item.tenAnh} className="d-block w-100" alt="..."/>
                                  </div>
                              ))}
                        </div>

                        <button
                            className="carousel-control-prev"
                            type="button"
                            data-bs-target="#carouselExampleControls"
                            data-bs-slide="prev"
                        >
                          <span className="carousel-control-prev-icon" aria-hidden="true"></span>
                        </button>

                        <button
                            className="carousel-control-next"
                            type="button"
                            data-bs-target="#carouselExampleControls"
                            data-bs-slide="next"
                        >
                          <span className="carousel-control-next-icon" aria-hidden="true"></span>
                        </button>
                      </div>

                      {/* Di chuyển phần thông tin sản phẩm xuống đây */}
                      <div className="cauhinhchitiet mt-4">
                        <p className="tieudesanpham">Thông tin sản phẩm</p>
                        <div id="thongtincauhinh" className="thongtincauhinhdv">
                    <span className="congnghect">
                      Mã sản phẩm: <span className="chitietcongnghe">{product?.maSanPham}</span>
                    </span>
                          <span className="congnghect">
                      Thương hiệu: <span className="chitietcongnghe">{product?.thuongHieu?.tenThuongHieu}</span>
                    </span>
                          <span className="congnghect">
                      Chất liệu: <span className="chitietcongnghe">{product?.chatLieu?.tenChatLieu}</span>
                    </span>
                          <span className="congnghect">
                      Đế giày: <span className="chitietcongnghe">{product?.deGiay?.tenDeGiay}</span>
                    </span>
                        </div>
                      </div>
                    </div>

                    <div className="col-sm-5">
                      <h4 className="pronamedetail" id="detailnamepro">
                        {product?.tenSanPham}
                      </h4>
                      <div>
                        <strong
                            id="pricedetail"
                            style={{
                              color: "red",
                              fontSize: "24px",
                              fontWeight: "bold",
                              display: "block",
                              margin: "10px 0"
                            }}
                        >
                          {formatMoney(giaTien)}
                        </strong>

                        <p style={{
                          color: "red",
                          margin: "8px 0",
                          fontSize: "16px",
                          fontWeight: "bold"
                        }}>
                          <i className="fa fa-check" aria-hidden="true" style={{marginRight: "8px"}}></i>
                          Tặng gói bảo hành Vip: Bảo hành keo trọn đời, da 1 năm (vẫn hỗ trợ kể cả do lỗi người dùng)
                        </p>

                        <p style={{
                          color: "red",
                          margin: "8px 0",
                          fontSize: "16px",
                          fontWeight: "bold"
                        }}>
                          <i className="fa fa-check" aria-hidden="true" style={{marginRight: "8px"}}></i>
                          Hỗ trợ đổi size tại nhà
                        </p>
                      </div>

                      {/* Phần chọn màu sắc và kích thước (giữ nguyên) */}
                      <span id="storagedetaillable" className="storagedetaillable">
                  Lựa chọn màu sắc
                </span>
                      <div className="listsize row" id="listcolor">
                        {mausac.map((item, index) => {
                          const divClass = `${"colorcdiv"} ${index === indexmausac ? "activecolor" : ""}`;
                          return (
                              <div className="col-lg-2 col-md-3 col-sm-6 col-6 mb-3 color-item" key={index}>
                                <div
                                    className={divClass}
                                    onClick={() => loadKichThuoc(item, index)}
                                >
                                  <span className="storagedetail">{item.mauSac.tenMauSac}</span>
                                  <br/>
                                </div>
                              </div>
                          );
                        })}
                      </div>

                      {kichthuoc.length != 0 && (
                          <span id="storagedetaillable" className={`storagedetaillable`} style={{marginTop:"-25px"}}>
                    Lựa chọn kích thước
                  </span>
                      )}
                      <div className="listsize" id="listcolor" style={{position: "relative"}}>
                        {kichthuoc.map((item, index) => {
                          const divClass = `${item.soLuong === 0 ? "colorcdiv hetsp" : "colorcdiv"} ${index === indexkichthuoc ? "activecolor" : ""}`;
                          return (
                              <>
                                <div>
                                  <div className="col-lg-3 col-md-3 col-sm-6 col-6" key={index}>
                                    <div
                                        className={divClass}
                                        onClick={() => {
                                          setGiaTien(item?.giaTien);
                                          if (item.soLuong > 0) {
                                            setChiTietSpChon(item, index);
                                          }
                                        }}
                                    >
                                      <span className="storagedetail">{item.kichCo.tenKichCo}</span>
                                      <br/>
                                    </div>
                                  </div>
                                </div>
                                {index === indexkichthuoc && (
                                    <div className="mt-2 sanphamcon" style={{fontSize: "12px"}}>
                                      {item.soLuong > 0 ? (
                                          <>Còn: <span style={{color: "green", fontWeight: "800"}}>{item.soLuong}</span> sản phẩm</>
                                      ) : (
                                          <span style={{color: "red", fontWeight: "800"}}>Hết hàng</span>
                                      )}
                                    </div>
                                )}
                              </>
                          );
                        })}
                      </div>

                      {/* Nhóm phần chọn số lượng và nút thêm giỏ hàng lại gần nhau */}
                      <div style={{marginTop: '20px'}}>
                  <span id="storagedetaillable" className="storagedetaillable">
                    Lựa chọn số lượng
                  </span>
                        <div className="sl-container">
                          <button onClick={() => upDownQuantity(-1)} className="cartbtn"> -</button>
                          <input onKeyUp={checkSoLuong} defaultValue={1} id="soluongaddgiohang"
                                 className="inputslcart"/>
                          <button onClick={() => upDownQuantity(1)} className="cartbtn"> +</button>
                        </div>

                        <button
                            disabled={selectChiTiet == null}
                            onClick={() => addToCart()}
                            className={selectChiTiet != null ? "btnthemgiohang mt-4" : "btnthemgiohang disablethemgh mt-4"}
                            style={{width: '50%'}}
                        >
                          <i className="fa fa-shopping-bag"></i> Thêm giỏ hàng
                        </button>
                      </div>
                    </div>
                  </div>

                  {/* Phần sản phẩm cùng thương hiệu (giữ nguyên) */}
                  <div className="sanphamtuongtudetail">
                    <p className="tieudesanpham">Sản phẩm cùng thương hiệu</p>
                    <div id="listsanphamlienquan" className="row">
                      {sanPhamLienQuan.map((item) => {
                        return (
                            <div className="col-lg-3 col-md-12 col-sm-12 col-12" key={item.id}>
                              <div className="singleproduct">
                                <a href={"chitietsanpham?id=" + item.id}>
                                  <div className="productimg-container">
                                    <img
                                        src={item.sanPhamChiTiets[0]?.anhs[0]?.tenAnh || ""}
                                        className="productimg"
                                    />
                                  </div>
                                </a>
                                <div className="contentsinglepro">
                                  <p className="productname">
                                    <a
                                        className="productname"
                                        href={"chitietsanpham?id=" + item.id}
                                    >
                                      {item.tenSanPham}
                                    </a>
                                  </p>
                                </div>
                              </div>
                            </div>
                        );
                      })}
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

  );
}

export default ChiTietSanPham;
