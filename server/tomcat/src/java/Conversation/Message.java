package Conversation;

public class Message {
    public boolean isMine;
    public int theirID;
    public String type;
    public String content;
    public String location;
    public String time;
    public String link;

    public Message(boolean isMine, int theirID, String type, String content, String time) {
        this.isMine = isMine;
        this.type = type;
        this.content = content;
        this.time = time;

        if (!type.equals("text")) {
            this.link = content;
            this.content = content.split("/")[1];
        }
    }

    public String getLink() {
        return link;
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

    public String getTime() {
        return time;
    }

    public String getIsMine() {
        return isMine + "";
    }

    public String toString() {
        return location + " " + content;
    }
}
