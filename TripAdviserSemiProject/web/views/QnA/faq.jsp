<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
 <section id="notice-section" class="notice-section">    
	<div class="caption">
    	<img src="<%=request.getContextPath()%>/images/faqBoard.png" width="800px"/>
    </div>       
    	<h4>질문을 클릭해 주세요.</h4>
<div class="container ">
    <div class="panel-group" id="faqAccordion">
        <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question0">
                 <h4 class="panel-title">
                    <a href="#" class="ing">Q: 검색을 하는 방법은?</a>
              </h4>

            </div>
            <div id="question0" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Answer</span></h5>

                    <p>메인 페이지 중앙의 검색어 창에 입력하여 검색을 하고, 검색버튼 또는 엔터버튼을 누르면 관련 검색어로 검색이 가능합니다.<BR> 검색후에는 상단의 검색버튼으로 다시 검색을 할수 있습니다.
                        </p>
                </div>
            </div>
        </div>
        <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question1">
                 <h4 class="panel-title">
                    <a href="#" class="ing">Q: 첫화면에 보이는 내용은?</a>
              </h4>

            </div>
            <div id="question1" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Answer</span></h5>

                    <p>첫 화면의 보이는 내용은 별점순으로 보여지는 상품들로서 3개씩 보여집니다.<BR> 맨 상단은 전체사이트의 상품중에서 최고 별점을 받은 3개의 상품이 나타나며, 그다음은 각 카테고리별 별점순 3개의 상품이 보여집니다.<BR> 각 상품에 사용자가 매겨진 상품 별점이 실시간으로 반영이 되는 순서로 보여집니다.
                    <BR>각 카테고리별 순서를 보고싶으시면 상단 메뉴에 각 카테고리를 선택해서 골라보실수 있습니다.
                    </p>
                </div>
            </div>
        </div>
            <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question2">
                 <h4 class="panel-title">
                    <a href="#" class="ing">Q: 상품추가하는 방법은?</a>
              </h4>

            </div>
            <div id="question2" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Answer</span></h5>

                    <p>현재는 관리자만 상품의 추가 삭제가 가능합니다.<BR> 추후 업데이트를 통해 사용자끼리의 상품 추가선택 공유를 가능하게 변경될 예정입니다.             </p>
                </div>
            </div>
        </div>
            <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question3">
                 <h4 class="panel-title">
                    <a href="#" class="ing">Q: 별점은 어디서 줄수 있나요?</a>
              </h4>

            </div>
            <div id="question3" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Answer</span></h5>

                    <p>메인 페이지의 화면또는 검색된 상태의 화면에서 상품 이미지를 클릭하시면 상품의 상세 정보가 나오는데 하단의 별점 코멘트를 주시면 가능합니다.
                        </p>
                </div>
            </div>
        </div>
            <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question4">
                 <h4 class="panel-title">
                    <a href="#" class="ing">Q: 회원가입관련 주의점은?</a>
              </h4>

            </div>
            <div id="question4" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Answer</span></h5>

                    <p>아이디는 기존아이디와 중복해서 가입할수 없으며, 비밀번호는 확인을 통해서 가입을 할수 있습니다. 이메일은 인증하기를 보내서 인증번호를 입력한후에 보내진 인증번호와 동일시 가입이 가능합니다.<BR> 가입한 정보는 My page 란에서 수정이 가능합니다. 기타 자세한 문의는 관리자와 상의하거나 게시판에 남겨주시면 빠른시일내로 처리 가능합니다.
                        </p>
                </div>
            </div>
        </div>
            <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question5">
                 <h4 class="panel-title">
                    <a href="#" class="ing">Q: 이 사이트 제작자?</a>
              </h4>

            </div>
            <div id="question5" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Answer</span></h5>

                    <p>KH 교육원의 R클래스 SSS 팀에서 제작하였으며 손성식팀장을 주축으로 박순규, 임지안, 이정복, 강도원, 왕찬웅이 세미 프로젝트로 제작하였습니다.<BR> 모두가 열심히 제작한 페이지입니다. 감사합니다.
                        </p>
                </div>
            </div>
        </div>
        
        
    </div>
    <!--/panel-group-->
</div>

<%@ include file="/views/common/footer.jsp"%>