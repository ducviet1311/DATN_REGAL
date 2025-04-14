import { useState, useEffect } from "react";
import star from "../assest/images/icon_star.png";
import banner from "../assest/images/logo-5.jpg";
import banner1 from "../assest/images/logo-6.jpg";
import banner2 from "../assest/images/logo-7.jpg";
import bannerNike from "../assest/images/banerNike.jpg";
import bannerMizuno from "../assest/images/banerMizino.jpg";
import bannerAkka from "../assest/images/bannerAkka.jpg";
import bannerPuma from "../assest/images/bannerPuma.jpg";
import bannerAdidas from "../assest/images/bannerAdidas.jpg";

import newitem from "../assest/images/newitem.jpg";
import rightarrow from "../assest/images/right-arrow.png";
import arrow from "../assest/images/arrow.png";

import ReactPaginate from "react-paginate";
import { getMethod } from "../services/request";
import { formatMoney } from "../services/money";
import { useNavigate } from "react-router-dom";

var size = 12;
var url = "";
function Home() {
  const navigate = useNavigate();
  const [thuongHieu, setThuongHieu] = useState([]);
  const [sanPhamMoi, setSanPhamMoi] = useState([]);
  const [pageCount, setpageCount] = useState(0);
  const [topSanPhamBanChay, setTopSanPhamBanChay] = useState([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const [thuongHieuRes, sanPhamMoiRes, banChayRes] = await Promise.all([
          getMethod("/api/thuong-hieu"),
          getMethod("/api/san-pham/public/all?&size=" + size + "&sort=id,desc&page=" + 0),
          getMethod("/api/san-pham/ban-chay")
        ]);

        setThuongHieu(await thuongHieuRes.json());

        const sanPhamMoiData = await sanPhamMoiRes.json();
        setSanPhamMoi(sanPhamMoiData.content);
        setpageCount(sanPhamMoiData.totalPages);

        setTopSanPhamBanChay(await banChayRes.json());
      } catch (error) {
        console.error("Error fetching data:", error);
      }
    };
    fetchData();
  }, []);

  const getSanPham = async (page = 0) => {
    try {
      const response = await getMethod(`/api/san-pham/public/all?size=${size}&sort=id,desc&page=${page}`);
      const result = await response.json();
      setSanPhamMoi(result.content);
      setpageCount(result.totalPages);
    } catch (error) {
      console.error("Error fetching products:", error);
    }
  };

  const handlePageClick = async (data) => {
    const selectedPage = data.selected;
    await getSanPham(selectedPage);
  };

  const handleBrandClick = (brandName) => {
    navigate(`/product?search=${brandName.toLowerCase()}`);
  };

  const handleProductClick = (productId) => {
    navigate(`/chitietsanpham?id=${productId}`);
  };

  const renderProductCards = (products) => {
    return products.map((item) => {
      var linkanh = "";
      var giaban = 0;
      var dotGiamGia = null;

      if (item.sanPhamChiTiets.length > 0) {
        giaban = item.sanPhamChiTiets[0].giaTien;
        if (item.sanPhamChiTiets[0].dotGiamGia != null) {
          dotGiamGia = item.sanPhamChiTiets[0].dotGiamGia;
        }
      }

      for (var i = 0; i < item.sanPhamChiTiets.length; i++) {
        if (
            item.sanPhamChiTiets[i].giaTien < giaban &&
            item.sanPhamChiTiets[i].giaTien != null &&
            item.sanPhamChiTiets[i].giaTien > 0
        ) {
          giaban = item.sanPhamChiTiets[i].giaTien;
        }
        if (
            item.sanPhamChiTiets[i].anhs != null &&
            item.sanPhamChiTiets[i].anhs.length > 0
        ) {
          linkanh = item.sanPhamChiTiets[i].anhs[0].tenAnh;
          break;
        }
      }

      return (
          <div className="col-lg-20p col-md-3 col-sm-6 col-6 d-flex" key={item.id}>
            <div className="singleproduct w-100" onClick={() => handleProductClick(item.id)} style={{ cursor: 'pointer' }}>
              <div className="productimg-container">
                <img src={linkanh || 'default-image.jpg'} className="productimg" alt={item.tenSanPham} />
                {item.soLuongDaBan > 0 && (
                    <div className="sold-badge">Đã bán: {item.soLuongDaBan}</div>
                )}
              </div>
              <div className="contentsinglepro">
                <p className="productname">
                <span className="productname">
                  {item.tenSanPham}
                </span>
                </p>
                <div className="price-view">
                  <div
                      style={{
                        display: "flex",
                        gap: "30px",
                        justifyContent: "center",
                        alignItems: "center",
                      }}
                      className="priceproduct"
                  >
                    <strong className="newprice">
                      {formatMoney(giaban)}
                    </strong>
                    {dotGiamGia ? (
                        <strong className="oldprice">
                          {formatMoney(giaban + dotGiamGia.giaTriGiam)}
                        </strong>
                    ) : null}
                  </div>
                </div>
              </div>
            </div>
          </div>
      );
    });
  };

  const renderProductCardsBanChay = (products) => {
    return products.map((product) => {
      const { idSanPham, tenSanPham, tenAnh, giaBan } = product;

      return (
          <div className="col-lg-20p col-md-3 col-sm-6 col-6 d-flex" key={idSanPham}>
            <div
                className="singleproduct w-100"
                onClick={() => handleProductClick(idSanPham)}
                style={{ cursor: "pointer" }}
            >
              <div className="productimg-container">
                <img
                    src={tenAnh || 'default-image.jpg'}
                    className="productimg"
                    alt={tenSanPham}
                />
                {/* Nếu bạn muốn hiển thị số lượng đã bán, bạn cần thêm trường này vào DTO */}
                {/* {soLuongDaBan > 0 && (
              <div className="sold-badge">Đã bán: {soLuongDaBan}</div>
            )} */}
              </div>
              <div className="contentsinglepro">
                <p className="productname">
                <span className="productname">
                  {tenSanPham}
                </span>
                </p>
                <div className="price-view">
                  <div className="priceproduct" style={{ display: "flex", gap: "30px", justifyContent: "center" }}>
                    <strong className="newprice">{formatMoney(giaBan)}</strong>
                    {/* Nếu muốn hiển thị giá gốc khi có giảm giá, bạn cần thêm trường này vào DTO */}
                    {/* {dotGiamGia && (
                  <strong className="oldprice">{formatMoney(giaBan + dotGiamGia.giaTriGiam)}</strong>
                )} */}
                  </div>
                </div>
              </div>
            </div>
          </div>
      );
    });
  };

  return (
      <div className="maincontentweb ">
        <div className="containercustom container-fluid">
          <div className="container-fluid">
            <div className="row">
              <div className="col-sm-12">
                <div
                    id="carouselExampleControls"
                    className="carousel slide bannerindex"
                    data-bs-ride="carousel"
                    data-bs-interval="2000"
                    style={{
                      marginLeft: '-1.5rem',
                      marginRight: '-1.5rem',
                      marginTop: '-1.5rem',
                      width: 'calc(100% + 3rem)'
                    }}
                >
                  <div className="carousel-inner my-2">
                    <div className="carousel-item active">
                      <img src={banner} className="d-block w-100" alt="..." />
                    </div>
                    <div className="carousel-item">
                      <img src={banner1} className="d-block w-100" alt="..." />
                    </div>
                    <div className="carousel-item">
                      <img src={banner2} className="d-block w-100" alt="..." />
                    </div>
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
              </div>
            </div>

            {/* New Products Section */}
            <div className="sectionmain cat_item_store cat_special container">
              <div className="cat-titles">
                <h5 className="titlespmoi">
                  Sản phẩm mới <img src={newitem} alt="icon" />
                </h5>
              </div>
              <hr />
              <div id="sanphammoinhat" className="listproduct row">
                {renderProductCards(sanPhamMoi)}
              </div>

              <br />
              <br />
              <ReactPaginate
                  marginPagesDisplayed={2}
                  pageCount={pageCount}
                  onPageChange={handlePageClick}
                  containerClassName={"pagination"}
                  pageClassName={"page-item"}
                  pageLinkClassName={"page-link"}
                  previousClassName="page-item"
                  previousLinkClassName="page-link"
                  nextClassName="page-item"
                  nextLinkClassName="page-link"
                  breakClassName="page-item"
                  breakLinkClassName="page-link"
                  previousLabel={<img src={arrow} alt="previous" />}
                  nextLabel={<img src={rightarrow} alt="next" />}
                  activeClassName="active"
              />
            </div>

            {/* Brands Section */}
            <div className="container">
              <h4 className="text-center text-danger fw-bold py-5">
                Hãng Giày Nổi Bật
                <i className="fas fa-shoe-prints text-primary ms-2"></i>
              </h4>

              <div className="row">
                <div className="col-sm-6 text-white position-relative"
                     style={{ cursor: 'pointer' }}
                     onClick={() => handleBrandClick('ADIDAS')}>
                  <img src={bannerAdidas} className="d-block w-100 rounded-3 hover-scale" alt="ADIDAS" />
                  <div className="position-absolute bottom-0 start-0 text-white p-2 mb-3 ms-3 fs-3 rounded">
                    <strong>ADIDAS</strong>
                  </div>
                </div>

                <div className="col-sm-6 text-white position-relative"
                     style={{ cursor: 'pointer' }}
                     onClick={() => handleBrandClick('NIKE')}>
                  <img src={bannerNike} className="d-block w-100 rounded-3 hover-scale" alt="NIKE" />
                  <div className="position-absolute bottom-0 start-0 text-white p-2 mb-3 ms-3 fs-3 rounded">
                    <strong>NIKE</strong>
                  </div>
                </div>
              </div>

              <div className="row my-5">
                <div className="col-sm-4 text-white position-relative"
                     style={{ cursor: 'pointer' }}
                     onClick={() => handleBrandClick('MIZUNO')}>
                  <img src={bannerMizuno} className="d-block w-100 rounded-3 hover-scale" alt="MIZUNO" />
                  <div className="position-absolute bottom-0 start-0 text-white p-2 mb-3 ms-3 fs-3 rounded">
                    <strong>MIZUNO</strong>
                  </div>
                </div>

                <div className="col-sm-4 text-white position-relative"
                     style={{ cursor: 'pointer' }}
                     onClick={() => handleBrandClick('PUMA')}>
                  <img src={bannerPuma} className="d-block w-100 rounded-3 hover-scale" alt="PUMA" />
                  <div className="position-absolute bottom-0 start-0 text-white p-2 mb-3 ms-3 fs-3 rounded">
                    <strong>PUMA</strong>
                  </div>
                </div>

                <div className="col-sm-4 text-white position-relative"
                     style={{ cursor: 'pointer' }}
                     onClick={() => handleBrandClick('AKKA')}>
                  <img src={bannerAkka} className="d-block w-100 rounded-3 hover-scale" alt="AKKA" />
                  <div className="position-absolute bottom-0 start-0 text-white p-2 mb-3 ms-3 fs-3 rounded">
                    <strong>AKKA</strong>
                  </div>
                </div>
              </div>
            </div>

            {/* Best Selling Products Section */}
            <div className="sectionmain cat_item_store cat_special container">
              <div className="cat-titles">
                <h5 className="titlespmoi">
                  Sản phẩm bán chạy <img src={star} alt="icon" />
                </h5>
              </div>
              <hr />
              <div id="banchay" className="listproduct row">
                {renderProductCardsBanChay(topSanPhamBanChay)}
              </div>
            </div>
          </div>
        </div>
      </div>
  );
}

export default Home;