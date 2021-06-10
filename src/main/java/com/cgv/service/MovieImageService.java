package com.cgv.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.cgv.mapper.MovieImageMapper;
import com.cgv.vo.MovieImageVO;
import com.cgv.vo.MovieVO;

@Service
public class MovieImageService {
	@Autowired
	MovieImageMapper mapper;
	public Map<String, String> insertMovieImage(MultipartFile file, MovieVO vo) throws Exception {
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		Path movieImageLocation = Paths.get("/cgv/movie_imgs");
		MovieImageVO imgVO = new MovieImageVO();
		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
		
		//String regex = "!\\\"#[$]%&\\\\(\\\\)\\\\{\\\\}@`[*]:[+];-.<>,\\\\^~|'\\\\[\\\\]";
		// ! \ # $ % & ( ) { } @ * + - < > | [ ] ' "
		//fileName = vo.getBrand_name().replaceAll(regex, "_")+"_"+vo.getMkp_name()+"_"+fileName.replaceAll(regex, "_");
		fileName = vo.getCmi_name()+"_"+fileName;
		imgVO.setCmii_uri(fileName.substring(0, fileName.indexOf(".")));
		
		Calendar c = Calendar.getInstance();
		String currentDate = ""+
				c.get(Calendar.YEAR)+(c.get(Calendar.MONTH)+1)+c.get(Calendar.DATE)+
				c.get(Calendar.HOUR_OF_DAY)+c.get(Calendar.MINUTE);
		fileName = currentDate+"_"+fileName;
		imgVO.setCmii_real_path(fileName);
		imgVO.setCmii_movie_seq(vo.getCmi_seq());
		imgVO.setCmii_size(file.getSize());
		imgVO.setCmii_name(file.getOriginalFilename());
		Path targetLocation = movieImageLocation.resolve(fileName);
		Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);
		mapper.insertMovieImage(imgVO);
		return resultMap;
	}
	
	public Resource getMovieImage(String fileName) throws Exception {
		MovieImageVO vo = mapper.selectMovieImage(fileName);
		Path movieImageLocation = Paths.get("/cgv/movie_imgs");
		Path movieImagePath = movieImageLocation.resolve(vo.getCmii_real_path()).normalize();
		Resource resource = new UrlResource(movieImagePath.toUri());
		return resource;
	}
}






