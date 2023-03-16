
import dal.DebtDao;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatter {

    public static void main(String[] args) throws ParseException {
        
        Date currentDate = new Date();
        String date="2023-03-09T23:41";
        // Định dạng ngày tháng
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        SimpleDateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        System.out.println(new Timestamp(originalFormat.parse(date).getTime()));
        System.out.println(dateFormat.format(originalFormat.parse(date)));
        // Chuyển đổi thành chuỗi theo định dạng
        String formattedDate = dateFormat.format(currentDate);
        Date format = dateFormat.parse(formattedDate);

        System.out.println("Ngày giờ hiện tại: " + format.getTime());
        Timestamp timestamp = new Timestamp(format.getTime());
        System.out.println(timestamp);
        formattedDate=dateFormat.format(timestamp);
        System.out.println(formattedDate);
        System.out.println("");

        
        
    }
}
