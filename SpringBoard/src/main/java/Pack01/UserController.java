package Pack01;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
	@RequestMapping("loginUser")
	public String loginUser(Model model,
			@RequestParam(value="id") String id,
			@RequestParam(value="pw") int pw) {
		
		LoginDao login = new LoginDao(id, pw);
		String name = login.loginUser();
		
		model.addAttribute("name", name);
		model.addAttribute("id", id);
		
		
		return "loginEnd";
	}

	@RequestMapping("insertUser")
	public String insertUser(Model model, UserVO user) {
		
		UserInsertDao insertDao = new UserInsertDao(user);
		
		boolean result = insertDao.insertUser();
		model.addAttribute("result", result);
		
		return "userInsertEndView";
	}
	
	@RequestMapping(value="idDuplicateCheck", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public JSONObject idDuplicateCheck(@RequestBody String kakaoId) {
		JSONObject jsonObj = new JSONObject();
		
		LoginDao dao = new LoginDao(kakaoId);
		jsonObj.put("check", dao.kakaoUser(kakaoId));
		return jsonObj;
	}
	
	@RequestMapping("loginKakaoUser")
	public String loginUser(Model model, @RequestParam(value="id") String id, @RequestParam(value="name") String name) {
		
		model.addAttribute("name", name);
		model.addAttribute("id", id);
		
		return "loginEnd";
	}

	@RequestMapping(value="kakaoSignUp", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Boolean kakaoSignUp(Model model, @RequestBody UserVO user) {
		System.out.println(user.toString());
		
		UserInsertDao insertDao = new UserInsertDao();
		boolean result = insertDao.kakaoSignUp(user);
		
		System.out.println(result);
		return result;
	}
	
	
}
