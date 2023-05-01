package com.ld.gg.dao.mentoringdao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ld.gg.dto.mentoringdto.MentorClassDTO;
import com.ld.gg.dto.mentoringdto.MentorProfileDTO;
import com.ld.gg.dto.mentoringdto.MentorTagDTO;

@Mapper
public interface MentorProfileDAO {
	List<MentorProfileDTO> select_all_mentor_profiles();
	MentorProfileDTO select_by_email_mentor_profile(String mentor_email);
	void renewal_mentor_profile();
	void insert_mentor_profile(String mentor_email);
	void update_mentor_profile(MentorProfileDTO mentor_profile);
	void delete_mentor_profile(String mentor_email);
	
	
	List<MentorTagDTO> select_by_email_mentor_tag(String mentor_email);
	void insert_mentor_tag(MentorTagDTO mentor_tag_dto);
	void delete_mentor_tag(String mentor_email);
	
	List<MentorClassDTO> select_by_email_mentor_class(String mentor_email);
	void insert_mentor_tag(MentorClassDTO mentor_class_dto);
	void delete_mentor_tag(int class_id);
}
