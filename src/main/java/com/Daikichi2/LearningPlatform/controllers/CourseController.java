package com.Daikichi2.LearningPlatform.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.Daikichi2.LearningPlatform.models.Course;
import com.Daikichi2.LearningPlatform.models.Enrollment;
import com.Daikichi2.LearningPlatform.models.User;
import com.Daikichi2.LearningPlatform.services.CourseService;
import com.Daikichi2.LearningPlatform.services.EnrollmentService;
import com.Daikichi2.LearningPlatform.services.UserService;

@Controller
public class CourseController {
	@Autowired
	private CourseService courseService;
	@Autowired
	private UserService userService;
	@Autowired
	private EnrollmentService enrollmentService;

	public CourseController(CourseService courseService, UserService userService, EnrollmentService enrollmentService) {
		this.courseService = courseService;
		this.userService = userService;
		this.enrollmentService = enrollmentService;
	}
	
	@GetMapping("/dashboard")
	public String dashboard(Model model, @Param("keyword") String keyword,HttpSession session)
	{
		if(!UserService.IsLoggedIn(session)) return "redirect:/createError";
		model.addAttribute("allCourses", courseService.allCourses());
		return "dashboard";
	}
	
	@GetMapping("/courses")
	public String courses (Model model, HttpSession session) {
		// user in session so query me
		//then add to jsp
		if(!UserService.IsLoggedIn(session)) return "redirect:/createError";
		model.addAttribute("allCourses", courseService.allCourses());
		return "courses";
	}
	
	@GetMapping("/my_courses")
	public String my_courses(Model model, HttpSession session) {
		if(!UserService.IsLoggedIn(session)) return "redirect:/createError";
		User user = (User) session.getAttribute("user");
		if(user.getRole().equals("teacher")) {
		List<Course> myCourses = (List<Course>)courseService.findTechersCourses(user);
		System.out.println("if");
		model.addAttribute("myCourses", myCourses);
	}
		if(user.getRole().equals("student")) {
			List<Enrollment> myEnrollments =(List<Enrollment>)enrollmentService.findByStudent(user);
			model.addAttribute("myEnrollments", myEnrollments);
		}
		return "myCourses";
	}
	
	//Route to show one course
	@GetMapping("/oneCourse/{id}")
	public String oneCourse(@PathVariable("id")Long id,  Model model, HttpSession session) {
		if(!UserService.IsLoggedIn(session)) return "redirect:/createError";
		model.addAttribute("course", courseService.findCourse(id));
		return "singleCourse";
	}
	
	@GetMapping("/new_course")
	public String new_course(Model model, HttpSession session) {
		if(!UserService.IsLoggedIn(session)) return "redirect:/createError";
		model.addAttribute("course", new Course());
		model.addAttribute("allTeachers", userService.allUsers("teacher"));
		//model.addAttribute("allTeachers", UserService.)
		return "new_course";
	}
	
	//process the post to create candy
	@PostMapping("/add_course")
	public String postingCourse(@Valid @ModelAttribute("course")Course course, BindingResult result,HttpSession session) {
		User user = (User)session.getAttribute("user");
		if(result.hasErrors()) return "new_course";
		
		else {
			course.setTeacher(user);
			courseService.createCourse(course);
		}				
		return "redirect:/dashboard";
	}
					
	//render the update course form
	
	@GetMapping("/updateCourse/{id}")
	public String updateCourse(@PathVariable("id") Long id, @ModelAttribute("course") Course course,Model model, HttpSession session) {
		if(!UserService.IsLoggedIn(session)) return "redirect:/createError";
		model.addAttribute("course", courseService.findCourse(id));
		return "updateCourse";
	}
	//process the post to update course
	@RequestMapping(value ="/updatingCourse/{id}", method = RequestMethod.PUT)
	public String updatingCourse(@Valid @ModelAttribute("course")Course course, BindingResult result) {
		
		if(result.hasErrors()) return "updateCourse";
		
		else {
			courseService.updateCourse(course);
		}
		return "redirect:/courses";
	}
	
	//route to delete a course 
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id")Long id,  Model model, HttpSession session) {
		if(!UserService.IsLoggedIn(session)) return "redirect:/createError";
		User user = (User)session.getAttribute("user");
		Course course = (Course)courseService.findCourse(id);
		if(course.getTeacher().getId()== user.getId()){
			courseService.delete(id);
			return "redirect:/courses";
			}		
		return "redirect:/createError2";
	}

	//for students enroll in a course
	@GetMapping("/student/enroll/{id}")
	public String student_enroll_course(@PathVariable("id") Long id, HttpSession session, Model model) {
		if(!UserService.IsLoggedIn(session)) return "redirect:/createError";
		Course course = (Course)courseService.findCourse(id);
		User student = (User) session.getAttribute("user");
		//Enrollment enrollment_db = (Enrollment)enrollmentService.findByStudentAndCourse(student,course);
		//System.out.println("THIS IS ENROLLMENT_DB ID: " + enrollment_db.getId());
		Enrollment enrollment = new Enrollment();		
		enrollment.setStudent(student);
		enrollment.setEnrolledCourse(course);
		enrollmentService.createEnrollment(enrollment);
		return "redirect:/dashboard";
	}
	

	
	//search work
	
	@RequestMapping("/search")
	public String search(Model model, @RequestParam(value="search")String keyword) {
		List<Course> courses = courseService.searchList(keyword);
		model.addAttribute("courses", courses);
		return "search";
	}
	// @RequestMapping("/search")
	// public String search(Model model, @Param("keyword")String keyword) {
		
		
	// 	List<Course> searchList = courseService.searchList(keyword);
	// 	model.addAttribute("listSearch",searchList );
		
	// 	System.out.println(searchList);
	// 	return "search";
	// }	

	// @GetMapping("/searchResult")
	// public String seach_result( @ModelAttribute("listSearch") Course searchList, Model model, HttpSession session) {
	// 	return "search";
	// }
	
}
