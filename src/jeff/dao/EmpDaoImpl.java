package jeff.dao;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import jeff.bean.AddressBean;
import jeff.bean.CityBean;
import jeff.bean.DistrictBean;
import jeff.bean.EmployeeBean;
import jeff.bean.StateBean;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("EmpDao")
public class EmpDaoImpl implements EmpDao {

    @Autowired
	private SessionFactory sessionFactory;
	
	
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public List<EmployeeBean> getEmployeeDetails() {
		Session session = sessionFactory.openSession();
		String cmd = "from jeff.bean.EmployeeBean";
		List<EmployeeBean> data =(List<EmployeeBean>)session.createQuery(cmd).list();
		session.flush();		
		return data;
		
	}


	@Override
	public EmployeeBean getEmployeeDetails(int empId) {
		Session session = sessionFactory.openSession();	
        EmployeeBean bean = (EmployeeBean) session.get(EmployeeBean.class,empId);
        session.flush();	
		return bean;
	
	}

	@Override
	public List<CityBean> getCityBean(int districtId) {
	
		String cmd ="from jeff.bean.CityBean where districtId = "+districtId+"";
		Session session = sessionFactory.openSession();	
		List<CityBean> data = session.createQuery(cmd).list();
        session.flush();
        return data;
		
		/*try{
			
			Query query = session.createQuery(cmd);
		    data = query.list();
		    for(int i=0;i<data.size();i++){
		    	System.out.println("values-----"+ToStringBuilder.reflectionToString(data.get(i)));
		    }			    
		    
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
			{
				session.flush();
				session.close();
				
			}					
		}
					
		return data;*/
	}

	@Override
	public List<DistrictBean> getDistrictBean(int stateId) {
		String cmd = "from jeff.bean.DistrictBean where stateId = '"+stateId+"'";
		Session session = sessionFactory.openSession();	
		List<DistrictBean> data = session.createQuery(cmd).list();
        session.flush();
        return data;
	}

	@Override
	public List<StateBean> getStateBean() {
		String cmd = "from jeff.bean.StateBean";
		Session session = sessionFactory.openSession();
		List<StateBean> data =(List<StateBean>)session.createQuery(cmd).list();
		session.flush();
		session.close();		
		return data;
	}


	@Override
	public int insertEmployeeDetails(EmployeeBean empBean) {
		Session session =  sessionFactory.openSession();
		int id=(Integer) session.save(empBean);
		session.flush();
		return saveDetails(empBean);
		
	}

	@Override
	public String updateEmployeeDetails(EmployeeBean empBean) {
		Session session =  sessionFactory.openSession();
		int id;
		String message = "Update Employee Details Successful!!!";
		try
		{
			session.saveOrUpdate(empBean);
			session.flush();
			session.clear();
		
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		return message;
	}

	@Override
	public String delete(int empId) {
		Session session = sessionFactory.openSession();
		EmployeeBean emp = new EmployeeBean();
		emp.setEmpId(empId);
		session.delete(emp);
		String message="Data removed";
		session.flush(); session.close();
		return message;
		
	}


	private int deleteMethod(String cmd) {
		Session session =sessionFactory.openSession();		
		int id=0;
		try{
			Transaction transaction = session.beginTransaction();
			Query query = session.createSQLQuery(cmd);
			id= query.executeUpdate();			
			transaction.commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.flush();
				session.close();
		}
		return id;
	}


	@Override
	public int insertEmpAddress(AddressBean addBean) {
		Session session =  sessionFactory.openSession();
		int id=(Integer) session.save(addBean);
		session.flush();
		return saveDetails(addBean);
	}


	private int saveDetails(Object obj) {
		Session session =  sessionFactory.openSession();
		int id=0;
		try
		{
			id=(Integer) session.save(obj);
			session.flush();
			session.clear();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		return id;
	}

	
	

	@Override
	public List getEmpAddress(int empId) {	
		String cmd = "from jeff.bean.AddressBean where empId = "+empId+"";
		
		return getDataList(cmd);
	}


	@Override
	public StateBean getState(int stateId) {
	
		StateBean sb = new StateBean();
		String cmd = "from jeff.bean.StateBean where stateId="+stateId+"";
		List data=getDataList(cmd);		
		Iterator itr = data.iterator();
		while (itr.hasNext()) {
			StateBean object = (StateBean) itr.next();
			sb.setStateId(object.getStateId());
			sb.setState(object.getState());
		}		
		
		return sb;
	}


	@Override
	public DistrictBean getDistrict(int districtId) {
		DistrictBean db = new DistrictBean();
		String cmd = "from jeff.bean.DistrictBean where districtId="+districtId+"";
		List data=getDataList(cmd);		
		Iterator itr = data.iterator();
		while (itr.hasNext()) {
			DistrictBean object = (DistrictBean) itr.next();
			db.setDistrictId(object.getDistrictId());
			db.setDistrict(object.getDistrict());
			db.setStateId(object.getStateId());
		}		
		
		return db;
	}


	@Override
	public CityBean getCity(int cityId) {
		CityBean cb = new CityBean();
		String cmd ="from jeff.bean.CityBean where cityId="+cityId+"";
		List data=getDataList(cmd);
		
		Iterator itr = data.iterator();
		while (itr.hasNext()) {
			CityBean object = (CityBean) itr.next();
			cb.setCityId(object.getCityId());
			cb.setCity(object.getCity());
			cb.setDistrictId(object.getDistrictId());
		}		
		
		return cb;
	}


	@Override
	public String updateEmployeeAddressDetails(AddressBean addBean) {
		String message = "Update Employee Address Successful!!!";
		Session session =  sessionFactory.openSession();	
		try
		{
			session.saveOrUpdate(addBean);
			session.flush();
			session.clear();
		
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		return message;
	}

	private List<Object[]> getDataList(String cmd ) {
		List<Object[]> data=null;
		Session session = sessionFactory.openSession();
		System.out.println("---->>>>Session Opened");
		try{						
		    data =session.createQuery(cmd).list();
			
		    for(int i=0;i<data.size();i++){
		    	System.out.println("values----- "+ToStringBuilder.reflectionToString(data.get(i)));
		    }			    
		    
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
			{
				session.flush();
				session.close();
				
			}					
		}
		if(data==null){
			System.out.println("--->data Null");
			getDataList(cmd);
		}
			
		
		return data;
	}


	@Override
	public Object getobj(String cmd, int id) {

		Object obj=null;
         Session session = sessionFactory.openSession();
         
         try{
        	 obj = session.get(cmd, new Integer(id));
         }
         catch(Exception ex)
         {
        	 ex.printStackTrace();
         }
         finally{
        	 if(session!=null)
        		 session.close();
         }
         
         if(obj==null)
        	 System.out.println("Object Null");
         
	return obj;
         
	}


	@Override
	public int deleteAddr(String addId) {
		String cmd = "delete from jeff.bean.AddressBean where addId in("+addId+")";
		System.out.println("\n ======>  Delete Query   "+cmd);
		return deleteMethod(cmd);
	}
	

}
