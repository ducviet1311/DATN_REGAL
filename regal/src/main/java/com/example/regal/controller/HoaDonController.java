package com.example.regal.controller;

import com.example.regal.dto.request.HoaDonRequest;
import com.example.regal.dto.response.TrangThai;
import com.example.regal.entity.*;
import com.example.regal.exception.MessageException;
import com.example.regal.ghn.GhnClient;
import com.example.regal.repository.*;
import com.example.regal.service.PhieuGiamGiaService;
import com.example.regal.service.impl.PhieuGiamGiaServiceImpl;
import com.example.regal.utils.MailService;
import com.example.regal.utils.UserUltis;
import com.example.regal.vnpay.VNPayService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/v1/hoa-don")
public class HoaDonController {

    @Autowired
    private HoaDonRepository hoaDonRepository;

    @Autowired
    private LichSuHoaDonRepository lichSuHoaDonRepository;

    @Autowired
    private PhieuGiamGiaService phieuGiamGiaService;

    @Autowired
    private PhieuGiamGiaServiceImpl phieuGiamGiaServiceImpl;

    @Autowired
    private UserUltis userUltis;

    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;

    @Autowired
    private GioHangRepository gioHangRepository;

    @Autowired
    private GhnClient ghnClient;

    @Autowired
    private PhieuGiamGiaRepository phieuGiamGiaRepository;

    @Autowired
    private VNPayService vnPayService;

    @Autowired
    private PhuongThucThanhToanRepository phuongThucThanhToanRepository;

    @Autowired
    private MailService mailService;

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired
    private SanPhamChiTietRepository sanPhamChiTietRepository;



