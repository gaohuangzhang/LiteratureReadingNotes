package com.teamghz.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.swing.text.html.HTML;
import javax.xml.ws.Response;
import com.teamghz.configure.Configure;
import com.teamghz.connecter.MysqlConnecter;
import net.sf.json.JSONObject;
import java.awt.Insets;
import java.io.ByteArrayInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.List;
import org.apache.struts2.ServletActionContext;
import org.jsoup.Jsoup;
import org.zefer.pd4ml.PD4Constants;
import org.zefer.pd4ml.PD4ML;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfImportedPage;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfWriter;
import com.opensymphony.xwork2.ActionSupport;


public class GeneratePDF extends ActionSupport {
	private String articleID;
	private String result;
	private String pdfURL;
	
	public String getPdfURL() {
		return pdfURL;
	}

	public void setPdfURL(String pdfURL) {
		this.pdfURL = pdfURL;
	}

	public String getArticleID() {
		return articleID;
	}

	public void setArticleID(String articleID) {
		this.articleID = articleID;
	}
	
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
	
	// 将源文件与笔记合成pdf
	public String execute() throws Exception {
		String root = ServletActionContext.getServletContext().getRealPath("/");
		MysqlConnecter mc = new MysqlConnecter();
		
		String url_sql = "select url from Article where articleid='" + articleID + "';";
		ArrayList<Map<String, String>> url_result = mc.select(url_sql);
		String fileURL = url_result.get(0).get("1");
		
		String type_sql = "select type from Article where articleid='" + articleID + "';";
		ArrayList<Map<String, String>> type_result = mc.select(type_sql);
		
		String userid_sql = "select userid from Article where articleid='" + articleID + "';";
		ArrayList<Map<String, String>> userid_result = mc.select(userid_sql);
		String userID = userid_result.get(0).get("1");
		String usermail_sql = "select mail from User where userid='" + userID + "';";
		ArrayList<Map<String, String>> usermail_result = mc.select(usermail_sql);
		String usermail = usermail_result.get(0).get("1");
		
		String notePDFPath = NoteToPDF(articleID, mc, usermail, root) + articleID + ".pdf";
		
		String generateFilePath;
		File g = null;
		if (Configure.ONTOMCAT) {
			g = new File(root + Configure.SLOCATION + usermail + Configure.SEPARATOR + "Generate" + Configure.SEPARATOR); 
		}
		else {
			g = new File(Configure.LOCATION + usermail + Configure.SEPARATOR + "Generate" + Configure.SEPARATOR);
		}
		try {
			if (!g.exists() && !g.isDirectory())
				g.mkdir();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
		if (type_result.get(0).get("1").equals("URL")) {
			
		}
		else {
			File originFile = new File(fileURL); 
			String fileName = originFile.getName();
			String ext = fileName.substring(fileName.lastIndexOf(".") + 1);		// 文件后缀名
			if (ext.equals("pdf")) {
				String originFilePath;
				if (Configure.ONTOMCAT) {
					originFilePath = root + Configure.SLOCATION + usermail + Configure.SEPARATOR + fileName;
				}
				else {
					originFilePath = Configure.LOCATION + usermail + Configure.SEPARATOR + fileName;
				}
				generateFilePath = g.getPath() + Configure.SEPARATOR + fileName;
				GeneratePDF(notePDFPath, originFilePath, generateFilePath);
				
				this.setPdfURL(Configure.SLOCATION + usermail + Configure.SEPARATOR + "Generate" + Configure.SEPARATOR + fileName);
			}
			else if (ext.equals("txt")) {
				
			}
		}
		return "SUCCESS";
	}
	
	// 笔记生成HTML
	public void NoteToHTML(String articleID, String noteToHTMLPath, MysqlConnecter mc) {
		String note_sql = "select User.username, Note.notename, Note.time, Note.note from User, Note where User.userid=Note.userid and Note.articleid='" + articleID + "';";
		String article_sql = "select articlename from Article where articleid='" + articleID + "';";
		ArrayList<Map<String, String>> note_result = mc.select(note_sql);
		ArrayList<Map<String, String>> article_result = mc.select(article_sql);
		String fileName = articleID + ".html";
		File f = new File(noteToHTMLPath, fileName);
		if (!f.exists()) {
			try {
				f.createNewFile();
			}
			catch (IOException e) {
				e.printStackTrace();
			}
		}
		byte[] bt = new byte[1024];
		String css = "<style> .city { margin: 5px; padding: 20px; width:100%; background-color: #F9F9F9; word-wrap: break-word; word-break: normal;} </style>";
		try {
			FileOutputStream os = new FileOutputStream(f);
			try {
				bt = ("<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"></head><body>").getBytes();
				os.write(bt, 0, bt.length);
				
				bt = css.getBytes();
				os.write(bt, 0, bt.length);
				
				bt = ("<font face=\"KaiTi\">").getBytes();
				os.write(bt, 0, bt.length);
				
				bt = "<hr>".getBytes();
				os.write(bt, 0, bt.length);
				
				bt = ("<h1>" + article_result.get(0).get("1") + "的相关笔记</h1>").getBytes();
				os.write(bt, 0, bt.length);
				
				for (int i = 0; i < note_result.size(); i++) {
					bt = "<div class=\"city\"> <h2>[".getBytes();
					os.write(bt, 0, bt.length);
					
					bt = (note_result.get(i).get("1") + "]").getBytes();
					os.write(bt, 0, bt.length);
					
					bt = (note_result.get(i).get("2") + "</h2>").getBytes();
					os.write(bt, 0, bt.length);
					
					bt = (note_result.get(i).get("3") + "<br></br>").getBytes();
					os.write(bt, 0, bt.length);
					
					bt = (note_result.get(i).get("4") + "</div>").getBytes();
					os.write(bt, 0, bt.length);
				}
				
				bt = ("</font></body></html>").getBytes();
				os.write(bt, 0, bt.length);
				os.close();
			}
			catch (IOException e) {
				e.printStackTrace();
			}
		}
		catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	// 笔记生成pdf
	public String NoteToPDF(String articleID, MysqlConnecter mc, String usermail, String root) {
		String noteToHTMLPath;
		if (Configure.ONTOMCAT) {
			noteToHTMLPath = root + Configure.SLOCATION + usermail + Configure.SEPARATOR + "Temp" + Configure.SEPARATOR;
		}
		else {
			noteToHTMLPath = Configure.LOCATION + usermail + Configure.SEPARATOR + "Temp" + Configure.SEPARATOR;
		}
		NoteToHTML(articleID, noteToHTMLPath, mc);	// 笔记先转成HTML
		HTMLToPDF(articleID, noteToHTMLPath);
		
		return noteToHTMLPath;
	}
	
	// HTML转成pdf
	public void HTMLToPDF(String articleID, String noteToHTMLPath) {
		String htmlFile = noteToHTMLPath + articleID + ".html";
		String pdfFile = articleID + ".pdf";
		File f = new File(noteToHTMLPath, pdfFile);
		if (!f.exists()) {
			try {
				f.createNewFile();
			}
			catch (IOException e) {
				e.printStackTrace();
			}
		}
		try {
			FileOutputStream os = new FileOutputStream(f);
			try {
				PD4ML pd4ml = new PD4ML();
				pd4ml.setPageInsets(new Insets(20, 10, 10, 10));
				pd4ml.setHtmlWidth(950);
				pd4ml.setPageSize(PD4Constants.A4);
				pd4ml.useTTF("java:fonts", true);
				pd4ml.setDefaultTTFs("KaiTi", "KaiTi", "KaiTi");
				pd4ml.enableDebugInfo();
				pd4ml.render("file:" + htmlFile, os);
			}
			catch (IOException e) {
				e.printStackTrace();
			}
		}
		catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	// 将上传的URL转化为pdf
	public void URLToPDF() {
		
	}
	
	// pdf与pdf合成
	public void GeneratePDF(String notePDFPath, String originFilePath, String generateFilePath) {
		try {
			List<InputStream> pdfs = new ArrayList<InputStream>();
			pdfs.add(new FileInputStream(originFilePath));
			pdfs.add(new FileInputStream(notePDFPath));
			OutputStream os = new FileOutputStream(generateFilePath);
			MergePDF(pdfs, os, true);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void MergePDF(List<InputStream>streamsOfPDF, OutputStream os, boolean paginate) {
		Document document = new Document();
		try {
			List<InputStream> pdfs = streamsOfPDF;
			List<PdfReader> readers = new ArrayList<PdfReader>();
			int totalPages = 0;
			Iterator<InputStream> iteratorPDFs = pdfs.iterator();
			
			while (iteratorPDFs.hasNext()) {
				InputStream pdf = iteratorPDFs.next();
				PdfReader pdfReader = new PdfReader(pdf);
				readers.add(pdfReader);
				totalPages += pdfReader.getNumberOfPages();
			}
			
			PdfWriter writer = PdfWriter.getInstance(document, os);
			document.open();
			BaseFont bf = BaseFont.createFont(BaseFont.HELVETICA, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
			PdfContentByte cb = writer.getDirectContent();
			
			PdfImportedPage page;
			int currentPageNumber = 0;
			int pageOfCurrentReaderPDF = 0;
			Iterator<PdfReader> iteratorPDFReader = readers.iterator();
			
			while (iteratorPDFReader.hasNext()) {
				PdfReader pdfReader = iteratorPDFReader.next();
				
				while (pageOfCurrentReaderPDF < pdfReader.getNumberOfPages()) {
					document.newPage();
					pageOfCurrentReaderPDF++;
					currentPageNumber++;
					page = writer.getImportedPage(pdfReader, pageOfCurrentReaderPDF);
					cb.addTemplate(page, 0, 0);
					
					if (paginate) {
						cb.beginText();
						cb.setFontAndSize(bf, 9);
						cb.showTextAligned(PdfContentByte.ALIGN_CENTER, "" + currentPageNumber + " of " + totalPages, 520, 5, 0);
						cb.endText();
					}
				}
				pageOfCurrentReaderPDF = 0;
			}
			os.flush();
			document.close();
			os.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if (document.isOpen())
				document.close();
			try {
				if (os != null)
					os.close();
			}
			catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}















