 package com.entity;



 import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "user_stats")
@Data
public class UserStatsEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer userStatsId;

    private Integer attendancePercentage;
    private Integer communication;	
    private Integer discipline;
    private Integer resultPercentage;

    @Column(name = "subject_name")  
    private String subject;

    
    @ManyToOne
    @JoinColumn(name = "faculty_id")
    private UserEntity faculty;

    
    @ManyToOne
    @JoinColumn(name = "student_id")
    private UserEntity student;
}
