package com.example.regal.config;

import com.cloudinary.Cloudinary;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

@Configuration
@SpringBootApplication
public class CloudConfig {

    @Bean
    public Cloudinary cloudinaryConfigs() {
        Cloudinary cloudinary = null;
        Map config = new HashMap();
        config.put("cloud_name", "daowhglcl");
        config.put("api_key", "814613964739531");
        config.put("api_secret", "SR6ZA6kOAL5paQ27zWvxNoRTeA8");
        cloudinary = new Cloudinary(config);
        return cloudinary;
    }

}

