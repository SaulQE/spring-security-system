package com.quispesucso.service;

import com.quispesucso.entity.RoleEntity;

import java.util.Collection;

public interface RoleService
{
	public abstract void insert(RoleEntity role);
	public abstract void update(RoleEntity role);
	public abstract void delete(Integer roleId);
	public abstract RoleEntity findById(Integer roleId);
	public abstract Collection<RoleEntity> findAll();
	public abstract Collection<RoleEntity> findAllOrderBy();
	
}
