<%-- 
    Document   : home
    Created on : 2 thg 3, 2025, 15:19:18
    Author     : Vinh
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Đăng ký hộ khẩu - Vienamese Public Services</title>
        <link rel="preconnect" href="https://fonts.gstatic.com/" />
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Cabin:wght@400;500;600;700&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colors.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/rtl.css" />
    </head>
            <style>
#pageWrapper {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

main {
    flex-grow: 1;
}
        </style>
    <body>
        <div id="pageWrapper">
            <div class="phStickyWrap">
                <header id="pageHeader" class="bg-white">
                    <jsp:include page="../citizen/citizenHeader.jsp"></jsp:include>   
                    </header>
                </div>
                <main>
                    <div class="container section">
                        <h2 class="text-center mt-4">Đăng ký hộ khẩu</h2>
                    <c:if test="${not empty requestScope.message}">
                        <div class="alert ${requestScope.success ? 'alert-success' : 'alert-danger'}">
                            ${requestScope.message}
                        </div>
                    </c:if>
                    <c:if test="${not empty sessionScope.registration}">
                        <div class="card border border-secondary rounded p-3 mb-4 shadow-sm">
                            <h4>Thông tin đăng ký</h4>
                            <p><strong>Người đăng ký:</strong> ${sessionScope.userName}</p>
                            <p><strong>Loại đăng ký:</strong> 
                                <c:choose>
                                    <c:when test="${sessionScope.registration.registrationType == 'Permanent'}">
                                        <span class="badge bg-secondary text-dark">Thường trú</span>
                                    </c:when>
                                    <c:when test="${sessionScope.registration.registrationType == 'Temporary'}">
                                        <span class="badge bg-success">Lưu trú</span>
                                    </c:when>
                                    <c:when test="${sessionScope.registration.registrationType == 'TemporaryStay'}">
                                        <span class="badge bg-danger text-dark">Tạm trú</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-secondary">Không xác định</span>
                                    </c:otherwise>
                                </c:choose>
                            </p>
                            <p><strong>Địa chỉ:</strong> ${sessionScope.registration.address}</p>
                            <p><strong>Ngày bắt đầu:</strong> ${sessionScope.registration.startDate}</p>
                            <p><strong>Ngày kết thúc:</strong> <c:out value="${sessionScope.registration.endDate}" default="Không có" /></p>
                            <p><strong>Trạng thái:</strong> <span class="badge bg-warning text-dark">Chờ duyệt</span></p>
                            <p><strong>Tài liệu:</strong> 
                                <a href="${pageContext.request.contextPath}/${sessionScope.registration.documentPath}" target="_blank">Xem file</a>
                            </p>
                        </div>
                    </c:if>
                    <form action="${pageContext.request.contextPath}/registration" method="post" enctype="multipart/form-data" class="p-4 border border-light rounded shadow-sm">
                        <input type="hidden" name="action" value="householdRegistration">
                        <div class="mb-3">
                            <label for="registrationType" class="form-label">Loại đăng ký:</label>
                            <select class="form-control" id="registrationType" name="registrationType" required>
                                <option value="Permanent">Thường trú</option>
                                <option value="Temporary">Tạm trú</option>
                                <option value="TemporaryStay">Lưu trú</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="address" class="form-label">Địa chỉ:</label>
                            <input type="text" class="form-control" id="address" name="address" placeholder="Nhập địa chỉ đầy đủ" required>
                        </div>
                        <div class="mb-3">
                            <label for="startDate" class="form-label">Ngày bắt đầu:</label>
                            <input type="text" class="form-control" id="startDate" name="startDate" placeholder="Chọn ngày bắt đầu" required>
                        </div>
                        <div class="mb-3">
                            <label for="endDate" class="form-label">Ngày kết thúc (nếu có):</label>
                            <input type="text" class="form-control" id="endDate" name="endDate" placeholder="Chọn ngày kết thúc">
                        </div>
                        <div class="mb-3">
                            <label for="document" class="form-label">Tải lên CMND/CCCD hoặc giấy tờ chứng minh nơi ở:</label>
                            <input type="file" class="form-control" id="document" name="document" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Gửi đăng ký</button>
                    </form>
                </div>
            </main>
            <footer
                id="pageFooter"
                class="text-center bg-danger pt-6 pb-3 pt-md-8 pb-md-5"
                >
                <div class="container">
                    <p>
                        <jsp:include page="../citizen/ftAreaWrap.jsp"></jsp:include>
                        </p>
                    </div>
                </footer>
            </div>

            <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jqueryCustom.js"></script>
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
        <script src="../../../kit.fontawesome.com/391f644c42.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#startDate, #endDate").datepicker({
                    dateFormat: "yy-mm-dd",
                    changeMonth: true,
                    changeYear: true,
                    yearRange: "1900:2100"
                });
            });
        </script>
    </body>
</html>
