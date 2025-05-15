package hx.util;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class JdbcUtil implements Serializable{

    private String connectUrl="jdbc:sqlserver://127.0.0.1;encrypt=false;databaseName=JspTest1;user=Pbird;password=123456";
    //抄自ms官网，配置
    public void setConnectUrl(String connectUrl){
        this.connectUrl=connectUrl;
    }
    public String getConnectUrl(){
        return connectUrl;
    }
    public JdbcUtil(){
        try {
            // 显式加载 Microsoft JDBC 驱动
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    public void insertUserRegister(String user,String password,String sex,String email){
        try(Connection connection = DriverManager.getConnection(connectUrl)){
            PreparedStatement prepsInsertProduct = connection.prepareStatement("Insert into Users values(?,?,?,?)");
            prepsInsertProduct.setString(1,user);
            prepsInsertProduct.setString(2,password);
            prepsInsertProduct.setString(3,sex);
            prepsInsertProduct.setString(4,email);
            @SuppressWarnings("unused")
            boolean res = prepsInsertProduct.execute();
            prepsInsertProduct.close();
        }
        catch (SQLException e) {}
        catch (Exception e) {}
    }
    public String selectUserQuery(String user,String password){
        String result="";
        try(Connection connection = DriverManager.getConnection(connectUrl)){
            PreparedStatement prepsInsertProduct = connection.prepareStatement("select * from Users where userName=? and password=?");
            prepsInsertProduct.setString(1,user);
            prepsInsertProduct.setString(2,password);
            ResultSet rs = prepsInsertProduct.executeQuery();
            while(rs.next()){
                if(rs.getString("sex").equals("1")){
                    result="男"+rs.getString("email");
                }
                if(rs.getString("sex").equals("0")){
                    result="女"+rs.getString("email");
                }
            }
            rs.close();
            prepsInsertProduct.close();
        }
        catch(SQLException e){return "error"+e.getMessage()+e.getErrorCode();}
        
        catch(Exception e){}
        if(result.equals(null)){
            return "No march info";
        }
        return result;
    }
    public void updateUserUpdate(String user,String password,String newuser,String newpassword,String newsex,String newemail){
        try(Connection connection = DriverManager.getConnection(connectUrl)){
            PreparedStatement prepsInsertProduct = connection.prepareStatement("update Users set userName=?,password=?,sex=?,email=? where userName=? and password=?");
            prepsInsertProduct.setString(1,newuser);
            prepsInsertProduct.setString(2,newpassword);
            prepsInsertProduct.setString(3,newsex);
            prepsInsertProduct.setString(4,newemail);
            prepsInsertProduct.setString(5,user);
            prepsInsertProduct.setString(6,password);
            @SuppressWarnings("unused")
            boolean res = prepsInsertProduct.execute();
            prepsInsertProduct.close();
        }
        catch(SQLException e){}
    }
    public void deleteUserdelete(String user,String password){
        try(Connection connection = DriverManager.getConnection(connectUrl)){
            PreparedStatement prepsInsertProduct = connection.prepareStatement("delete from Users where userName=? and password=?");
            prepsInsertProduct.setString(1,user);
            prepsInsertProduct.setString(2,password);
            @SuppressWarnings("unused")
            boolean res = prepsInsertProduct.execute();
            prepsInsertProduct.close();
        }
        catch (SQLException e) {}
        catch (Exception e) {}
    }
    public void insertQuestionRegister(String title,String optionA,String optionB,String optionC,String optionD,String answer){
        try(Connection connection = DriverManager.getConnection(connectUrl)){
            PreparedStatement prepsInsertProduct = connection.prepareStatement("Insert into question values(?,?,?,?,?,?)");
            prepsInsertProduct.setString(1,title);
            prepsInsertProduct.setString(2,optionA);
            prepsInsertProduct.setString(3,optionB);
            prepsInsertProduct.setString(4,optionC);
            prepsInsertProduct.setString(5,optionD);
            prepsInsertProduct.setString(6,answer);
            prepsInsertProduct.execute();
            prepsInsertProduct.close();
        }
        catch (SQLException e) {}
    }
    public String selectQuestionQuery(){
        String result="";
        try(Connection connection = DriverManager.getConnection(connectUrl)){
            PreparedStatement prepsInsertProduct = connection.prepareStatement("select * from question");
            ResultSet rs = prepsInsertProduct.executeQuery();
            while(rs.next()){
                result = result+
                "<tr>"+
                "<td>"+rs.getString("questionID")+"</td>"+
                "<td>"+rs.getString("title")+"</td>"+
                "<td>"+rs.getString("optionA")+"</td>" +
                "<td>"+rs.getString("optionB")+"</td>" +
                "<td>"+rs.getString("optionC")+"</td>" +
                "<td>"+rs.getString("optionD")+"</td>" +
                "<td>"+rs.getString("answer")+"</td>"+
                "<td>"+"<div class = \"delete\" qid=\""+rs.getString("questionId")+ "\">删除</div>"+"</td>"+
                "</tr>";

            }
            rs.close();
            prepsInsertProduct.close();
        }
        catch (SQLException e) {}
        return result;
    }
    public void deleteQuestiondelete(String questionID){
        try(Connection connection = DriverManager.getConnection(connectUrl)){
            PreparedStatement prepsInsertProduct = connection.prepareStatement("delete from question where questionid=? ");
            prepsInsertProduct.setString(1,questionID);
            @SuppressWarnings("unused")
            boolean res = prepsInsertProduct.execute();
            prepsInsertProduct.close();

        }
        catch (SQLException e) {}
    }    
    public void updateQuestionUpdate(String questionID,String title,String optionA,String optionB,String optionC,String optionD,String answer){
            try(Connection connection = DriverManager.getConnection(connectUrl)){
                PreparedStatement prepsInsertProduct = connection.prepareStatement("update question set title=?,optionA=?,optionB=?,optionC=?,optionD=?,answer=? where questionID=?");
                prepsInsertProduct.setString(1,title);
                prepsInsertProduct.setString(2,optionA);
                prepsInsertProduct.setString(3,optionB);
                prepsInsertProduct.setString(4,optionC);
                prepsInsertProduct.setString(5,optionD);
                prepsInsertProduct.setString(6,answer);
                prepsInsertProduct.setString(7,questionID);
                @SuppressWarnings("unused")
                boolean res = prepsInsertProduct.execute();
                prepsInsertProduct.close();
            }
            catch (SQLException e) {}
            catch (Exception e) {}
        }
    public String selectQuestionRandom(int num){
        String result="";
        int i=1;
        try(Connection connection = DriverManager.getConnection(connectUrl)){
            PreparedStatement prepsInsertProduct = connection.prepareStatement("select Top(?)* from question order by NEWID()");
            prepsInsertProduct.setInt(1,num);
            ResultSet rs = prepsInsertProduct.executeQuery();
            while(rs.next()){
                result = result+
                "<tr>"+
                "<div hidden=\"hidden\" id=\"question"+String.valueOf(i)+"\">"+rs.getString("answer")+"</div>"+
                "<td>"+rs.getString("questionID")+"</td>"+
                "<td>"+rs.getString("title")+"</td>"+
                "<td>"+rs.getString("optionA")+"</td>" +
                "<td>"+rs.getString("optionB")+"</td>" +
                "<td>"+rs.getString("optionC")+"</td>" +
                "<td>"+rs.getString("optionD")+"</td>" +
                "<td>"+
                "<input type=\"radio\" name=\"answer"+String.valueOf(i)+"\"value =\"A\">"+
                "<input type=\"radio\" name=\"answer"+String.valueOf(i)+"\"value =\"B\">"+
                "<input type=\"radio\" name=\"answer"+String.valueOf(i)+"\"value =\"C\">"+
                "<input type=\"radio\" name=\"answer"+String.valueOf(i)+"\"value =\"D\">"+
                "</td>"+
                "</tr>";
                i++;
            }
            rs.close();
            prepsInsertProduct.close();
        }
        catch(SQLException e){}
        return result;
    }   
}
