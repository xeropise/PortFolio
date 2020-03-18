package com.mmm.common;

import java.util.ArrayList;
import java.util.HashMap;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

public class MovieAPI {

	
	/* KMDB */
	//지행이꺼 발급되면 바꿀예정
	public String kmdbKey = "VE61R22GGTP493E028O6";
	
	//포스터 포함 주소
	public String urlKmdb = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json.jsp?collection=kmdb_new&detail=Y&ratedYn=Y&ServiceKey="+kmdbKey;
	/* KMDB */
	
	
	
	private RestTemplate template;
	private ObjectMapper objectMapper;
	private HttpEntity<?> headers;
	
	/* KMDB */
	public String kmdbGetPosterRating(String searchKeyword) throws Exception{
		
		
		this.template = new RestTemplate();
		this.objectMapper = new ObjectMapper();
		
//		header정보 
		MultiValueMap<String, String> headerMap = new LinkedMultiValueMap<>();
		headerMap.add("Content-Type", MediaType.APPLICATION_JSON_VALUE);
		this.headers = new HttpEntity<>(headerMap);
		
		
		ResponseEntity<String> responseEntity = template.exchange(urlKmdb+"&title="+searchKeyword, HttpMethod.GET, headers, String.class);
		HashMap<String, Object> searchResult = objectMapper.readValue(responseEntity.getBody(), new TypeReference<HashMap<String, Object>>() {});
		
		ArrayList<HashMap<String, Object>> kmdbList = (ArrayList<HashMap<String, Object>>) searchResult.get("Data");
		ArrayList<HashMap<String, Object>> kmdbListResult = (ArrayList<HashMap<String, Object>>) kmdbList.get(0).get("Result");
		//System.out.println("-------- kmdbListResult : " + kmdbListResult);
		HashMap<String, Object> movieInfoFromKmdb = kmdbListResult.get(0);
		//System.out.println("-------- movieInfoFromKmdb : " + movieInfoFromKmdb);
		
		//포스터
		String[] posters = (movieInfoFromKmdb.get("posters").toString()).split("\\|");
		
		//관람물등급
		ArrayList<HashMap<String, Object>> Result= (ArrayList<HashMap<String, Object>>)(movieInfoFromKmdb.get("rating"));
		HashMap<String, Object> finalResult =Result.get(0);	
		
		return posters[0]+"@@@"+(String)finalResult.get("ratingGrade");
	}
	
	public String kmdbGetRatings(String searchKeyword) throws Exception{
		
		this.template = new RestTemplate();
		this.objectMapper = new ObjectMapper();
		
//		header정보 
		MultiValueMap<String, String> headerMap = new LinkedMultiValueMap<>();
		headerMap.add("Content-Type", MediaType.APPLICATION_JSON_VALUE);
		this.headers = new HttpEntity<>(headerMap);
		
		
		ResponseEntity<String> responseEntity = template.exchange(urlKmdb+"&title="+searchKeyword, HttpMethod.GET, headers, String.class);
		HashMap<String, Object> searchResult = objectMapper.readValue(responseEntity.getBody(), new TypeReference<HashMap<String, Object>>() {});
		
		ArrayList<HashMap<String, Object>> kmdbList = (ArrayList<HashMap<String, Object>>) searchResult.get("Data");
		ArrayList<HashMap<String, Object>> kmdbListResult = (ArrayList<HashMap<String, Object>>) kmdbList.get(0).get("Result");
		//System.out.println("-------- kmdbListResult : " + kmdbListResult);
		HashMap<String, Object> movieInfoFromKmdb = kmdbListResult.get(0);
		//System.out.println("-------- movieInfoFromKmdb : " + movieInfoFromKmdb);
		ArrayList<HashMap<String, Object>> Result= (ArrayList<HashMap<String, Object>>)(movieInfoFromKmdb.get("rating"));
		HashMap<String, Object> finalResult =Result.get(0);
		
		return (String) finalResult.get("ratingGrade");		
		
		
	}
	
}
