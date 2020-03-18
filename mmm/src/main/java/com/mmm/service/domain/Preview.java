package com.mmm.service.domain;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Preview {

	private int previewNo; //시사회 이벤트 관리번호
	private String previewName; //시사회 이름
	private String previewPlace; //시사회 장소
	private Timestamp previewDate; //시사회 일자
	private String preDate;
	private String previewTime; //시사회 상영시간
	private int movieNo; //시사회 영화 관리번호
	private String trailer; //트레일러
	private String previewImage; //시사회 이미지 URI
	private List<MultipartFile> file; //시사회 이미지 파일   
	private Timestamp winnerDate; // 당첨자 발표 일자
	private String winDate;
	private int winnerCount; //당첨자 수
	private Timestamp previewStartDate; //시사회 이벤트 시작 일자
	private String preStDate;
	private Timestamp previewEndDate; //시사회 이벤트 종료 일자
	private String preEdDate;
	private Timestamp previewRegDate; //시사회 이벤트 등록 일시
	private String preRegDate;
	private int applyCount; //응모자 수
	private String previewFlag; //시사회 이벤트 상태(0:시작전1:진행중2:마감)
	
	
	public String getTrailer() {
		return trailer;
	}
	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}

	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public String getPreRegDate() {
		return preRegDate;
	}
	public void setPreRegDate(String preRegDate) {
		this.preRegDate = preRegDate;
	}
	public int getPreviewNo() {
		return previewNo;
	}
	public void setPreviewNo(int previewNo) {
		this.previewNo = previewNo;
	}
	public String getPreviewName() {
		return previewName;
	}
	public void setPreviewName(String previewName) {
		this.previewName = previewName;
	}
	public String getPreviewPlace() {
		return previewPlace;
	}
	public void setPreviewPlace(String previewPlace) {
		this.previewPlace = previewPlace;
	}
	public Timestamp getPreviewDate() {
		return previewDate;
	}
	
	public void setPreviewDate(Timestamp previewDate) {
		this.previewDate = previewDate;
		if(previewDate!=null) {
			preDate = previewDate.toString().substring(0,10);
			previewTime = previewDate.toString().substring(11, 16);
		}
	}
	
	public String getPreDate() {
		return preDate;
	}
	
	public String getPreviewTime() {
		return previewTime;
	}
	public void setPreviewTime(String previewTime) {
		this.previewTime = previewTime;
		
	}
	public String getPreviewImage() {
		return previewImage;
	}
	public void setPreviewImage(String previewImage) {
		this.previewImage = previewImage;
	}
	public Timestamp getWinnerDate() {
		return winnerDate;
	}
	public void setWinnerDate(Timestamp winnerDate) {
		this.winnerDate = winnerDate;
		if(winnerDate!=null) {
			winDate = winnerDate.toString().substring(0,10);
		}
	}
	public int getWinnerCount() {
		return winnerCount;
	}
	public void setWinnerCount(int winnerCount) {
		this.winnerCount = winnerCount;
	}
	public Timestamp getPreviewStartDate() {
		return previewStartDate;
	}
	public void setPreviewStartDate(Timestamp previewStartDate) {
		this.previewStartDate = previewStartDate;
		if(previewStartDate!=null) {
			preStDate = previewStartDate.toString().substring(0,10);
		}
	}
	public Timestamp getPreviewEndDate() {
		return previewEndDate;
	}
	public void setPreviewEndDate(Timestamp previewEndDate) {
		this.previewEndDate = previewEndDate;
		if(previewEndDate!=null) {
			preEdDate = previewEndDate.toString().substring(0,10);
		}
	}
	public Timestamp getPreviewRegDate() {
		return previewRegDate;
	}
	public void setPreviewRegDate(Timestamp previewRegDate) {
		this.previewRegDate = previewRegDate;
		if(previewRegDate!=null) {
			preRegDate = previewRegDate.toString().substring(0,10);
		}
		
	}
	public int getApplyCount() {
		return applyCount;
	}
	public void setApplyCount(int applyCount) {
		this.applyCount = applyCount;
	}
	public String getPreviewFlag() {
		return previewFlag;
	}
	public void setPreviewFlag(String previewFlag) {
		this.previewFlag = previewFlag;
	}
	
	
	public List<MultipartFile> getFile() {
		return file;
	}
	public void setFile(List<MultipartFile> file) {
		this.file = file;
	}
	
	
	public String getWinDate() {
		return winDate;
	}
	public void setWinDate(String winDate) {
		this.winDate = winDate;
	}
	public String getPreStDate() {
		return preStDate;
	}
	public void setPreStDate(String preStDate) {
		this.preStDate = preStDate;
	}
	public String getPreEdDate() {
		return preEdDate;
	}
	public void setPreEdDate(String preEdDate) {
		this.preEdDate = preEdDate;
	}
	public void setPreDate(String preDate) {
		this.preDate = preDate;
	}
	
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Preview [previewNo=");
		builder.append(previewNo);
		builder.append(", previewName=");
		builder.append(previewName);
		builder.append(", previewPlace=");
		builder.append(previewPlace);
		builder.append(", previewDate=");
		builder.append(previewDate);
		builder.append(", preDate=");
		builder.append(preDate);
		builder.append(", previewTime=");
		builder.append(previewTime);
		builder.append(", movieNo=");
		builder.append(movieNo);
		builder.append(", previewImage=");
		builder.append(previewImage);
		builder.append(", file=");
		builder.append(file);
		builder.append(", winnerDate=");
		builder.append(winnerDate);
		builder.append(", winDate=");
		builder.append(winDate);
		builder.append(", winnerCount=");
		builder.append(winnerCount);
		builder.append(", previewStartDate=");
		builder.append(previewStartDate);
		builder.append(", preStDate=");
		builder.append(preStDate);
		builder.append(", previewEndDate=");
		builder.append(previewEndDate);
		builder.append(", preEdDate=");
		builder.append(preEdDate);
		builder.append(", previewRegDate=");
		builder.append(previewRegDate);
		builder.append(", preRegDate=");
		builder.append(preRegDate);
		builder.append(", applyCount=");
		builder.append(applyCount);
		builder.append(", previewFlag=");
		builder.append(previewFlag);
		builder.append("]");
		return builder.toString();
	}
	
	
	
	
}
