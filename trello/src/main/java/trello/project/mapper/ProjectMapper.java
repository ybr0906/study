package trello.project.mapper;

import java.util.List;

import trello.project.domain.ProjectVO;

public interface ProjectMapper {
	public List<ProjectVO> selectProject();
}
