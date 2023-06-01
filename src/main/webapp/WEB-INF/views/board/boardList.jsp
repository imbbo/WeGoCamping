<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="${pageContext.request.contextPath}/css/board.css" rel="stylesheet">
</head>

<%@ include file="../include/header.jsp" %>
<article class="board">
    <div id="board-selector">
        <a id="1">캠핑후기</a>
        <a id="2">꿀팁공유</a>
        <a id="3">메이트찾기</a>
        <a id="4">건의사항</a>
    </div>
    <div class="tab">
        <button onclick="location.href='${pageContext.request.contextPath}/board/boardWrite'" class="write">글쓰기</button>

        <div class="search">
            <input type="text" placeholder="검색어를 입력해주세요">
            <button type="menu">검색</button>
        </div>
    </div>
    <table id="boardList">

        <th class="head"></th>
        <th class="title">제목</th>
        <th class="writer">작성자</th>
        <th class="regDate">작성일</th>
        <th class="hit">조회</th>

        <tr>
            <td>후기</td>
            <td>너무 좋아요</td>
            <td>캠핑초보</td>
            <td>23-05-24</td>
            <td>23</td>
        </tr>
        <tr>
            <td>매칭</td>
            <td>같이 노실분?</td>
            <td>심심한사람</td>
            <td>23-05-23</td>
            <td>12</td>
        </tr>
        <c:forEach var="board" items="${boardList}">
            <tr>
                <td>
                    <c:if test="${board.cls==1}">후기</c:if>
                    <c:if test="${board.cls==2}">꿀팁</c:if>
                    <c:if test="${board.cls==3}">메이트찾기</c:if>
                    <c:if test="${board.cls==4}">건의사항</c:if>
                </td>
                <td class="title" style="cursor:pointer;">
                    <a onclick="location.href='${pageContext.request.contextPath}/board/content/${board.bno}'">${board.title}</a>
                </td>
                <td>${board.writer}</td>
                <td>
                    <fmt:parseDate value="${board.regDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime"
                        type="both" />
                    <fmt:formatDate value="${parsedDateTime}" pattern="yy-MM-dd" />
                </td>
                <td>${board.hit}</td>
            </tr>
        </c:forEach>


    </table>

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
<script>
    document.getElementById('board-selector').addEventListener('click', e => {
        if (!e.target.matches('a')) return;
        console.log('게시판클릭');
        const $list = document.getElementById('boardList')
        $list.replaceChildren();
        const cls = e.target.getAttribute('id');
        console.log(cls);
        $list.innerHTML = ` <th class="head"></th>
                            <th class="title">제목</th>
                            <th class="writer">작성자</th>
                            <th class="regDate">작성일</th>
                            <th class="hit">조회</th>`;
        fetch('${pageContext.request.contextPath}/board/cls/' + cls)
            .then(rs => rs.json())
            .then(data => {
                console.log(data[0].regDate);
                console.log(data);
                for (var i = 0; i < data.length; i++) {
                    const $frag = document.createDocumentFragment;
                    const $tr = document.createElement('tr');
                    const $cls =  document.createElement('td');
                    switch(data[i].cls){
                        case 1:
                            $cls.textContent = '캠핑후기';
                        break;
                        case 2:
                            $cls.textContent = '꿀팁공유';
                        break;
                        case 3:
                            $cls.textContent = '메이트찾기';
                        break;
                        case 4:
                            $cls.textContent = '건의사항';
                        break;
                    }
                    
                    const $title = document.createElement('td');
                    const $a = document.createElement('a');
                    $a.textContent = data[i].title;
                    $a.setAttribute('onclick',"location.href='${pageContext.request.contextPath}/board/content/"+data[i].bno+"'");
                    $title.appendChild($a);
                    

                    const $writer = document.createElement('td');
                    $writer.textContent = data[i].writer;
                    const $date = document.createElement('td');
                    
                    
                    $date.textContent = data[i].regDate[0]-2000 + '-' + 
                    (data[i].regDate[1]>10? data[i].regDate[1]:('0'+data[i].regDate[1]))+ '-' + 
                    (data[i].regDate[2]>10? data[i].regDate[2]:('0'+data[i].regDate[2]));
                    const $hit = document.createElement('td');
                    $hit.textContent = data[i].hit;

                    $tr.appendChild($cls);
                    $tr.appendChild($title);
                    $tr.appendChild($writer);
                    $tr.appendChild($date);
                    $tr.appendChild($hit);

                    $list.appendChild($tr);
                    
                }
            })




    })
</script>