import java.sql.*;

public class customerreport {
    public static void main(String[] args) throws Exception {
        String url = "jdbc:mysql://localhost:3306/venusc";
        String user = "root";
        String pass = "";

        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stmt = conn.createStatement()) {

            // Allow large GROUP_CONCAT output
            stmt.execute("SET SESSION group_concat_max_len = 1000000");

            // 1. Build dynamic column list
            String colSQL =
                "SELECT GROUP_CONCAT(DISTINCT " +
                "CONCAT('SUM(CASE WHEN salesgroupcode2 = ''', salesgroupcode2, " +
                "''' THEN qty ELSE 0 END) AS `', salesgroupcode2, '`') " +
                "ORDER BY CAST(salesgroupcode2 AS UNSIGNED)) AS cols " +
                "FROM stock " +
                "WHERE salesgroupdesc6 = 'Vertical' " +
                "AND plant = 'b101' AND qty > 0";

            ResultSet rsCols = stmt.executeQuery(colSQL);
            String cols = "";
            if (rsCols.next()) {
                cols = rsCols.getString("cols");
            }
            rsCols.close();

            if (cols == null || cols.isEmpty()) {
                System.out.println("No columns found for pivot.");
                return;
            }

            // 2. Build final pivot query with model name fallback
            String finalSQL =
                "SELECT COALESCE(NULLIF(salesgroupdesc7,''),'Unknown Model') AS Model, " +
                cols +
                " FROM stock " +
                "WHERE salesgroupdesc6 = 'Vertical' AND plant = 'b101' " +
                "GROUP BY salesgroupdesc7 " +
                "ORDER BY Model";

            // 3. Execute pivot query
            ResultSet rs = stmt.executeQuery(finalSQL);
            ResultSetMetaData meta = rs.getMetaData();
            int colCount = meta.getColumnCount();

            // Print header
            for (int i = 1; i <= colCount; i++) {
                System.out.print(meta.getColumnLabel(i) + "\t");
            }
            System.out.println();

            // Print rows
            while (rs.next()) {
                for (int i = 1; i <= colCount; i++) {
                    System.out.print(rs.getString(i) + "\t");
                }
                System.out.println();
            }
            rs.close();
        }
    }
}
