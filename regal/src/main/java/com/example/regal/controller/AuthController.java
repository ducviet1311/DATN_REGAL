package com.example.regal.controller;

import com.example.regal.dto.request.*;
import com.example.regal.dto.response.MessageResponse;
import com.example.regal.dto.response.TokenDto;
import com.example.regal.entity.KhachHang;
import com.example.regal.entity.NhanVien;
import com.example.regal.entity.User;
import com.example.regal.exception.MessageException;
import com.example.regal.jwt.JwtUtils;
import com.example.regal.repository.KhachHangRepository;
import com.example.regal.repository.NhanVienRepository;
import com.example.regal.utils.MailService;
import com.example.regal.utils.UserUltis;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;
import java.util.Random;

@RestController
@RequestMapping("/api/v1/auth")
public class AuthController {

    @Autowired
    private NhanVienRepository nhanVienRepository;

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private JwtUtils jwtUtils;

    @Autowired
    private MailService mailService;

    @Autowired
    private UserUltis userUltis;

    private String generatedOtp;

    @PostMapping("/public/login")
    public TokenDto authenticate(@RequestBody LoginDto loginDto) throws Exception {
        Optional<KhachHang> khachHang = khachHangRepository.findKhByEmail(loginDto.getEmail());
        Optional<NhanVien> nhanVien = nhanVienRepository.findByEmail(loginDto.getEmail());
        // check infor user
//        return new TokenDto(jwtUtils.generateToken(loginDto.getEmail()), "ROLE_ADMIN");
        if(khachHang.isEmpty() && nhanVien.isEmpty()){
            throw new MessageException("Không tìm thấy tài khoản");
        }
        else if(khachHang.isPresent()){
            if(passwordEncoder.matches(loginDto.getPassword(), khachHang.get().getMatKhau())){
                if(khachHang.get().getTrangThai() == 0){
                    throw new MessageException("Tài khoản đã bị khóa");
                }
                String token = jwtUtils.generateToken(loginDto.getEmail());
                return new TokenDto(token, "ROLE_CUSTOMER");
            }
            else{
                throw new MessageException("Mật khẩu không chính xác");
            }
        }
        else if(nhanVien.isPresent()){

            if(passwordEncoder.matches(loginDto.getPassword(), nhanVien.get().getMatKhau())){
                String role = "";
                if(nhanVien.get().getVaiTro() == 1){
                    role = "ROLE_ADMIN";
                }
                if(nhanVien.get().getVaiTro() == 0){
                    role = "ROLE_EMPLOYEE";
                }
                String token = jwtUtils.generateToken(loginDto.getEmail());
                return new TokenDto(token, role);
            }
            else{
                throw new MessageException("Mật khẩu không chính xác");
            }
        }
        throw new MessageException("Đăng nhập thất bại");
    }

    @PostMapping("/public/register")
    public MessageResponse registerAccount(@RequestBody KhachHangRequest request) {
        // Kiểm tra email đã tồn tại trong bảng Khách hàng
        Optional<KhachHang> existingCustomer = khachHangRepository.findKhByEmail(request.getEmail());
        Optional<NhanVien> exNhanVien = nhanVienRepository.findByEmail(request.getEmail());
        if (existingCustomer.isPresent() || exNhanVien.isPresent()) {
            throw new MessageException("Email đã được sử dụng");
        }

        // Kiểm tra email đã tồn tại trong bảng Nhân viên
        Optional<NhanVien> existingEmployee = nhanVienRepository.findByEmail(request.getEmail());
        if (existingEmployee.isPresent()) {
            throw new MessageException("Email đã được sử dụng trong hệ thống Nhân Viên.");
        }

        // Tạo mã khách hàng mới theo định dạng KHxxx
        String newMaKhachHang = generateMaKhachHang();

        // Tạo mới Khách hàng
        KhachHang newCustomer = new KhachHang();
        newCustomer.setMaKhachHang(newMaKhachHang);  // Sử dụng mã mới
        newCustomer.setHoVaTen(request.getHoVaTen());
        newCustomer.setNgaySinh(request.getNgaySinh());
        newCustomer.setGioiTinh(request.getGioiTinh());
        newCustomer.setSoDienThoai(request.getSoDienThoai());
        newCustomer.setEmail(request.getEmail());
        newCustomer.setMatKhau(passwordEncoder.encode(request.getMatKhau()));
        newCustomer.setTrangThai(1);

        // Lưu khách hàng vào cơ sở dữ liệu
        khachHangRepository.save(newCustomer);

        return new MessageResponse("Đăng ký thành công!");
    }

