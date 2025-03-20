<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container">
    <div class="flatpWrap position-relative mt-n8 mt-md-n18">
        <ul class="list-unstyled fabFeaturesList d-flex flex-wrap justify-content-center">
            <li class="col-6 col-sm-4 col-md-3 p-2">
                <a href="${pageContext.request.contextPath}/view/leader/leaderHome.jsp"
                   class="fflColumn d-block w-100 text-center px-2 pt-4 pb-10">
                    <img src="${pageContext.request.contextPath}/img/logoCitizen.png" class="feature-icon" alt="Trang chủ"/>
                    <h2 class="mb-0">Trang chủ</h2>
                </a>
            </li>
            <li class="col-6 col-sm-4 col-md-3 p-2">
                <a href="${pageContext.request.contextPath}/view/leader/profileApproval.jsp"
                   class="fflColumn d-block w-100 text-center px-2 pt-4 pb-10">
                    <img src="${pageContext.request.contextPath}/img/logoCitizen.png" class="feature-icon" alt="Duyệt hồ sơ"/>
                    <h2 class="mb-0">Duyệt<br/>Hồ sơ</h2>
                </a>
            </li>
            <li class="col-6 col-sm-4 col-md-3 p-2">
                <a href="${pageContext.request.contextPath}/view/leader/profileReport.jsp"
                   class="fflColumn d-block w-100 text-center px-2 pt-4 pb-10">
                    <img src="${pageContext.request.contextPath}/img/logoCitizen.png" class="feature-icon" alt="Báo cáo"/>
                    <h2 class="mb-0">Báo cáo<br/>Thống kê</h2>
                </a>
            </li>
            <li class="col-6 col-sm-4 col-md-3 p-2">
                <a href="${pageContext.request.contextPath}/view/leader/leaderNotification.jsp"
                   class="fflColumn d-block w-100 text-center px-2 pt-4 pb-10">
                    <img src="${pageContext.request.contextPath}/img/logoCitizen.png" class="feature-icon" alt="Danh sách hộ"/>
                    <h2 class="mb-0">Thông báo</h2>
                </a>
            </li>
        </ul>
    </div>
</div>

<style>
/* Định dạng icon */
.feature-icon {
    width: 60px; /* Kích thước ảnh */
    height: auto;
    margin-bottom: 10px;
}

/* Responsive layout */
@media (max-width: 767px) {
    .fabFeaturesList li {
        flex: 0 0 50%; /* 2 cột trên màn hình nhỏ */
        max-width: 50%;
    }
}

@media (max-width: 575px) {
    .fabFeaturesList li {
        flex: 0 0 100%; /* 1 cột trên màn hình cực nhỏ */
        max-width: 100%;
    }
}
</style>
