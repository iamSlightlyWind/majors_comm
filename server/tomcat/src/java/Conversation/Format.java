package Conversation;

import java.util.ArrayList;

public class Format {
    public static ArrayList<Message> formatMessages(ArrayList<Message> messages) {
        ArrayList<Message> formattedMessages = new ArrayList<Message>();
        for (int i = 0; i < messages.size(); i++) {
            Message message = messages.get(i);
            boolean isFirst = (i == 0) || (messages.get(i - 1).isMine != message.isMine);
            boolean isLast = (i == messages.size() - 1) || (messages.get(i + 1).isMine != message.isMine);

            if (isFirst && isLast) {
                message.location = "middle";
            } else if (isFirst) {
                message.location = "first";
            } else if (isLast) {
                message.location = "last";
            } else {
                message.location = "middle";
            }

            formattedMessages.add(message);
        }
        return formattedMessages;
    }
}
