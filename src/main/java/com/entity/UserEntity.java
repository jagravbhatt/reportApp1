package com.entity;


import jakarta.persistence.*;
import lombok.Data;
import java.util.List;

@Entity
@Table(name = "users")
@Data
public class UserEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer userId;

    private String firstName;
    private String lastName;
    private String gender;
    private String email;
    private String password;
    private String contactNum;
    private String batch;
    private String role; 
    private String branch;
    private String profilePicURL;

   
    @OneToMany(mappedBy = "faculty")
    private List<UserStatsEntity> reports;

    
    @OneToMany(mappedBy = "student")
   private List<UserStatsEntity> myReports;
}
