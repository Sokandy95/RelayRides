package com.RelayRides.mvc;

import javax.annotation.Resource;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.CommandLineRunner;

import com.RelayRides.mvc.services.FileService;

@SpringBootApplication
public class RelayRidesApplication implements CommandLineRunner {

	@Resource
	FileService fileService;

	public static void main(String[] args) {
		SpringApplication.run(RelayRidesApplication.class, args);
	}
<<<<<<< HEAD
	

=======

	// implemented from commandlinerunner
>>>>>>> ff4c55077169841d7210b2ba1626cdfed661ce2c
	@Override
	public void run(String... arg) throws Exception {
		this.fileService.init();
	}

}
