//package Pack01;
//import java.util.List;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//@Controller
//public class BoardController2 {
//
//	@RequestMapping(value="list.do", method=RequestMethod.GET)
//	public String getList(Model model) {
//		List<BoardVO> allList = BoardListDao.getList();
//		model.addAttribute("allList", allList);
//		return "list";
//	}
//	
//	@RequestMapping(value = "create.do", method = RequestMethod.GET)
//    public String getcreate() throws Exception {
//       return "create";
//    }
//	
//	@RequestMapping(value = "create2.do", method = RequestMethod.POST)
//    public String postcreate() throws Exception {
//       return "redirect:list";
//    }
//	
//	@RequestMapping(value = "detail.do", method = RequestMethod.GET)
//    public String getdetail() {
//       return "detail";
//    }
//	
//	@RequestMapping(value = "update.do", method = RequestMethod.GET)
//    public String getupdate() throws Exception {
//
//       return "update";
//    }
//	
//	
//}