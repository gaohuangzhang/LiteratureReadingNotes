package com.teamghz.action;


import java.util.ArrayList;

import java.util.HashMap;

import java.util.List;
import java.util.Map;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


  
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
        String tmp = "";
        System.out.println("hereh" + this.name);
        Map map = new HashMap(); 
        List<String> lstTree = new ArrayList<String>();
        JSONObject jsonObject;  
       
        String s1 = "{id:1, pId:0, name:\"test1\" , open:true}";
        String s2 = "{id:11, pId:1, name:\"test1\" , open:true}";
        lstTree.add(s1);
        lstTree.add(s2);

    
        String s = JSONArray.fromObject(lstTree).toString();

        result = s;
        System.out.println(s);
        
        
      
    
        return "success";
    }
   

}