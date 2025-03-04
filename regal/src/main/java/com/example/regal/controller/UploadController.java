package com.example.regal.controller;

import com.example.regal.utils.CloudinaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("/api")
@CrossOrigin
public class UploadController {

    @Autowired
    private CloudinaryService cloudinaryService;

    @PostMapping("/public/upload-file")
    public String uploadFile(@RequestParam("file") MultipartFile file){
        try {
            return cloudinaryService.uploadFile(file);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @PostMapping("/public/upload-multiple-file")
    public List<String> uploadFile(@RequestParam("file") List<MultipartFile> file){
        List<String> list = new ArrayList<>();
        ExecutorService es = Executors.newCachedThreadPool();
        for(int i=0; i<file.size(); i++) {
            Integer x=i;
            es.execute(new Runnable() {
                @Override
                public void run() {
                    try {
                        String image = cloudinaryService.uploadFile(file.get(x));
                        list.add(image);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            });
        }
        es.shutdown();
        try {
            boolean finished = es.awaitTermination(100000, TimeUnit.MINUTES);
            if (finished) {
                return list;
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        return list;
    }
}
