package jeff.dao;

import java.util.List;

import jeff.bean.AddressBean;
import jeff.bean.CityBean;
import jeff.bean.DistrictBean;
import jeff.bean.EmployeeBean;
import jeff.bean.StateBean;

public interface EmpDao {
	
	List<EmployeeBean> getEmployeeDetails();
	
	EmployeeBean getEmployeeDetails(int empId);
	
	List<Object[]> getEmpAddress(int empId);
	
	List<CityBean> getCityBean(int districtId);
	
	List<DistrictBean> getDistrictBean(int stateId);
	
	List<StateBean> getStateBean();
	
	StateBean getState(int stateId);
	
	Object getobj(String cmd, int id);
	
	DistrictBean getDistrict(int districtId);
	
	CityBean getCity(int cityId);
	
	int insertEmployeeDetails(EmployeeBean empBean);
	
	int insertEmpAddress(AddressBean addBean);
	
	String updateEmployeeDetails(EmployeeBean empBean);
	
	String updateEmployeeAddressDetails(AddressBean addBean);
	
	String delete(int empId);
	
	int deleteAddr(String addId);
	

	
}
