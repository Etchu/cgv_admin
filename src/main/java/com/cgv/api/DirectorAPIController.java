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

import com.cgv.service.DirectorService;
import com.cgv.vo.DirectorVO;

@RestController
public class DirectorAPIController {
	@Autowired
	DirectorService service;
	
	@PostMapping("/api/insert_director")
	public Map<String, String> PostDirector(@RequestBody DirectorVO vo) {
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		String name = vo.getCmd_name();
		boolean result = service.checkedDirector(name);
		if(result) {
			resultMap.put("status", "success");
			resultMap.put("message", "추가되었습니다.");
			service.insertDirector(vo);
		}
		else {
			resultMap.put("status", "failed");
			resultMap.put("message", "["+name+"]은/는 이미 존재합니다.");
		}
	
		return resultMap;
	}
	
	@PatchMapping("/director")
	public Map<String, String> updateDirector(@RequestBody DirectorVO vo) {
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		Integer seq = vo.getCmd_seq();
		String name = vo.getCmd_name();
		String content = vo.getCmd_content();
		
		boolean updateStatus = service.checkedDirector(name);
		
		if(updateStatus) {
			resultMap.put("status", "success");
			resultMap.put("message", "변경되었습니다.");
			System.out.println(seq+":"+name+":"+content);
			service.updateDirector(vo);
		}
		else {
			resultMap.put("status", "failed");
			resultMap.put("message", "배우 이름이 중복됩니다.");
		}
		
		return resultMap;
	}
	
	@DeleteMapping("/director")
	public Map<String, String> deleteDirector(@RequestParam Integer seq) {
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		service.deleteDirector(seq);
		resultMap.put("status", "success");
		resultMap.put("message", "삭제되었습니다.");
		
		return resultMap;
	}
	
	@GetMapping("/director_list")
	public List<DirectorVO> getDirector() {
		return service.selectDirectors();
	}
	
	@PostMapping("/sel_director_list")
	public List<DirectorVO> postDirectorList(@RequestParam String keyword) {
		
		if(keyword != null){
			keyword = ("%"+keyword+"%");
		}
		return service.selectDirectorPopupList(keyword);
	}
	
	@GetMapping("/sel_director_list/{seq}")
	public DirectorVO getSelectedDirector(@PathVariable Integer seq) {
		
		return service.selectDirectorBySeq(seq);
	}
	
	@PostMapping("/director_in_movie")
	public Map<String, String> insertDirectorInMovie(@RequestBody DirectorVO vo) {
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		service.insertDirectorInMovie(vo);
		
		resultMap.put("status", "success");
		resultMap.put("message", "추가되었습니다.");
		
		return resultMap;
		
	}
	
	@DeleteMapping("/del_movieDirector")
	public Map<String, String> deleteMovieInDirector(@RequestParam Integer seq) {
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		service.deleteMovieInDirector(seq);
		resultMap.put("status", "success");
		resultMap.put("message", "삭제되었습니다.");
		
		return resultMap;
	}
}
