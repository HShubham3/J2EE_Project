package model;

import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

public class Registration {

		private Connection con;
		HttpSession se;

		public Registration(HttpSession session) {
			try {
				Class.forName("com.mysql.jdbc.Driver"); // load the drivers
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sookshmas", "root", "root");
				// connection with data base
				se = session;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		public String Registration(String name, String phone, String email, String pw) {
			PreparedStatement ps=null;
			String status = "";
			try {
				Statement st = null;
				ResultSet rs = null;
				st = con.createStatement();
				rs = st.executeQuery("select * from sookshmas1 where phone='" + phone + "' or email='" + email + "';");
				boolean b = rs.next();
				if (b) {
					status = "existed";
				} 
				else {
					ps = con.prepareStatement("insert into sookshmas1 values(0,?,?,?,?,now())");
					ps.setString(1, name);
					ps.setString(2, phone);
					ps.setString(3, email);
					ps.setString(4, pw);
					int a = ps.executeUpdate();
					if (a > 0) {
						status = "success";
					} 
					else {
						status = "failure";
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return status;
		}

		public String login(String email, String pass) {
			
	        String status1 = "", id = "";
	        String name = "", emails = "";

	        try {
	            Statement st = null;
	            ResultSet rs = null;
	            st = con.createStatement();

	            rs = st.executeQuery("select * from sookshmas1 where email='" + email + "' and password='" + pass + "';");
	            boolean b = rs.next();
	            if (b == true) {
	                id = rs.getString("slno");
	                name = rs.getString("name");
	                emails = rs.getString("email");
	                se.setAttribute("uname", name);
	                se.setAttribute("email", emails);
	                se.setAttribute("id", id);
	                status1 = "success";
	            } 
	            else {
	                status1 = "failure";
	            }
	        } 
	        catch (Exception e) {
	            e.printStackTrace();
	        }

	        return status1;
	    }
		
		
		public student getInfo() {
	        Statement st = null;
	        ResultSet rs = null;
	        student s = null;
	        try {
	            st = con.createStatement();
	            rs = st.executeQuery("select * from sookshmas1 where slno= '" + se.getAttribute("id") + "'");
	            boolean b = rs.next();
	            if (b == true) {
	                s = new student();
	                s.setName(rs.getString("name"));
	                s.setphone(rs.getString("phone"));
	                s.setemail(rs.getString("email"));
	            } else {
	                s = null;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return s;
	    }

		public String update(String name, String pno, String email) {
	        String status = "";
	        Statement st = null;
	        ResultSet rs = null;
	        try {
	            st = con.createStatement();
	            st.executeUpdate("update sookshmas1 set name='" + name + "',phone='" + pno + "',email='" + email + "' where slno= '" + se.getAttribute("id") + "' ");
	            se.setAttribute("uname", name);
	            status = "success";
	        } catch (Exception e) {
	            status = "failure";
	            e.printStackTrace();
	        }

	        return status;

		}
		
		public ArrayList<student> getUserinfo(String id) {
	        Statement st = null;
	        ResultSet rs = null;
	        ArrayList<student> al = new ArrayList<student>();
	        try {
	            st = con.createStatement();
	            String qry = "select * from sookshmas1 where slno = '" + id + "';";
	            rs = st.executeQuery(qry);
	            while (rs.next()) {
	                student p = new student();
	                p.setId(rs.getString("slno"));
	                p.setName(rs.getString("name"));
	                p.setemail(rs.getString("email"));
	                p.setphone(rs.getString("phone"));
	                p.setdate(rs.getString("timedate"));
	                al.add(p);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return al;
	    }

		
		public ArrayList<student> getUserDetails() {
			Statement st;
			ResultSet rs;
			ArrayList<student> al = new ArrayList<student>();
			try {
				st = con.createStatement();
				String qry = "select *,date_format(timedate,'%b %d, %Y') as date1 from sookshmas1 where slno not in(1);";
				rs = st.executeQuery(qry);
				while (rs.next()) {
					student p = new student();
					p.setId(rs.getString("slno"));
					p.setName(rs.getString("name"));
					p.setemail(rs.getString("email"));
					p.setphone(rs.getString("phone"));
					p.setdate(rs.getString("date1"));
					al.add(p);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return al; 
		}

		public String delete(String id) {
			 String status="";
			 int count=0;
			 Statement st;
			
			 try {
				st=con.createStatement();
				String qry ="delete from sookshmas1 where slno='"+id+"'";
				count=st.executeUpdate(qry);
				
				if(count>0) {
					status="success";
				}
				else {
					status="failed";
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			 
			 return status;
		}

		public String forgotPassword(String pw, String id) {
			String status="";
			int count=0;
			Statement st;
			
			String qry="update sookshmas1 set password='"+pw+"' where slno='"+id+"'";
			try {
				st=con.createStatement();
				count = st.executeUpdate(qry);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			if(count>0) {
				status="success";
			}
			else {
				status="failed";
			}
			
			return status;
		}

}
