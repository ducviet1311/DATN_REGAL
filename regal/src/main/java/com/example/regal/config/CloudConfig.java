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
        config.put("cloud_name", "dkc0ky8md");
        config.put("api_key", "992598811475483");
        config.put("api_secret", "O8a9j2DPPyCV6hAUlBzc1cWpXRQ");
=======
<<<<<<< HEAD
        config.put("cloud_name", "daowhglcl");
        config.put("api_key", "814613964739531");
        config.put("api_secret", "SR6ZA6kOAL5paQ27zWvxNoRTeA8");
=======
        config.put("cloud_name", "djw90k3et");
        config.put("api_key", "275988259733236");
        config.put("api_secret", "IFB5eUhCnB23cy49xp5ztOVcFVA");
>>>>>>> 6c3d7fb65af90cb226814be30c5d31df00e60baa
>>>>>>> 4550e0fb5a481bd29276900712032b9ff571ca1c
        cloudinary = new Cloudinary(config);
        return cloudinary;
    }

}

