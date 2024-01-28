/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;

/**
 *
 * @author Admin
 */
public class DAOStaff extends DBContext {

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[nameUser]\n"
                + "      ,[amount]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[role]\n"
                + "  FROM [dbo].[Account]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6));
                list.add(a);
            }

        } catch (SQLException e) {
        }
        return list;
    }

  
    public void addAccount(Account a) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([nameUser]\n"
                + "           ,[amount]\n"
                + "           ,[username]\n"
                + "           ,[password]\n"
                + "           ,[role])\n"
                + "     VALUES (?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getNameUser());
            st.setDouble(2, a.getMoney());
            st.setString(3, a.getUsername());
            st.setString(4, a.getPassword());
            st.setInt(5, a.getRole());
            st.executeUpdate();
            
            
        } catch (SQLException e) {
        }
        
    }
}
