import {useState, useEffect} from 'react'
import {toast} from 'react-toastify';
import {getMethod, uploadSingleFile, uploadMultipleFile, postMethodPayload} from '../../services/request';
import Swal from 'sweetalert2';
import Select from 'react-select';
import {Editor} from '@tinymce/tinymce-react';
import React, {useRef} from 'react';
import {forEach} from "react-bootstrap/ElementChildren";


const AdminAddDotGiamGia = () => {
  const [item, setItem] = useState(null);
  const [products, setProducts] = useState([]);
  const [productSelect, setproductSelect] = useState([]);
  const [label, setLabel] = useState("Thêm đợt giảm giá");
  useEffect(() => {
    const getPhieuGiamGia = async () => {
      var uls = new URL(document.URL)
      var id = uls.searchParams.get("id");
      if (id != null) {
        setLabel("Cập nhật đợt giảm giá")
        var response = await getMethod('/api/phieu-giam-gia/' + id);
        var result = await response.json();
        setItem(result)
      }
    };
    getPhieuGiamGia();
    const getProducts = async () => {
      var response = await getMethod('/api/san-pham');
      var result = await response.json();
      setProducts(result)
    };
    getProducts();
    console.log((products));
  }, []);


  async function handleAddPhieuGG(event) {
    event.preventDefault();
    var user = JSON.parse(localStorage.getItem("user"))
    var giaTriGiam = event.target.elements.giatrigiam.value;

    var arr = [];
    for (var i = 0; i < productSelect.length; i++) {
      arr.push(productSelect[i].id)
    }
    if (arr.length == 0) {
      toast.error("Hãy chọn ít nhất 1 sản phẩm")
      return;
    } else {
      if (isNaN(giaTriGiam) || !Number.isInteger(Number(giaTriGiam)) || giaTriGiam <= 0 || giaTriGiam >= 10000000) {
        toast.error("Giá trị giảm phải là số nguyên dương và nhỏ hơn 10tr VNĐ!");
        return;
      }
      for (var items of arr) {
        console.log(arr);
        const sanPhams = products.find(product => product.id === items);
        for (var item of sanPhams.sanPhamChiTiets) {
          if (item.giaTien <= giaTriGiam) {
            toast.error("Giá trị giảm không được lớn hơn hoặc bằng giá trị của sản phẩm!")
            return;
          }
        }
      }
    }
    var ngayBatDau = event.target.elements.ngaybatdau.value;
    var ngayKetThuc = event.target.elements.ngayketthuc.value;

    if (!ngayBatDau || !ngayKetThuc) {
      toast.error("Vui lòng nhập đầy đủ ngày bắt đầu và ngày kết thúc");
      return;
    }

    var d = new Date();
    var d1 = new Date(ngayBatDau);
    var d2 = new Date(ngayKetThuc);

    if (isNaN(d1) || isNaN(d2)) {
      toast.error("Ngày không hợp lệ");
      return;
    }

    if(d1>d){
      toast.error("Ngày bắt đầu phải nhỏ hơn hoặc bằng ngày hiện tại");
      return;
    }
    // Chỉ so sánh ngày, bỏ qua thời gian
    if (d1.setHours(0, 0, 0, 0) > d2.setHours(0, 0, 0, 0)) {
      toast.error("Ngày bắt đầu phải trước ngày kết thúc");
      return;
    }

    const payload = {
      giaTriGiam: event.target.elements.giatrigiam.value,
      ngayBatDau: event.target.elements.ngaybatdau.value,
      ngayKetThuc: event.target.elements.ngayketthuc.value,
      nguoiTao: user.hoVaTen,
      listIdSp: arr,
      trangThai: 1
    };
    console.log(payload);

    const res = await postMethodPayload('/api/dot-giam-gia', payload)
    if (res.status < 300) {
      toast.success('Thêm thành công!');
      await new Promise(resolve => setTimeout(resolve, 1000));
      window.location.href = 'dot-giam-gia'
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
            <form onSubmit={handleAddPhieuGG}>
              <div className="row">
                <div className="col-md-6">
                  <div className="mb-3">
                    <label className="form-label fw-bold">Giá trị giảm (VNĐ)</label>
                    <input
                        name="giatrigiam"
                        defaultValue={item?.maCode}
                        className="form-control p-2 border-2"
                        placeholder="Nhập giá trị giảm"
                    />
                    <small className="text-muted">Giá trị phải là số nguyên dương và nhỏ hơn 10,000,000 VNĐ</small>
                  </div>

                  <div className="mb-3">
                    <label className="form-label fw-bold">Ngày bắt đầu</label>
                    <input
                        type="datetime-local"
                        name="ngaybatdau"
                        defaultValue={item?.tenPhieu}
                        className="form-control p-2 border-2"
                    />
                  </div>

                  <div className="mb-3">
                    <label className="form-label fw-bold">Ngày kết thúc</label>
                    <input
                        type="datetime-local"
                        name="ngayketthuc"
                        defaultValue={item?.tenPhieu}
                        className="form-control p-2 border-2"
                    />
                  </div>
                </div>

                <div className="col-md-6">
                  <div className="mb-3">
                    <label className="form-label fw-bold">Chọn sản phẩm</label>
                    <Select
                        className="select-container"
                        classNamePrefix="select"
                        options={products}
                        value={productSelect}
                        onChange={setproductSelect}
                        getOptionLabel={(option) => option.tenSanPham}
                        getOptionValue={(option) => option.id}
                        name="sanpham"
                        placeholder="Chọn sản phẩm..."
                        isMulti
                        noOptionsMessage={() => "Không có sản phẩm nào"}
                        styles={{
                          control: (base) => ({
                            ...base,
                            minHeight: '45px',
                            border: '2px solid #dee2e6',
                            boxShadow: 'none',
                            '&:hover': {
                              borderColor: '#86b7fe'
                            }
                          })
                        }}
                    />
                    <small className="text-muted">Chọn ít nhất một sản phẩm để áp dụng giảm giá</small>
                  </div>

                  <div className="selected-products mt-3">
                    <h6 className="fw-bold">Sản phẩm đã chọn ({productSelect.length}):</h6>
                    {productSelect.length > 0 ? (
                        <div
                            className="list-group scrollable-list"
                            style={{
                              maxHeight: '200px',
                              overflowY: 'auto',
                              border: '1px solid #dee2e6',
                              borderRadius: '0.375rem'
                            }}
                        >
                          {productSelect.map(product => (
                              <div
                                  key={product.id}
                                  className="list-group-item d-flex justify-content-between align-items-center"
                              >
                                                    <span className="text-truncate" style={{maxWidth: '70%'}}>
                                                        {product.tenSanPham}
                                                    </span>
                                <button
                                    type="button"
                                    className="btn btn-sm btn-outline-danger"
                                    onClick={() => setproductSelect(productSelect.filter(p => p.id !== product.id))}
                                >
                                  ×
                                </button>
                              </div>
                          ))}
                        </div>
                    ) : (
                        <div className="alert alert-info">Chưa có sản phẩm nào được chọn</div>
                    )}
                  </div>
                </div>
              </div>

              <div className="d-flex justify-content-end mt-4">
                <button
                    type="submit"
                    className="btn btn-primary px-4 py-2 fw-bold"
                    style={{minWidth: '150px'}}
                >
                  {label}
                </button>
              </div>
            </form>
          </div>
        </div>

        {/* Add custom scrollbar styling */}
        <style jsx>{`
                .scrollable-list::-webkit-scrollbar {
                    width: 8px;
                }
                .scrollable-list::-webkit-scrollbar-track {
                    background: #f1f1f1;
                    border-radius: 10px;
                }
                .scrollable-list::-webkit-scrollbar-thumb {
                    background: #888;
                    border-radius: 10px;
                }
                .scrollable-list::-webkit-scrollbar-thumb:hover {
                    background: #555;
                }
            `}</style>
      </div>
  );
}


export default AdminAddDotGiamGia;