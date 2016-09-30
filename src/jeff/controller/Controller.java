package jeff.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeff.service.EmpService;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.pdfbox.cos.COSDocument;
import org.apache.pdfbox.pdfparser.PDFParser;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.util.PDFTextStripper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jeff.bean.*;
@org.springframework.stereotype.Controller
public class Controller {

	@Autowired
	private EmpService empService;
	
	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public ModelAndView Insert(){
		System.out.println("---> Got into controller");
		ModelAndView mav= null;
		mav= new ModelAndView("EmployeeDetails");
		mav.addObject("stateBe",empService.getStateBean());
		return mav;
	}
	
	@RequestMapping(value="/upload",method=RequestMethod.POST)
	public ModelAndView upload(HttpServletRequest req){
		String str = empService.insertEmployeeDetails(req);
		req.setAttribute("message", str);
		return new ModelAndView("Message");
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public ModelAndView update(HttpServletRequest req){
		String str = empService.updateEmployeeDetails(req);
		req.setAttribute("message", str);
		return new ModelAndView("Message");
	}
	
	@RequestMapping(value="/state",method=RequestMethod.GET)
	@ResponseBody
	public List<DistrictBean> getdistrict(@RequestParam int stateId,HttpServletRequest req ){
	
		System.out.println("--> get District Controller");		
		return empService.getDistrictBean(stateId);	
	}
	
	@RequestMapping(value="/district",method=RequestMethod.GET)
	@ResponseBody
	public List<CityBean> getcity(@RequestParam int districtId){
		System.out.println("--> city Controller");
		return  empService.getCitybean(districtId);
		//return "hai";
	}
	
	@ResponseBody
	@RequestMapping(value="/updatt",method=RequestMethod.GET)	
	public EmployeeBean updateAj(@RequestParam int empId, HttpServletRequest req){
		/*EmployeeBean empl =empService.getEmployeeDetails(empId);
		System.out.println("\n --> update Controller");
		for(EmployeeBean empl : addr){
	    	System.out.println("\n"+"Controller values :   "+ToStringBuilder.reflectionToString(empl));
	    	for(AddressList add : empl.getAddress())
	    		 System.out.println(ToStringBuilder.reflectionToString(add));
	    }	*/
		return empService.getEmployeeDetails(empId) ;
	}
	
	@ResponseBody
	@RequestMapping(value="/removeAddr",method=RequestMethod.GET)	
	public int removeAddr(@RequestParam String addId){		
		System.out.println("---> remove Addr Controller");
		return empService.deleteAddr(addId);
	}
	
	
	@RequestMapping(value="/employee/{empId}",method=RequestMethod.GET)
	public ModelAndView getEmpDetail(@PathVariable int empId){
		ModelAndView mav =null;
		mav = new ModelAndView("ListEmployees");		
		mav.addObject("empdetail", empService.getEmployeeDetails(empId)	);
		return mav;
	}	
	
	@RequestMapping(value="/update/{empId}",method=RequestMethod.GET)
	public ModelAndView updateEmpDetail(@PathVariable int empId){
		System.out.println("----> update hitted controlller");
		ModelAndView mav =null;
		
		mav = new ModelAndView("UpdateEmployeeDetails");
		mav.addObject("stateBe",empService.getStateBean());
		mav.addObject("empdetail",empService.getEmployeeDetails(empId));
		return mav;
	}
	
	@RequestMapping(value="/delete/{empId}",method=RequestMethod.GET)
	public ModelAndView deleteEmpDetail(@PathVariable int empId){
		ModelAndView mav =null;
		String message = empService.delete(empId);
		mav = new ModelAndView("Message");
		mav.addObject("message", message);
		return mav;
	}
	
	@RequestMapping(value="/employee",method=RequestMethod.GET)
	public ModelAndView getEmpDetails(HttpServletRequest req){
		
		ModelAndView mav =null;
		System.out.println("--->>>> Employee Controller");
		List<EmployeeBean> empBean = empService.getEmployeeDetails();		 	
		List<StateBean> stat = empService.getStateBean();
		mav = new ModelAndView("ListEmployees");
		mav.addObject("stateBe", stat);
		mav.addObject("drop", empBean);
		mav.addObject("empdetail", empBean);
		
		for(int i=0;i<empBean.size();i++){
	    	System.out.println("values----- "+ToStringBuilder.reflectionToString(empBean.get(i)));
	    }		
		return mav;
	}
	
	@Override
	public String toString() {
		return "Controller [empService=" + empService + "]";
	}

	@ResponseBody
	@RequestMapping(value="/search1",method=RequestMethod.GET)
	public List<EmployeeBean> searchEmpDetail(){
		return empService.getEmployeeDetails();
	}

	@ResponseBody
	@RequestMapping(value="/search",method=RequestMethod.GET)
	public EmployeeBean searchEmpDetail(@RequestParam int empId){
		
		EmployeeBean addr =empService.getEmployeeDetails(empId);
		System.out.println("\n<------Contoller Values------->\n");
	    System.out.println("\n\n"+"Controller values :   "+ToStringBuilder.reflectionToString(addr)+"\n");	  
	  
	   /* for(AddressBean s :addr.getAddress()){
			System.out.println(ToStringBuilder.reflectionToString(s)+"\n");
			  System.out.println("states are "+s.getState());
		}*/
			
		
		return addr;	}
	
	@ResponseBody
	@RequestMapping(value="/address",method=RequestMethod.GET)
	public List<AddressList> addressEmpDetail(@RequestParam int empId){
		System.out.println("\n=====>>> Address controller");
		return empService.getAddress(empId);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/testFile",method=RequestMethod.GET)
	public ModelAndView testFile(){
	//System.out.println("pageContext.request.contextPath"+file.getOriginalFilename());
	ModelAndView mav =new ModelAndView("map");
/*    String line = "";
	File newFile = new File("C:\\Users\\admin\\Documents\\JeffWorkSpace\\WorkSpace\\demo\\EmployeeTest\\server\\"+file.getOriginalFilename());
	file.transferTo(newFile);
	Scanner scanner = new Scanner(newFile.getAbsoluteFile());
	while (scanner.hasNextLine()) {
	    line+= scanner.nextLine()+"\n";
	}
	scanner.close();
	System.out.println("+++>>"+line);
	line = getdata(newFile.getAbsolutePath());*/
	mav.addObject("tag","file.html");
	return mav;
	}
	
	/*@RequestMapping(value="/testFile")
	public ModelAndView delete() throws UnirestException{
		ModelAndView mav =null;
		mav = new ModelAndView("t");
		HttpResponse<JsonNode> response = Unirest.post("https://netservice-convert-pdf-to-html-v1.p.mashape.com/api/documents/pdf2html.json")
		.header("X-Mashape-Key", "jo2zyhE0XGmshSH8BabqRdDuU0FRp1O9zGhjsnBEJte6IPkrb8")
		.header("X-BlackboxApiId", "3")
		.header("X-BlackboxApiToken", "Mashape")
		.field("document", new File("C:\\Users\\admin\\Documents\\JeffWorkSpace\\WorkSpace\\demo\\EmployeeTest\\server\\TNSTC_.pdf"))
		.field("dpi", 144)
		.field("embedCSS", true)
		.field("embedFont", true)
		.field("embedImage", true)
		.field("embedJavascript", true)
		.field("enableOutline", false)
		.field("zoom", 1.0)
		.asJson();
		mav.addObject("testFile",response);
		return mav;
	}*/
	
	
	String getdata(String fil){
		PDFTextStripper pdfStripper = null;
        PDDocument pdDoc = null;
        COSDocument cosDoc = null;
        String parsedText=null;
        File file = new File(fil);
        try {
            PDFParser parser = new PDFParser(new FileInputStream(file));
            parser.parse();
            cosDoc = parser.getDocument();
            pdfStripper = new PDFTextStripper();
            pdDoc = new PDDocument(cosDoc);
           // pdfStripper.setStartPage(1);
           // pdfStripper.setEndPage(5);
            parsedText = pdfStripper.getText(pdDoc);
            System.out.println(parsedText);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		
		return parsedText; 
	}
	@ResponseBody
	@RequestMapping(value = "/download" , method = RequestMethod.GET) 
	public void doDownload(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		
		ServletContext context = request.getSession().getServletContext();
		String appPath = context.getRealPath("/");
		String fullPath = appPath + "WEB-INF/server/sample.xlsx";
		/*ModelAndView mav = new ModelAndView("map");
		mav.addObject("path", fullPath);*/
		FileInputStream inputStream = new FileInputStream(fullPath);
		System.out.println("+++Path"+fullPath);
          Path file = Paths.get(fullPath);
		   // get MIME type of the file
		   String mimeType = context.getMimeType(fullPath);
		   if (mimeType == null) {
		       // set to binary type if MIME mapping not found
		       mimeType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
		   }
		   System.out.println("MIME type: " + mimeType);


		   String headerKey = "Content-Disposition";
		  // response.addHeader(headerKey, "attachment;filename=sample.xlsx");
		   response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

		   // get output stream of the response
		   OutputStream outStream = response.getOutputStream();

		   byte[] buffer = Files.readAllBytes(file);
		   int bytesRead = -1;

		   // write bytes read from the input stream into the output stream
		   while ((bytesRead = inputStream.read(buffer)) != -1) {
		       outStream.write(buffer, 0, bytesRead);
		   }

		   inputStream.close();
		   outStream.close();
		//return mav;
	}
	
	
}
