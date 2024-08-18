package Conversation;

public class Message {
    public boolean isMine;
    public int theirID;
    public String type;
    public String content;
    public String location;

    public Message(boolean isMine, int theirID, String type, String content) {
        this.isMine = isMine;
        this.type = type;
        this.content = content;
    }

    public String getLocation() {
        return location;
    }

    public String getContent() {
        return content;
    }

    public String getId() {
        return theirID + "";
    }

    public String getType() {
        return type;
    }

    public String getIsMine() {
        return isMine + "";
    }

    public String toString(){
        return location + " " + content;
    }
}
