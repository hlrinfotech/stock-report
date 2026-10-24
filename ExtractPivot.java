import java.sql.SQLException;
import java.util.*;
import java.util.Calendar;

public class ExtractPivot {

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        // Sample CSV data as ArrayList<ArrayList<String>>
        ArrayList<ArrayList> rawData = DBService.viewlast12Extract("1010009");

        // Generate last 12 months header dynamically
        List<String> header =  Last12MonthsList.getLast12Months();
        ArrayList<ArrayList<String>> pivotTable = new ArrayList<>();

        // First row = header
        ArrayList<String> headerRow = new ArrayList<>();
        headerRow.add("Description");
        headerRow.addAll(header);
        pivotTable.add(headerRow);

        // Initialize rows with "-"
        Map<String, ArrayList<String>> rows = new LinkedHashMap<>();
        rows.put("Credit Note for Schemes Received", initRow(header.size()));
        rows.put("Credit Note for Replacement Received", initRow(header.size()));
        rows.put("Credit Note for Cash Discount Received", initRow(header.size()));
        rows.put("Remarks", initRow(header.size()));
        

        // Process raw data
        for (ArrayList<String> row : rawData) {
            String month = row.get(4);
            int colIndex = header.indexOf(month) + 1; // +1 because first column = name
            if (colIndex <= 0) continue;

            rows.put("Credit Note for Schemes Received",
                    mergeCell(rows.get("Credit Note for Schemes Received"), colIndex, row.get(0)));
            rows.put("Credit Note for Replacement Received",
                    mergeCell(rows.get("Credit Note for Replacement Received"), colIndex, row.get(1)));
            rows.put("Credit Note for Cash Discount Received",
                    mergeCell(rows.get("Credit Note for Cash Discount Received"), colIndex, row.get(2)));
            if (row.get(3) != null && !row.get(3).trim().isEmpty()) {
                rows.get("Remarks").set(colIndex, row.get(3));
            }
        }

        // Add rows to pivot table
        for (Map.Entry<String, ArrayList<String>> entry : rows.entrySet()) {
            ArrayList<String> r = entry.getValue();
            r.set(0, entry.getKey()); // first column = row name
            pivotTable.add(r);
        }

        // Print table
        printTable(pivotTable);
    }
    
    
     public static    ArrayList<ArrayList> lasttmo(String code) throws SQLException, ClassNotFoundException {
        // Sample CSV data as ArrayList<ArrayList<String>>
        ArrayList<ArrayList> rawData = DBService.viewlast12Extract(code);

        // Generate last 12 months header dynamically
        List<String> header =  Last12MonthsList.getLast12Months();
        ArrayList<ArrayList> pivotTable = new ArrayList<>();

        // First row = header
        ArrayList<String> headerRow = new ArrayList<>();
        headerRow.add("Description");
        headerRow.addAll(header);
        pivotTable.add(headerRow);

        // Initialize rows with "-"
 Map<String, ArrayList<String>> rows = new LinkedHashMap<>();
        rows.put("Credit Note for Schemes Received", initRow(header.size()));
        rows.put("Credit Note for Replacement Received", initRow(header.size()));
        rows.put("Credit Note for Cash Discount Received", initRow(header.size()));
        rows.put("Remarks", initRow(header.size()));;

        // Process raw data
        for (ArrayList<String> row : rawData) {
            String month = row.get(4);
            int colIndex = header.indexOf(month) + 1; // +1 because first column = name
            if (colIndex <= 0) continue;

              rows.put("Credit Note for Schemes Received",
                    mergeCell(rows.get("Credit Note for Schemes Received"), colIndex, row.get(0)));
            rows.put("Credit Note for Replacement Received",
                    mergeCell(rows.get("Credit Note for Replacement Received"), colIndex, row.get(1)));
            rows.put("Credit Note for Cash Discount Received",
                    mergeCell(rows.get("Credit Note for Cash Discount Received"), colIndex, row.get(2)));
            if (row.get(3) != null && !row.get(3).trim().isEmpty()) {
                rows.get("Remarks").set(colIndex, row.get(3));
            }
        }

        // Add rows to pivot table
        for (Map.Entry<String, ArrayList<String>> entry : rows.entrySet()) {
            ArrayList<String> r = entry.getValue();
            r.set(0, entry.getKey()); // first column = row name
            pivotTable.add(r);
        }

        return pivotTable;
        // Print table
      //  printTable(pivotTable);
    }

    // Merge logic: YES + NO → PENDING, YES/YES = YES
    private static ArrayList<String> mergeCell(ArrayList<String> row, int index, String value) {
        if (value == null || value.trim().isEmpty()) return row;
        String existing = row.get(index);
        if (existing.equals("-")) {
            row.set(index, value.toUpperCase());
        } else if (!existing.equalsIgnoreCase(value)) {
            row.set(index, "PENDING");
        }
        return row;
    }

    // Initialize a row with "-" for all months (+1 for row name)
    private static ArrayList<String> initRow(int months) {
        ArrayList<String> row = new ArrayList<>();
        for (int i = 0; i <= months; i++) row.add("-");
        return row;
    }

    // Last 12 months header generator
   

//    // Sample data as ArrayList<ArrayList<String>>
//    private static ArrayList<ArrayList<String>> getSampleData() {
//        ArrayList<ArrayList<String>> data = new ArrayList<>();
//
//        data.add(new ArrayList<>(Arrays.asList("YES","YES","YES","","Apr-20")));
//        data.add(new ArrayList<>(Arrays.asList("YES","","YES","","Apr-20")));
//        data.add(new ArrayList<>(Arrays.asList("YES","-","YES","","Apr-20")));
//        data.add(new ArrayList<>(Arrays.asList("YES","","YES","","Apr-20")));
//        data.add(new ArrayList<>(Arrays.asList("YES","NO","YES","PARTIAL PENDING","Jun-20")));
//        data.add(new ArrayList<>(Arrays.asList("NO","","NO","WILL ISSUE WITHIN 10TH JAN","Dec-20")));
//        // Add more rows as needed...
//
//        return data;
//    }

  //   Print table nicely
    private static void printTable(ArrayList<ArrayList<String>> table) {
        for (ArrayList<String> row : table) {
            for (String cell : row) {
                System.out.print(String.format("%-25s", cell));
            }
            System.out.println();
        }
    }
}
