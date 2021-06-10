package com.cgv.api;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cgv.service.GenreService;
import com.cgv.vo.GenreVO;

@RestController
public class GenreAPIController {
	
	@Autowired
	GenreService service;
	
	@PostMapping("/api/insert_genre")
	public Map<String, String> PostGenre(@RequestParam String name) {
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		boolean result = service.checkedGenre(name);
		if(result) {
			resultMap.put("status", "success");
			resultMap.put("message", "추가되었습니다.");
			service.insertGenre(name);
		}
		else {
			resultMap.put("status", "failed");
			resultMap.put("message", "["+name+"]은/는 이미 존재합니다.");
		}
	
		return resultMap;
	}
	
	@PatchMapping("/genre/{seq}")
	public Map<String, String> updateGenre(@PathVariable Integer seq, @RequestParam String name) {
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		GenreVO vo = new GenreVO();
		vo.setCmg_seq(seq);
		vo.setCmg_name(name);
		
		boolean updateStatus = service.checkedGenre(name);
		
		if(updateStatus) {
			resultMap.put("status", "success");
			resultMap.put("message", "변경되었습니다.");
			System.out.println(seq+":"+name);
			service.updateGenre(vo);
		}
		else {
			resultMap.put("status", "failed");
			resultMap.put("message", "장르 이름이 중복됩니다.");
		}
		
		return resultMap;
	}
	
	@DeleteMapping("/genre")
	public Map<String, String> deleteGenre(@RequestParam Integer seq) {
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		service.deleteGenre(seq);
		resultMap.put("status", "success");
		resultMap.put("message", "삭제되었습니다.");
		
		return resultMap;
	}
	
	@GetMapping("/genre_list")
	public List<GenreVO> getGenre() {
		return service.selectGenres();
	}
	
	@PostMapping("/sel_genre_list")
	public List<GenreVO> postGenreList(@RequestParam String keyword) {
		
		if(keyword != null){
			keyword = ("%"+keyword+"%");
		}
		return service.selectGenrePopupList(keyword);
	}
	
	@GetMapping("/sel_genre_list/{seq}")
	public GenreVO getSelectedGenre(@PathVariable Integer seq) {
		
		return service.selectGenreBySeq(seq);
	}
	
	@PostMapping("/genre_in_movie")
	public Map<String, String> insertGenreInMovie(@RequestBody GenreVO vo) {
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		service.insertGenreInMovie(vo);
		
		resultMap.put("status", "success");
		resultMap.put("message", "추가되었습니다.");
		
		return resultMap;
		
	}
	
	@DeleteMapping("/del_movieGenre")
	public Map<String, String> deleteMovieInGenre(@RequestParam Integer seq) {
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		service.deleteMovieInGenre(seq);
		resultMap.put("status", "success");
		resultMap.put("message", "삭제되었습니다.");
		
		return resultMap;
	}
}
