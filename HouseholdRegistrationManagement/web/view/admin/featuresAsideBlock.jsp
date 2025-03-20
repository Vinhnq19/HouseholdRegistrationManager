<%-- 
    Document   : featuresAsideBlock
    Created on : 5 thg 3, 2025, 18:09:05
    Author     : Vinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container">
    <div
        class="flatpWrap position-relative mt-n8 mt-md-n18"
        >
        <ul
            class="list-unstyled fabFeaturesList mb-0 d-flex overflow-hidden flex-wrap"
            >
            <li>
                <a
                    href="${pageContext.request.contextPath}/view/citizen/citizenHome.jsp"
                    class="fflColumn d-block w-100 text-center px-2 pt-4 pb-10"
                    >
                    <img src="${pageContext.request.contextPath}/img/logoCitizen.png" alt="Congdan"/>
                    <h2 class="mb-0">
                        Trang chủ
                    </h2>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/view/admin/manageUsers.jsp" class="fflColumn d-block w-100 text-center px-2 pt-4 pb-10">
                    <img src="${pageContext.request.contextPath}/img/logoCitizen.png" alt="Admin"/>
                    <h2 class="mb-0">
                        Quản lý <br />Người dùng
                    </h2>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/view/admin/manageHouseholds.jsp" class="fflColumn d-block w-100 text-center px-2 pt-4 pb-10">
                    <img src="${pageContext.request.contextPath}/img/logoCitizen.png" alt="Admin"/>
                    <h2 class="mb-0">
                        Quản lý <br />Hộ khẩu
                    </h2>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/view/admin/manageRegistrations.jsp" class="fflColumn d-block w-100 text-center px-2 pt-4 pb-10">
                    <img src="${pageContext.request.contextPath}/img/logoCitizen.png" alt="Admin"/>
                    <h2 class="mb-0">
                        Quản lý <br />Đăng ký
                    </h2>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/view/admin/manageNotifications.jsp" class="fflColumn d-block w-100 text-center px-2 pt-4 pb-10">
                    <img src="${pageContext.request.contextPath}/img/logoCitizen.png" alt="Admin"/>
                    <h2 class="mb-0">
                        Quản lý <br />Thông báo
                    </h2>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/view/admin/systemConfig.jsp" class="fflColumn d-block w-100 text-center px-2 pt-4 pb-10">
                    <img src="${pageContext.request.contextPath}/img/logoCitizen.png" alt="Admin"/>
                    <h2 class="mb-0">
                        Cấu hình <br />Hệ thống
                    </h2>
                </a>
            </li>
        </ul>
    </div>
</div>
