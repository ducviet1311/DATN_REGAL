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
        <div>
            <div className="col-sm-12 header-sps">
                <div className="title-add-admin">
                    <h4>{label}</h4>
                </div>
            </div>
            <div className="col-sm-12">
                <form onSubmit={handleAddPhieuGG} className="form-add row">
                    <div className="col-sm-5">
                        <label className="lb-form">Giá trị giảm (VNĐ)</label>
                        <input
                            name="giatrigiam"
                            defaultValue={item?.giaTriGiam}
                            className="form-control"
                            type="number"
                        />

                        <label className="lb-form">Ngày bắt đầu</label>
                        <input
                            type="datetime-local"
                            name="ngaybatdau"
                            defaultValue={item?.ngayBatDau?.slice(0, 16)}
                            className="form-control"
                        />

                        <label className="lb-form">Ngày kết thúc</label>
                        <input
                            type="datetime-local"
                            name="ngayketthuc"
                            defaultValue={item?.ngayKetThuc?.slice(0, 16)}
                            className="form-control"
                        />

                        <label className="lb-form">Chọn sản phẩm thêm vào phiếu giảm giá</label>
                        <Select
                            className="select-container ms-2"
                            options={products}
                            value={productSelect}
                            onChange={setProductSelect}
                            getOptionLabel={(option) => option.tenSanPham}
                            getOptionValue={(option) => option.id}
                            name="sanpham"
                            placeholder="Chọn sản phẩm"
                            isMulti
                        />
                        <br />
                        <button className="form-control btn btn-primary">{label}</button>
                    </div>
                    <div className="col-sm-5">
                        <h5>Các sản phẩm đã add đợt giảm giá này</h5>
                        <table className="table">
                            <thead>
                            <tr>
                                <th>Id sản phẩm</th>
                                <th>Tên sản phẩm</th>
                            </tr>
                            </thead>
                            <tbody>
                            {productDaThem.map((item) => (
                                <tr key={item.id}>
                                    <td>{item.id}</td>
                                    <td>{item.tenSanPham}</td>
                                </tr>
                            ))}
                            </tbody>
                        </table>
                    </div>
                </form>
            </div>
        </div>
    );
};

export default AdminUpdateDotGiamGia;