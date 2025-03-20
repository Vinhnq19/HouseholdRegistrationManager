<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <!-- Metadata -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Vietnamese Public Services - Duyệt hồ sơ đăng ký</title>

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
            .table-responsive {
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}

.table-bordered {
    border-radius: 10px;
    width: 100%;
    font-size: 1.5rem; /* Tăng kích thước chữ */
    width: 80%; /* Tăng chiều rộng bảng */
    border-collapse: collapse; /* Gộp viền bảng */
}

th {
    background-color: #343a40 !important;
    color: white !important;
}

td, th {
    vertical-align: middle !important;
}

.btn-sm {
    padding: 5px 10px;
}
/* Tăng padding trong ô */
th, td {
    padding: 20px;
    text-align: center;
}

/* Tăng kích thước nút */
.btn {
    font-size: 1.2rem;
    padding: 12px 24px;
}
/* Thiết lập cho màn hình nhỏ (dưới 768px) */
@media screen and (max-width: 768px) {
    .table-bordered {
        font-size: 0.9rem; /* Giảm kích thước chữ */
    }
    /* Căn chỉnh lại kích thước nút bấm */
    .btn {
        font-size: 0.85rem;
        padding: 6px 10px;
    }
}
        </style>
    </head>
    <body>
        <div id="pageWrapper" class="ltr">
            <!-- Header -->
            <div class="phStickyWrap">
                <header id="pageHeader" class="bg-white">
                    <jsp:include page="../leader/leaderHeader.jsp"></jsp:include>   
                    </header>
                </div>

                <!-- Main Content -->
                <main>
                    <div class="container section">
                        <h2 class="text-center mt-4">Duyệt Hồ Sơ Đăng Ký</h2>
                        <!-- Nút chọn loại đơn -->
                        <div class="text-center my-3">
                            <a href="?filter=household" class="btn btn-primary ${filter == 'household' ? 'active' : ''}">📌 Đăng ký hộ khẩu</a>
                        <a href="?filter=separation" class="btn btn-success ${filter == 'separation' ? 'active' : ''}">📂 Tách hộ khẩu</a>
                    </div>
                    <c:if test="${filter == 'household'}">
                        <h4 class="text-center">📌 Đăng ký hộ khẩu</h4>
                        <c:choose>
                            <c:when test="${empty householdRegistrations}">
                                <p class="text-center">Bạn chưa có hồ sơ đăng ký hộ khẩu.</p>
                            </c:when>
                            <c:otherwise>
                                <div class="table-responsive">
                                    <table class="table-bordered table-striped table-hover mt-3 text-center">
                                        <thead class="table-light">
                                            <tr>
                                                <th>Mã hộ khẩu</th>
                                                <th>Họ và tên</th>
                                                <th>Địa chỉ</th>
                                                <th>Loại đơn</th>
                                                <th>Trạng thái</th>
                                                <th>Tài liệu</th>
                                                <th>Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="r" items="${householdRegistrations}">
                                                <tr>
                                                    <td>${r.registrationId}</td>
                                                    <td>${fullname[r.userId]}</td>
                                                    <td>${r.address}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${r.registrationType == 'Permanent'}">
                                                                <span class="badge bg-warning text-dark">Thường trú</span>
                                                            </c:when>
                                                            <c:when test="${r.registrationType == 'Temporary'}">
                                                                <span class="badge bg-success">Tạm trú</span>
                                                            </c:when>
                                                            <c:when test="${r.registrationType == 'TemporaryStay'}">
                                                                <span class="badge bg-danger">Lưu trú</span>
                                                            </c:when>
                                                        </c:choose>
                                                    </td>
                                                    <td><span class="badge bg-warning text-dark">Chờ duyệt</span></td>
                                                    <td>
                                                        <c:if test="${not empty r.documentPath}">
                                                            <a href="${pageContext.request.contextPath}/${r.documentPath}" target="_blank" class="btn btn-info btn-sm">
                                                                <i class="fas fa-file-alt"></i> Xem file
                                                            </a>
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <form action="profileApproval" method="post">
                                                            <input type="hidden" name="registrationId" value="${r.registrationId}">
                                                            <button type="submit" name="action" value="approve" class="btn btn-success btn-sm">
                                                                <i class="fas fa-check"></i> Duyệt
                                                            </button>
                                                            <button type="submit" name="action" value="reject" class="btn btn-danger btn-sm">
                                                                <i class="fas fa-times"></i> Từ chối
                                                            </button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:if>


                    <c:if test="${filter == 'separation'}">
                        <h4 class="text-center">📂 Tách hộ khẩu</h4>
                        <c:choose>
                            <c:when test="${empty separationRegistrations}">
                                <p class="text-center">Bạn chưa có hồ sơ đăng ký hộ khẩu.</p>
                            </c:when>
                            <c:otherwise>
                                <div class="table-responsive">
                                    <table class="table-bordered table-striped table-hover mt-3 text-center">
                                        <thead class="table-light">
                                            <tr>
                                                <th>Mã hộ khẩu</th>
                                                <th>Họ và tên</th>
                                                <th>Địa chỉ cũ</th>
                                                <th>Địa chỉ mới</th>
                                                <th>Tài liệu</th>
                                                <th>Trạng thái</th>
                                                <th>Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="r" items="${separationRegistrations}">
                                                <tr>
                                                    <td>${r.registrationId}</td>
                                                    <td>${fullname[r.userId]}</td>
                                                    <td>${r.comments}</td>
                                                    <td>${r.address}</td>
                                                    <td>
                                                        <c:if test="${not empty r.documentPath}">
                                                            <a href="${pageContext.request.contextPath}/${r.documentPath}" 
                                                               target="_blank" class="btn btn-info btn-sm">
                                                                <i class="fas fa-file-alt"></i> Xem file
                                                            </a>
                                                        </c:if>
                                                    </td>
                                                    <td><span class="badge bg-warning text-dark">Chờ duyệt</span></td>
                                                    <td>
                                                        <form action="profileApproval" method="post">
                                                            <input type="hidden" name="registrationId" value="${r.registrationId}">
                                                            <button type="submit" name="action" value="approve" class="btn btn-success">Duyệt</button>
                                                            <button type="submit" name="action" value="reject" class="btn btn-danger">Từ chối</button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:if>

                </div>
                    </main>

                    <!-- Footer -->
            <footer
                id="pageFooter"
                class="text-center bg-danger pt-6 pb-3 pt-md-8 pb-md-5"
                >
                <div class="container">
                    <p>
                        <jsp:include page="../common/ftAreaWrap.jsp"></jsp:include>
                        </p>
                    </div>
                </footer>
            </div>

            <!-- Scripts -->
            <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jqueryCustom.js"></script>
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
        <script src="https://kit.fontawesome.com/391f644c42.js"></script>
    </body>
</html>