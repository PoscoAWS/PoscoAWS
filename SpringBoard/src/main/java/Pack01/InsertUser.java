package Pack01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InsertUser {
	@RequestMapping("insertUser")
	public String insertUser(UserVO user) {
		System.out.println("insertUser");
		System.out.println(user.name);
		UserInsertDao insertDao = new UserInsertDao(user);
		insertDao.insertUser();
		return "userInsertEndView";
	}
}
