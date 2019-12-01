package controller.authentication;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.restfb.types.User;
import dao.AccountFBDao;
import entity.Account;
import entity.AccountFB;
import service.AccountService;

@WebServlet("/loginfb")
public class LoginFacebookServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;
  public LoginFacebookServlet() {
    super();
  }
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String code = request.getParameter("code");
    
    if (code == null || code.isEmpty()) {
      RequestDispatcher dis = request.getRequestDispatcher("client/login_1.jsp");
      dis.forward(request, response);
    } else {
      String accessToken = RestFB.getToken(code);
      User user = RestFB.getUserInfo(accessToken);
      
        AccountFB account = AccountFB.builder().id(user.getId()).displayName(user.getName()).roleId(4).status(1).build();
      Account account1 = Account.builder().userName(user.getId()).displayName(user.getName()).roleId(4).status(1).build();
    request.getSession().setAttribute("account", account1);
    try{    
    new AccountFBDao().add(account);
    }catch(Exception e){
        
    }
        boolean check =new AccountService().add(account1);
    request.getRequestDispatcher("home").forward(request, response);

    }
    
  }
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
}