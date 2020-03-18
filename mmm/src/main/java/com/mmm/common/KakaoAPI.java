package com.mmm.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

public class KakaoAPI {
	
	// "규비" 카카오 NATIVE APP KEY
	private String nativeAppKey ="f58ccb97778dd630f5184c5921779bd9";
	
	// "규비" 카카오 REST API KEY
	private String restAPIKey = "9a333c2afc5b56f5619a374debb3fa5a";
	 
	
	// 키워드로 장소 검색 //
	public JSONObject searchPlaceByKeyword(String keyword) throws Exception{
		
		String url="https://dapi.kakao.com/v2/local/search/keyword.json?query="+URLEncoder.encode(keyword);
		JSONObject result =getHttpClient(url);
		return result;
	}
	
	
	public JSONObject getHttpClient(String url) throws Exception {
		HttpClient httpClient = new DefaultHttpClient();
		
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Authorization", "KakaoAK "+restAPIKey);
		HttpResponse httpResponse = httpClient.execute(httpGet);
		
		//System.out.println(httpResponse);
		
		HttpEntity httpEntity = httpResponse.getEntity();
		
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader( new InputStreamReader( is, "UTF-8"));
		
		String serverdata = br.readLine();
		System.out.println(serverdata);
		
		JSONObject jo = (JSONObject) JSONValue.parse(serverdata);
		
		return jo;
		
	}
	
	public JSONArray postHttpClient(String url, Map<String,Object> keyValue) throws Exception {
		HttpClient httpClient = new DefaultHttpClient();
		
		HttpPost httpPost = new HttpPost(url);

		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		JSONObject jsonObject = new JSONObject();
		for( String key : keyValue.keySet() ) {
			jsonObject.put(key, keyValue.get(key));
		}
		
		System.out.println("jsonObject : \n"+jsonObject.toString());
		HttpEntity httpEntity2 = new StringEntity( jsonObject.toString(),"utf-8");
		
		httpPost.setEntity( httpEntity2 );
		
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		//System.out.println(httpResponse);
		//System.out.println();
		
		HttpEntity httpEntity = httpResponse.getEntity();
		
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader( new InputStreamReader( is, "UTF-8"));
		
		String serverdata = br.readLine();
		System.out.println(serverdata);
		
		JSONArray jo = (JSONArray) JSONValue.parse(serverdata);
		
		return jo;
		
	}	
}
