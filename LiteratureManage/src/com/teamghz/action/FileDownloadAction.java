package com.teamghz.action;

import java.io.*;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class FileDownloadAction extends ActionSupport
{
    public InputStream getDownloadFile()
    {
        return ServletActionContext.getServletContext().getResourceAsStream("upload/通讯录2012年9月4日.xls");
    }
    
    @Override
    public String execute() throws Exception
    {
        return SUCCESS;
    }
}