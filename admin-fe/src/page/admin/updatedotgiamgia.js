import { useState, useEffect } from "react";
import { toast } from "react-toastify";
import { getMethod, postMethodPayload, putMethodPayload } from "../../services/request";
import Select from "react-select";

const AdminUpdateDotGiamGia = () => {
    const [item, setItem] = useState(null);
    const [products, setProducts] = useState([]);
    const [productDaThem, setProductDaThem] = useState([]);
    const [productSelect, setProductSelect] = useState([]);
    const [label, setLabel] = useState("Thêm đợt giảm giá");

    useEffect(() => {
        const getPhieuGiamGia = async () => {
            var uls = new URL(document.URL);
            var id = uls.searchParams.get("id");
            if (id != null) {
                setLabel("Cập nhật đợt giảm giá");
                var response = await getMethod("/api/dot-giam-gia/" + id);
                var result = await response.json();
                setItem(result);

                var responseDaThem = await getMethod("/api/dot-giam-gia/san-pham-add?id=" + id);
                var resultDaThem = await responseDaThem.json();
                setProductDaThem(resultDaThem);
                setProductSelect(resultDaThem); // Điền sẵn sản phẩm đã thêm
            }
        };

        const getProducts = async () => {
            var response = await getMethod("/api/san-pham");
            var result = await response.json();
            setProducts(result);
        };

        getPhieuGiamGia();
        getProducts();
    }, []);

    async function handleAddPhieuGG(event) {
        event.preventDefault();
        var user = JSON.parse(localStorage.getItem("user"));
        if (!user) {
            toast.error("Vui lòng đăng nhập để thực hiện thao tác này.");
            return;
        }

        var arr = productSelect.map((product) => product.id);
        if (arr.length === 0) {
            toast.error("Hãy chọn ít nhất 1 sản phẩm");
            return;
        }

        const giaTriGiam = event.target.elements.giatrigiam.value;
        const ngayBatDau = event.target.elements.ngaybatdau.value;
        const ngayKetThuc = event.target.elements.ngayketthuc.value;

        // Validation giá trị giảm
        if (isNaN(giaTriGiam) || !Number.isInteger(Number(giaTriGiam)) || giaTriGiam <= 0 || giaTriGiam >= 10000000) {
            toast.error("Giá trị giảm phải là số nguyên dương và nhỏ hơn 10 triệu VNĐ!");
            return;
        }

        // Kiểm tra giá trị giảm so với giá sản phẩm
        for (var spId of arr) {
            const sanPham = products.find((product) => product.id === spId);
            if (sanPham && sanPham.sanPhamChiTiets) {
                for (var spct of sanPham.sanPhamChiTiets) {
                    if (spct.giaTien <= giaTriGiam) {
                        toast.error("Giá trị giảm không được lớn hơn hoặc bằng giá trị của sản phẩm!");
                        return;
                    }
                }
            }
        }

        // Kiểm tra ngày
        var d1 = new Date(ngayBatDau);
        var d2 = new Date(ngayKetThuc);
        if (d1 > d2) {
            toast.error("Ngày bắt đầu phải trước ngày kết thúc");
            return;
        }

        const payload = {
            id: item?.id || null,
            giaTriGiam: parseFloat(giaTriGiam),
            ngayBatDau: ngayBatDau,
            ngayKetThuc: ngayKetThuc,
            nguoiTao: item?.nguoiTao || user.hoVaTen,
            nguoiCapNhat: user.hoVaTen,
            listIdSp: arr,
            trangThai: item?.trangThai || 1,
        };

        console.log("Payload gửi lên:", payload);

        const url = item ? `/api/dot-giam-gia/${item.id}` : "/api/dot-giam-gia";
        const method = item ? putMethodPayload : postMethodPayload;
        const res = await method(url, payload);

        if (res.status < 300) {
            toast.success(item ? "Cập nhật thành công!" : "Thêm thành công!");
            await new Promise((resolve) => setTimeout(resolve, 1000));
            window.location.href = "dot-giam-gia";
        } else {
            const errorData = await res.json();
            console.error("Lỗi từ server:", errorData);
            toast.error(errorData.message || errorData.defaultMessage || "Thất bại");
        }
    }

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
                                        defaultValue={item?.giaTriGiam}
                                        className="form-control form-control-lg"
                                        type="number"
                                        placeholder="Nhập giá trị giảm"
                                    />
                                </div>

                                <div className="mb-3">
                                    <label className="form-label fw-bold">Ngày bắt đầu</label>
                                    <input
                                        type="datetime-local"
                                        name="ngaybatdau"
                                        defaultValue={item?.ngayBatDau?.slice(0, 16)}
                                        className="form-control form-control-lg"
                                    />
                                </div>

                                <div className="mb-3">
                                    <label className="form-label fw-bold">Ngày kết thúc</label>
                                    <input
                                        type="datetime-local"
                                        name="ngayketthuc"
                                        defaultValue={item?.ngayKetThuc?.slice(0, 16)}
                                        className="form-control form-control-lg"
                                    />
                                </div>

                                <div className="mb-4">
                                    <label className="form-label fw-bold">Chọn sản phẩm</label>
                                    <Select
                                        className="select-container"
                                        options={products}
                                        value={productSelect}
                                        onChange={setProductSelect}
                                        getOptionLabel={(option) => option.tenSanPham}
                                        getOptionValue={(option) => option.id}
                                        name="sanpham"
                                        placeholder="Chọn sản phẩm..."
                                        isMulti
                                    />
                                </div>

                                <button className="btn btn-primary btn-lg w-100 py-3">
                                    <i className="bi bi-save me-2"></i>
                                    {label}
                                </button>
                            </div>

                            <div className="col-md-6">
                                <div className="top-products-card h-100">
                                    <div className="card-header bg-light">
                                        <h5 className="mb-0 fw-bold">
                                            <i className="bi bi-list-check me-2"></i>
                                            Sản phẩm đã được chọn
                                        </h5>
                                    </div>
                                    <div className="card-body p-0">
                                        <div className="table-responsive" style={{ maxHeight: "500px", overflowY: "auto" }}>
                                            <table className="table table-hover mb-0">
                                                <thead className="table-light sticky-top">
                                                <tr>
                                                    <th width="100">ID</th>
                                                    <th>Tên sản phẩm</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                {productDaThem.length > 0 ? (
                                                    productDaThem.map((item) => (
                                                        <tr key={item.id}>
                                                            <td className="fw-bold">{item.id}</td>
                                                            <td>{item.tenSanPham}</td>
                                                        </tr>
                                                    ))
                                                ) : (
                                                    <tr>
                                                        <td colSpan="2" className="text-center text-muted py-4">
                                                            <i className="bi bi-info-circle me-2"></i>
                                                            Chưa có sản phẩm nào được chọn
                                                        </td>
                                                    </tr>
                                                )}
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div className="top-products-card-footer bg-light">
                                        <small className="text-muted">
                                            Tổng số sản phẩm: <span className="fw-bold">{productDaThem.length}</span>
                                        </small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    );
};

export default AdminUpdateDotGiamGia;