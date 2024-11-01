<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>

<style type="text/css">
    .container { margin-top: 10px; }
    .rounded-pill { opacity: 0.7; }
    #buttonset { margin-top: 15px; }
    .tbBoardEdit th { width: 120px; }
</style>

<div class="container">
    <h2>${requestScope.bean.brdidx}번 게시물 수정</h2>
    <form action="<%=postForm%>" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="opsmode" value="aibbsUpdate">
        
        <table class="table tbBoardEdit">
            <tbody>
                <tr>
                    <th>게시물 번호</th>
                    <td><input id="brdidx" name="brdidx" type="number" class="form-control" readonly value="${requestScope.bean.brdidx}"></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td><input id="memid" name="memid" type="text" class="form-control" readonly value="${requestScope.bean.memid}"></td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input id="boardpwd" name="boardpwd" type="password" class="form-control" placeholder="글작성 시 입력한 비밀번호를 입력하세요."></td>
                </tr>
                <tr>
                    <th>글제목</th>
                    <td><input id="subtitle" name="subtitle" type="text" class="form-control" value="${requestScope.bean.subtitle}"></td>
                </tr>
                <tr>
                    <th>글내용</th>
                    <td><input id="contents" name="contents" type="text" class="form-control" value="${requestScope.bean.contents}"></td>
                </tr>

                <c:choose>
                    <c:when test="${not empty requestScope.bean.attach01}">
                        <tr>
                            <th>첨부파일(1)</th>
                            <td>
                                <div>${requestScope.filePath}/${requestScope.bean.attach01}</div>
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <th>첨부파일(1)</th>
                            <td>첨부파일이 없습니다.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${not empty requestScope.bean.attach02}">
                        <tr>
                            <th>첨부파일(2)</th>
                            <td>
                                <div>${requestScope.filePath}/${requestScope.bean.attach02}</div>
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <th>첨부파일(2)</th>
                            <td>첨부파일이 없습니다.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${not empty requestScope.bean.attach03}">
                        <tr>
                            <th>첨부파일(3)</th>
                            <td>
                                <div>${requestScope.filePath}/${requestScope.bean.attach03}</div>
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <th>첨부파일(3)</th>
                            <td>첨부파일이 없습니다.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${not empty requestScope.bean.attach04}">
                        <tr>
                            <th>첨부파일(4)</th>
                            <td>
                                <div>${requestScope.filePath}/${requestScope.bean.attach04}</div>
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <th>첨부파일(4)</th>
                            <td>첨부파일이 없습니다.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${not empty requestScope.bean.codefile}">
                        <tr>
                            <th>코드파일</th>
                            <td>
                            	<div>${requestScope.filePath}/${requestScope.bean.codefile}</div>
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <th>코드파일</th>
                            <td>코드파일이 없습니다.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>

                <tr>
                    <th>조회수</th>
                    <td>${requestScope.bean.readcnt}</td>
                </tr>
            </tbody>
        </table>

        <div id="buttonset" style="text-align:center;">
            <button type="submit" class="btn btn-primary">수정</button>
            <button type="reset" class="btn btn-secondary">초기화</button>
        </div>
    </form>
</div>
</body>
</html>
