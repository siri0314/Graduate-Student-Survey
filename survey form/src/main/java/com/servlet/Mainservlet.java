//Sreelalitha
//This is main servlet program used to handle doGet and doPost methods to respective programs

package com.servlet;

import java.io.IOException;

import com.bean.DataBean;
import com.bean.StudentBean;
import com.dao.DataProcessor;
import com.dao.StudentDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



public class Mainservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Mainservlet() {}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		StudentDAO dao = new StudentDAO();
		dao.setFname(request.getParameter("fname"));
		dao.setLname(request.getParameter("lname"));
		dao.setStudentid(request.getParameter("studentid"));
		dao.setEmail(request.getParameter("email"));
		dao.setStreetaddress(request.getParameter("streetaddress"));
		dao.setCity(request.getParameter("city"));
		dao.setCountry(request.getParameter("country"));
		dao.setState(request.getParameter("state"));
		dao.setZipcode(request.getParameter("zipcode"));
		dao.setData(request.getParameter("data"));
		dao.setTelephone(request.getParameter("telephone"));
		dao.setUrl(request.getParameter("url"));
		dao.setSurveydate(request.getParameter("surveydate"));
		String likevalues="";
		String vals[]=request.getParameterValues("likemost");
		for(int i=0;i< vals.length;i++)
		{
			likevalues+= vals[i]+",";
		}
		dao.setLikemost(likevalues);
		dao.setIntuniversity(request.getParameter("interestInUniversity"));
		dao.setComments(request.getParameter("comments"));
		dao.setMonth(request.getParameter("month"));
		dao.setGraduationYear(request.getParameter("graduationYear"));
		dao.setRecommend(request.getParameter("recommend"));
		
		Object sids = dao.storedata();
		System.out.println("SIDS : "+ sids);
		if(sids!=null)
		{
			DataProcessor dp = new DataProcessor();
			DataBean dbean = dp.calculate(dao.getData());
			request.setAttribute("dataBean", dbean);
			request.setAttribute("stdids", sids);
			if(dbean.getMean() >= 90)
			{
				RequestDispatcher rd = request.getRequestDispatcher("jsp/WinnerAck.jsp");
				rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd = request.getRequestDispatcher("jsp/SimpleAck.jsp");
				rd.forward(request, response);
			}
		}
		else
		{
			request.setAttribute("errorID", "Student with a similar ID Already exist, Please enter your unique ID");
			RequestDispatcher rd = request.getRequestDispatcher("jsp/SameID.jsp");
			rd.forward(request, response);
		}
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudentDAO dao = new StudentDAO();
		StudentBean stdbean = dao.getStudentData(request.getParameter("param"));
	    if (stdbean != null) {
	      HttpSession session = request.getSession();
	      session.setAttribute("stdbean", stdbean);
	      String values = stdbean.getLikemost();
	      
		  String[] tokens = values.split(",");

		  for(int i=0;i<tokens.length;i++)
		  {
			  session.setAttribute(tokens[i],"checked");
		  }
		  session.setAttribute(stdbean.getRecommend(),"selected");


	      RequestDispatcher rd = request.getRequestDispatcher("jsp/StudentData.jsp");
	      rd.include(request, response);
	    } else {
	      RequestDispatcher rd = request.getRequestDispatcher("jsp/NoStudent.jsp");
	      rd.include(request, response);
	    }
	}


}
