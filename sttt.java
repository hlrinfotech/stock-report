import java.sql.*;
import java.util.*;

public class sttt {
    public static ArrayList<ArrayList<String>> getStockData(String customercode) throws ClassNotFoundException {
        ArrayList<ArrayList<String>> tableData = new ArrayList<>();

        String sql = "SELECT name,salesgroupdesc7, salesgroupcode2, Salesgroupdesc6, SUM(qty) AS total_qty " +
                     "FROM stock " +
                     "INNER JOIN user ON stock.plant = user.plant " +
                     "WHERE user.customerid = ? " +
                     "GROUP BY name,salesgroupdesc7, salesgroupcode2, Salesgroupdesc6";

        try (Connection conn = DBService.getDBConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, customercode);

            try (ResultSet rs = ps.executeQuery()) {
                // Extract column names as header row
                ResultSetMetaData metaData = rs.getMetaData();
                ArrayList<String> headers = new ArrayList<>();
                for (int i = 1; i <= metaData.getColumnCount(); i++) {
                    headers.add(metaData.getColumnLabel(i));
                }
                tableData.add(headers);

                // Extract data rows
                while (rs.next()) {
                    ArrayList<String> row = new ArrayList<>();
                    for (int i = 1; i <= metaData.getColumnCount(); i++) {
                        row.add(rs.getString(i) != null ? rs.getString(i) : "");
                    }
                    tableData.add(row);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tableData;
    }

    public static void main(String[] args) throws ClassNotFoundException {
        ArrayList<ArrayList<String>> data = getStockData("1010012");
        
        // Print table for testing
        for (ArrayList<String> row : data) {
            System.out.println(row);
        }
    }
}
