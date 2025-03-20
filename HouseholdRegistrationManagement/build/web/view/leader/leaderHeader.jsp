<%-- 
    Document   : header
    Created on : 5 thg 3, 2025, 11:15:59
    Author     : Vinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div
    class="hdTopBar py-2 py-xl-3 bg-danger d-none d-md-block"
>
</div>
<div
    class="hdFixerWrap py-2 py-md-3 py-xl-5 sSticky bg-white"
    >
    <div class="container">
        <nav
            class="navbar navbar-expand-md navbar-light p-0"
            >
            <div
                class="logo flex-shrink-0 mr-3 mr-xl-8 mr-xlwd-16"
                >
                <a href="${pageContext.request.contextPath}/view/leader/leaderHome.jsp">
                    <img
                        src="${pageContext.request.contextPath}/img/VNPS.png"
                        class="img-fluid"
                        alt="VNPS"
                        />
                </a>
            </div>
            <div
                class="hdNavWrap flex-grow-1 d-flex align-items-center justify-content-end justify-content-lg-start"
                >
                <div
                    class="collapse navbar-collapse pageMainNavCollapse mt-2 mt-md-0"
                    id="pageMainNavCollapse"
                    >
                    <ul class="navbar-nav mainNavigation">
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/view/leader/leaderHome.jsp">Trang chủ</a>
                        </li>
                        <li
                            class="nav-item dropdown ddohOpener"
                            >
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/profileApproval">Duyệt hồ sơ</a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/view/leader/profileReport.jsp">Báo cáo</a>
                        </li>
                        <li
                            class="nav-item dropdown ddohOpener"
                            >
                            <a
                                class="dropdown-toggle dropIcn"
                                href="javascript:void(0);"
                                role="button"
                                data-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                                >Tài khoản</a
                            >
                            <div
                                class="dropdown-menu hdMainDropdown desktopDropOnHover"
                                >
                                <ul
                                    class="list-unstyled mb-0 hdDropdownList"
                                    >
                                    <li>
                                        <a
                                            class="dropdown-item"
                                            href="contact-2.html"
                                            >Thông tin cá nhân</a
                                        >
                                    </li>
                                    <li>
                                        <a
                                            class="dropdown-item"
                                            href="${pageContext.request.contextPath}/logout"
                                            >Đăng xuất</a
                                        >
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a href="">Thông báo</a>
                        </li>
                    </ul>
                </div>
                <form action="#" class="hdSearchForm ml-3 ml-xl-6">
                    <a class="hdSearchOpener" data-toggle="collapse" href="#hdSearchCollapse" role="button" aria-expanded="false" aria-controls="hdSearchCollapse">
                        <img src="${pageContext.request.contextPath}/img/search.jpg" alt="search"/>                    </a>
                    <div class="collapse hdSearchCollapse d-block position-fixed" id="hdSearchCollapse">
                        <div class="d-flex w-100 h-100 align-items-center jusity-content-center">
                            <div class="container d-block text-center text-light">
                                <div class="row">
                                    <div class="col-12 col-md-8 offset-md-2">
                                        <div class="input-group mb-3">
                                            <input type="search" class="form-control text-left" placeholder="Tìm kiếm&hellip;" />
                                            <div class="input-group-append">
                                                <button class="btn btn-secondary" type="button">Tìm kiếm</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a class="position-absolute rounded-circle bg-danger text-white btnClose d-flex align-items-center justify-content-center" data-toggle="collapse" href="#hdSearchCollapse" role="button" aria-expanded="true" aria-controls="hdSearchCollapse">
                            <i class="fas fa-times"><span class="sr-only">Đóng thanh tìm kiếm</span></i>
                        </a>
                    </div>
                </form>

            </div>
            <div class="hdRighterWrap d-flex align-items-center justify-content-end">
                <button class="navbar-toggler pgNavOpener ml-2 bdrWidthAlter position-relative" type="button" data-toggle="collapse" data-target="#pageMainNavCollapse" aria-controls="pageMainNavCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
        </nav>
    </div>
</div>
