<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Trạng thái hồ sơ - Vietnamese Public Services</title>
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
        <div id="pageWrapper">
            <div class="phStickyWrap">
                <header id="pageHeader" class="bg-white">
                    <jsp:include page="../citizen/citizenHeader.jsp"></jsp:include>
                    </header>
                </div>
                <main>
                    <div class="container section">
                        <h2 class="text-center mt-4">Trạng thái hồ sơ đăng ký</h2>

                        <!-- Nút chọn loại đơn -->
                        <div class="text-center my-3">
                            <a href="?filter=household" class="btn btn-primary ${filter == 'household' ? 'active' : ''}">📌 Đăng ký hộ khẩu</a>
                        <a href="?filter=separation" class="btn btn-success ${filter == 'separation' ? 'active' : ''}">📂 Tách hộ khẩu</a>
                    </div>
                    <!-- Hiển thị bảng Đăng ký hộ khẩu -->
                    <c:if test="${filter == 'household'}">
                        <h4 class="text-center">📌 Đăng ký hộ khẩu</h4>
                        <c:choose>
                            <c:when test="${empty householdRegistrations}">
                                <p class="text-center">Bạn chưa có hồ sơ đăng ký hộ khẩu.</p>
                            </c:when>
                            <c:otherwise>
                                <div class="table-responsive">
                                    <table class="table-bordered mt-3">
                                        <thead class="table-light">
                                            <tr>
                                                <th>Mã</th>
                                                <th>Người đăng ký</th>
                                                <th>Địa chỉ</th>
                                                <th>Tài liệu</th>
                                                <th>Trạng thái</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="r" items="${householdRegistrations}">
                                                <tr>
                                                    <td>${r.registrationId}</td>
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
                                                    <td>${r.address}</td>
                                                    <td>
                                                        <c:if test="${not empty r.documentPath}">
                                                            <a href="${pageContext.request.contextPath}/${r.documentPath}" target="_blank">Xem file</a>
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${r.status == 'Pending'}">
                                                                <span class="badge bg-warning text-dark">Chờ duyệt</span>
                                                            </c:when>
                                                            <c:when test="${r.status == 'Approved'}">
                                                                <span class="badge bg-success">Đã duyệt</span>
                                                            </c:when>
                                                            <c:when test="${r.status == 'Rejected'}">
                                                                <span class="badge bg-danger">Bị từ chối</span>
                                                            </c:when>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:if>

                    <!-- Hiển thị bảng Tách hộ khẩu -->
                    <c:if test="${filter == 'separation'}">
                        <h4 class="text-center">📂 Tách hộ khẩu</h4>
                        <c:choose>
                            <c:when test="${empty separationRegistrations}">
                                <p class="text-center">Bạn chưa có hồ sơ tách hộ khẩu.</p>
                            </c:when>
                            <c:otherwise>
                                <div class="table-responsive">
                                    <table class="table-bordered mt-3">
                                        <thead class="table-light">
                                            <tr>
                                                <th>Mã</th>
                                                <th>Địa chỉ cũ</th>
                                                <th>Địa chỉ mới</th>
                                                <th>Trạng thái</th>
                                                <th>Tài liệu</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="r" items="${separationRegistrations}">
                                                <tr>
                                                    <td>${r.registrationId}</td>
                                                    <td><c:out value="${r.comments}" default="Không có" /></td>
                                                    <td>${r.address}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${r.status == 'Pending'}">
                                                                <span class="badge bg-warning text-dark">Chờ duyệt</span>
                                                            </c:when>
                                                            <c:when test="${r.status == 'Approved'}">
                                                                <span class="badge bg-success">Đã duyệt</span>
                                                            </c:when>
                                                            <c:when test="${r.status == 'Rejected'}">
                                                                <span class="badge bg-danger">Bị từ chối</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="badge bg-secondary">Không xác định</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <c:if test="${not empty r.documentPath}">
                                                            <a href="${pageContext.request.contextPath}/${r.documentPath}" target="_blank">Xem file</a>
                                                        </c:if>
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
    </body>
</html>