package trello.project.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import trello.project.domain.ProjectVO;
import trello.project.mapper.ProjectMapper;

@Service
public class ProjectService {
	Logger log = LoggerFactory.getLogger(this.getClass());
	@Autowired
	ProjectMapper projectMapper;
	
	public List<ProjectVO> selectProject(){
		return  projectMapper.selectProject();
	}
}
