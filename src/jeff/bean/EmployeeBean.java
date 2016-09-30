package jeff.bean;

import java.util.List;
import java.util.Set;

public class EmployeeBean {

private int empId;
private String empName;
private String gender;
private String dateOfBirth;
private String maritalStatus;
private String designation;
private List<AddressBean> address;
public int getEmpId() {
	return empId;
}
public void setEmpId(int empId) {
	this.empId = empId;
}
public String getEmpName() {
	return empName;
}
public void setEmpName(String empName) {
	this.empName = empName;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public String getDateOfBirth() {
	return dateOfBirth;
}
public void setDateOfBirth(String dateOfBirth) {
	this.dateOfBirth = dateOfBirth;
}
public String getMaritalStatus() {
	return maritalStatus;
}
public void setMaritalStatus(String maritalStatus) {
	this.maritalStatus = maritalStatus;
}
public String getDesignation() {
	return designation;
}
public void setDesignation(String designation) {
	this.designation = designation;
}
public List<AddressBean> getAddress() {
	return address;
}
public void setAddress(List<AddressBean> address) {
	this.address = address;
}




	
}