    @PostMapping("/update-trang-thai")
    public ResponseEntity<?> capNhatTrangThai(@RequestParam Integer hoaDonId, @RequestParam Integer trangThai, HttpServletRequest request){
        Boolean check = TrangThai.kiemTraTonTai(trangThai);
        if(check == false){
            throw new MessageException("Trạng thái chỉ có giá trị từ 1 - 8");
        }
        Optional<HoaDon> hoaDon = hoaDonRepository.findById(hoaDonId);
        if(hoaDon.isEmpty()){
            throw new MessageException("Hóa đơn không tồn tại");
        }
        if(hoaDon.get().getTrangThai() == 6){
            throw new MessageException("Đơn hàng đã hủy, không thể cập nhật trạng thái");
        }
        NhanVien nhanVien = userUltis.getLoggedInNhanVien(request);
        hoaDon.get().setTrangThai(trangThai);
        hoaDon.get().setLanCapNhatCuoi(new Timestamp(System.currentTimeMillis()));
        hoaDon.get().setNguoiCapNhat(nhanVien.getEmail());
        if(trangThai == 2) hoaDon.get().setNgayXacNhan(new Timestamp(System.currentTimeMillis()));
        if(trangThai == 4) hoaDon.get().setNgayVanChuyen(new Timestamp(System.currentTimeMillis()));
        if(trangThai == 5) hoaDon.get().setNgayNhanHang(new Timestamp(System.currentTimeMillis()));
        if(trangThai == 8) hoaDon.get().setNgayHoanThanh(new Timestamp(System.currentTimeMillis()));
        hoaDonRepository.save(hoaDon.get());
        LichSuHoaDon lichSuHoaDon = new LichSuHoaDon();
        lichSuHoaDon.setHoaDon(hoaDon.get());
        lichSuHoaDon.setNguoiCapNhat(nhanVien.getEmail());
        lichSuHoaDon.setTrangThai(trangThai);
        lichSuHoaDon.setLanCapNhatCuoi(new Timestamp(System.currentTimeMillis()));
        lichSuHoaDon.setNhanVien(nhanVien);
        lichSuHoaDon.setNgayTao(new Timestamp(System.currentTimeMillis()));
        lichSuHoaDonRepository.save(lichSuHoaDon);

        // Chỉ hoàn lại số lượng sản phẩm khi trạng thái là Hủy đơn (6)
        if(trangThai == 6){
            List<HoaDonChiTiet> hoaDonChiTiets = hoaDon.get().getHoaDonChiTiets();
            for(HoaDonChiTiet h : hoaDonChiTiets){
                h.getSanPhamChiTiet().setSoLuong(h.getSoLuong() + h.getSanPhamChiTiet().getSoLuong());
                sanPhamChiTietRepository.save(h.getSanPhamChiTiet());
            }
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }
    @PostMapping("/huy-don-hang")
    public ResponseEntity<?> huyDonHang(@RequestParam Integer hoaDonId, HttpServletRequest request) {
        // Tìm hóa đơn
        Optional<HoaDon> hoaDon = hoaDonRepository.findById(hoaDonId);
        if (hoaDon.isEmpty()) {
            throw new MessageException("Hóa đơn không tồn tại");
        }

        // Kiểm tra nếu đơn hàng đã bị hủy trước đó
        if (hoaDon.get().getTrangThai() == 6) {
            throw new MessageException("Đơn hàng đã bị hủy trước đó");
        }

        // Cập nhật trạng thái thành 6 (đã hủy)
        if (hoaDon.get().getTrangThai() != 1 && hoaDon.get().getTrangThai() != 2 && hoaDon.get().getTrangThai() != 3){
            throw new MessageException("Chỉ có thể hủy các được hàng chưa được gửi đi");

        }

        KhachHang khachHang = userUltis.getLoggedInKhachHang(request);
        hoaDon.get().setTrangThai(6);
        hoaDon.get().setLanCapNhatCuoi(new Timestamp(System.currentTimeMillis()));
        hoaDon.get().setNguoiCapNhat(khachHang.getEmail());

        // Hoàn lại số lượng sản phẩm trong kho
        List<HoaDonChiTiet> hoaDonChiTiets = hoaDon.get().getHoaDonChiTiets();
        for (HoaDonChiTiet chiTiet : hoaDonChiTiets) {
            chiTiet.getSanPhamChiTiet().setSoLuong(
                    chiTiet.getSanPhamChiTiet().getSoLuong() + chiTiet.getSoLuong()
            );
            sanPhamChiTietRepository.save(chiTiet.getSanPhamChiTiet());
        }

        // Lưu lịch sử hủy đơn hàng
        LichSuHoaDon lichSuHoaDon = new LichSuHoaDon();
        lichSuHoaDon.setHoaDon(hoaDon.get());
        lichSuHoaDon.setNguoiCapNhat(khachHang.getEmail());
        lichSuHoaDon.setTrangThai(6);
        lichSuHoaDon.setLanCapNhatCuoi(new Timestamp(System.currentTimeMillis()));
        lichSuHoaDon.setNhanVien(null);
        lichSuHoaDon.setNgayTao(new Timestamp(System.currentTimeMillis()));
        lichSuHoaDonRepository.save(lichSuHoaDon);

        // Lưu hóa đơn cập nhật vào database
        hoaDonRepository.save(hoaDon.get());


        return new ResponseEntity<>("Đơn hàng đã được hủy thành công", HttpStatus.OK);
    }
    @GetMapping("/danh-sach-trang-thai")
    public ResponseEntity<?> viewListTrangThai(){
        return new ResponseEntity<>(TrangThai.initTrangThais(),HttpStatus.OK);
    }

    @GetMapping("/all")
    public ResponseEntity<?> findAll(Pageable pageable, @RequestParam(required = false) Integer trangthai){
        Page<HoaDon> page = null;
        if(trangthai == null){
            page = hoaDonRepository.findAllHd(pageable);
        }
        else{
            page = hoaDonRepository.findByTrangThai(trangthai, pageable);
        }
        return new ResponseEntity<>(page, HttpStatus.OK);
    }


    @PostMapping("/dat-hang-cod")
    public void datHang(@RequestBody HoaDonRequest request, HttpServletRequest httpServletRequest){
        taoDonHang(request, httpServletRequest);
    }


    @PostMapping("/tao-link-thanh-toan")
    public String taoLinkThanhToan(@RequestBody HoaDonRequest request, HttpServletRequest httpServletRequest){
        List<GioHang> list = gioHangRepository.findAllById(request.getListIdGioHang());
        Double tong = 0D;
        for(GioHang g : list){
            tong += g.getSoLuong() * g.getSanPhamChiTiet().getGiaTien();
        }
        for(GioHang g : list){
            if(g.getSanPhamChiTiet().getSoLuong() < g.getSoLuong()){
                throw new MessageException("Số lượng sản phẩm "+g.getSanPhamChiTiet().getSanPham().getTenSanPham()+" - màu "+g.getSanPhamChiTiet().getMauSac().getTenMauSac()+" - size: "+g.getSanPhamChiTiet().getKichCo().getTenKichCo()+" chỉ còn: "+ g.getSanPhamChiTiet().getSoLuong());
            }
        }
        Double tienGiam = 0D;
        if(request.getPhieuGiamGia() != null){
            PhieuGiamGia phieuGiamGia = phieuGiamGiaRepository.findById(request.getPhieuGiamGia().getId()).get();
            if(phieuGiamGia.getLoaiPhieu() == true){
                tienGiam = Double.valueOf(phieuGiamGia.getGiaTriGiam());
            }
            else{
                tienGiam = tong - tong * phieuGiamGia.getGiaTriGiam() / 100;
                if(tienGiam > phieuGiamGia.getGiaTriGiamToiDa()){
                    tienGiam = phieuGiamGia.getGiaTriGiamToiDa();
                }
            }
        }

        Float kl = 0f;
        for(GioHang g : list){
            kl += 0.5f * g.getSoLuong();
        }
        Integer khoiLuong = kl.intValue() + 1;
        System.out.println("id huyen: "+ request.getDiaChi().getQuanHuyen().split("\\?")[0]);
        Map<String, Object> map = ghnClient.calculateShippingFee(Integer.valueOf(request.getDiaChi().getQuanHuyen().split("\\?")[0]), request.getDiaChi().getXaPhuong().split("\\?")[0], khoiLuong);
        Map<String, Object> data = (Map<String, Object>) map.get("data");
        Integer phiShip = (Integer) data.get("service_fee");
        tong = tong + phiShip - tienGiam;
        String link = vnPayService.createOrder(tong.intValue(), String.valueOf(System.currentTimeMillis()), "http://localhost:84/payment");
        return link;
    }


    @PostMapping("/kiem-tra-thanh-toan")
    public void kiemTraThanhToan(@RequestBody HoaDonRequest request, HttpServletRequest httpServletRequest){
        Optional<PhuongThucThanhToan> phuongThucThanhToan = phuongThucThanhToanRepository.findByMaGG(request.getVnpOrderInfo());
        if(phuongThucThanhToan.isPresent()){
            throw new MessageException("Đơn hàng đã được thanh toán");
        }
        if(vnPayService.orderReturnByUrl(request.getVnpayUrl()) == 1){
            HoaDon hoaDon = taoDonHang(request, httpServletRequest);
            PhuongThucThanhToan pttt = new PhuongThucThanhToan();
            pttt.setHoaDon(hoaDon);
            pttt.setNgayTao(new Timestamp(System.currentTimeMillis()));
            pttt.setMaGiaoDichVnPay(request.getVnpOrderInfo());
            pttt.setTenPhuongThuc("Vnpay");
            pttt.setTongTien(hoaDon.getTongTien());
            phuongThucThanhToanRepository.save(pttt);
        }
        else{
            throw new MessageException("Thanh toán thất bại");
        }
    }


    public HoaDon taoDonHang(HoaDonRequest request, HttpServletRequest httpServletRequest) {
        KhachHang khachHang = userUltis.getLoggedInKhachHang(httpServletRequest);
        List<GioHang> list = gioHangRepository.findAllById(request.getListIdGioHang());
        Double tong = 0D;
        for (GioHang g : list) {
            tong += g.getSoLuong() * g.getSanPhamChiTiet().getGiaTien();
            if (g.getSanPhamChiTiet().getSoLuong() < g.getSoLuong()) {
                throw new MessageException("Số lượng sản phẩm " + g.getSanPhamChiTiet().getSanPham().getTenSanPham() + " - màu " + g.getSanPhamChiTiet().getMauSac().getTenMauSac() + " - size: " + g.getSanPhamChiTiet().getKichCo().getTenKichCo() + " chỉ còn: " + g.getSanPhamChiTiet().getSoLuong());
            }
        }

        Double tienGiam = 0D;
        if (request.getPhieuGiamGia() != null) {
            PhieuGiamGia phieuGiamGia = phieuGiamGiaRepository.findById(request.getPhieuGiamGia().getId()).get();
            if (phieuGiamGia.getSoLuong() > 0) {
                if (phieuGiamGia.getLoaiPhieu() == true) {
                    tienGiam = Double.valueOf(phieuGiamGia.getGiaTriGiam());
                } else {
                    tienGiam = tong - tong * phieuGiamGia.getGiaTriGiam() / 100;
                    if (tienGiam > phieuGiamGia.getGiaTriGiamToiDa()) {
                        tienGiam = phieuGiamGia.getGiaTriGiamToiDa();
                    }
                }
                phieuGiamGia.setSoLuong((short) (Integer.valueOf(phieuGiamGia.getSoLuong()) - 1));
            }
        }

        Float kl = 0f;
        for (GioHang g : list) {
            kl += 0.5f * g.getSoLuong();
        }
        Integer khoiLuong = kl.intValue() + 1;
        Map<String, Object> map = ghnClient.calculateShippingFee(Integer.valueOf(request.getDiaChi().getQuanHuyen().split("\\?")[0]), request.getDiaChi().getXaPhuong().split("\\?")[0], khoiLuong);
        Map<String, Object> data = (Map<String, Object>) map.get("data");
        Integer phiShip = (Integer) data.get("service_fee");
        tong = tong + phiShip - tienGiam;

        HoaDon hoaDon = new HoaDon();
        hoaDon.setMaHoaDon(String.valueOf(System.currentTimeMillis()));
        hoaDon.setLoaiHoaDon(true);
        hoaDon.setKhachHang(khachHang);
        hoaDon.setNgayTao(new Timestamp(System.currentTimeMillis()));
        hoaDon.setDiaChi(request.getDiaChi().getTenDuong() + ", " + request.getDiaChi().getXaPhuong().split("\\?")[1] + ", " + request.getDiaChi().getQuanHuyen().split("\\?")[1] + ", " + request.getDiaChi().getTinhThanhPho().split("\\?")[1]);
        hoaDon.setGhiChu(request.getGhiChu());
        hoaDon.setEmail(khachHang.getEmail());
        hoaDon.setPhieuGiamGia(request.getPhieuGiamGia());
        hoaDon.setTongTien(new BigDecimal(tong));
        hoaDon.setTienGiam(new BigDecimal(tienGiam));
        hoaDon.setTrangThai(1);
        hoaDon.setPhiVanChuyen(new BigDecimal(phiShip));
        // Gán số điện thoại người nhận từ DiaChi
        hoaDon.setSoDienThoai(request.getDiaChi().getSdtNguoiNhan() != null ?
                request.getDiaChi().getSdtNguoiNhan() :
                khachHang.getSoDienThoai()); // Nếu sdtNguoiNhan null, lấy số điện thoại chính của khách hàng
        hoaDon.setTenKhachHang(request.getDiaChi().getTenNguoiNhan() != null ?
                request.getDiaChi().getTenNguoiNhan() :
                khachHang.getHoVaTen()); // Gán tên người nhận từ DiaChi
        hoaDonRepository.save(hoaDon);

        for (GioHang g : list) {
            HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
            hoaDonChiTiet.setHoaDon(hoaDon);
            hoaDonChiTiet.setSanPhamChiTiet(g.getSanPhamChiTiet());
            hoaDonChiTiet.setSoLuong(g.getSoLuong());
            hoaDonChiTiet.setGiaSanPham(new BigDecimal(g.getSanPhamChiTiet().getGiaTien()));
            hoaDonChiTietRepository.save(hoaDonChiTiet);

            g.getSanPhamChiTiet().setSoLuong(g.getSanPhamChiTiet().getSoLuong() - g.getSoLuong());
            sanPhamChiTietRepository.save(g.getSanPhamChiTiet());
            gioHangRepository.deleteById(g.getId());
        }
        mailService.sendMailHtml(khachHang.getEmail(), "Đặt hàng thành công",
                "Cảm ơn bạn đã đặt hàng trên website của chúng tôi<br>" +
                        "Mã đơn hàng của bạn là: " + hoaDon.getMaHoaDon());
        return hoaDon;
    }

    @GetMapping("/hoa-don-cua-toi")
    public ResponseEntity<?> donCuaToi(HttpServletRequest request){
        KhachHang khachHang = userUltis.getLoggedInKhachHang(request);
        List<HoaDon> hoaDons = hoaDonRepository.findAllByKhachHang(khachHang.getId());
        return new ResponseEntity<>(hoaDons, HttpStatus.OK);
    }

    @GetMapping("/hoa-don-cho")
    public ResponseEntity<?> getHoaDonCho(HttpServletRequest request){
        List<HoaDon> hoaDons = hoaDonRepository.hoaDonCho();
        return new ResponseEntity<>(hoaDons, HttpStatus.OK);
    }

    @PostMapping("/tao-hoa-don-cho")
    public ResponseEntity<?> taoHoaDonCho(HttpServletRequest request){
        NhanVien nhanVien = userUltis.getLoggedInNhanVien(request);
        Long demHoaDonCho = hoaDonRepository.demHoaDonCho();
        if(demHoaDonCho > 4){
            throw new MessageException("Đã có "+demHoaDonCho+" hóa đơn chờ, không tạo thêm");
        }
        HoaDon hoaDon = new HoaDon();
        hoaDon.setMaHoaDon(String.valueOf(System.currentTimeMillis()));
        hoaDon.setLoaiHoaDon(false);
        hoaDon.setTrangThai(1);
        hoaDon.setNhanVien(nhanVien);
        hoaDon.setNgayTao(new Timestamp(System.currentTimeMillis()));
        hoaDon.setNguoiTao(nhanVien.getHoVaTen());
        hoaDon.setTongTien(new BigDecimal(0));
//        hoaDon.setDaThanhToan(false);
        hoaDonRepository.save(hoaDon);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PostMapping("/cap-nhat-khach-hang")
    public ResponseEntity<?> capNhatKhachHang(@RequestParam Integer idKhachHang, @RequestParam Integer idHoaDon){
        HoaDon hoaDon = hoaDonRepository.findById(idHoaDon).get();
        Optional<KhachHang> khachHang = khachHangRepository.findById(idKhachHang);
        if(khachHang.isEmpty()){
            hoaDon.setKhachHang(null);
        }
        else{
            hoaDon.setKhachHang(khachHang.get());
        }
        HoaDon h = hoaDonRepository.save(hoaDon);
        return new ResponseEntity<>(h,HttpStatus.OK);
    }

    @PostMapping("/cap-nhat-phieu-giam-gia")
    public ResponseEntity<?> capNhapPhieuGiamGia_sl(@RequestParam Integer idPGG, @RequestParam Integer idHoaDon){
        HoaDon hoaDon = hoaDonRepository.findById(idHoaDon).get();
        Optional<PhieuGiamGia> phieuGiamGia = phieuGiamGiaService.getPhieuGiamGiaById(idPGG);
        if (phieuGiamGia.get().getTrangThai() != 1) {
            return new ResponseEntity<>("Phiếu giảm giá đã hết được sử dụng vui lòng chọn phiếu giảm giá khác", HttpStatus.valueOf(417));
        }
        if(phieuGiamGia.isEmpty()){
            hoaDon.setPhieuGiamGia(null);
        }
        else{
            hoaDon.setPhieuGiamGia(phieuGiamGia.get());
            phieuGiamGiaServiceImpl.update_sl(phieuGiamGia.get().getId(), (short) -1);
        }

        HoaDon h = hoaDonRepository.save(hoaDon);
        return new ResponseEntity<>(h,HttpStatus.OK);
    }

    @PostMapping("/cap-nhat-phieu-giam-gia-hd")
    public ResponseEntity<?> capNhapPhieuGiamGia(@RequestParam Integer idPGG, @RequestParam Integer idHoaDon){
        HoaDon hoaDon = hoaDonRepository.findById(idHoaDon).get();
        if(idPGG == 28978) {
            hoaDon.setPhieuGiamGia(null);
            HoaDon h = hoaDonRepository.save(hoaDon);
            return new ResponseEntity<>(h,HttpStatus.OK);
        }
        Optional<PhieuGiamGia> phieuGiamGia = phieuGiamGiaService.getPhieuGiamGiaById(idPGG);
        if(phieuGiamGia.isEmpty()){
            hoaDon.setPhieuGiamGia(null);
        }
        else{
            hoaDon.setPhieuGiamGia(phieuGiamGia.get());
        }

        HoaDon h = hoaDonRepository.save(hoaDon);
        return new ResponseEntity<>(h,HttpStatus.OK);
    }


    @GetMapping("/find-by-id")
    public ResponseEntity<?> findById(@RequestParam Integer id){
        HoaDon hoaDon = hoaDonRepository.findById(id).get();
        return new ResponseEntity<>(hoaDon,HttpStatus.OK);
    }

    @PostMapping("/xac-nhan-dat-tai-quay")
    public ResponseEntity<?> xacNhanDatHang(@RequestParam Integer idHoaDon){
        HoaDon hoaDon = hoaDonRepository.findById(idHoaDon).get();
        Double tongTien = 0D;
        for(HoaDonChiTiet hc : hoaDon.getHoaDonChiTiets()){
            if(hc.getSanPhamChiTiet().getSoLuong() < hc.getSoLuong()){
                throw new MessageException("Số lượng sản phẩm "+hc.getSanPhamChiTiet().getSanPham().getTenSanPham()+" - màu "+hc.getSanPhamChiTiet().getMauSac().getTenMauSac()+" - size: "+hc.getSanPhamChiTiet().getKichCo().getTenKichCo()+" chỉ còn: "+ hc.getSanPhamChiTiet().getSoLuong());
            }
        }
        for(HoaDonChiTiet hc : hoaDon.getHoaDonChiTiets()){
            hc.getSanPhamChiTiet().setSoLuong(hc.getSanPhamChiTiet().getSoLuong() - hc.getSoLuong());
            sanPhamChiTietRepository.save(hc.getSanPhamChiTiet());
            tongTien += hc.getSoLuong() * hc.getSanPhamChiTiet().getGiaTien();
//            hc.getSanPhamChiTiet().setSoLuong(hc.getSanPhamChiTiet().getSoLuong() - hc.getSoLuong());
            sanPhamChiTietRepository.save(hc.getSanPhamChiTiet());
        }
        hoaDon.setTrangThai(8);
        hoaDon.setTongTien(new BigDecimal(tongTien));
        HoaDon h = hoaDonRepository.save(hoaDon);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/xoa-don-cho")
    public ResponseEntity<?> xoaDonCho(@RequestParam Integer idHoaDon){
        hoaDonRepository.deleteById(idHoaDon);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/search")
    public ResponseEntity<?> searchHoaDon(
            Pageable pageable,
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) Integer trangthai,
            @RequestParam(required = false) Boolean loaiHoaDon) {
        Page<HoaDon> page;
        if (keyword != null && !keyword.trim().isEmpty()) {
            page = hoaDonRepository.searchHoaDon(keyword.trim(), trangthai, loaiHoaDon, pageable);
        } else {
            if (trangthai != null && loaiHoaDon != null) {
                page = hoaDonRepository.findByTrangThaiAndLoaiHoaDon(trangthai, loaiHoaDon, pageable);
            } else if (trangthai != null) {
                page = hoaDonRepository.findByTrangThai(trangthai, pageable);
            } else if (loaiHoaDon != null) {
                page = hoaDonRepository.findByLoaiHoaDon(loaiHoaDon, pageable);
            } else {
                page = hoaDonRepository.findAllHd(pageable);
            }
        }
        return new ResponseEntity<>(page, HttpStatus.OK);
    }

    @GetMapping("/loai-hoa-don-options")
    public ResponseEntity<?> getLoaiHoaDonOptions() {
        List<Map<String, Object>> options = List.of(
                Map.of("value", true, "label", "Đặt hàng online"),
                Map.of("value", false, "label", "Thanh toán tại quầy")
        );
        return new ResponseEntity<>(options, HttpStatus.OK);
    }
}
