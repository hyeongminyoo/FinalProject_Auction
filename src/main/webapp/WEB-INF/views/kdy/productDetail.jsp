<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
    #inquirySt{
      margin-top: 50px;
      margin-bottom: 50px;
    }
    #inquiryss{
      margin-left: 350px;
    }
    #inquiryAddBottonST{
      margin-top: 50px;
    }
    #information{
            font-size: 17px;
            font-weight: bold;
        }
  </style>
<script  defer src="/kdy/js/admin.js"></script>
</head>
<body>
    <c:import url="../common/header.jsp"></c:import>

    <div class="container-fluid">
      <div id="contact" class="contact">
        <div class="container" data-aos="fade-up" id="inquirySt">
            <div class="section-header">
            <h2>상품번호 ${productVO.product_num}번<br> 품목 : ${productVO.name}</h2>
            </div>
            <div class="row gx-lg-0 gy-4">
              <div style="height: 50px;">
                <div class="d-flex">
                  <div class="info-item d-flex" >
                      <i class="bi bi-envelope flex-shrink-0"></i>
                      <div>
                        <h4>상품 판매 여부</h4>
                          <c:choose>
                             <c:when test="${productVO.sales == 3}">
                              보류
                             </c:when>
                             <c:when test="${productVO.sales == 2}">
                              SOLD OUT
                             </c:when>
                             <c:otherwise>
                              판매중
                             </c:otherwise>
                          </c:choose>
                      </div>
                  </div><!-- End Info Item -->

                  <div class="info-item d-flex">
                    <i class="bi bi-envelope flex-shrink-0"></i>
                    <div>
                      <h4>상품 등급</h4>
                        ${productVO.productGradeVO.grade_name}
                    </div>
                </div><!-- End Info Item -->
  
                    <div class="info-item d-flex">
                    <i class="bi bi-envelope flex-shrink-0"></i>
                    <div>
                      <h4>경매 번호</h4>
                      <c:choose>
                        <c:when test="${empty productVO.auction_num}">
                          경매 미정
                        </c:when>
                        <c:otherwise>
                          ${productVO.auction_num}번 입니다.
                        </c:otherwise>
                      </c:choose>
                    </div>
                  </div><!-- End Info Item -->
                </div>
            </div>
            <div class="col-lg-8 php-email-form" style="margin-bottom: 90px;">
              <div class="row">
                <div class="col-md-6 form-group">
                  <input type="text" name="name" class="form-control" id="information" style="border: 0;"   readonly value="상품 수량 : ${productVO.quantity}">
                </div>
                <div class="col-md-6 form-group mt-3 mt-md-0">
                  <input type="text" class="form-control" name="email" id="information" style="border: 0;"  readonly value="상품 중량 : ${productVO.weight}">
                </div>
                <div class="col-md-6 form-group mt-3 mt-md-0">
                  <input type="text" class="form-control" name="email" id="information" style="border: 0;"  readonly value="상품 위치 : ${productVO.product_address}">
                </div>
                    <!-- ======= Frequently Asked Questions Section ======= -->
                    <c:choose>
                      <c:when test="${empty productVO.productFileVOs[0].fileName}">                        
                      </c:when>
                      <c:otherwise>
                        <section id="faq" class="faq">
                          <div class="container" data-aos="fade-up" style="margin-left: 150px; margin-top: -45px;">
                            <div class="row gy-4">
                              <div class="col-lg-8">
                                <div class="accordion accordion-flush" id="faqlist" data-aos="fade-up" data-aos-delay="100">
                                  <div class="accordion-item">
                                    <h3 class="accordion-header">
                                      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-1">
                                        <span class="num">-</span>
                                        상품번호 ${productVO.product_num}번의 품질을 확인해보세요
                                      </button>
                                    </h3>
                                    <div id="faq-content-1" class="accordion-collapse collapse" data-bs-parent="#faqlist">
                                      <div class="accordion-body">
                                        <c:forEach items="${productVO.productFileVOs}" var="proFile">
                                          <img alt="" src="/file/membersFile/${proFile.fileName}">
                                        </c:forEach>  
                                      </div>
                                    </div>
                                  </div><!-- # Faq item-->
                                </div>
                              </div>
                            </div>
                          </div>
                        </section><!-- End Frequently Asked Questions Section -->
                      
                      </c:otherwise>
                    </c:choose>
              </div>
              
              <div class="d-flex" style="margin-left: 400px;">
                <c:choose>
                  <c:when test="${productVO.sales == 1}">
                    <div class="text-center" onclick="location.href='/kdy/productHold?sales=3&product_num=${productVO.product_num}';">
                      <button type="submit" >판매 보류</button>
                    </div>
                    <div class="text-center" onclick="location.href='/kdy/productHold?sales=2&product_num=${productVO.product_num}';">
                      <button type="submit" >SOLD OUT</button>
                    </div>
                  </c:when>
                  <c:when test="${productVO.sales == 2}">
                    <div class="text-center"  onclick="location.href='/kdy/productHold?sales=3&product_num=${productVO.product_num}';">
                      <button type="submit" >판매 보류</button>
                    </div>
                    <div class="text-center" onclick="location.href='/kdy/productHold?sales=1&product_num=${productVO.product_num}';">
                      <button type="submit">상품 판매</button>
                    </div>
                  </c:when>
                  <c:otherwise>
                    <div class="text-center"onclick="location.href='/kdy/productHold?sales=2&product_num=${productVO.product_num}';">
                      <button type="submit" >SOLD OUT</button>
                    </div>
                    <div class="text-center" onclick="location.href='/kdy/productHold?sales=1&product_num=${productVO.product_num}';">
                      <button type="submit">상품 판매</button>
                    </div>
                  </c:otherwise>
                </c:choose>

                <div class="text-center"   onclick="location.href='/kdy/saleTypeList';">
                  <button type="submit" id="inquiryAddBtn">뒤로가기</button>
                </div>
              </div>
          </div>
            </div>
        </div>
      </div>
    </div>
        <c:import url="../common/footer.jsp"></c:import>
</body>
</html>