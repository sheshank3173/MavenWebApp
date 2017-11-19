package com.htc.service;

import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;

import com.htc.dao.UserDAO;
import com.htc.model.Login;
import com.htc.model.User;

public class UserServiceImpl implements UserService {

  @Autowired
  public UserDAO userDAO;
  public void register(User user) {
    userDAO.register(user);
  }

  public User validateUser(Login login) {
    return userDAO.validateUser(login);
  }
  
  /* Method to list valid users -- for  Selenium testing*/
	public HashMap<String, String> existingUsers() {		
		return userDAO.existingUsers();
	}

	public void removeTestRegister(User testUser){
		userDAO.removeTestRegister(testUser);
	}
}
