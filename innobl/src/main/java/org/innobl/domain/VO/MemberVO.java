package org.innobl.domain.VO;

import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class MemberVO {

	  private int mno; // p.k
	  
	  private String name;
	  private String juminNo;
	  private String gender;
	  private String profileImg; // 이미지 경로 
	  @NotNull
	  private String engName;
	  @NotNull
	  private String chnName;
	  private String birthday;
	  private String marriage;
	  private int emplYear; // 년차
	  private String payType; // 급여지급 유형
	  private String emplType; // 입사유형
	  private String wishPos; // 희망 직무
	  private String addr;
	  private String addrdtl;
	  private String phone;
	  private String email;
	  private String skillLevel;
	  private String joinDate; // 입사일
	  private String exitDate;
	  @NotNull
	  private String alchol;
	  

//	  public String getJoinDate() {
//		    //"yyyy-MM-dd" 형식으로 변환된 joinDate를 반환하는 로직
//		    try {
//		      SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		      Date date = inputDateFormat.parse(joinDate);
//		      SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		      return outputDateFormat.format(date);
//		    } catch (Exception e) {
//		      e.printStackTrace();
//		    }
//		    return "입사날이 입력되지 않았습니다";
//		  }
//	  
//	  public String getExitDate() {
//		  try {
//			  SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		      Date date = inputDateFormat.parse(exitDate);
//		      SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		      return outputDateFormat.format(date);
//		} catch (Exception e) {
//			  e.printStackTrace();
//		}
//		  return "재직중";
//	  }
}
