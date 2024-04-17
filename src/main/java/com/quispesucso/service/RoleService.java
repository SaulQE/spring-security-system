package com.quispesucso.service;

import com.quispesucso.entity.RoleEntity;

import java.util.Collection;

public interface RoleService {
	
	public abstract Collection<RoleEntity> findAll();
	
}
