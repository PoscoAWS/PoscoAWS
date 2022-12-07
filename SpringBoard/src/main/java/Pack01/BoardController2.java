package Pack01;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController2 {

	@RequestMapping("getList")
	public String insertUser(BoardVO board) {
		System.out.println("getList");
		BoardListDao boardListDao = new BoardListDao(board);
		boardListDao.getList();
		return "list";
}
}