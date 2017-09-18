package com.htc.dao;

import com.htc.model.Login;
import com.htc.model.User;
public interface UserDAO {
  void register(User user);
  User validateUser(Login login);
}