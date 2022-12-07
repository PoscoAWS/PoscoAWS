package Pack01;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
}
