package Pack01.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Pack01.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	BoardDao boardDao;
	
	@RequestMapping(value="boardList", method=RequestMethod.GET)
	public String getList(Model model) {
		List<BoardVO> allList = boardDao.getList();
		model.addAttribute("allList", allList);
		return "list";
	}
	
	@RequestMapping(value = "detail.do", method = RequestMethod.GET)
    public String getdetail(Model model, @RequestParam(value="boardNo") int boardNo) {
		List<BoardVO> allList = boardDao.getList();
		BoardVO listArray = null;
		for (BoardVO boardVO : allList) {
			if (boardVO.getBoardNo() == boardNo)
				listArray = boardVO;
		}
		model.addAttribute("listArray", listArray);
       return "detail";
    }
}


