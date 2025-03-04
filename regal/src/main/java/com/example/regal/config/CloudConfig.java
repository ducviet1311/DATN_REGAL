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
<<<<<<< HEAD
        config.put("cloud_name", "daowhglcl");
        config.put("api_key", "814613964739531");
        config.put("api_secret", "SR6ZA6kOAL5paQ27zWvxNoRTeA8");
=======
        config.put("cloud_name", "djw90k3et");
        config.put("api_key", "275988259733236");
        config.put("api_secret", "IFB5eUhCnB23cy49xp5ztOVcFVA");
>>>>>>> 6c3d7fb65af90cb226814be30c5d31df00e60baa
        cloudinary = new Cloudinary(config);
        return cloudinary;
    }

}

