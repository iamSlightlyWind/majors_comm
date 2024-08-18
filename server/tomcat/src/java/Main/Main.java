package Main;

import java.util.ArrayList;

import Conversation.Format;
import Conversation.Message;

public class Main {
    public static void main(String[] args) {
        User current = Database.getUser(1);
        User them = Database.getUser(2);

        ArrayList<Message> messages = Format.formatMessages(Database.getMessages(current.id, them.id));

        for (Message message : messages) {
            System.out.println(message.isMine + " " + message.location + " " + message.content);
        }
    }
}
