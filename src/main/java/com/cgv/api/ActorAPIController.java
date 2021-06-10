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

import com.cgv.service.ActorService;
import com.cgv.vo.ActorVO;

@RestController
public class ActorAPIController {
	
	@Autowired
	ActorService service;
	
	@PostMapping("/api/insert_actor")
	public Map<String, String> PostActor(@RequestBody ActorVO vo) {
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		String name = vo.getCma_name();
		boolean result = service.checkedActor(name);
		if(result) {
			resultMap.put("status", "success");
			resultMap.put("message", "추가되었습니다.");
			service.insertActor(vo);
		}
		else {
			resultMap.put("status", "failed");
			resultMap.put("message", "["+name+"]은/는 이미 존재합니다.");
		}
	
		return resultMap;
	}
	
	@PatchMapping("/actor")
	public Map<String, String> updateActor(@RequestBody ActorVO vo) {
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		Integer seq = vo.getCma_seq();
		String name = vo.getCma_name();
		String content = vo.getCma_content();
		
		boolean updateStatus = service.checkedActor(name);
		
		if(updateStatus) {
			resultMap.put("status", "success");
			resultMap.put("message", "변경되었습니다.");
			System.out.println(seq+":"+name+":"+content);
			service.updateActor(vo);
		}
		else {
			resultMap.put("status", "failed");
			resultMap.put("message", "배우 이름이 중복됩니다.");
		}
		
		return resultMap;
	}
	
	@DeleteMapping("/actor")
	public Map<String, String> deleteActor(@RequestParam Integer seq) {
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		service.deleteActor(seq);
		resultMap.put("status", "success");
		resultMap.put("message", "삭제되었습니다.");
		
		return resultMap;
	}
	
	@GetMapping("/actor_list")
	public List<ActorVO> getActor() {
		return service.selectActors();
	}
	
	@PostMapping("/sel_actor_list")
	public List<ActorVO> postActorList(@RequestParam String keyword) {
		
		if(keyword != null){
			keyword = ("%"+keyword+"%");
		}
		return service.selectActorPopupList(keyword);
	}
	
	@GetMapping("/sel_actor_list/{seq}")
	public ActorVO getSelectedActor(@PathVariable Integer seq) {
		
		return service.selectActorBySeq(seq);
	}
	
	@PostMapping("/actor_in_movie")
	public Map<String, String> insertActorInMovie(@RequestBody ActorVO vo) {
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		service.insertActorInMovie(vo);
		
		resultMap.put("status", "success");
		resultMap.put("message", "추가되었습니다.");
		
		return resultMap;
		
	}
	
	@DeleteMapping("/del_movieActor")
	public Map<String, String> deleteMovieInActor(@RequestParam Integer seq) {
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		service.deleteMovieInActor(seq);
		resultMap.put("status", "success");
		resultMap.put("message", "삭제되었습니다.");
		
		return resultMap;
	}
}
