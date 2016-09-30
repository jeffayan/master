package jeff.bean;

import java.util.List;
import java.util.Set;

import org.hibernate.mapping.Bag;

public class AddressBean {

	private int addId;
	private int empId;
	private int cityId;
	private int districtId;
	private int stateId;	
	private StateBean state;
	private DistrictBean district;
    private CityBean city;
	//private List<StateBean> stateBag;
    
	public StateBean getState() {
		return state;
	}
	public void setState(StateBean state) {
		this.state = state;
	}
	public DistrictBean getDistrict() {
		return district;
	}
	public void setDistrict(DistrictBean district) {
		this.district = district;
	}
	public CityBean getCity() {
		return city;
	}
	public void setCity(CityBean city) {
		this.city = city;
	}
	
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
	public int getCityId() {
		return cityId;
	}
	public void setCityId(int cityId) {
		this.cityId = cityId;
	}
	public int getDistrictId() {
		return districtId;
	}
	public void setDistrictId(int districtId) {
		this.districtId = districtId;
	}
	public int getStateId() {
		return stateId;
	}
	public void setStateId(int stateId) {
		this.stateId = stateId;
	}
	/*public List<StateBean> getStateBag() {
		return stateBag;
	}
	public void setStateBag(List<StateBean> stateBag) {
		this.stateBag = stateBag;
	}*/
	
	
	
}
