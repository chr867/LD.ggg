package com.ld.gg.controller.mentoringController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ld.gg.dto.MemberDto;
import com.ld.gg.dto.mentoringdto.MentorProfileDTO;
import com.ld.gg.dto.mentoringdto.TagListDTO;
import com.ld.gg.service.MemberService;
import com.ld.gg.service.mentoringService.MentorProfileService;

@Controller
@RequestMapping("/mentor")
public class MentoringController {
	
	@Autowired
	private MentorProfileService mtpService;
	@Autowired
	private MemberService mbService;
	
	//멘토 찾기 페이지로 이동
	@GetMapping("/list")
    public String go_find_mentor() {
        return "mentoringView/mentorSearch";
    }
	
	//멘토 아이디를 입력해서 멘토 프로필 페이지로 이동
	@GetMapping("/profile/{lol_account}")
    public ModelAndView go_mentor_profile(@PathVariable String lol_account) {
		List<MemberDto> mbList = mbService.findLolAccount(lol_account);
		String mentor_email = mbList.get(0).getEmail();
		MentorProfileDTO mtp = mtpService.select_by_email_mentor_profile(mentor_email);
		if (mtp!=null) {
			return new ModelAndView("mentoringView/mentorInfo")
					.addObject("mentor_profile", mtp)
					.addObject("member", mbList.get(0));
		}
		return null;
    }
	
	//멘토 프로필 작성 페이지로 이동
	@GetMapping("/write-profile")
    public ModelAndView go_mentor_profile_edit(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		Integer user_type = (Integer)session.getAttribute("user_type");
		MentorProfileDTO mtp = mtpService.select_by_email_mentor_profile(email);
		List<TagListDTO> tagList = mtpService.select_all_tag();
		if (user_type==2) {
			if(mtp == null) {
				mtpService.insert_mentor_profile(email);
			}else {
			return new ModelAndView("mentoringView/mentorProfileForm") 
					.addObject("mentor_profile", mtp)
					.addObject("tag_list", tagList);
			}
		}
		return new ModelAndView("member/myPage");
    }
}
