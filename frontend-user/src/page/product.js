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
import "bootstrap/dist/css/bootstrap.min.css";
import Slider from "@mui/material/Slider";
import Typography from "@mui/material/Typography";
import Select from "react-select";
import ReactPaginate from "react-paginate";

var size = 8;
var url = "";
function Product() {
  const [thuongHieu, setThuongHieu] = useState([]);
  const [deGiay, setDeGiay] = useState([]);
  const [chatlieu, setChatLieu] = useState([]);
  const [price, setPrice] = useState([100000, 10000000]);
  const [selectThuongHieu, setselectThuongHieu] = useState([]);
  const [selectDeGiay, setselectDeGiay] = useState([]);
  const [selectChatLieu, setselectChatLieu] = useState([]);
  const [pageCount, setpageCount] = useState(0);
  const [sanPham, setSanPham] = useState([]);
  const [payload, setPayload] = useState(null);

  useEffect(() => {
    const getSelect = async () => {
      var response = await getMethod("/api/thuong-hieu");
      var list = await response.json();
      setThuongHieu(list);

      var response = await getMethod("/api/chat-lieu");
      var list = await response.json();
      setChatLieu(list);

      var response = await getMethod("/api/de-giay");
      var list = await response.json();
      setDeGiay(list);
    };
    getSelect();
    getInitProduct();
  }, []);
  const handleChange = (event, newValue) => {
    setPrice(newValue);
  };

  async function getInitProduct() {
    var uls = new URL(document.URL);
    var thuonghieu = uls.searchParams.get("thuonghieu");
    var search = uls.searchParams.get("search");
    var urls = "/api/san-pham/public";
    if (thuonghieu == null && search == null) {
      filterProduct();
      return;
    }
    if (thuonghieu != null) {
      urls +=
          "/tim-theo-thuong-hieu?thuongHieu=" +
          thuonghieu +
          "&size=" +
          size +
          "&sort=id,desc" +
          "&page=";
    }
    if (search != null) {
      urls +=
          "/tim-theo-ten?search=" +
          search +
          "&size=" +
          size +
          "&sort=id,desc" +
          "&page=";
    }
    var response = await getMethod(urls + 0);
    var result = await response.json();
    setSanPham(result.content);
    setpageCount(result.totalPages);
    url = urls;
  }

  async function filterProduct() {
    var arrThuongHieu = [];
    var arrDeGiay = [];
    var arrChatLieu = [];
    for (var i = 0; i < selectThuongHieu.length; i++) {
      arrThuongHieu.push(selectThuongHieu[i].id);
    }
    for (var i = 0; i < selectDeGiay.length; i++) {
      arrDeGiay.push(selectDeGiay[i].id);
    }
    for (var i = 0; i < selectChatLieu.length; i++) {
      arrChatLieu.push(selectChatLieu[i].id);
    }
    var obj = {
      idThuongHieu: arrThuongHieu,
      idDeGiay: arrDeGiay,
      idChatLieu: arrChatLieu,
      small: price[0],
      large: price[1],
    };

    setPayload(obj);
    var response = await postMethodPayload(
        "/api/san-pham/public/loc-san-pham?size=" +
        size +
        "&sort=id,desc&page=" +
        0,
        obj
    );
    var result = await response.json();

    setSanPham(result.content);
    setpageCount(result.totalPages);
    url =
        "/api/san-pham/public/loc-san-pham?size=" + size + "&sort=id,desc&page=";
  }

  const handlePageClick = async (data) => {
    var currentPage = data.selected;
    if (payload == null) {
      var response = await getMethod(url + currentPage);
      var result = await response.json();
      setSanPham(result.content);
      setpageCount(result.totalPages);
    } else {
      var response = await postMethodPayload(url + currentPage, payload);
      var result = await response.json();
      setSanPham(result.content);
      setpageCount(result.totalPages);
    }
  };

  return (
      <div className="maincontentweb">
        <div className="containercustom container">
          <div className="container-fluid my-3">
            <div className="row">
              <div className="col-lg-3 col-md-4 col-sm-12 p-10">
                <div className="headerloc">
                  <span>Bộ lọc sản phẩm</span>
                </div>
                <div>
                  <Typography variant="h6">Chọn khoảng giá</Typography>
                  <Slider
                      value={price}
                      onChange={handleChange}
                      valueLabelDisplay="auto"
                      min={100000}
                      max={10000000}
                  />
                  <Typography className="text-danger fw-bold">
                    Khoảng giá: {formatMoney(price[0])} - {formatMoney(price[1])}
                  </Typography>
                </div>
                <br />
                <h5>Chọn thương hiệu</h5>
                <Select
                    className="select-container selectheader"
                    options={thuongHieu}
                    onChange={setselectThuongHieu}
                    value={selectThuongHieu}
                    getOptionLabel={(option) => option.tenThuongHieu}
                    getOptionValue={(option) => option.id}
                    isMulti
                    placeholder="Chọn thương hiệu"
                />
                <br />
                <h5>Chọn chất liệu</h5>
                <Select
                    className="select-container selectheader"
                    options={chatlieu}
                    onChange={setselectChatLieu}
                    value={selectChatLieu}
                    getOptionLabel={(option) => option.tenChatLieu}
                    getOptionValue={(option) => option.id}
                    isMulti
                    placeholder="Chọn chất liệu"
                />
                <br />
                <h5>Chọn loại đế giày</h5>
                <Select
                    className="select-container selectheader"
                    options={deGiay}
                    onChange={setselectDeGiay}
                    value={selectDeGiay}
                    getOptionLabel={(option) => option.tenDeGiay}
                    getOptionValue={(option) => option.id}
                    isMulti
                    placeholder="Chọn loại đế giày"
                />
                <br />
                <button
                    style={{
                      backgroundColor: "rgb(236, 221, 198)",
                      color: "#212529",
                      borderColor: "rgb(236, 221, 198)",
                    }}
                    onClick={() => filterProduct()}
                    className="form-control btn btn-success"
                >
                  Tìm kiếm sản phẩm
                </button>
                <br />
                <br />
                <br />
              </div>
              <div className="col-lg-9 col-md-8 col-sm-12">
                <div className="row">
                  {sanPham.map((item) => (
                      <div className="col-lg-3 col-md-4 col-sm-6 col-6 d-flex flex-column align-items-center" key={item.id}>
                        <div
                            style={{
                              border: "1px solid #eee",
                              borderRadius: "10px",
                              padding: "10px",
                              marginBottom: "20px",
                              textAlign: "center",
                              backgroundColor: "#fff",
                              display: "flex",
                              flexDirection: "column",
                              height: "100%",  // Ensures the container takes up full height for consistent sizing
                            }}
                        >
                          <a href={`chitietsanpham?id=${item.id}`}>
                            <div>
                              <img
                                  src={item?.sanPhamChiTiets[0]?.anhs[0]?.tenAnh}
                                  alt={item.tenSanPham}
                                  style={{
                                    width: "100%",
                                    height: "200px",
                                    objectFit: "cover",
                                    borderRadius: "10px",
                                  }}
                              />
                            </div>
                          </a>
                          <div style={{ marginTop: "10px", flexGrow: 1 }}>
                            <p style={{ fontWeight: "500", fontSize: "14px", margin: "5px 0" }}>
                              <a
                                  href={`chitietsanpham?id=${item.id}`}
                                  style={{ textDecoration: "none", color: "#333" }}
                              >
                                {item.tenSanPham}
                              </a>
                            </p>
                            <strong style={{ color: "#d0021b", fontSize: "16px" }}>
                              {formatMoney(item.sanPhamChiTiets[0].giaTien)}
                            </strong>
                          </div>
                        </div>
                      </div>
                  ))}
                </div>


                <br />
                <ReactPaginate
                    marginPagesDisplayed={2}
                    pageCount={pageCount}
                    onPageChange={handlePageClick}
                    containerClassName="pagination d-flex justify-content-center mx-auto"  // Added d-flex, justify-content-center, mx-auto
                    pageClassName="page-item"
                    pageLinkClassName="page-link"
                    previousClassName="page-item"
                    previousLinkClassName="page-link"
                    nextClassName="page-item"
                    nextLinkClassName="page-link"
                    breakClassName="page-item"
                    breakLinkClassName="page-link"
                    previousLabel="Trang trước"
                    nextLabel="Trang sau"
                    activeClassName="active"
                />

              </div>

            </div>
          </div>
        </div>
      </div>
  );
}

export default Product;