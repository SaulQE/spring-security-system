package com.quispesucso.repository;

import com.quispesucso.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Integer> 
{
	@Query(value = "select * from users where username=:username", nativeQuery = true)
	public abstract UserEntity findByUsername(String username);
}
