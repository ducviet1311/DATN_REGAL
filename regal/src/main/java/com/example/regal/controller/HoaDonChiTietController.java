package com.example.regal.controller;

import com.example.regal.entity.HoaDon;
import com.example.regal.entity.HoaDonChiTiet;
import com.example.regal.entity.SanPhamChiTiet;
import com.example.regal.exception.MessageException;
import com.example.regal.repository.HoaDonChiTietRepository;
import com.example.regal.repository.HoaDonRepository;
import com.example.regal.repository.SanPhamChiTietRepository;
import com.example.regal.service.impl.SanPhamChiTietServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.List;

@RestController
@RequestMapping("/api/hoa-don-chi-tiet")
@RequiredArgsConstructor
public class HoaDonChiTietController {

    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;

    @Autowired
    private final SanPhamChiTietServiceImpl sanPhamChiTietService;


    @Autowired
    private SanPhamChiTietRepository sanPhamChiTietRepository;

    @Autowired
    private HoaDonRepository hoaDonRepository;

    @GetMapping("/find-by-hoa-don")
    public ResponseEntity<?> findByHoaDon(@RequestParam Integer hoaDonId){
        List<HoaDonChiTiet> list = hoaDonChiTietRepository.findHoaDonChiTietByIdHoaDon(hoaDonId);
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @PostMapping("/them-vao-hoa-don")
    public ResponseEntity<?> addChiTiet(@RequestParam Integer hoaDonId, @RequestParam Integer chiTietSp, @RequestParam Integer soLuong){
        List<HoaDonChiTiet> list = hoaDonChiTietRepository.findHoaDonChiTietByIdHoaDon(hoaDonId);
        SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietRepository.findById(chiTietSp).get();
        if(soLuong > sanPhamChiTiet.getSoLuong()){
            throw new MessageException("Số lượng không được vượt quá "+sanPhamChiTiet.getSoLuong());
        }
        HoaDon hoaDon = hoaDonRepository.findById(hoaDonId).get();
        Boolean check = false;
        for(HoaDonChiTiet h : list){
            if(h.getSanPhamChiTiet().getId() == chiTietSp){
                check = true;
                h.setSoLuong((short) (soLuong.shortValue() + h.getSoLuong()));
                Short sl =(short) (soLuong.shortValue() + h.getSoLuong());
                if(sl > sanPhamChiTiet.getSoLuong()){
//                    int check_sl = sanPhamChiTiet.getSoLuong()-h.getSoLuong() < 0 ? 0 : sanPhamChiTiet.getSoLuong()-h.getSoLuong();
//                    throw new MessageException("Bạn chỉ được thêm "+(check_sl)+" nữa");
                    h.setSoLuong(soLuong.shortValue());
                    hoaDonChiTietRepository.save(h);
                    break;
                }
//                h.setSoLuong(sl);
                hoaDonChiTietRepository.save(h);
                break;
            }
        }
        if(check == false){
            HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
            hoaDonChiTiet.setSanPhamChiTiet(sanPhamChiTiet);
            hoaDonChiTiet.setHoaDon(hoaDon);
            hoaDonChiTiet.setSoLuong(soLuong.shortValue());
            hoaDonChiTiet.setTrangThai(1);
            hoaDonChiTiet.setGiaSanPham(new BigDecimal(sanPhamChiTiet.getGiaTien()));
            hoaDonChiTietRepository.save(hoaDonChiTiet);
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PostMapping("/updateSoLuong")
    public ResponseEntity<?> updateSoLuong(@RequestParam Integer id, @RequestParam Integer soLuong){
        HoaDonChiTiet hoaDonChiTiet = hoaDonChiTietRepository.findById(id).get();
        if(soLuong > hoaDonChiTiet.getSanPhamChiTiet().getSoLuong()){
            throw new MessageException("Số lượng không được vượt quá "+hoaDonChiTiet.getSanPhamChiTiet().getSoLuong());
        }
        hoaDonChiTiet.setSoLuong((short) (hoaDonChiTiet.getSoLuong() + soLuong.shortValue()));
        hoaDonChiTietRepository.save(hoaDonChiTiet);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PostMapping("/updateSoLuongEnter")
    public ResponseEntity<?> updateSoLuong_enter(@RequestParam Integer id, @RequestParam Integer soLuong , @RequestParam Integer slold){
        HoaDonChiTiet hoaDonChiTiet = hoaDonChiTietRepository.findById(id).get();
//        sanPhamChiTietService.update_quality_detail_product(hoaDonChiTiet.getSanPhamChiTiet().getId(), 0, -slold);
        if(soLuong > hoaDonChiTiet.getSanPhamChiTiet().getSoLuong()){
            throw new MessageException("Số lượng không được vượt quá "+hoaDonChiTiet.getSanPhamChiTiet().getSoLuong());
        }
        if(soLuong == hoaDonChiTiet.getSanPhamChiTiet().getSoLuong()){

        }

//        sanPhamChiTietService.update_quality_detail_product(hoaDonChiTiet.getSanPhamChiTiet().getId(), -slold, soLuong);
        hoaDonChiTiet.setSoLuong(soLuong.shortValue());
        hoaDonChiTietRepository.save(hoaDonChiTiet);
        return new ResponseEntity<>(HttpStatus.OK);
    }


    @DeleteMapping("/xoa-chi-tiet-don-cho")
    public ResponseEntity<?> xoa(@RequestParam Integer id){
        HoaDonChiTiet hoaDonChiTiet = hoaDonChiTietRepository.findById(id).get();
        hoaDonChiTietRepository.deleteById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
