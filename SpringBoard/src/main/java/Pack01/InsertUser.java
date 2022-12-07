package Pack01;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InsertUser {
	@RequestMapping("insertUser")
	public String insertUser(Model model, UserVO user) {
		
		UserInsertDao insertDao = new UserInsertDao(user);
		
		boolean result = insertDao.insertUser();
		model.addAttribute("result", result);
		
		return "userInsertEndView";
	}
}
