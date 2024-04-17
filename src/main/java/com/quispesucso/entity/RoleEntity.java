package com.quispesucso.entity;

import com.quispesucso.util.RoleType;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "roles")
public class RoleEntity implements Serializable
{
    private static final long serialVersionUID=1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer roleId;
    @Column(unique = true, nullable = false)
    private String tipo= RoleType.USER.name();

    @ManyToMany(mappedBy = "itemsRole", fetch = FetchType.EAGER)
    private Set<UserEntity> itemsUser = new HashSet<>();

    public RoleEntity() {
    }

    public RoleEntity(Integer roleId, String tipo) {
        this.roleId = roleId;
        this.tipo = tipo;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Set<UserEntity> getItemsUser() {
        return itemsUser;
    }

    public void setItemsUser(Set<UserEntity> itemsUser) {
        this.itemsUser = itemsUser;
    }
}
