package jeff.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jeff.bean.AddressBean;
import jeff.bean.AddressList;
import jeff.bean.CityBean;
import jeff.bean.DistrictBean;
import jeff.bean.EmployeeBean;
import jeff.bean.StateBean;
import jeff.dao.EmpDao;

@Service("EmpService")
public class EmpServiceImpl implements EmpService {

	@Autowired
	private EmpDao empDao;
	
	EmployeeBean empBean = new EmployeeBean();
	AddressBean addBean = new AddressBean();
	
	@Override
	public List<EmployeeBean> getEmployeeDetails() {
		/*List<EmployeeBean> empBean =this.empDao.getEmployeeDetails();
				List<Object[]> list = this.empDao.getEmployeeDetails();
		Iterator iterator = list.iterator();
		while (iterator.hasNext()) {
			EmployeeBean obj =(EmployeeBean) iterator.next();
			EmployeeBean emp = new EmployeeBean();
		    emp.setEmpId(obj.getEmpId());
		    emp.setEmpName(obj.getEmpName());
		    emp.setGender(obj.getGender());
		    emp.setDateOfBirth(obj.getDateOfBirth());
		    emp.setMaritalStatus(obj.getMaritalStatus());
		    emp.setDesignation(obj.getDesignation());    
			empBean.add(emp);			 	    
		}
		*/		
		
		return this.empDao.getEmployeeDetails();
	}

	@Override
	public EmployeeBean getEmployeeDetails(int empId) {
		
		/*List<EmployeeBean> empBean = new ArrayList<>();
		List<Object[]> list = this.empDao.getEmployeeDetails(empId);
		Iterator iterator = list.iterator();
		while (iterator.hasNext()) {
			EmployeeBean obj = (EmployeeBean) iterator.next();
			EmployeeBean emp = new EmployeeBean();
			int Id = obj.getEmpId();
		    emp.setEmpId(Id);
		    	//System.out.println(Integer.parseInt(obj[0].toString()));
		    emp.setEmpName(obj.getEmpName());
		    	//System.out.println(obj[1].toString());
		    emp.setGender(obj.getGender());
		    	//System.out.println(obj[2].toString());
		    emp.setDateOfBirth(obj.getDateOfBirth());
		    	//System.out.println(obj[3].toString());
		    emp.setMaritalStatus(obj.getMaritalStatus());
		    	//System.out.println(obj[4].toString());
		    emp.setDesignation(obj.getDesignation());
		    	//System.out.println(obj[5].toString());
		    	
	        List<Object[]> addlist = empDao.getEmpAddress(Id);		   
	        List<AddressList> demoList = new ArrayList<AddressList>();
	        Iterator itr = addlist.iterator();
	        
	        while (itr.hasNext()) {
				AddressBean temp = (AddressBean) itr.next();
				
				AddressList al = new AddressList();
				
				al.setAddId(temp.getAddId());
				al.setEmpId(temp.getEmpId());
                al.setCity(empDao.getCity(temp.getCityId()));
                al.setDistrict(empDao.getDistrict(temp.getDistrictId()));
                al.setState(empDao.getState(temp.getStateId()));
				demoList.add(al);
			}       
	         
	      //  emp.setAddress(demoList);
	        empBean.add(emp);
		}
	
		 System.out.println("---> exited getemp(id)"+ empBean.size());*/
		return this.empDao.getEmployeeDetails(empId);
	}

	@Override
	public List<CityBean> getCitybean(int districtId) {
		/*List<CityBean> cityBean = new ArrayList<>();
		List<Object[]> list = this.empDao.getCityBean(districtId);
		Iterator iterator = list.iterator();
		while (iterator.hasNext()) {
			CityBean obj =(CityBean) iterator.next();
			CityBean cb = new CityBean();
			cb.setCityId(obj.getCityId());
			cb.setCity(obj.getCity());
			cb.setDistrictId(obj.getDistrictId());
		   cityBean.add(cb);
		   
		}*/
		return this.empDao.getCityBean(districtId);
	}

	@Override
	public List<DistrictBean> getDistrictBean(int stateId) {
		/*List<DistrictBean> districtBean = new ArrayList<>();
		List<Object[]> list = this.empDao.getDistrictBean(stateId);
		Iterator iterator = list.iterator();
		while (iterator.hasNext()) {
			DistrictBean obj = (DistrictBean) iterator.next();
			DistrictBean db = new DistrictBean();
			db.setDistrictId(obj.getDistrictId());
			db.setDistrict(obj.getDistrict());
			db.setStateId(obj.getStateId());
			districtBean.add(db);
		}*/
		
		return this.empDao.getDistrictBean(stateId);
	}

