package trello.project.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import trello.project.domain.ProjectVO;
import trello.project.service.ProjectService;

@Controller
public class ProjectController {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	ProjectService projectService;
	
	@RequestMapping(value="/projectList")
	public ModelAndView projectList() {
		ModelAndView model = new ModelAndView();
		List<ProjectVO> list = projectService.selectProject();
		model.setViewName("project/projectList");
		model.addObject("list", list);
		
		log.info(list.toString());
		
		return model;
	}
	
	@RequestMapping(value="/insertProject")
	public String insertProject() {
		
		return "redirect:/projectList";
	}
}
