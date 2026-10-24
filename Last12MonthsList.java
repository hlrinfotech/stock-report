/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author INIYA RAJI
 */
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

public class Last12MonthsList {

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        ArrayList<String> months = getLast12Months();
        System.out.println(months);
//      ArrayList< ArrayList> lasttw = DBService.viewlast12Extract("1010009");
//           System.out.println(lasttw.toString());
    }

    public static ArrayList<String> getLast12Months() {
        ArrayList<String> monthList = new ArrayList<String>();
        SimpleDateFormat sdf = new SimpleDateFormat("MMM-yy");
        Calendar cal = Calendar.getInstance(); // current date
        cal.add(Calendar.MONTH, -1);
        for (int i = 1; i <= 12; i++) {
            monthList.add(sdf.format(cal.getTime()));
            cal.add(Calendar.MONTH, -1); // move to previous month
        }

        return monthList; // already in reverse order: current → oldest
    }
}
