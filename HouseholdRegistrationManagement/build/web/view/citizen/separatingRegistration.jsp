
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Tách hộ khẩu - Vietnamese Public Services</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
        <style>
#pageWrapper {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

main {
    flex-grow: 1;
}    </style>
    </head>

    <body>
        <div id="pageWrapper">
            <div class="phStickyWrap section">
                <header id="pageHeader" class="bg-white">
                    <jsp:include page="../citizen/citizenHeader.jsp"></jsp:include>
                    </header>
                </div>
                <main>
                    <div class="container section">
                        <h2 class="text-center mt-4">Đăng ký tách hộ khẩu</h2>

                        <!-- Hiển thị thông báo từ Servlet -->
                    <c:if test="${not empty requestScope.message}">
                        <div class="alert ${requestScope.requestSaved ? 'alert-success' : 'alert-danger'}">
                            ${requestScope.message}
                        </div>
                    </c:if>

                    <c:if test="${requestScope.requestSaved}">
                        <div class="card p-3 mt-3 section">
                            <h4>Thông tin tách hộ khẩu</h4>
                            <p><strong>Chủ hộ:</strong> ${sessionScope.userName}</p>
                            <p><strong>Địa chỉ hiện tại:</strong> ${sessionScope.currentAddress}</p>
                            <p><strong>Địa chỉ mới:</strong> ${requestScope.newAddress}</p>
                            <p><strong>Ngày gửi yêu cầu:</strong> ${requestScope.createdDate}</p>
                            <p><strong>Trạng thái:</strong> <span class="badge bg-warning text-dark">Chờ duyệt</span></p>
                            <c:if test="${not empty requestScope.documentPath}">
                                <p><strong>Tài liệu:</strong> 
                                    <a href="${pageContext.request.contextPath}/${requestScope.documentPath}" target="_blank">Xem file</a>
                                </p>
                            </c:if>
                        </div>
                    </c:if>

                    <!-- Form đăng ký tách hộ khẩu -->
                    <form action="${pageContext.request.contextPath}/registration" method="post" enctype="multipart/form-data" class="section">
                        <input type="hidden" name="action" value="separatingRegistration">

                        <!-- Hiển thị địa chỉ hiện tại của hộ khẩu -->
                        <c:if test="${not empty sessionScope.currentAddress}">
                            <div class="mb-3">
                                <label class="form-label">Địa chỉ hiện tại:</label>
                                <input type="text" class="form-control" value="${sessionScope.currentAddress}" readonly>
                            </div>
                        </c:if>

                        <div class="mb-3">
                            <label for="newAddress" class="form-label">Nhập địa chỉ mới:</label>
                            <input type="text" class="form-control" id="newAddress" name="newAddress" placeholder="Nhập địa chỉ mới" required>
                        </div>

                        <div class="mb-3">
                            <label for="document" class="form-label">Tải lên CMND/CCCD hoặc giấy tờ chứng minh nơi ở:</label>
                            <input type="file" class="form-control" id="document" name="document" required>
                        </div>

                        <button type="submit" class="btn btn-primary">Tách hộ khẩu</button>
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

            <!-- include jQuery library -->
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
