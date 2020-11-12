package Controllers;

import myPackage.DatabaseClass;
import myPackage.classes.Courses;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/CourseController")
public class CourseController extends HttpServlet {
    private DatabaseClass db = null;
    private DatabaseClass pDAO = new DatabaseClass();

    public CourseController() throws SQLException, ClassNotFoundException {
        db = new DatabaseClass();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "add":
                add(request,response);
                break;
            case "update":
                String fCourseID = request.getParameter("fCourseID");
                String fCourseName = request.getParameter("fCourseName");
                int fMark = Integer.parseInt(request.getParameter("fMark"));
                String ftime = request.getParameter("ftime");
                pDAO.updateCourse(fCourseID,fCourseName,fMark,ftime);
                request.getSession().removeAttribute("isUpdate");
                request.getSession().removeAttribute("courseUpdate");
                response.sendRedirect("adm-page.jsp?pgprt=2");
                break;

        }
    }

    private void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
        db.addNewCourse(request.getParameter("coursename"),Integer.parseInt(request.getParameter("totalmarks")),
                request.getParameter("time"),request.getParameter("courseCode"));
        response.sendRedirect("adm-page.jsp?pgprt=2");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {

            case "update":
                Courses courses = pDAO.getCourseIdDetails(request.getParameter("fCourseID"));
                request.getSession().setAttribute("isUpdate",1);
                request.getSession().setAttribute("courseUpdate",courses);
                response.sendRedirect("adm-page.jsp?pgprt=2");
                break;
            case "delete":
                pDAO.delCourseCode(request.getParameter("fCourseID").trim());
                response.sendRedirect("adm-page.jsp?pgprt=2");
                break;
        }
    }
}
