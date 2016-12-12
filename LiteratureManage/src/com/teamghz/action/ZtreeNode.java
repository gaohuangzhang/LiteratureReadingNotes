package com.teamghz.action;

public class ZtreeNode {
    private String id;
    private Integer state;
    private String pid;
    private String icon;
    private String iconClose;
    private String iconOpen;
    private String name;
    private boolean open;
    private boolean isParent;

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("{id:\"");
        sb.append(id);
        sb.append("\",pId:\"");
        sb.append(pid);
        sb.append("\",name:\"");
        sb.append(name);
        sb.append("\",state:");
        sb.append(state);
        sb.append(",icon:\"");
        sb.append(icon);
        sb.append("\",iconClose:\"");
        sb.append(iconClose);
        sb.append("\",iconOpen:\"");
        sb.append(iconOpen);
        sb.append("\",open:\"");
        sb.append(open);
        sb.append("\",isParent:\"");
        sb.append(isParent);
        sb.append("\"}");
        return sb.toString();
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getIconClose() {
        return iconClose;
    }

    public void setIconClose(String iconClose) {
        this.iconClose = iconClose;
    }

    public String getIconOpen() {
        return iconOpen;
    }

    public void setIconOpen(String iconOpen) {
        this.iconOpen = iconOpen;
    }

    public boolean isOpen() {
        return open;
    }

    public void setOpen(boolean open) {
        this.open = open;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isIsParent() {
        return isParent;
    }

    public void setIsParent(boolean isParent) {
        this.isParent = isParent;
    }


    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public static void main(String[] args) {
        ZtreeNode ztree1 = new ZtreeNode();
        ztree1.setId("1");
        ztree1.setPid("0");
        ztree1.setName("¶¥²ã½Úµã");
        System.out.println(ztree1);
    }
    
}