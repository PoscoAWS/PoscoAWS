package Pack01.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Pack01.BoardListDao;
import Pack01.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	BoardDao boardDao;
	
	@RequestMapping(value="boardList", method=RequestMethod.GET)
	public String getList(Model model, HttpServletRequest request,HttpServletResponse response) {
		List<BoardVO> allList = boardDao.getList();
		model.addAttribute("allList", allList);
		return "list";
	}
	
	@RequestMapping(value="delete.do", method=RequestMethod.GET)
	public String deleteBoard(Model model,
			@RequestParam(value="boardNo") int boardNo) {
		
		BoardDao boardDao = new BoardDao();
		boardDao.deleteBoard(boardNo);
		
		List<BoardVO> allList = boardDao.getList();
		model.addAttribute("allList", allList);
		return "list";
	}
	
	
//	@RequestMapping(value = "detail.do", method = RequestMethod.GET)
//    public String getdetail(Model model, @RequestParam(value="boardNo") int boardNo) {
//		List<BoardVO> allList = boardDao.getList();
//		BoardVO listArray = null;
//		for (BoardVO boardVO : allList) {
//			if (boardVO.getBoardNo() == boardNo)
//				listArray = boardVO;
//		}
//		model.addAttribute("listArray", listArray);
//       return "detail";
//    }
	@RequestMapping(value="insertComment", method=RequestMethod.POST)
	public String insertComment(Model model,
			CommentDTO comment) {
		
		BoardDao boardDao = new BoardDao();
		boardDao.insertCommet(comment);
		List<CommentVO> commentList =  boardDao.getCommets(comment.getBoardNo());
		List<BoardVO> allList = BoardListDao.getList();
		BoardVO listArray = null;
		for (BoardVO boardVO : allList) {
			if (boardVO.getBoardNo() == comment.getBoardNo())
				listArray = boardVO;
		}
		model.addAttribute("listArray", listArray);
		model.addAttribute("commentList", commentList);
		return "detail";
	}
	
	@RequestMapping(value="deleteCommet", method=RequestMethod.GET)
	public String deleteCommet(Model model,
			@RequestParam(value="commentNo") int commentNo,
			@RequestParam(value="boardNo") int boardNo) {
		
		BoardDao boardDao = new BoardDao();
		
		boardDao.deleteCommet(commentNo);
		
		
		List<CommentVO> commentList =  boardDao.getCommets(boardNo);
		List<BoardVO> allList = BoardListDao.getList();
		BoardVO listArray = null;
		for (BoardVO boardVO : allList) {
			if (boardVO.getBoardNo() == boardNo)
				listArray = boardVO;
		}
		model.addAttribute("listArray", listArray);
		model.addAttribute("commentList", commentList);
		return "detail";
	}
}


