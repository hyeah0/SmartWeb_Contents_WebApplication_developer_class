import java.util.Calendar;

public class Switch_Calendar {

    public static void main(String[] args) {
        String day = "friday";
        System.out.println("Hey, are you free on " + day + "? \n");

        System.out.println("Hmm, let me check my calendar.");

        Calendar cal = Calendar.getInstance();
        // DAY_OF_WEEK : 요일
        int dayNum = cal.get(Calendar.DAY_OF_WEEK);

        switch (dayNum) {
            case 0:
            case 5:
            case 6:
                System.out.println("I'm free!!");
                break;
            case 1:
                System.out.println("Sorry, I have to stay at work late");
                break;
            case 2:
                System.out.println("It looks like i have meetings all day");
                break;
            case 3:
                System.out.println("I have a dentis appointment. Some other time!");
                break;
            case 4:
                System.out.println("Sorry, thursday is date night!");
            default:
                System.out.println("that's not a day");
        }

    }
}