<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <!-- Metadata -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Vietnamese Public Services - Thong bao</title>

        <!-- Google Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com/" />
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Cabin:wght@400;500;600;700&display=swap" rel="stylesheet" />

        <!-- Stylesheets -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colors.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/rtl.css" />
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
    </head>
    <body>
        <div id="pageWrapper" class="ltr">
            <!-- Header -->
            <div class="phStickyWrap">
                <header id="pageHeader" class="bg-white">
                    <jsp:include page="../citizen/citizenHeader.jsp"></jsp:include>   
                    </header>
                    </div>

                    <!-- Main Content -->
                    <main>
                        <div class="container mt-5">
                            <h2 class="text-center">📢 Thông báo của bạn</h2>
                        <c:choose>
                            <c:when test="${not empty notifications}">
                                <ul class="list-group">
                                    <c:forEach var="n" items="${notifications}">
                                        <li class="list-group-item">
                                            📢 ${n.message} <br>
                                            <small class="text-muted">${n.sentDate}</small>
                                        </li>
                                    </c:forEach>
                                </ul>
                                <button id="markAllRead" class="btn btn-primary mt-3">Đánh dấu tất cả đã đọc</button>
                            </c:when>
                            <c:otherwise>
                                <p class="text-muted text-center">Bạn chưa có thông báo nào.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>

            </main>

            <!-- Footer -->
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

        <!-- Scripts -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jqueryCustom.js"></script>
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
        <script src="https://kit.fontawesome.com/391f644c42.js"></script>
        <script>
            $(document).ready(function () {
                // Đánh dấu một thông báo đã đọc
                $('.mark-read').click(function () {
                    var notificationId = $(this).data('notification-id');
                    $.post('${pageContext.request.contextPath}/notifications', 
                        { notificationId: notificationId }, 
                        function () {
                            location.reload(); // Tải lại trang để cập nhật
                        });
                });

                // Đánh dấu tất cả đã đọc
                $('#markAllRead').click(function () {
                    $.post('${pageContext.request.contextPath}/notifications', 
                        { action: 'markAll' }, 
                        function () {
                            location.reload();
                        });
                });
            });
        </script>
    </body>
</html>