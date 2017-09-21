package com.htc.dao;

import java.util.HashMap;

import com.htc.model.Login;
import com.htc.model.User;
public interface UserDAO {
  public void register(User user);
  public User validateUser(Login login);
  public HashMap<String, String> existingUsers();
  public void removeTestRegister(User testUser);
}