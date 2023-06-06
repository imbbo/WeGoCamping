<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link href="${pageContext.request.contextPath}/css/mypage.css" rel="stylesheet">
    </head>
    
<%@ include file="../include/header.jsp" %>

     <!-- 정보수정창 -->
     <section>
        <div class="wrap">
             <div class="menuBox">   
                <div class="infoKind">
                     <a href="${pageContext.request.contextPath}/user/info" class="privacy">⦁ 개인 정보 수정</a> <br>
                     <a href="${pageContext.request.contextPath}/user/reservation" class="reserInfo">⦁ 예약 정보</a> <br>
                     <a href="${pageContext.request.contextPath}/user/myBoard" class="myText">⦁ 내 게시글</a> <br>
                </div>  
            </div>
            <div class="privacyFix">
                <div class="fixBox">
                    <h3> 개인 정보 수정(메뉴 값 받아오기)</h3>
                        <form action="#">
                            <div class="form-group">
                                <label for="name" class="lName">이름</label> <br>
                                <input type="text" name="userName" id="userName" placeholder="변경불가" readonly>
                            </div>
                            <div class="form-group">
                                <label for="id" class="lId">아이디</label> <br>
                                <input type="text" name="userId" id="userId" placeholder="변경불가" readonly>
                            </div>
                            <div class="form-group">
                                <label for="pw" class="lPw">변경 비밀번호</label> <br>
                                <input type="password" name="userPw" id="userPw" placeholder="(영 대/소문자, 숫자 조합 8~16자 이상)">

                            </div>
                            <div class="form-group">
                                <label for="pwCheck" class="lPCheck">비밀번호 확인</label><br>
                                <input type="password" name="pwCheck" id="pwCheck" placeholder="변경할 비밀번호를 입력해주세요">

                            </div>
                            <div class="form-group">
                                <label for="phoneNum" class="lPhone">휴대폰 번호</label> <br>
                                <input type="text" name="phoneNum" id="phoneNum">
                            </div>
                            <div class="form-group">
                                <label for="email" class="lEmail">이메일</label> <br>
                                <input type="text" name="email1" id="email1" class="emailBtn">
                                <select name="email2" id="email2">
                                    <option>@naver.com</option>
                                    <option>@hanmail.net</option>
                                    <option>@gmail.com</option>
                                    <option>@nate.com</option>
                                </select>
                            
                            </div>	
                            <div class="mailCheckBox">
                                <input type="text" class="mail-check-input" placeholder="인증번호 6자리를 입력하세요." maxlength="6"
                                    disabled="disabled">
                                
                                    <button type="button" id="mail-check-btn" class="checkBoxE">이메일 인증</button>
                                
                            </div>

                            <div class="form-group">
                                <label for="address" class="lAddr">주소</label>
                                <div class="input-group">
                                    <input type="text" name="address" id="address" placeholder="우편번호" readonly>
                                    
                                        <button type="button" class="CheckBoxA" onclick="searchAddress()">주소찾기</button>
                                    
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" name="addrBasic" id="addrBasic" placeholder="기본주소">
                            </div>
                            <div class="form-group">
                                <input type="text" name="addrBasic" id="addrDetail" class="addrDetail" placeholder="상세주소">
                            </div>

                            <div class="bottomBtn">
                                <div class="form-group">
                                    <button type="button" id="fixBtn" class="fixBtn">수정완료</button>
                                </div>
                                <div class="form-group">
                                    <button type="button" id="goMainBtn" class="goMainBtn">메인으로</button>
                                </div>
                                <div class="form-group">
									<button type="button" id=withdrawal class="Withdrawal">탈퇴</button>                                
                                </div>
                            </div>

                        </form>
                    </div>
            </div>
        </div>
    </section>
    
    <%@ include file="../include/footer.jsp" %>
    
    <!-- 모달  -->
    <div class="modal-dialog modal-dialog-centered">
    <div class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">비밀번호를 입력해주세요.</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <input type="password" class="modalInput" id="modalInput">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">완료</button>
      </div>
    </div>
  </div>
</div>
    </div>
    
    <script>

        document.getElementById('withdrawal').onclick = () => {
            console.log('회원탈퇴 버튼이 클릭됐습니다!');
            let id = "${login}";
           const chPw = prompt('비밀번호를 입력해주세요.');
           const withObj = {
            method: 'post',
            headers: {
                'Content-type': 'application/json'
            },
            body:JSON.stringify({
                'userId' : "${login}",
                'userPw' : chPw
                
            })

           };
            fetch('${pageContext.request.contextPath}/user/withdrawal',withObj) 
            .then(rs=>rs.text())
                .then(data=>{
                    console.log(data);
                    if(data === 'true') {
                    	alert('회원 탈퇴가 완료되었습니다. 그동안 감사했습니다.');
                        console.log("탈퇴했는데?");
                    } else {
                    	alert('회원 탈퇴가 정상 처리 되지 않았습니다. 다시 시도해주세요.');
                    }  
                    
                });
           
        }

    </script>
    
    
    