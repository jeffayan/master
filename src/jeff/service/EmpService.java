package jeff.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import jeff.bean.AddressBean;
import jeff.bean.AddressList;
import jeff.bean.CityBean;
import jeff.bean.DistrictBean;
import jeff.bean.EmployeeBean;
import jeff.bean.StateBean;

public interface EmpService {
	String delete(int empid);
	
	int deleteAddr(String addId);
	
	List<EmployeeBean> getEmployeeDetails();
	
	EmployeeBean getEmployeeDetails(int empId);
	
	List<CityBean> getCitybean(int districtId);
	
	List<DistrictBean> getDistrictBean(int stateId);
	
	List<StateBean> getStateBean();
	
	String insertEmployeeDetails(HttpServletRequest req);
	
	String updateEmployeeDetails(HttpServletRequest req);

	List<AddressList> getAddress(int empId);
	
	
}
