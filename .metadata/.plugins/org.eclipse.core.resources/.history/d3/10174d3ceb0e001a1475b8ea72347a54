package user;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.logging.Logger;
import diary.Diary;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO(){
		try{
			String dbURL="jdbc:mysql://localhost:3306/diarychange";
			String dbID="root";
			String dbPassword="1111";
			Class.forName("com.mysql.jdbc.Driver");
			conn= DriverManager.getConnection(dbURL, dbID, dbPassword);

		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public int login(String userID, String userPassword){
		String SQL="SELECT userPassword FROM USER WHERE userID=?";
		try{
			pstmt= conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs=pstmt.executeQuery();
			if(rs.next()){
				if(rs.getString(1).equals(userPassword)){
					return 1;//로그인 성공
				}
				else
					return 0;//비밀번호 불일치
			}
			return -1;//아이디 없음
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return -2;//데이터베이스 오류
	}
	public String userAgecall(String userID){
		String SQL="SELECT userAge FROM USER WHERE userID=?";
		try{
			String Age=null;
			pstmt= conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				User user = new User();
				user.setUserAge(rs.getString(1));
				Age=user.getUserAge();
				return Age;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return null;//데이터베이스 오류
	}
	
	public Diary getDiary(int diaryID){
		String SQL = "SELECT * FROM diary WHERE  diaryID=?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, diaryID);
			rs = pstmt.executeQuery();
			if(rs.next()){
				Diary diary = new Diary();
				diary.setDiaryID(rs.getInt(1));
				diary.setUserID(rs.getString(2));
				diary.setDiaryDate(rs.getString(3));
				diary.setDiaryContent(rs.getString(4));
				diary.setDiaryReport(rs.getInt(5));
				diary.setUserAge(rs.getString(6));
				diary.setDiaryAvailable(rs.getInt(7));
				diary.setWeather(rs.getString(8));
				return diary;
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public Diary getDiaryByUserID(String userID) {
	      String SQL = "SELECT * FROM diary WHERE userID=? ORDER BY diaryDate DESC LIMIT 1";
	      Diary diary = null;
	         try{
	            PreparedStatement pstmt = conn.prepareStatement(SQL);
	            pstmt.setString(1, userID);
	            rs = pstmt.executeQuery();
	            if(rs.next()){
	              diary = new Diary();
	               diary.setDiaryID(rs.getInt(1));
	               diary.setUserID(rs.getString(2));
	               diary.setDiaryDate(rs.getString(3));
	               diary.setDiaryContent(rs.getString(4));
	               diary.setDiaryReport(rs.getInt(5));
	               diary.setUserAge(rs.getString(6));
	               diary.setDiaryAvailable(rs.getInt(7));
					diary.setWeather(rs.getString(8));
	            }
	         } catch (Exception e){
	            e.printStackTrace();
	         }
	         return diary;
	   }
	
	public int join(User user){
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?)";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserEmail());
			pstmt.setString(4, user.getUserAge());
			return pstmt.executeUpdate();
		} catch(Exception e)
		{
			e.printStackTrace();
		}
		return -1;
	}
}
