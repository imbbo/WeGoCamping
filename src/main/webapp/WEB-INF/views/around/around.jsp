<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 웹폰트 적용 -->
            <link rel="preconnect" href="https://fonts.googleapis.com">
			<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
			<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">

            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/around/basic.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
            <script src="https://ajax.googlehttps://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.cssapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
            
            
			
            <title>캠핑장 둘러보기</title>

            


<%@ include file="../include/header.jsp" %>
 
    <article class="around">
      
      <h1>캠핑장 둘러보기</h1>
          <select>
              <option value="0">지역</option>
              <option value="1">서울</option>
              <option value="2">경기</option>
              <option value="3">대전</option>
              <option value="4">대구</option>
              <option value="5">부산</option>
              <option value="6">제주</option>
          </select>
      
      <div class="container">
       
        <div class="section">
      <div class="col-md-4">
        <div class="thumbnail">
          <a href="#" target="_blank">
            <img src="${pageContext.request.contextPath}/img/cam1.jpg" alt="camp1" style="width:100%">
            <div class="caption">
              <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
            </div>
            </a>
        </div>
      </div>
      <div class="col-md-4">
        <div class="thumbnail">
          <a href="#" target="_blank">
            <img src="${pageContext.request.contextPath}/img/cam1.jpg" alt="camp2" style="width:100%">
            <div class="caption">
              <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
            </div>
          </a>
        </div>
      </div>
      
      <div class="col-md-4">
        <div class="thumbnail">
          <a href="#" target="_blank">
            <img src="${pageContext.request.contextPath}/img/cam1.jpg" alt="camp3" style="width:100%">
            <div class="caption">
              <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
            </div>
          </a>
        </div>
      </div>
      
        </div>
      </div>
      
      
      <div class="container">
       
        <div class="section">
      <div class="col-md-4">
      
          <a href="#" target="_blank">
      
            <div class="button">
              <p><button>예약하기</button></p>
            </div>
          </a>
      </div>
      <div class="col-md-4">
      
        <a href="#" target="_blank">
      
          <div class="button">
            <p><button>예약하기</button></p>
          </div>
        </a>
      </div>
      <div class="col-md-4">
      
        <a href="#" target="_blank">
      
          <div class="button">
          <p><button>예약하기</button></p>
          </div>
        </a>
      </div>
        </div>
      </div>
                  
        <div class="page">
        <div>이전</div>
        <div>1</div>
        <div>2</div>
        <div>3</div>
        <div>4</div>
        <div>5</div>
        <div>다음</div>
    </div>
    
    </article>
 
 <%@ include file="../include/footer.jsp" %>