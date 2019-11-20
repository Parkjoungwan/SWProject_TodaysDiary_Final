package user;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.logging.Logger;

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
		System.out.println(SQL);
		try{
			pstmt= conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs=pstmt.executeQuery();
			if(rs.next()){
				if(rs.getString(1).equals(userPassword)){
					return 1;//�α��� ����
				}
				else
					return 0;//��й�ȣ ����ġ
			}
			return -1;//���̵� ����
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return -2;//�����ͺ��̽� ����
		
	}
	public int join(User user){
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserEmail());
			pstmt.setString(4, user.getUserAge());
			pstmt.setInt(5, 1);
			return pstmt.executeUpdate();
		} catch(Exception e)
		{
			e.printStackTrace();
		}
		return -1;
	}
}