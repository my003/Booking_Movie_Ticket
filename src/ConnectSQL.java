//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.ResultSet;
//import java.sql.Statement;
//public class ConnectSQL {
//
//    public void connectDB() {
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            Connection connection = DriverManager.getConnection(
//                    "jdbc:mysql://localhost:1433/HDS?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",
//                    "sa", "123456aA@$");
//            /*
//             * System.out.println("Sql:"
//             * + connection.getMetaData().getDatabaseProductName());
//             * Statement statement = connection.createStatement();
//             * ResultSet resultSet = statement.executeQuery("SELECT *FROM login");
//             * while (resultSet.next()) {
//             * System.out.println("Username:"
//             * + resultSet.getString("UserName"));
//             * System.out.println("Password:"
//             * + resultSet.getString("password"));
//             * }
//             */
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//}
