package org.scoula.jdbc_ex.common;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;


public class JDBCUtil {
    static Connection con = null;

    public static Connection getConnection(){
        if(con != null){
            return con;
        }
        //application.properties파일 로드
        try{
            Properties properties = new Properties();
            properties.load(JDBCUtil.class.getResourceAsStream("/application.properties"));

            //데이터베이스 접속에 필요한 정보를 추출함
            String driver = properties.getProperty("driver");
            String url = properties.getProperty("url");
            String id = properties.getProperty("id");
            String password = properties.getProperty("password");

            Class.forName(driver);
            //jdbc_ex 데이터베이스에 접속하여 Connection 객체를 보관함
            con = DriverManager.getConnection(url, id, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    public static void close(){
        try{
            if(con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    @DisplayName("jdbd_ex 연결")
    public void testConnection2()throws SQLException {
        try (Connection con = JDBCUtil.getConnection()){
            System.out.println("DB 연결성공");
        }
    }
}