package com.ld.gg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ld.gg.dao.Summoner_dao;
import com.ld.gg.dto.summoner.ChampRecordDto;
import com.ld.gg.dto.summoner.RecordDto;
import com.ld.gg.dto.summoner.RecordInfoDto;
import com.ld.gg.dto.summoner.SummonerDto;
import com.ld.gg.dto.summoner.SummonerRankDto;
import com.ld.gg.paging.Paging;

@Service
public class SummonerService {
	
	@Autowired
	private Summoner_dao SD;

	public List<SummonerRankDto> get_summoner_solo() {
		List<SummonerRankDto> sd = SD.get_summoer_solo();
		return sd;
	}

	public List<SummonerRankDto> get_summoner_flex() {
		List<SummonerRankDto> sd = SD.get_summoner_flex();
		return sd;
	}

	public List<SummonerRankDto> get_summoner_level() {
		List<SummonerRankDto> sd = SD.get_summoner_level();
		return sd;
	}

	public List<SummonerDto> get_summoner_info(String summoner_name) {
		List<SummonerDto> sd = SD.get_summoner_info(summoner_name);
		return sd;
	}

	public List<RecordDto> get_summoner_record(String summoner_name) {
		List<RecordDto> sr = SD.get_summoner_record(summoner_name);
		return sr;
	}

	public List<SummonerDto> get_renewal_info(String summoner_name) {
		List<SummonerDto> sd = SD.get_renewal_info(summoner_name); 
		return sd;
	}

	public List<SummonerDto> get_champ_position_filter(String summoner_name) {
		List<SummonerDto> sd = SD.get_champ_position_filter(summoner_name);
		return sd;
	}

	public List<ChampRecordDto> get_champ_record(String summoner_name) {
		List<ChampRecordDto> crd = SD.get_champ_record(summoner_name);
		return crd;
	}

	public List<ChampRecordDto> get_20games_summary(String summoner_name) {
		List<ChampRecordDto> crd = SD.get_20games_summary(summoner_name);
		return crd;
	}

	public List<RecordDto> get_record_detail(String match_id) {
		List<RecordDto> rd = SD.get_record_detail(match_id);
		return rd;
	}

	public List<SummonerRankDto> getRankAllData() {
		List<SummonerRankDto> srd = SD.getRankAllData();
		return srd;
	}

}
