package Pack01;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginUser {
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
}
