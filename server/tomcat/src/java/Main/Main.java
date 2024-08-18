package Main;

import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        User current = Database.getUser(1);

        ArrayList<Message> firstMessages = Database.getLastMessages(current.id);
        for (Message message : firstMessages) {
            System.out.println(message);
        }
    }
}