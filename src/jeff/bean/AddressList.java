package jeff.bean;

import java.util.List;

public class AddressList {

private int addId;
private int empId;
private CityBean city;
private DistrictBean district;
private StateBean state;
public int getAddId() {
	return addId;
}
public void setAddId(int addId) {
	this.addId = addId;
}
public int getEmpId() {
	return empId;
}
public void setEmpId(int empId) {
	this.empId = empId;
}
public CityBean getCity() {
	return city;
}
public void setCity(CityBean city) {
	this.city = city;
}
public DistrictBean getDistrict() {
	return district;
}
public void setDistrict(DistrictBean district) {
	this.district = district;
}
public StateBean getState() {
	return state;
}
public void setState(StateBean state) {
	this.state = state;
}



}
