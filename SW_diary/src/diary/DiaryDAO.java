package diary;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DiaryDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public DiaryDAO(){
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
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getString(1);
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return "";//데이터베이스오류
	}
	
	public int getNext() {
		String SQL = "SELECT diaryID FROM diary ORDER BY diaryID DESC";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getInt(1)+1;
			}
			return 1;//첫 번째 게시물인 경우
		} catch (Exception e){
			e.printStackTrace();
		}
		return -1;//데이터베이스오류
	}
	
	public int write(String userID, String diaryContent, String userAge){
		String SQL = "INSERT INTO diary VALUES (?, ?, ?, ?, ?, ?, ?)";
		int diaryReport=0;
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, userID);
			pstmt.setString(3, getDate());
			pstmt.setString(4, diaryContent);
			pstmt.setInt(5,diaryReport);
			pstmt.setString(6, userAge);
			pstmt.setInt(7, 1);
			return pstmt.executeUpdate();
		} catch (Exception e){
			e.printStackTrace();
		}
		return -1;//데이터베이스오류
	}
	public ArrayList<Diary> getList (int pageNumber){
		String SQL = "SELECT * FROM diary WHERE diaryID < ? AND diaryAvailable = 1 ORDER BY diaryID DESC LIMIT 10";
		ArrayList<Diary> list = new ArrayList<Diary>();
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);
			rs = pstmt.executeQuery();
			while (rs.next()){
				Diary diary = new Diary();
				diary.setDiaryID(rs.getInt(1));
				diary.setUserID(rs.getString(2));
				diary.setDiaryDate(rs.getString(3));
				diary.setDiaryContent(rs.getString(4));
				diary.setDiaryReport(rs.getInt(5));
				diary.setUserAge(rs.getString(6));
				diary.setDiaryAvailable(rs.getInt(7));
				list.add(diary);	
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber){
		String SQL = "SELECT * FROM diary WHERE diaryID < ? AND diaryAvailable = 1 ORDER BY diaryID DESC LIMIT 10";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return true;
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return false;
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
				return diary;
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return null;
	}
	public int update(int diaryID, String diaryContent){
		String SQL = "UPDATE diary SET diaryContent=? WHERE diaryID = ?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, diaryContent);
			pstmt.setInt(2, diaryID);
			return pstmt.executeUpdate();
		} catch (Exception e){
			e.printStackTrace();
		}
		return -1;//데이터베이스오류
	}
	public int  delete (int diaryID){
		String SQL = "UPDATE diary SET diaryAvailable = 0 WHERE diaryID = ?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, diaryID);
			return pstmt.executeUpdate();
		} catch (Exception e){
			e.printStackTrace();
		}
		return -1;//데이터베이스오류
	}
}
