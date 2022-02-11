package com.gmu.crm.workbench.service;

import com.gmu.crm.workbench.dao.ClueRemarkDao;
import com.gmu.crm.settings.dao.UserDao;
import com.gmu.crm.settings.domain.User;
import com.gmu.crm.utils.DateTimeUtil;
import com.gmu.crm.utils.MybatisUtil;
import com.gmu.crm.utils.UUIDUtil;
import com.gmu.crm.vo.Pagination;
import com.gmu.crm.workbench.dao.*;
import com.gmu.crm.workbench.domain.*;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

public class ClueService {
    private static UserDao userDao = MybatisUtil.getSqlSession().getMapper(UserDao.class);
    private static ClueDao clueDao = MybatisUtil.getSqlSession().getMapper(ClueDao.class);
    private static ActiveDao activeDao = MybatisUtil.getSqlSession().getMapper(ActiveDao.class);
    private static CustomerDao customerDao = MybatisUtil.getSqlSession(true).getMapper(CustomerDao.class);
    private static ContactsDao contactsDao = MybatisUtil.getSqlSession(true).getMapper(ContactsDao.class);
    private static ClueRemarkDao clueRemarkDao = MybatisUtil.getSqlSession(true).getMapper(ClueRemarkDao.class);
    private static CustomerRemarkDao customerRemarkDao = MybatisUtil.getSqlSession(true).getMapper(CustomerRemarkDao.class);
    private static ContactsRemarkDao contactsRemarkDao = MybatisUtil.getSqlSession(true).getMapper(ContactsRemarkDao.class);
    private static ClueActivityRelationDao clueActivityRelationDao = MybatisUtil.getSqlSession(true).getMapper(ClueActivityRelationDao.class);
    private static ContactsActivityRelationDao contactsActivityRelationDao = MybatisUtil.getSqlSession(true).getMapper(ContactsActivityRelationDao.class);
    private static TranDao tranDao = MybatisUtil.getSqlSession(true).getMapper(TranDao.class);
    private static TranHistoryDao tranHistoryDao = MybatisUtil.getSqlSession(true).getMapper(TranHistoryDao.class);

    public List<User> getUserList() {
        List<User> users = null;
        users = userDao.selectAllUsers();
        return users;
    }

    public boolean save(Clue clue) {
        boolean flag = false;
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ClueDao dao = sqlSession.getMapper(ClueDao.class);
        int result = dao.save(clue);
        if (result == 1) {
            flag = true;
            sqlSession.commit();
        }
        return flag;
    }

    public Pagination<Clue> pageList(Map<String, Object> map) {
        int total = clueDao.getTotalByCondition(map);
        List<Clue> clues = clueDao.getClueListByCondition(map);
        Pagination<Clue> pagination = new Pagination<>();
        pagination.setTotal(total);
        pagination.setActivity(clues);
        return pagination;
    }

    public Clue getClueById(String id) {
        return clueDao.getClueById(id);
    }

    public List<Activity> showActivityList(String clueId) {
        return activeDao.showActivityList(clueId);
    }

    public boolean unbund(String id) {
        boolean flag = false;
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ClueActivityRelationDao dao = sqlSession.getMapper(ClueActivityRelationDao.class);
        int result = dao.unbund(id);
        if (result == 1) {
            flag = true;
            sqlSession.commit();
        }
        return flag;
    }

