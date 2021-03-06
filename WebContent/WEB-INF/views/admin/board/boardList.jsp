<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<link type="text/css" rel="stylesheet" href="/resources/css/pm.css" />

<script type="text/javascript" src="/resources/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript" src="/resources/js/myAjax.js"></script>
<script type="text/javascript" src="/resources/js/pageCommon.js"></script>

<title>UCT 인사관리</title>

<style type="text/css">
	.style1
        {
            font-family: "맑은 고딕", "Courier New", monospace;
            font-size: 17px;
        }
        .style2
        {
            font-family:"맑은 고딕";
            font-size: 13px;
        }
		.style3
        {
            font-family:"맑은 고딕";
            font-size: 25px;
        }
		body{ 
		background:url('img/bg1.jpg') fixed bottom ;
		} 
		table.`
		{
		padding: 0px;
		margin: 0px;

		border: #b7b6b6 1px dashed; 
		height: 40px;
		width: 700px;
	}
</style>

<script type="text/javascript">
	function fn_detail(no){
		$('#board_idx').val(no);
		$('#dePm').attr("action","/boardDetail.do").submit();
	}

	function fn_delte(no){
		$('#board_idx').val(no);
// 		$('#dePm').attr("action","/boardDlete.do").submit();
	}

	function fn_searchName(){
// 		$('#searchName').val($('#SEARCH_TITLE').val());
// 		$('#dePm').attr("action","/pjt/uct/pmList.do").submit();
	}
	
</script>
</head>

<body>
<form id="dePm" method="post">
	<input type="hidden" id="searchName" name="searchName">
	<input type="hidden" id="board_idx" name="board_idx">
</form>

<!-- wrap -->
	<div id="wrap">
		<!-- header_top -->
		<div id="header">
			<div class="header_top">
				<div class="inner clear">
					<h1><a href="#">UCT</a></h1>
					<span class="user_id">ID 명</span>
					<a href="#" class="btn_bl logout">로그아웃</a>
				</div>
			</div>
			<!-- //header_top -->
			<div class="inner">
				<!-- gnb -->
				<ul class="gnb clear">
					<li><a href="adminCateList.do">카테고리</a>
	<!-- 					<ul> -->
	<!-- 						<li><a href="#">근태</a></li> -->
	<!-- 					</ul> -->
					</li>
					<li class="first-child"><a href="adminBoardList.do">게시판 관리</a></li>
				</ul>
				<!-- //gnb -->
			</div>
		</div>
        
        <!-- Body_contents -->
        <!-- content -->
	    <div id="content">
		<!-- top_content -->
		<div class="top_content">
			<!-- location -->
			<div class="location">
			</div>
			<!-- //location -->
		</div>
		<!-- //top_content -->
		
		<div class="inner mt10">
			<!-- search_bx -->
			<div class="search_bx">
				<form name="searchForm" id="searchForm" method="POST">
				<table class="tbl_srch">
					<colgroup>
						<col style="width:80px;" />
						<col style="width:250px;" />
						<col style="width:80px;" />
						<col style="width:300px;" />
						<col style="width:*" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">제품명</th>
							<td>
								<input type="text" id="SEARCH_TITLE" name="SEARCH_TITLE" placeholder="제품명 검색" value="${searchName }" style="width:200px;" />
							</td>
							<td class="tr">
								<a href="javascript:fn_searchName();" class="btn btn_w">검색</a>
							</td>
						</tr>
					</tbody>
				</table>
				</form>
			</div>
			<!-- //search_bx -->
			
			<!-- btn_area -->
			<div class="btn_area">
				<a href="boardRegForm.do" class="btn btn_b">등록</a>
			</div>
			<!-- //btn_area -->
			
			<!-- tbl -->
			<div class="tbl mt10">
				<!-- list -->
				<table class="list">
					<colgroup>
						<col style="width:12%" />
						<col style="width:12%" />
						<col style="width:12%" />
						<col style="width:12%" />
						<col style="width:*" />
						<col style="width:12%" />
					</colgroup>
					<thead>	
						<tr>
							<th scope="col">대분류</th>
							<th scope="col">중분류</th>
							<th scope="col">소분류</th>
							<th scope="col">가격</th>
							<th scope="col">제품명</th>
							<th scope="col">삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty listBoard}">
							<tr>
								<td class="nolineL" colspan="6">조회된 결과가 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="i" items="${listBoard }">
							<tr>
								<td>${i.DEPTH1 }</td>
								<td>${i.DEPTH2 }</td>
								<td>${i.DEPTH3 }</td>
<%-- 								<td>${i.CATE_IDX }</td> --%>
								<td>${i.PRICE }</td>
								<td><a href="javascript:fn_detail('${i.BOARD_IDX }');">${i.TITLE }</a></td>
								<td><a href="javascript:fn_delete('${i.BOARD_IDX }');" class="btn btn_b">삭제</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- //list -->
			</div>
			<!-- //tbl -->
			<div class="paging">
				<%@include file="../../common/pageNavi.jsp"%>
			</div>
		</div>
	</div>
	<!-- //content -->
	</div>
	<!-- //wrap -->
</body>
</html>