    // Tạo mã khách hàng theo định dạng KHxxx
    private String generateMaKhachHang() {
        return "kh" + new Random().nextInt(10000);
    }

    // Gửi mã OTP vào email
    @PostMapping("/public/quen-mat-khau")
    public MessageResponse quenMatKhau(@RequestParam String email) {
        Optional<KhachHang> khachHang = khachHangRepository.findKhByEmail(email);
        Optional<NhanVien> nhanVien = nhanVienRepository.findByEmail(email);

        // Kiểm tra tài khoản tồn tại
        if(khachHang.isEmpty() && nhanVien.isEmpty()){
            throw new MessageException("Không tìm thấy tài khoản với email này");
        }

        String matKhauNgauNhien = randomPass();
        if(nhanVien.isPresent()){
            nhanVien.get().setMatKhau(passwordEncoder.encode(matKhauNgauNhien));
            nhanVienRepository.save(nhanVien.get());
        }
        if(khachHang.isPresent()){
            khachHang.get().setMatKhau(passwordEncoder.encode(matKhauNgauNhien));
            khachHangRepository.save(khachHang.get());
        }
        mailService.sendMailHtml(email, "Khôi Phục Mật Khẩu",
                "<!DOCTYPE html>" +
                        "<html>" +
                        "<head>" +
                        "<style>" +
                        "body { margin: 0; padding: 0; font-family: 'Arial', sans-serif; background-color: #ffffff; color: #000000; }" + // Nền trắng, chữ mặc định đen
                        ".container { max-width: 600px; margin: 0 auto; background-color: #ffffff; border: 1px solid #ddd; }" + // Nền container trắng
                        ".header { background-color: #ffffff; padding: 20px; text-align: center; }" + // Giữ header đỏ như Riot
                        ".header h1 { margin: 0; font-size: 28px; font-weight: bold; text-transform: uppercase; letter-spacing: 2px; color: #000000; }" + // Chữ header trắng
                        ".content { padding: 30px; text-align: center; }" +
                        ".content p { font-size: 16px; line-height: 1.5; margin: 10px 0; color: #000000; font-weight: bold; }" + // Chữ <p> đen, in đậm
                        ".password { font-size: 24px; font-weight: bold; color: #007bff; margin: 20px 0; }" + // Mật khẩu xanh dương
                        ".button { display: inline-block; padding: 12px 30px; background-color: #c8102e; color: #ffffff; text-decoration: none; font-weight: bold; border-radius: 5px; text-transform: uppercase; letter-spacing: 1px; }" +
                        ".footer { padding: 20px; text-align: center; font-size: 12px; color: #666; border-top: 1px solid #ddd; }" + // Footer xám nhạt trên nền trắng
                        ".footer a { color: #007bff; text-decoration: none; }" + // Link xanh dương
                        "</style>" +
                        "</head>" +
                        "<body>" +
                        "<div class='container'>" +
                        "<div class='header'>" +
                        "<h1>KHÔI PHỤC MẬT KHẨU</h1>" +
                        "</div>" +
                        "<div class='content'>" +
                        "<p>Chào bạn,</p>" +
                        "<p>Chúng tôi đã tạo một mật khẩu mới cho tài khoản của bạn theo yêu cầu.</p>" +
                        "<p>Mật khẩu mới của bạn là:</p>" +
                        "<div class='password'>" + matKhauNgauNhien + "</div>" +
                        "</div>" +
                        "<div class='footer'>" +
                        "<p>© 2025 Regal Store. All Rights Reserved.</p>" +
                        "<p>Cần hỗ trợ? Liên hệ <a href='mailto:qtvducviet131@gmail.com'>Hỗ trợ của chúng tôi</a>.</p>" +
                        "</div>" +
                        "</div>" +
                        "</body>" +
                        "</html>");        return new MessageResponse("Đã gửi mật khẩu về gmail");
    }


