package com.cgv.api;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.cgv.service.MovieImageService;
import com.cgv.service.MovieService;
import com.cgv.vo.MovieVO;

@RestController
public class MovieAPIController {
	
	@Autowired
	MovieService service;
	
	@Autowired
	MovieImageService imageService;
	
	@PostMapping("/api/insert_movie")
	public Map<String, String> insertMovie(@RequestBody MovieVO vo) {
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		String name = vo.getCmi_name();
		boolean result = service.checkedMovie(name);
		if(result) {
			service.insertMovie(vo);
			resultMap.put("status", "success");
			resultMap.put("message", "추가되었습니다.");
			resultMap.put("cmi_seq", vo.getCmi_seq().toString());
		}
		else {
			resultMap.put("status", "failed");
			resultMap.put("message", "["+name+"]은/는 이미 존재합니다.");
		}
		
		return resultMap;
		
	}
	
	@PutMapping("/movie_img/{seq}")
	public Map<String, String> putMovieImage(
			@RequestPart MultipartFile file,
			@PathVariable Integer seq,
			@RequestParam String name
		) throws Exception {
		
		if(file.getOriginalFilename() == "") {
			return null;
		}
		
		MovieVO vo = new MovieVO();
		vo.setCmi_name(name);
		vo.setCmi_seq(seq);
		
		return imageService.insertMovieImage(file, vo);
	}
	
	@GetMapping("/movie_img/{fileName}")
	public ResponseEntity<Resource> getMovieImage(@PathVariable String fileName, HttpServletRequest request) throws Exception {
		Resource resource = imageService.getMovieImage(fileName);
		
		String contentType = null;
		contentType = request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());
		if(contentType == null) {
			contentType = "application/octet-stream";
		}
		
		return ResponseEntity.ok()
				.contentType(MediaType.parseMediaType(contentType))
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename*=\""+resource.getFilename()+"\"")
				.body(resource);
	}
	
	@PatchMapping("/movie_modify")
	public Map<String, String> modifyMovie(@RequestBody MovieVO vo) {
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		service.updateMovie(vo);
		resultMap.put("status", "success");
		resultMap.put("message", "추가되었습니다.");
		
		return resultMap;
	}
	
	@DeleteMapping("/movie_delete")
	public Map<String, String> deleteMovie(@RequestParam Integer seq) {
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		service.deleteMovie(seq);
		resultMap.put("status", "success");
		resultMap.put("message", "삭제되었습니다.");
		
		return resultMap;
	}
}
