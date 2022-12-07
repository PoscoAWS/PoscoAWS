package Pack01;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import Pack01.BoardVO;
@Controller
@RequestMapping("/board/*")
public class BoardController {

    @RequestMapping(value="/list", method=RequestMethod.GET) //url mapping
    public void getList() throws Exception{

    }
}