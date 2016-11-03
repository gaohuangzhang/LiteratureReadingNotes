package com.teamghz.action;

  
public class AjaxExampleAction {

    private String name;
    private String result;

    // ajax请求参数赋值
    public void setName(String name) {
        this.name = name;
    }

    // ajax返回结果
    public String getResult() {
        return result;
    }

    public String execute() {
        this.result = "Hello! " + this.name + ".";
        System.out.println("hereh" + this.name);
        return "success";
    }

}