	@Override
	public List<StateBean> getStateBean() {
		/*System.out.println("---> got into service method");
		List<StateBean> stateBean = new ArrayList<>();
		List<StateBean> list =(List<StateBean>) */
		/*Iterator iterator = list.iterator();
		while (iterator.hasNext()) {
			StateBean obj =(StateBean) iterator.next();
			StateBean sb = new StateBean();
			sb.setStateId(obj.getStateId());
			sb.setState(obj.getState());
			stateBean.add(sb);
		}*/
		return this.empDao.getStateBean();
	}

	@Override
	public String insertEmployeeDetails(HttpServletRequest req) {
        int add_id=0;
		int emp_Id;
		String msg="Exception Occurred";
		try{
			
			
			empBean.setEmpName(req.getParameter("empName"));
			empBean.setGender(req.getParameter("gender"));
			empBean.setDateOfBirth(req.getParameter("dateOfBirth"));
			empBean.setMaritalStatus(req.getParameter("maritalStatus"));
			empBean.setDesignation(req.getParameter("designation"));
									
			emp_Id= empDao.insertEmployeeDetails(empBean);
			
			 addBean.setEmpId(emp_Id);
		     String[] stateId = req.getParameterValues("state");
		     String[] districtId = req.getParameterValues("district");
		     String[] cityId = req.getParameterValues("city");		
			
			for(int i=0;i<stateId.length;i++)
			{
				addBean.setStateId(Integer.parseInt(stateId[i]));
				addBean.setDistrictId(Integer.parseInt(districtId[i]));
				addBean.setCityId(Integer.parseInt(cityId[i]));
				 add_id = empDao.insertEmpAddress(addBean);
			}
			
			if(add_id!=0)
				msg="Data Uploaded Successfully";
			else
				msg="Data Upload failed";
				
			
			}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
		return msg;
	}

	@Override
	public String updateEmployeeDetails(HttpServletRequest req) {
		String msg =null;
		try{
			
			empBean.setEmpId(Integer.parseInt(req.getParameter("empId")));
			System.out.println(empBean.getEmpId());
			empBean.setEmpName(req.getParameter("empName"));
			System.out.println(empBean.getEmpName());
			empBean.setGender(req.getParameter("gender"));
			System.out.println(empBean.getGender());
			empBean.setDateOfBirth(req.getParameter("dateOfBirth"));
			System.out.println(empBean.getDateOfBirth());
			empBean.setMaritalStatus(req.getParameter("maritalStatus"));
			System.out.println(empBean.getMaritalStatus());
			empBean.setDesignation(req.getParameter("designation"));
			System.out.println(empBean.getDesignation());	
						
			 addBean.setEmpId(empBean.getEmpId());
			 String[] addId= req.getParameterValues("addId");
		     String[] stateId = req.getParameterValues("state");
		     String[] districtId = req.getParameterValues("district");
		     String[] cityId = req.getParameterValues("city");		
			
			for(int i=0;i<stateId.length;i++)
			{
				String id = addId[i];
				if(id!="")addBean.setAddId(Integer.parseInt(id));
				addBean.setStateId(Integer.parseInt(stateId[i]));
				addBean.setDistrictId(Integer.parseInt(districtId[i]));
				addBean.setCityId(Integer.parseInt(cityId[i]));
		
				msg = empDao.updateEmployeeAddressDetails(addBean);
			}
		  	  msg = empDao.updateEmployeeDetails(empBean);
			
			}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
		return msg;
	}

	@Override
	public String delete(int empid) {
		String message = empDao.delete(empid);
		return message;
		
	}

	@Override
	public List<AddressList> getAddress(int empId) {
		
		List<AddressList> AddBean = new ArrayList<>();
		/*List<Object[]> list = this.empDao.getEmpAddress(empId);
		Iterator iterator = list.iterator();
		while (iterator.hasNext()) {
			AddressBean temp = (AddressBean)iterator.next();
			AddressList al = new AddressList();
			al.setAddId(temp.getAddId());
			al.setEmpId(temp.getEmpId());
            al.setCity(empDao.getCity(temp.getCityId()));
            al.setDistrict(empDao.getDistrict(temp.getDistrictId()));
            al.setState(empDao.getState(temp.getStateId()));
			AddBean.add(al);
		}*/
		return AddBean;
		
	}

	@Override
	public int deleteAddr(String addId) {
		 return empDao.deleteAddr(addId);
		// TODO Auto-generated for JeffAyan
		
	}

	
	 

}
