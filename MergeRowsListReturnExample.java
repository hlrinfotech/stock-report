import java.util.*;

public class MergeRowsListReturnExample {
    public static void main(String[] args) {
        // Raw data: Branch, Model, Size, Qty, Orientation
        List<List<String>> rawData = Arrays.asList(
            Arrays.asList("MB", "Magma", "3",  "10", "Vertical"),
            Arrays.asList("MB", "Magma", "5",  "5",  "Vertical"),
            Arrays.asList("MB", "Magma", "10", "8",  "Horizontal"),
            Arrays.asList("MB", "Magma", "15", "6",  "Horizontal"),
            Arrays.asList("MB", "Lyra",  "6",  "2",  "Vertical"),
            Arrays.asList("MB", "Lyra",  "25", "4",  "Horizontal"),
            Arrays.asList("MB", "Splash","35", "3",  "Vertical"),
            Arrays.asList("MB", "Splash","50", "1",  "Horizontal"),
            Arrays.asList("MB", "sds",   "",   "10", "Horizontal"), // size missing
            Arrays.asList("MB", "sds",   "50", "10", "Horizontal")
        );

        List<String> headers = Arrays.asList(
            "Branch", "Model", "3", "5", "6", "10", "15", "25", "35", "50", "70", "100", "140", "200", "orientation"
        );

        ArrayList<ArrayList<String>> result = transformData(rawData, headers);

        // Print
        for (ArrayList<String> row : result) {
            System.out.println(row);
        }
    }
    
        public static  ArrayList<ArrayList<String>> main(List<List<String>> rawData,List<String> headers) {
        // Raw data: Branch, Model, Size, Qty, Orientation
      
      

        ArrayList<ArrayList<String>> result = transformData(rawData, headers);

        // Print
        for (ArrayList<String> row : result) {
            System.out.println(row);
        }
        return result;
    }

    public static ArrayList<ArrayList<String>> transformData(List<List<String>> rawData, List<String> headers) {
        // Map: Branch|Model|Orientation → size→qty
        Map<String, Map<String, String>> pivotMap = new LinkedHashMap<>();

        for (List<String> row : rawData) {
            String branch = row.get(0);
            String model = row.get(1);
            String size = row.get(2);
            String qty = row.get(3);
            String orientation = row.get(4);

            String key = branch + "|" + model + "|" + orientation;

            pivotMap.putIfAbsent(key, new LinkedHashMap<>());
            Map<String, String> sizeMap = pivotMap.get(key);

            if (size != null && !size.isEmpty()) {
                sizeMap.put(size, qty);
            }

            sizeMap.put("Branch", branch);
            sizeMap.put("Model", model);
            sizeMap.put("orientation", orientation);
        }

        // Output list
        ArrayList<ArrayList<String>> output = new ArrayList<>();
        output.add(new ArrayList<>(headers));

        for (Map<String, String> sizeMap : pivotMap.values()) {
            ArrayList<String> row = new ArrayList<>();
            for (String header : headers) {
                row.add(sizeMap.getOrDefault(header, ""));
            }
            output.add(row);
        }

        return output;
    }
}
