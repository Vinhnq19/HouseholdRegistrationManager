<%-- 
    Document   : meetCouncilBlock
    Created on : 6 thg 3, 2025, 09:00:18
    Author     : Vinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container">
    <header
        class="headingHead text-center cdTitle mb-7 mb-md-13"
        >
        <h2 class="fwSemiBold mb-4">Thành viên dự án</h2>
        <p>
            Các thành viên lớp SE1912
        </p>
        <style>
            .imgHolder img {
    width: 500px; /* hoặc kích thước mong muốn */
    height: 500px;
    object-fit: cover; /* Cắt ảnh cho vừa khung */
}
        </style>
    </header>
    <div class="row justify-content-center text-center">
        <div class="col-12 col-sm-6 col-lg-3 col-xl-3">
            <article
                class="mccColumn bg-white shadow mb-6 mx-auto mx-sm-0"
                >
                <div class="imgHolder position-relative d-flex justify-content-center">
                    <img
                        src="${pageContext.request.contextPath}/img/QV.jpg"
                        class="img-fluid d-block w-100 mx-auto"
                        alt="Nguyễn Quang Vinh"
                        />
                </div>
                <div
                    class="mcCaptionWrap px-5 pt-5 pb-4 position-relative"
                    >
                    <h3 class="fwMedium h3Small mb-1">
                        Nguyễn Quang Vinh
                    </h3>
                    <h4
                        class="fwSemiBold fontBase text-secondary"
                        >
                        HE194181
                    </h4>
                </div>
            </article>
        </div>
        <div class="col-12 col-sm-6 col-lg-3 col-xl-3">
            <article
                class="mccColumn bg-white shadow mb-6 mx-auto mx-sm-0"
                >
                <div class="imgHolder position-relative d-flex justify-content-center">
                    <img
                        src="${pageContext.request.contextPath}/img/HaiDang.jpg"
                        class="img-fluid d-block w-100 mx-auto"
                        alt="image description"
                        />
                </div>
                <div
                    class="mcCaptionWrap px-5 pt-5 pb-4 position-relative"
                    >
                    <h3 class="fwMedium h3Small mb-1">
                        Phạm Đức Hải Đăng
                    </h3>
                    <h4
                        class="fwSemiBold fontBase text-secondary"
                        >
                        HE190525
                    </h4>
                </div>
            </article>
        </div>
        <div class="col-12 col-sm-6 col-lg-3 col-xl-3">
            <article
                class="mccColumn bg-white shadow mb-6 mx-auto mx-sm-0"
                >
                <div class="imgHolder position-relative d-flex justify-content-center">
                    <img
                        src="${pageContext.request.contextPath}/img/AnhThu.jpg"
                        class="img-fluid d-block w-100 mx-auto"
                        alt="image description"
                        />
                </div>
                <div
                    class="mcCaptionWrap px-5 pt-5 pb-4 position-relative"
                    >
                    <h3 class="fwMedium h3Small mb-1">
                        Trần Anh Thư
                    </h3>
                    <h4
                        class="fwSemiBold fontBase text-secondary"
                        >
                        HE190508
                    </h4>
                </div>
            </article>
        </div>
    </div>
</div>