package util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/*")
public class HTTPErrorHandler {	

	@RequestMapping(method = RequestMethod.GET)
	public String erro404(HttpServletRequest request, ModelMap model){
		return "404";
	}
}
