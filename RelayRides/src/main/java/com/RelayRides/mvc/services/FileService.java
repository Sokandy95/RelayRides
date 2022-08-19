package com.RelayRides.mvc.services;

import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileService {

	private final Path root = Paths.get("uploads/");

	// create folder for files
	public void init() throws IOException {

		if (!Files.exists(root)) {
			try {
				Files.createDirectory(root);
			} catch (IOException e) {
				throw new RuntimeException("could not initialize folder for upload");
			}
		}

	}

	public String save(MultipartFile file) {
		try {
			Path savePath = this.root.resolve(file.getOriginalFilename());
			Files.copy(file.getInputStream(), savePath);
			System.out.println(savePath.toString());
			return savePath.toString();
		} catch (Exception e) {
			return null;
		}
	}

	public Resource load(String filename) {
		try {
			Path file = root.resolve(filename);
			Resource resource = new UrlResource(file.toUri());

			if (resource.exists() || resource.isReadable()) {
				return resource;
			} else {
				throw new RuntimeException("could not read the file");
			}
		} catch (MalformedURLException e) {
			throw new RuntimeException("Error: " + e.getMessage());
		}
	}

}