    @PostMapping("/user/change-password")
    public ResponseEntity<?> changePassword(@RequestBody PasswordDto passwordDto, HttpServletRequest request){
        KhachHang khachHang = userUltis.getLoggedInKhachHang(request);
        if(!passwordEncoder.matches(passwordDto.getOldPass(), khachHang.getMatKhau())){
            throw new MessageException("Mật khẩu cũ không đúng");
        }
        khachHang.setMatKhau(passwordEncoder.encode(passwordDto.getNewPass()));
        khachHangRepository.save(khachHang);
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    public String randomPass(){
        String str = "qwert1yui2op3as4dfg5hj6klzx7cvb8nmQ9WE0RTYUIOPASDFGHJKLZXCVBNM";
        Integer length = str.length()-1;
        StringBuilder stringBuilder = new StringBuilder("");
        for(int i=0; i<7; i++){
            Integer ran = (int)(Math.random()*length);
            stringBuilder.append(str.charAt(ran));
        }
        return String.valueOf(stringBuilder);
    }

    // Gửi mã OTP vào email
    @PostMapping("/public/forgot-password")
    public MessageResponse forgotPassword(@RequestBody ForgotPasswordRequest request) {
        Optional<KhachHang> khachHang = khachHangRepository.findKhByEmail(request.getEmail());
        Optional<NhanVien> nhanVien = nhanVienRepository.findByEmail(request.getEmail());

        // Kiểm tra tài khoản tồn tại
        if(khachHang.isEmpty() && nhanVien.isEmpty()){
            throw new MessageException("Không tìm thấy tài khoản với email này");
        }

        // Tạo mã OTP ngẫu nhiên
        generatedOtp = generateOtp();

        // Gửi mã OTP qua email
        String subject = "Mã OTP khôi phục mật khẩu";
        String body = "Mã OTP của bạn là: " + generatedOtp;

        // Gửi email bằng MailService
        if (khachHang.isPresent()) {
            mailService.sendMail(khachHang.get().getEmail(), subject, body);
        } else if (nhanVien.isPresent()) {
            mailService.sendMail(nhanVien.get().getEmail(), subject, body);
        }

        return new MessageResponse("Mã OTP đã được gửi đến email của bạn.");
    }

    // Xác nhận mã OTP và cho phép đổi mật khẩu
    @PostMapping("/public/reset-password")
    public MessageResponse resetPassword(@RequestBody ResetPasswordRequest request) {
        if (!request.getOtp().equals(generatedOtp)) {
            throw new MessageException("Mã OTP không đúng");
        }

        // Kiểm tra tài khoản tồn tại và đổi mật khẩu
        Optional<KhachHang> khachHang = khachHangRepository.findKhByEmail(request.getEmail());
        Optional<NhanVien> nhanVien = nhanVienRepository.findByEmail(request.getEmail());

        if(khachHang.isPresent()) {
            khachHang.get().setMatKhau(passwordEncoder.encode(request.getNewPassword()));
            khachHangRepository.save(khachHang.get());
        } else if (nhanVien.isPresent()) {
            nhanVien.get().setMatKhau(passwordEncoder.encode(request.getNewPassword()));
            nhanVienRepository.save(nhanVien.get());
        } else {
            throw new MessageException("Không tìm thấy tài khoản");
        }

        return new MessageResponse("Mật khẩu đã được thay đổi thành công.");
    }

    // Tạo mã OTP ngẫu nhiên
    private String generateOtp() {
        Random random = new Random();
        int otp = random.nextInt(999999);
        return String.format("%06d", otp); // Đảm bảo mã OTP có 6 chữ số
    }


    @PostMapping("/admin/check-admin")
    public void checkAdmin() {

    }

    @PostMapping("/user/check-user")
    public void checkUser() {

    }

    @PostMapping("/all/check-all")
    public void checkAll() {

    }


    public Boolean checkUser(Optional<User> users){
        if(users.isPresent() == false){
            throw new MessageException("Không tìm thấy tài khoản", 404);
        }
        else if(users.get().getActivationKey() != null && users.get().getActived() == false){
            throw new MessageException("Tài khoản chưa được kích hoạt", 300);
        }
        else if(users.get().getActived() == false && users.get().getActivationKey() == null){
            throw new MessageException("Tài khoản đã bị khóa", 500);
        }
        return true;
    }
}
