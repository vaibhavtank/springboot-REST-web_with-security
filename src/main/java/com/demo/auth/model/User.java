package com.demo.auth.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.persistence.Entity;

import java.util.Set;

@Entity
@Table(name = "user")
@Getter
@Setter
public class User extends com.demo.auth.model.Entity<Long, User> {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    @TableGenerator(name = "TABLE_GEN", table = "SEQUENCER", pkColumnName = "SEQ_NAME", valueColumnName = "SEQ_COUNT", pkColumnValue = "USER_SEQ_NEXT_VAL")
    private Long id;

    private String username;

    private String password;

    private String firstName;

    private String lastName;

    private String email;

    private String contactNo;

    private Integer countryCode;

    private Integer status;

    @Transient
    private String passwordConfirm;

    @ManyToMany
    private Set<Role> roles;

}
