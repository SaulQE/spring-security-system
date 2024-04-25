package com.quispesucso.repository;

import com.quispesucso.entity.RoleEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Collection;

@Repository
public interface RoleRepository extends JpaRepository<RoleEntity, Integer>
{
    public abstract RoleEntity findByTipo(String tipo);

    @Query(value = "select * from roles order by role_id",nativeQuery = true)
    public abstract Collection<RoleEntity> findAllOrderBy();
}
