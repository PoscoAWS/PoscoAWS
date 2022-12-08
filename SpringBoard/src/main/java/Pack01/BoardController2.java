package Pack01;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Pack01.board.BoardDao;

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
		String file = request.getParameter("file");
		
		BoardVO board = new BoardVO();
		board.setId(id);
		board.setName(name);
		board.setTitle(title);
		board.setContents(contents);
		board.setFile(file);
		
		
		BoardCreateDao.boardInsert(board);
		List<BoardVO> allList = BoardListDao.getList();
		model.addAttribute("allList", allList);
		return "list";
		
    }
	
	@RequestMapping(value = "detail.do", method = RequestMethod.GET)
    public String getdetail(Model model,
    		@RequestParam(value="boardNo") int boardNo) {
		List<BoardVO> allList = BoardListDao.getList();
		BoardVO listArray = null;
		for (BoardVO boardVO : allList) {
			if (boardVO.boardNo == boardNo)
				listArray = boardVO;
		}
		model.addAttribute("listArray", listArray);
       return "detail";
    }
	
	@RequestMapping(value = "update.do", method = RequestMethod.GET)
    public String getupdate(Model model,
    		@RequestParam(value="boardNo") int boardNo) throws Exception {
		System.out.println(boardNo);
		List<BoardVO> allList = BoardListDao.getList();
		BoardVO board = null;
		for (BoardVO boardVO : allList) {
			if (boardVO.boardNo == boardNo)
				board = boardVO;
		}
		model.addAttribute("board", board);
		
       return "update";
    }
	
	@RequestMapping(value = "update.do", method = RequestMethod.POST)
    public String getupdate2(Model model, BoardVO board) {
		
		BoardDao boardDao = new BoardDao();
		boardDao.updateBoard(board);
		model.addAttribute("listArray", board);
		List<BoardVO> allList = BoardListDao.getList();
		model.addAttribute("allList", allList);
		return "list";
	}
}
