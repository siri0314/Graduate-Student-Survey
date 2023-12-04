//Sreelalitha
//This program is used to insert and retrieve data from database

package com.dao;
import java.sql.*;

import java.util.ArrayList;
import java.util.List;
import com.bean.StudentBean;

public class StudentDAO {
    private String fname;
    private String lname;
    private String studentid;
    private String email;
    private String streetaddress;
    private String city;
    private String country;
    private String state;
    private String zipcode;
    private String data;
    private String telephone;
    private String url;
    private String surveydate;
    private String likemost;
    private String interestInUniversity;
    private String comments;
    private String month;
    private String graduationYear;
    private String recommend;
    
    public void setFname(String fname) {
        this.fname = fname;
    }
    
    public String getFname() {
        return this.fname;
    }
    
    public void setLname(String lname) {
        this.lname = lname;
    }
    public String getLname() {
        return this.lname;
    }
    
    public void setStudentid(String studentid) {
        this.studentid = studentid;
    }
    
    public String getStudentid() {
        return this.studentid;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getEmail() {
        return this.email;
    }
    
    
    public void setStreetaddress(String streetaddress) {
        this.streetaddress = streetaddress;
    }
    public String getStreetaddress() {
        return this.streetaddress;
    }
    
    public void setCity(String city) {
        this.city = city;
    }
    
    public String getCity() {
        return this.city;
    }
    
    public void setCountry(String country) {
        this.country = country;
    }
    
    public String getCountry() {
        return this.country;
    }
    
    public void setState(String state) {
        this.state = state;
    }
    
    public String getState() {
        return this.state;
    }
    
    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }
    
    public String getZipcode() {
        return this.zipcode;
    }
    
    public void setData(String data) {
        this.data = data;
    }
    
    public String getData() {
        return this.data;
    }
    
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
    
    public String getTelephone() {
        return this.telephone;
    }
    
    public void setUrl(String url) {
        this.url = url;
    }
    
    public String getUrl() {
        return this.url;
    }
    
    public void setSurveydate(String surveydate) {
        this.surveydate = surveydate;
    }
    
    public String getSurveydate() {
        return this.surveydate;
    }
    
    public void setLikemost(String likemost) {
        this.likemost = likemost;
    }
    
    public String getLikemost() {
        return this.likemost;
    }
    
    public void setIntuniversity(String interestInUniversity) {
        this.interestInUniversity = interestInUniversity;
    }
    
    public String getIntuniversity() {
        return this.interestInUniversity;
    }
    
    public void setComments(String comments) {
        this.comments = comments;
    }
    
    public String getComments() {
        return this.comments;
    }
    
    public void setMonth(String month) {
        this.month = month;
    }
    
    public String getMonth() {
        return this.month;
    }
    
    public void setGraduationYear(String graduationYear) {
        this.graduationYear = graduationYear;
    }
    
    public String getGraduationYear() {
        return this.graduationYear;
    }
    
    public void setRecommend(String recommend) {
        this.recommend = recommend;
    }
    
    public String getRecommend() {
        return this.recommend;
    }
    
    
    public List<String> storedata() {
        String url_c = "jdbc:oracle:thin:@artemis.vsnet.gmu.edu:1521/vse18c.vsnet.gmu.edu";
        String uname = "mjayakum";
        String pass = "yvoogyro";
        ArrayList<String> si = new ArrayList<String>();
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection(url_c, uname, pass);
            PreparedStatement pstmt = con.prepareStatement("insert into Students(FName,LName,StudentID,Email,StreetAddr,City,Country,States,Zipcode,Dataval,Telephone,Urls,SurveyDate,Likemost,InterestInUniv,Comments,GradMonth,GradYear,Recommend) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pstmt.setString(1, this.fname);
            pstmt.setString(2, this.lname);
            pstmt.setString(3, this.studentid);
            pstmt.setString(4, this.email);
            pstmt.setString(5, this.streetaddress);
            pstmt.setString(6, this.city);
            pstmt.setString(7, this.country);
            pstmt.setString(8, this.state);
            pstmt.setString(9, this.zipcode);
            pstmt.setString(10, this.data);
            pstmt.setString(11, this.telephone);
            pstmt.setString(12, this.url);
            pstmt.setString(13, this.surveydate);
            pstmt.setString(14, this.likemost);
            pstmt.setString(15, this.interestInUniversity);
            pstmt.setString(16, this.comments);
            pstmt.setString(17, this.month);
            pstmt.setString(18, this.graduationYear);
            pstmt.setString(19, this.recommend);
            pstmt.executeUpdate();
            pstmt.close();

            pstmt = con.prepareStatement("select StudentID from Students");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                si.add(rs.getString("StudentID"));
            }
            pstmt.close();
            con.close();
            return si;
        }
        catch (Exception e) {
        	System.out.println("Connection Error");
        	System.out.println(e);
        	
            e.printStackTrace();
            return null;
        }
    }
    
    public StudentBean getStudentData(String stdid) {
        String url_c = "jdbc:oracle:thin:@artemis.vsnet.gmu.edu:1521/vse18c.vsnet.gmu.edu";
        String uname = "mjayakum";
        String pass = "yvoogyro";

       StudentBean sb = new StudentBean();
       try {
    	   Class.forName("oracle.jdbc.driver.OracleDriver");
           Connection con = DriverManager.getConnection(url_c, uname, pass);
           PreparedStatement pstmt = con.prepareStatement("select * from Students where StudentID=?");
           System.out.println("STDID is:"+stdid);
           pstmt.setString(1, stdid);
           ResultSet results = pstmt.executeQuery();
           int i = 0;
           while (results.next()) {
               ++i;
               sb.setFname(results.getString("FName"));
               sb.setLname(results.getString("LName"));
               sb.setStudentid(results.getString("StudentID"));
               sb.setEmail(results.getString("Email"));
               sb.setStreetaddress(results.getString("StreetAddr"));
               sb.setCity(results.getString("City"));
               sb.setCountry(results.getString("Country"));
               sb.setState(results.getString("States"));
               sb.setZipcode(results.getString("Zipcode"));
               sb.setData(results.getString("Dataval"));
               sb.setTelephone(results.getString("Telephone"));
               sb.setUrl(results.getString("Urls"));
               sb.setSurveydate(results.getString("SurveyDate"));
               sb.setLikemost(results.getString("Likemost"));
               sb.setInterestInUniversity(results.getString("InterestInUniv"));
               sb.setComments(results.getString("Comments"));
               sb.setMonth(results.getString("GradMonth"));
               sb.setGraduationYear(results.getString("GradYear"));
               sb.setRecommend(results.getString("Recommend"));
           }
           pstmt.close();
           con.close();
           if (i > 0) {
               return sb;
           }
           return null;
       }
       catch (Exception e) {
           e.printStackTrace();
           return null;
       }
   }
    


}