    public boolean saveLinkedActivity(String clueId, String[] activityIds) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ClueActivityRelationDao clueActivityRelationDao = sqlSession.getMapper(ClueActivityRelationDao.class);
        boolean flag = false;
        ClueActivityRelation car = null;
        for (String activityId:activityIds) {
            car = new ClueActivityRelation();
            car.setId(UUIDUtil.getUUID());
            car.setClueId(clueId);
            car.setActivityId(activityId);
            int result = clueActivityRelationDao.saveLinkedActivity(car);
            if (result == 1) {
                flag = true;
                sqlSession.commit();
            }
        }
        return flag;
    }

    public boolean convert(String clueId, Tran t, String createBy) {
        boolean flag = true;
        String createTime = DateTimeUtil.getSysTime();
        // (1) 获取到线索id，通过线索id获取线索对象（线索对象当中封装了线索的信息）
        Clue clue = clueDao.getClueById(clueId);
        // (2) 通过线索对象提取客户信息，当该客户不存在的时候，新建客户（根据公司的名称精确匹配，判断该客户是否存在！）
        String company = clue.getCompany();
        Customer customer = customerDao.getCustomerByName(company);
        if (customer == null) {
            customer = new Customer();
            customer.setId(UUIDUtil.getUUID());
            customer.setAddress(clue.getAddress());
            customer.setWebsite(clue.getWebsite());
            customer.setPhone(clue.getPhone());
            customer.setOwner(clue.getOwner());
            customer.setNextContactTime(clue.getNextContactTime());
            customer.setName(company);
            customer.setDescription(clue.getDescription());
            customer.setCreateTime(createTime);
            customer.setCreateBy(createBy);
            customer.setContactSummary(clue.getContactSummary());
            int result = customerDao.save(customer);
            if (result != 1) {
                flag = false;
            }
        }
        // (3) 通过线索对象提取联系人信息，保存联系人
        Contacts con = new Contacts();
        con.setId(UUIDUtil.getUUID());
        con.setSource(clue.getSource());
        con.setOwner(clue.getOwner());
        con.setNextContactTime(clue.getNextContactTime());
        con.setMphone(clue.getMphone());
        con.setJob(clue.getJob());
        con.setFullname(clue.getFullname());
        con.setEmail(clue.getEmail());
        con.setDescription(clue.getDescription());
        con.setCustomerId(customer.getId());
        con.setCreateTime(createTime);
        con.setCreateBy(createBy);
        con.setContactSummary(clue.getContactSummary());
        con.setAppellation(clue.getAppellation());
        con.setAddress(clue.getAddress());
        int result = contactsDao.save(con);
        if (result != 1) {
            flag = false;
        }
        // (4) 线索备注转换到客户备注以及联系人备注
        List<ClueRemark> clueRemarkList = clueRemarkDao.getListByClueId(clueId);
        for(ClueRemark clueRemark : clueRemarkList){
            String noteContent = clueRemark.getNoteContent();
            CustomerRemark customerRemark = new CustomerRemark();
            customerRemark.setId(UUIDUtil.getUUID());
            customerRemark.setCreateBy(createBy);
            customerRemark.setCreateTime(createTime);
            customerRemark.setCustomerId(customer.getId());
            customerRemark.setEditFlag("0");
            customerRemark.setNoteContent(noteContent);
            int count3 = customerRemarkDao.save(customerRemark);
            if(count3!=1){
                flag = false;
            }
            ContactsRemark contactsRemark = new ContactsRemark();
            contactsRemark.setId(UUIDUtil.getUUID());
            contactsRemark.setCreateBy(createBy);
            contactsRemark.setCreateTime(createTime);
            contactsRemark.setContactsId(con.getId());
            contactsRemark.setEditFlag("0");
            contactsRemark.setNoteContent(noteContent);
            int count4 = contactsRemarkDao.save(contactsRemark);
            if(count4!=1){
                flag = false;
            }
        }
        // (5) “线索和市场活动”的关系转换到“联系人和市场活动”的关系
        List<ClueActivityRelation> clueActivityRelationList = clueActivityRelationDao.getListByClueId(clueId);
        for(ClueActivityRelation clueActivityRelation : clueActivityRelationList){
            String activityId = clueActivityRelation.getActivityId();
            ContactsActivityRelation contactsActivityRelation = new ContactsActivityRelation();
            contactsActivityRelation.setId(UUIDUtil.getUUID());
            contactsActivityRelation.setActivityId(activityId);
            contactsActivityRelation.setContactsId(con.getId());
            int count5 = contactsActivityRelationDao.save(contactsActivityRelation);
            if(count5!=1){
                flag = false;
            }
        }
        // (6) 如果有创建交易需求，创建一条交易
        if (t!=null) {
            t.setSource(clue.getSource());
            t.setOwner(clue.getOwner());
            t.setNextContactTime(clue.getNextContactTime());
            t.setDescription(clue.getDescription());
            t.setCustomerId(customer.getId());
            t.setContactSummary(clue.getContactSummary());
            t.setContactsId(con.getId());
            int count6 = tranDao.save(t);
            if(count6!=1){
                flag = false;
            }
            //(7)如果创建了交易，则创建一条该交易下的交易历史
            TranHistory th = new TranHistory();
            th.setId(UUIDUtil.getUUID());
            th.setCreateBy(createBy);
            th.setCreateTime(createTime);
            th.setExpectedDate(t.getExpectedDate());
            th.setMoney(t.getMoney());
            th.setStage(t.getStage());
            th.setTranId(t.getId());
            int count7 = tranHistoryDao.save(th);
            if(count7!=1){
                flag = false;
            }
        }
        // (8) 删除线索备注
        for(ClueRemark clueRemark : clueRemarkList){
            int count8 = clueRemarkDao.delete(clueRemark);
            if(count8!=1){
                flag = false;
            }
        }
        // (9) 删除线索和市场活动的关系
        for(ClueActivityRelation clueActivityRelation : clueActivityRelationList){
            int count9 = clueActivityRelationDao.delete(clueActivityRelation);
            if(count9!=1){
                flag = false;
            }
        }
        // (10) 删除线索
        int count10 = clueDao.delete(clueId);
        if(count10!=1){
            flag = false;
        }

        return flag;
    }
}
