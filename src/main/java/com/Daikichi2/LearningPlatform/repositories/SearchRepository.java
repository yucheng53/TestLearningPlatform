package com.Daikichi2.LearningPlatform.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.Daikichi2.LearningPlatform.models.Course;

//@Repository
public interface SearchRepository extends JpaRepository<Course, Long>{
	
	public List<Course> findByTitle(String keyword);
	// @Query("SELECT c from Course c where c.title like %?1%"
			
	// 		+"OR c.credit LIKE %?1%"
	// 		+"OR c.required LIKE %?1%"
	// 		+"OR c.teacher LIKE %?1%" )
	// public List<Course> search(String keyword);

}
