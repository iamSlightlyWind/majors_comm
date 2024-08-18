package Main;

public class Message {
    public boolean isMine;
    public int theirID;
    public String type;
    public String content;

    public Message(boolean isMine, int theirID, String type, String content) {
        this.isMine = isMine;
        this.type = type;
        this.content = content;
    }

    public String getContent() {
        return content;
    }

    public String getType() {
        return type;
    }

    public boolean isMine() {
        return isMine;
    }

    public String toString() {
        if (isMine) {
            return "Me: " + content;
        } else {
            return "Them: " + content;
        }
    }
}
