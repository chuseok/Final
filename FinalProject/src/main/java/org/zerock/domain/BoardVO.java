package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {

	private String userId;
	private String userPwd;
	private String userName;
	private String birthday;
	private String phoneNo;
	private String email;
	private Date lastConn;
	private boolean enable;
	private List<AuthVO> authList;
}
