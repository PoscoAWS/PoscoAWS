//package Pack01.board;
//
//import java.io.IOException;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.social.google.connect.GoogleConnectionFactory;
//import org.springframework.social.oauth2.GrantType;
//import org.springframework.social.oauth2.OAuth2Operations;
//import org.springframework.social.oauth2.OAuth2Parameters;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//
//@Controller
//public class GoogleController {
//	@Autowired
//	private GoogleConnectionFactory googleConnectionFactory;
//
//	@Autowired
//	private OAuth2Parameters googleOAuth2Parameters;
//
//	// 로그인 페이지로 이동하는 컨트롤러
//	@RequestMapping(value = "googleLogin")
//	public String initLogin(Model model, HttpSession session) throws Exception {
//
//		/* 구글code 발행 */
//		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
//
//		/* 로그인페이지 이동 url생성 */
//		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
//
//		model.addAttribute("google_url", url);
//
//		/* 생성한 인증 URL을 Model에 담아서 전달 */
//		return "page1/login.all";
//	}
//
//	// 구글 Callback호출 메소드
//	@RequestMapping(value = "oauth2callback.do", method = { RequestMethod.GET, RequestMethod.POST })
//	public String googleCallback(Model model, @RequestParam String code) throws IOException {
//
//		System.out.println("Google login success");
//
//		// 저는 성공하면 메인페이지로 리다이렉트합니다.
//		return "redirect:main.do";
//	}
//}
