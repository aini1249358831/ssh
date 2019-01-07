package com.itlike.dao;

import com.itlike.domian.User;

public interface UserDao {
     User getUser(String username, String password);
}
