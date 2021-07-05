package ua.summer;

import java.io.IOException;
import javax.servlet.http.*;

public class Questionnaire extends javax.servlet.http.HttpServlet {


    private int countQuestion1No ;//підрахунок відпові для таблиці
    private int  countQuestion1Yes;
    private  int countQuestion2Yes ;
    private int countQuestion2No ;




    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, IOException {



        if (request.getParameter("question1") == null || request.getParameter("question2") == null)
        {//при отриманні пустого пункту відправляємо користувача знову до тесту
            HttpSession session = request.getSession(true);


            session.setAttribute("havAllTheQuestionsBeenAnswered", false);

        }


      else  {
            Integer question1 = Integer.parseInt(request.getParameter("question1"));
            Integer question2 = Integer.parseInt(request.getParameter("question2"));
            HttpSession session = request.getSession(true);
            if (question1 ==1)
                this.countQuestion1Yes++;//додаємо до кісльнсті однакових відповідей
            if (question1 ==2)
                this.countQuestion1No++;

            if(question2 == 1)
                this.countQuestion2Yes++;
            if (question2 ==2)
                this.countQuestion2No++;

            session.setAttribute("havAllTheQuestionsBeenAnswered", true );
            session.setAttribute("countQuestion1Yes", countQuestion1Yes );
            session.setAttribute("countQuestion1No" , countQuestion1No);
            session.setAttribute("countQuestion2Yes" ,countQuestion2Yes );
            session.setAttribute("countQuestion2No" , countQuestion2No);
           }



        response.sendRedirect("index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String a = request.getParameter("a");
        HttpSession session = request.getSession(false);

        if ("exit".equals(a) && (session != null)) {
            session.removeAttribute("havAllTheQuestionsBeenAnswered");
            session.removeAttribute("countQuestion1Yes");
            session.removeAttribute("countQuestion1No" );
            session.removeAttribute("countQuestion2Yes"  );
            session.removeAttribute("countQuestion2Yes" );
        }

        response.sendRedirect("index.jsp");
    }
}
