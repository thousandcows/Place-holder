<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PlaceHolder</title>
<link rel="shortcut icon" type="image/x-icon"
	href="/semi-img/favicon.png" />
<!-- 제이쿼리CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 부트스트랩CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!-- 폰트어썸CDN -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<!-- 구글 폰트CDN -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="/semi-css/admin.css">
</head>

<body>

	<div class="container">
		<div class="containerIn">
			<div class="container">

				<!-- 사이드바 코드 시작 -->
          <div class="row header">
            <div class="col-3 align-self-center">
              <a href="index.jsp"><img src="/semi-img/logos.png" id="logo"></a>
            </div>
            <div class="col-8 align-self-center">

              <input type="text" placeholder="HotelName" id="topSearch">
              <button type="button" class="top-search" id="topSearchBtn">
                <i class="fas fa-search"></i>
              </button>

            </div>
            <!-- 햄버거메뉴 -->
            <div class="col-1  align-self-center justify-content-end">
              <nav class="navbar navbar-light">
                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas"
                  data-bs-target="#offcanvasNavbar">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar"
                  aria-labelledby="offcanvasNavbarLabel">
                  <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasNavbarLabel">PlaceHolder</h5>

                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                      aria-label="Close"></button>
                  </div>
                  <hr>
                  <div class="offcanvas-body">

                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                      <c:choose>
                        <c:when test="${loginId != null}">
                          <!-- 로그인 이후 보일 내용 -->
                          <li class="nav-item" id="loginAcc">
                            <div class="row">
                              <div class="col-12 loginAcc"></div>
                            </div>
                            <div class="row">
                              <div class="col-8 loginMent">${loginId}님, 안녕하세요.</div>
                              <div class="col-4"><a href="/logout.user"><button class="logOut">로그아웃</button></a></div>
                            </div>
                            <div class="row loginAccBannerH">
                              <div class="col-3">
                                <a href="/list.hotel"><button class="loginAccBanner">Hotels</button></a>
                              </div>
                              <div class="col-3">
                                <a href="/inquiryList.qna"><button class="loginAccBanner">고객센터</button></a>
                              </div>
                              <div class="col-3">
                                <a href="/likeList.like?loginId=${loginId}"><button
                                    class="loginAccBanner">찜목록</button></a>
                              </div>
                              <div class="col-3">
                                <a href="/mypage.home"><button class="loginAccBanner">MyPage</button></a>
                              </div>
                            </div>
                          </li>

                          <c:if test="${loginId == 'admin00'}">
                            <button id="adminBtn">관리자 창으로</button>
                          </c:if>

                          <li class="nav-item" id="sideC">
                            <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
                              <div class="carousel-inner sideCBackBox">
                                <div class="sideCBack">PlaceHolder</div>
                                <div class="carousel-item active">
                                  <img src="/semi-img/sideC1.jpg" class="d-block w-100" alt="여행을 해보세요">
                                </div>
                                <div class="carousel-item">
                                  <img src="/semi-img/sideC2.jpg" class="d-block w-100" alt="나만의 공간">
                                </div>
                                <div class="carousel-item">
                                  <img src="/semi-img/sideC3.jpg" class="d-block w-100" alt="PlaceHolder">
                                </div>
                              </div>
                            </div>
                          </li>

                        </c:when>
                        <c:otherwise>
                          <!-- 로그인 폼 -->
                          <li class="nav-item">
                            <div class="row signBox">
                              <form action="/login.user" method="post">
                                <div class="col-12 signInput">
                                  <input type="text" placeholder="Input ID" class="inputId" name="id" id="inputId">
                                  <input type="password" placeholder="Input PW" class="inputPw" name="pw" id="inputPw">
                                </div>
                                <div class="row">
                                  <div class="col-6 sign">
                                    <button type="button" class="signBtns" id="loginBtn">로그인</button>
                                  </div>
                                  <div class="col-6 sign">
                                    <a href="/signupPage.user"><button type="button"
                                        class="signBtns signUp">회원가입</button></a>
                                  </div>
                                </div>
                              </form>
                            </div>
                          </li>

                          <!-- 로그인 밑 캐러셀 -->

                          <li class="nav-item" id="sideC">
                            <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
                              <div class="carousel-inner sideCBackBox">
                                <div class="sideCBack">PlaceHolder</div>
                                <div class="carousel-item active">
                                  <img src="/semi-img/sideC1.jpg" class="d-block w-100" alt="여행을 해보세요">
                                </div>
                                <div class="carousel-item">
                                  <img src="/semi-img/sideC2.jpg" class="d-block w-100" alt="나만의 공간">
                                </div>
                                <div class="carousel-item">
                                  <img src="/semi-img/sideC3.jpg" class="d-block w-100" alt="PlaceHolder">
                                </div>
                              </div>
                            </div>
                          </li>

                        </c:otherwise>
                      </c:choose>
                      <li class="nav-item nav-banner">
                        <a href="/main.home"><button type="button" class="sideBanner">처음으로</button></a>
                      </li>
                      <li class="nav-item nav-banner">
                        <a href="/articleList.article"><button type="button" class="sideBanner">자유게시판</button></a>
                      </li>
                    </ul>
                  </div>
                </div>
              </nav>
            </div>
          </div>
          <!-- 사이드바 코드 끝 -->

				<div class="row" id="banner">
					<div class="col-2 goHome bannerIn">
						<p id="goHome">홈</p>
					</div>
					<div class="col-2 reservation bannerIn">
						<p id="goUser">유저관리</p>
					</div>
					<div class="col-2 community bannerIn">
						<p id="goHotel">호텔관리</p>
					</div>
					<div class="col-2 qna bannerIn">
						<p id="goQna">QnA관리</p>
					</div>
					<div class="col-2 mypage bannerIn">
						<p id="goArticle">보드관리</p>
					</div>
				</div>

				<!-- 배너 밑 검색바 -->
				<div class="row bannerSearch">
					<div class="col-2">
						<select id="searchOption">
							<option>유저ID</option>
						</select>
					</div>
					<div class="col-8">
						<input type="text" placeholder="상세검색어를 입력해주세요."
							class="detailSearch" id="">
					</div>
					<div class="col-2 align-self-start">
						<button class="detailSearchBtn">검색</button>
					</div>
				</div>
				<hr class="bannerHr">

				<!-- 컨텐츠 -->
				<br>
				<h3>
					<b>Q&A 관리 페이지</b>
				</h3>
				<hr class="bannerHr">
				<div class="container" style="text-align: center;">
					<div class="row top"
						style="text-align: center; line-height: 40px; width: 100%; background-color: rgb(226, 242, 255);">
						<span style = "width:10%;">
							<b>번호</b>
						</span>
						<span style = "width:20%;">
							<b>호텔</b>
						</span>
						<span style = "width:15%;">
							<b>질문자</b>
						</span>
						<span style = "width:37%;">
							<b>내용</b>
						</span>
						<span style = "width:18%;">
							<b>상태</b>
						</span>
					</div>

					<c:forEach var="list" items="${qnaList}">
						<div class="row"
							style="text-align: center; line-height: 30px; width: 100%;">
							<span style = "width:10%;" class="userId">${list.inquiry}</span>
							<span style = "width:20%;">${list.hotelId}</span>
							<span style = "width:15%;">${list.userId}</span>
							<span style = "width:37%; overflow:hidden; white-space:nowrap; text-overflow:ellipsis;"><a href="/detail.qna?inquiry=${list.inquiry}" style="text-decoration:none">
							${list.inquiryContent}</a></span>
							<span style = "width:18%;">${list.inquiryStat}
								<a href="/qnaDelete.admin?inquiry=${list.inquiry}"
									style="text-decoration-line: none;"> <input type="button"
									value="삭제" class="btn"
									style="background-color: rgb(236, 249, 255);"></a>
							</span>
						</div>
					</c:forEach>
					<hr class="bannerHr">
				</div>
				<!-- 푸터 -->
				<div class="container-fluid footBack">
					<div class="container">
						<div id="footer">
							<div id="footerIn">
								<div class="row">
									<div class="col-3 footer-left">

										<a href="index.jsp" class="fot_logo"></a>

									</div>
									<div class="col-3 footer-center"></div>
									<div class="col-6 footer-right">
										<ul class="foot-ul-blog">
											<li><a
												href="https://section.blog.naver.com/BlogHome.naver?directoryNo=0&currentPage=1&groupId=0" target='_blank'>블로그</a>
											</li>
											<li><a href="/footer.jsp" target='_blank'>이용약관</a></li>
											<li><a href="/footer2.jsp" target='_blank'>개인정보처리방침</a></li>
											<li><a href="/inquiryList.qna">고객 문의</a></li>
										</ul>
									</div>
								</div>

								<div class="row">

									<div class="col-4">
										<ul class="foot-sangho">
											<li>상호명 : <a href="index.jsp" class="foot-sangho-a">PlaceHolder</a></li>
											<li>공동대표 : 기억해조</li>
											<li>사업자등록번호 : 230-00-12345</li>
											<li>동신판매업신고번호 : 2021-서울종로-05000</li>
										</ul>
									</div>

									<div class="col-5">
										<ul class="foot-sangho">
											<li>&nbsp;</li>
											<li>대표전화 : 02-1234-5678</li>
											<li>이메일 : PlaceHolder@LoremIpsum.com</li>
											<li>영업소재지 : 서울특별시 중구 남대문로 120 대일빌딩 2F, 3F</li>
										</ul>
									</div>

									<div class="col-3">
										<ul class="foot-logos">

											<li><a
												href="https://section.blog.naver.com/BlogHome.naver?directoryNo=0&currentPage=1&groupId=0"
												target='_blank' class="nblog"></a></li>
											<li><a href="https://twitter.com/" target='_blank'
												class="twitter"></a></li>
											<li><a href="https://www.instagram.com/" target='_blank'
												class="instargram"></a></li>
											<li><a href="https://www.facebook.com/" target='_blank'
												class="facebook"></a></li>
										</ul>
									</div>
								</div>
								<hr class="bottomHr">
								<div class="row">
									<div class="col-9">
										<p class="foot_caution">PlaceHolder는 통신판매중개자이자 통신판매 당사자
											입니다. 따라서 PlaceHolder는 공간 거래정보 및 거래내역을 소유할 수 있습니다.</p>
									</div>
									<div class="col-3">
										<p class="foot_caution">Copyright PLACEHOLDER Corp. All
											Rights Reserved.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>

		<script> 
				// 사이드바 관련 스크립트 시작
        $("#loginBtn").on("click", () => {
          let logId = $("#inputId").val();
          let logPw = $("#inputPw").val();
          $.ajax({
            type: "POST",
            url: "/login.user",
            data: {
              "id": logId,
              "pw": logPw
            }
          }).done(function (res) {
            if (res == 'true') {
              if (logId == 'admin00') {
                console.log("어드민 로그인");
                location.href = "/user.admin";
              } else {
                alert(`\${logId}님 환영합니다.`);
                location.reload();
              }
            } else if (res == 'false') {
              alert("아이디와 비밀번호를 확인해주세요.");
            }
          })
        })

        $(".signUp").on("click", function () {
          location.href = "/signupPage.user";
        })

        // 빠른 예약 select box 함수 ***** 현우 : 호텔 select box
        let selectBoxChange = function (value) {
          console.log(value);
          $("#sideHotelId").val(value);
        }
        // 룸 타입 selectbox 함수
        let selectRoomChange = function (value) {
          console.log(value);
          $("#revRoomType").val(value);
        }

        $(".logOut").on("click", () => {
          alert("로그아웃 되었습니다.");
        })

        // 체크인 체크아웃 날짜 확인
        function onChange(){
        	
        	let checkIn = new Date(document.getElementById("speedRevIn").value);
        	let checkOut = new Date(document.getElementById("speedRevOut").value);
        	console.log(checkIn + '' +checkOut);
        	if(checkOut <= checkIn){
        		alert("체크아웃은 체크인 날짜 다음날부터 가능합니다.");
        		$("#speedRevOut").val("");
        	}
        }
        
        // 예약 제출 전
        $("#sideReserveBtn").on("click", function () {
          let hotelId = document.getElementById("sideHotelId").value;
          let checkIn = document.getElementById("speedRevIn").value;
          let checkOut = document.getElementById("speedRevOut").value;
          let revRoomType = document.getElementById("revRoomType").value;
          let revQuantity = document.getElementById("revQuantity").value;
          let addPrice = document.getElementById("addPrice").value;

          console.log(checkIn + checkOut + revRoomType + revQuantity + addPrice);
			if(hotelId == ''){
				alert("호텔을 선택해주세요");
        }else if (checkIn == '' || checkOut == '') {
            alert("체크인, 체크아웃 날짜를 입력해주세요");
            return false;
          } else if (checkIn >= checkOut) {
            alert("체크아웃 날짜는 체크인 다음날부터 가능합니다.");
            return false;
          } else if (revRoomType == '') {
            alert("방 타입을 선택해주세요.");
            return false;
          } else if (revQuantity == '') {
            alert("방 개수를 선택해주세요.");
            return false;
          } else if (addPrice == '') {
            alert("방 1개 당 인원을 선택해주세요.");
            return false;
          } else {
            if (confirm("예약 하시겠습니까?")) {
              alert("예약이 완료되었습니다.");
              $("#form").submit();
            }
          }
        })

        // 관리자 이동버튼
        $("#adminBtn").on("click", () => {
          location.href = "/user.admin";
        })

        // 사이드바 관련 스크립트 끝


      //유저관리로 이동
      document.querySelector("#goUser").addEventListener("click", function () {
          location.href = "/user.admin";
        })
      //호텔관리로 이동
      document.querySelector("#goHotel").addEventListener("click", function () {
          location.href = "/hotel.admin";
        })
      //큐앤에이관리로 이동
      document.querySelector("#goQna").addEventListener("click", function () {
          location.href = "/qna.admin";
        })
	 //아티클관리로 이동
      document.querySelector("#goArticle").addEventListener("click", function () {
          location.href = "/article.admin";
        })
     // 홈으로
       document.querySelector("#goHome").addEventListener("click", function () {
          location.href = "/index.jsp";
        })
        
     // 탈퇴 눌렀을 때
     $(".btn").on("click",function(){
    	 let result = confirm("정말 삭제시키겠습니까?");
    	 if(!result){return false;}
     })
     
     //검색
     let searchBtn = document.querySelector(".detailSearchBtn");
        searchBtn.addEventListener("click", function () { // 검색버튼을 누를때 option의 값을 빼냄

          let searchTxt = document.querySelector(".detailSearch").value; // 검색창 value값 추출

          let searchBox = document.querySelector("#searchOption");
          let searchOption = searchBox.options[searchBox.selectedIndex].value; // 검색 옵션값 추출
          location.href = "/qnaSearch.admin?option=" + searchOption + "&Keyword=" + searchTxt; // get으로 검색값 전달
        })

        document.getElementById("topSearchBtn").addEventListener("click", () => {
          let keyword = document.getElementById("topSearch").value;
          location.href = "/listSearch.hotel?option=이름" + "&Keyword=" + keyword;
        })
      </script>
</body>

</html>