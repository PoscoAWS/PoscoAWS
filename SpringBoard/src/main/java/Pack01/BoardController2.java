package Pack01;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController2 {

	@RequestMapping(value="list.do", method=RequestMethod.GET)
	public String getList(HttpServletRequest request, Model model) {
		List<BoardVO> allList = BoardListDao.getList();
		model.addAttribute("allList", allList);
		return "list";
}
	
	@RequestMapping(value = "create.do", method = RequestMethod.GET)
    public String getcreate() throws Exception {
       return "create";
    }
	
	@RequestMapping(value = "create2.do", method = RequestMethod.POST)
    public String postcreate(HttpServletRequest request, Model model) throws Exception {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String file = request.getParameter("uploadFile");
		
		BoardVO board = new BoardVO();
		board.setId(id);
		board.setName(name);
		board.setTitle(title);
		board.setContents(contents);
		board.setFile(file);
		
		BoardCreateDao.boardInsert(board);
		return "redirect:list.do";
		
    }
	
	@RequestMapping(value = "detail.do", method = RequestMethod.GET)
    public String getdetail() {
       return "detail";
    }
	
	@RequestMapping(value = "update.do", method = RequestMethod.GET)
    public String getupdate() throws Exception {

       return "update";
    }
	
	
}