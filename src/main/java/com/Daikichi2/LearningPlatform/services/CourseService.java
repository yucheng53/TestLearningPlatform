package com.Daikichi2.LearningPlatform.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Daikichi2.LearningPlatform.models.Course;
import com.Daikichi2.LearningPlatform.models.User;
import com.Daikichi2.LearningPlatform.repositories.CoursesRepository;
import com.Daikichi2.LearningPlatform.repositories.SearchRepository;


@Service
public class CourseService {
	
	@Autowired
	private SearchRepository searchRepo;
	
	// public List<Course> searchList(String keyword){
	// 	if(keyword!= null) {
	// 		return searchRepo.search(keyword);
	// 	}
		
	// 	return searchRepo.search(keyword);
	// }
	public List<Course> searchList(String keyword){

		return searchRepo.findByTitle(keyword);
	
		}
	
	private final CoursesRepository courseRepo;

	public CourseService(CoursesRepository courseRepo) {
		super();
		this.courseRepo = courseRepo;
	}
	
	//find all courses
		public List<Course>allCourses(){
			return courseRepo.findAll();
		}
		//create courses
		
		public Course createCourse(Course course) {
			return courseRepo.save(course);
		}
		
		//find one Course
		public Course findCourse(Long id) {			
			Optional<Course> optCourse = courseRepo.findById(id);
			if(optCourse.isPresent()) {
				return optCourse.get();
			}
			else return null;
		}		
		
		//delete a Course		
		public void delete(Long id) {
				courseRepo.deleteById(id);
				}
		
		//update one Course
		public Course updateCourse(Course course) {
			return courseRepo.save(course);
		}	
		
		//find all of one teacher's courses
		public List<Course> findTechersCourses(User teacher) {
			return courseRepo.findByTeacher(teacher);			
		}

};
