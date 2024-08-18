package Conversation;

public class Preview {
    public String theirName;
    public Message message;
    public int theirID;

    public Preview(int theirID, String theirName, Message message) {
        this.theirID = theirID;
        this.theirName = theirName;
        this.message = message;
    }

    public int getTheirID() {
        return theirID;
    }

    public String getTheirName() {
        return theirName;
    }

    public String getMessage() {
        String from = message.isMine ? "You: " : theirName + ": ";
        return from + message.content;
    }
}
