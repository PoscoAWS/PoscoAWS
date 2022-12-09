package Pack01;
import java.io.File;
import java.net.URL;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import Pack01.board.BoardDao;
import Pack01.board.CommentVO;
import util.JdbcTemplate;

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
    public String postcreate(@RequestParam(value = "id") String id,
    		@RequestParam(value = "name") String name,
    		@RequestParam(value = "title") String title,
    		@RequestParam(value = "contents") String contents,
    		@RequestParam(value = "file") MultipartFile file,
    		HttpServletRequest request,
    		Model model) throws Exception {
		

		String currDir = BoardController2.class.getResource(".").getPath();
		
		
		URL resource = getClass().getClassLoader().getResource("file");
		String filePath = resource.getFile();

		System.out.println(file);
		String savedFileName = "";
		// 1. 파일 저장 경로 설정 : 실제 서비스되는 위치(프로젝트 외부에 저장)
		//String uploadPath = filePath.substring(1, filePath.length());
//		String uploadPath = "C:\\isohyeon\\GitHub\\PoscoAWS\\SpringBoard\\src\\main\\webapp\\";
		String uploadPath = "/var/lib/tomcat9/webapps/";
		System.out.println(uploadPath);
		// 2. 원본 파일 이름 알아오기
		String originalFileName = file.getOriginalFilename();
		// 3. 파일 이름 중복되지 않게 이름 변경(서버에 저장할 이름) UUID 사용
		UUID uuid = UUID.randomUUID();
		savedFileName = uuid.toString() + "_" + originalFileName;
		// 4. 파일 생성
		File file1 = new File(uploadPath + savedFileName);
		// 5. 서버로 전송
		file.transferTo(file1);
		// model로 저장
		model.addAttribute("originalFileName", savedFileName);

		
		BoardVO board = new BoardVO();
		board.setId(id);
		board.setName(name);
		board.setTitle(title);
		board.setContents(contents);
		board.setFile(uploadPath + savedFileName);

		
		
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
		
		BoardDao boardDao = new BoardDao();
		List<CommentVO> commentList =  boardDao.getCommets(boardNo);
		
		model.addAttribute("listArray", listArray);
		model.addAttribute("commentList", commentList);
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
