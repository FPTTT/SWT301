/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Category;
import model.Product;

/**
 *
 * @author Admin
 */
public class DAO extends DBContext {

    // lay het du lieu tu database trade2022 tu bang catogories
    public List<Category> getAll() {
        List<Category> list = new ArrayList<>();

        try {
            String sql = "select * from Categories";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDescribe(rs.getString("describe"));
                list.add(c);

            }

        } catch (SQLException e) {
        }

        return list;
    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();

        try {
            String sql = "select * from Products";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setReleaseDate(rs.getDate("releaseDate"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);
            }

        } catch (SQLException e) {
        }

        return list;
    }

    public Category getCategoryById(int id) {
        try {
            String sql = "select * from Categories where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDescribe(rs.getString("describe"));
                return c;

            }
        } catch (SQLException e) {
        }

        return null;
    }

    public List<Product> getProductsByCid(int cid) {
        List<Product> list = new ArrayList<>();

        try {
            String sql = "select * from Products where 1=1 ";
            if (cid != 0) {
                sql += " and cid=" + cid;
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setReleaseDate(rs.getDate("releaseDate"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public Product getProductsById(String id) {

        try {
            String sql = "select * from Products where id = ? ";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setReleaseDate(rs.getDate("releaseDate"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                return p;
            }
        } catch (SQLException e) {
        }

        return null;
    }

    public List<Product> search(String key, Date from, Date to, Double price1, Double price2, int cid) {

        List<Product> list = new ArrayList<>();

        try {

            String sql = "select * from Products where 1=1 ";
            if (key != null && !key.equals("")) {
                sql += "and name like N'%" + key + "%' ";
            }
            if (from != null) {
                sql += "and releaseDate >='" + from + "' ";
            }
            if (to != null) {
                sql += "and releaseDate <='" + to + "' ";
            }
            if (price1 != null) {
                sql += "and price >=" + price1 + " ";
            }
            if (price2 != null) {
                sql += "and price <=" + price2 + " ";
            }
            if (cid != 0) {
                sql += " and cid=" + cid + " ";
            }

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setReleaseDate(rs.getDate("releaseDate"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);
            }

        } catch (SQLException e) {
        }

        return list;

    }

    public List<Product> getListByPage(List<Product> list, int start, int end) {
        List<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;

    }

    public Account getAccount(String user, String pass) {
        String sql = "select * from account where username = ? and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6));
                return a;

            }
        } catch (SQLException e) {
        }

        return null;
    }

    public Account checkAccount(String user) {
        String sql = "select * from account where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6));
                return a;

            }
        } catch (SQLException e) {
        }

        return null;
    }

    public void insertAccount(String user, String pass) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([nameUser]\n"
                + "           ,[amount]\n"
                + "           ,[username]\n"
                + "           ,[password]\n"
                + "           ,[role])\n"
                + "     VALUES\n"
                + "           (?,3000.000,?,?,0)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, user);
            st.setString(3, pass);
            st.executeUpdate();

        } catch (SQLException e) {
        }

    }

    public void deleteProductById(String id) {
        String sql = "delete from Products where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void addProduct(Product x) {
        String sql = "insert into Products values(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, x.getId());
            st.setString(2, x.getName());
            st.setInt(3, x.getQuantity());
            st.setDouble(4, x.getPrice());
            st.setDate(5, x.getReleaseDate());
            st.setString(6, x.getDescribe());
            st.setString(7, x.getImage());
            st.setInt(8, x.getCategory().getId());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateProduct(Product x) {
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET [id] = ?\n"
                + "      ,[name] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[releaseDate] = ?\n"
                + "      ,[describe] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[cid] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, x.getId());
            st.setString(2, x.getName());
            st.setInt(3, x.getQuantity());
            st.setDouble(4, x.getPrice());
            st.setDate(5, x.getReleaseDate());
            st.setString(6, x.getDescribe());
            st.setString(7, x.getImage());
            st.setInt(8, x.getCategory().getId());
            st.setString(9, x.getId());
            st.executeUpdate();
        } catch (SQLException e) {
        }

    }

}
