package Pack01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//@RestController
@Controller
public class Tiger {
	@RequestMapping("/t1")
	public String func01() {
		// 데이터 베이스 작업
		System.out.println("function call");
//		return "apple";
		return "TigerView";
	}
}
