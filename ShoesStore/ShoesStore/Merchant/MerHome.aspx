<%@ Page Language="C#" Title="Trang Chủ" MasterPageFile="~/Merchant/SiteMerchant.Master" AutoEventWireup="true" CodeFile="MerHome.aspx.cs" Inherits="ShoesStore.Merchant.MerHome" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainPlaceHolder" runat="server">
<!-- .block-slideshow -->
<div class="block-slideshow block-slideshow--layout--full block">
    <div class="row">
        <div class="col-12">
            <div class="block-slideshow__body">
                <div class="owl-carousel">
                    <a class="block-slideshow__slide">
                        <div class="block-slideshow__slide-image block-slideshow__slide-image--desktop" style="background-image: url('/Merchant/images/slides/slide-1-full.jpg')"></div>
                        <div class="block-slideshow__slide-image block-slideshow__slide-image--mobile" style="background-image: url('/Merchant/images/slides/slide-1-mobile.jpg')"></div>
                        <div class="block-slideshow__slide-content">
                            <div class="block-slideshow__slide-title">
                                Sự Lựa Chọn Tin Cậy<br/>
                                Khi Mua Sắm HypeBeast
                            </div>
                            <div class="block-slideshow__slide-text">
                                Chúng tôi cung cấp thị trường cho mọi loại giày<br/>
                                Và kể cả giày Hypebeast
                            </div>
                            <div class="block-slideshow__slide-button">
                                
                                <span  class="btn btn-primary btn-lg">Tham Gia Ngay</span>
                            </div>
                        </div>
                    </a>
                    <a class="block-slideshow__slide" href="#">
                        <div class="block-slideshow__slide-image block-slideshow__slide-image--desktop" style="background-image: url('images/slides/slide-2-full.jpg')"></div>
                        <div class="block-slideshow__slide-image block-slideshow__slide-image--mobile" style="background-image: url('images/slides/slide-2-mobile.jpg')"></div>
                        <div class="block-slideshow__slide-content">
                            <div class="block-slideshow__slide-title">
                                Kể Cả<br/>
                                Những Hãng Thời Trang Cao Cấp
                            </div>
                            <div class="block-slideshow__slide-text">
                                Vẫn luôn có chỗ dành cho việc mua bán<br/>
                                Từ những hãng thời trang hàng đầu
                            </div>
                            <div class="block-slideshow__slide-button">
                                <span class="btn btn-primary btn-lg">Tham Gia Ngay</span>
                            </div>
                        </div>
                    </a>
                    <a class="block-slideshow__slide" href="#">
                        <div class="block-slideshow__slide-image block-slideshow__slide-image--desktop" style="background-image: url('images/slides/slide-3-full.jpg')"></div>
                        <div class="block-slideshow__slide-image block-slideshow__slide-image--mobile" style="background-image: url('images/slides/slide-3-mobile.jpg')"></div>
                        <div class="block-slideshow__slide-content">
                            <div class="block-slideshow__slide-title">Cho Đến Những Dòng Sản Phẩm Casual</div>
                            <div class="block-slideshow__slide-text">
                                Và tất nhiên có cả các loại giày Casual<br/>
                                Vì nơi đây dành cho tất cả mọi người !
                            </div>
                            <div class="block-slideshow__slide-button">
                                <span class="btn btn-primary btn-lg">Tham Gia Ngay</span>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- .block-slideshow / end -->
<!-- .block-features -->
<div class="block block-features block-features--layout--boxed">
    <div class="container">
        <div class="block-features__list">
            <div class="block-features__item">
                <div class="block-features__icon">
                    <svg width="48px" height="48px">
                        <use href="images/sprite.svg#fi-free-delivery-48"></use>
                    </svg>
                </div>
                <div class="block-features__content">
                    <div class="block-features__title"> Uy Tín</div>
                    <div class="block-features__subtitle">Cùng hệ thống rating</div>
                </div>
            </div>
            <div class="block-features__divider"></div>
            <div class="block-features__item">
                <div class="block-features__icon">
                    <svg width="48px" height="48px">
                        <use href="images/sprite.svg#fi-24-hours-48"></use>
                    </svg>
                </div>
                <div class="block-features__content">
                    <div class="block-features__title">Hỗ trợ 24/7</div>
                    <div class="block-features__subtitle">Gọi chúng tôi bất cứ lúc nào</div>
                </div>
            </div>
            <div class="block-features__divider"></div>
            <div class="block-features__item">
                <div class="block-features__icon">
                    <svg width="48px" height="48px">
                        <use href="images/sprite.svg#fi-payment-security-48"></use>
                    </svg>
                </div>
                <div class="block-features__content">
                    <div class="block-features__title">100% An Toàn</div>
                    <div class="block-features__subtitle">Sử dụng thanh toán Paypal</div>
                </div>
            </div>
            <div class="block-features__divider"></div>
            <div class="block-features__item">
                <div class="block-features__icon">
                    <svg width="48px" height="48px">
                        <use href="images/sprite.svg#fi-tag-48"></use>
                    </svg>
                </div>
                <div class="block-features__content">
                    <div class="block-features__title">Giá Hấp Dẫn</div>
                    <div class="block-features__subtitle">Cùng nhiều khuyến mãi cho cả 2 bên</div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- .block-features / end -->
<!-- .block-products-carousel -->
<!-- .block-products-carousel / end -->
<!-- .block-banner -->
<div class="block block-banner">
    <div class="container">
        <a href="#" class="block-banner__body">
            <div class="block-banner__image block-banner__image--desktop" style="background-image: url('images/banners/banner-1.jpg')"></div>
            <div class="block-banner__image block-banner__image--mobile" style="background-image: url('images/banners/banner-1-mobile.jpg')"></div>
            <div class="block-banner__title">
                Hàng Ngàn<br class="block-banner__mobile-br">
                Người Bán Tin Dùng
            </div>
            <div class="block-banner__text">Luxury, Hypebeast, Sporting, Casual, Trending</div>
            <div class="block-banner__button">
                <span class="btn btn-sm btn-primary">Tham Gia Ngay</span>
            </div>
        </a>
    </div>
</div>
<!-- .block-banner / end -->
<!-- .block-categories -->
<!-- .block-categories / end -->
<!-- .block-products-carousel -->
<!-- .block-products-carousel / end -->
<!-- .block-posts -->
<div class="block block-posts block-posts--layout--grid-nl" data-layout="grid-nl">
<div class="container">
<div class="block-header">
    <h3 class="block-header__title">Tin Mới</h3>
    <div class="block-header__divider"></div>
    <div class="block-header__arrows-list">
        <button class="block-header__arrow block-header__arrow--left" type="button">
            <svg width="7px" height="11px">
                <use href="images/sprite.svg#arrow-rounded-left-7x11"></use>
            </svg>
        </button>
        <button class="block-header__arrow block-header__arrow--right" type="button">
            <svg width="7px" height="11px">
                <use href="images/sprite.svg#arrow-rounded-right-7x11"></use>
            </svg>
        </button>
    </div>
</div>
<div class="block-posts__slider">
<div class="owl-carousel">
<div class="post-card">
    <div class="post-card__image">
        <a href="https://snkrvn.com/tin-tuc/thong-tin-ve-adidas-originals-x-hender-scheme/">
            <img src="images/posts/post-1.jpg" alt="">
        </a>
    </div>
    <div class="post-card__info">
        <div class="post-card__category">
            <a href="#">Special Offers</a>
        </div>
        <div class="post-card__name">
            <a href="https://snkrvn.com/tin-tuc/thong-tin-ve-adidas-originals-x-hender-scheme/">adidas Originals x Hender Scheme – Sự kết hợp của “sporty” và “luxury”</a>
        </div>
        <div class="post-card__date">Tháng 10 19, 2019</div>
        <div class="post-card__content">adidas Originals và Hender Scheme chưa bao giờ làm các fan phải thất vọng... </div>
        <div class="post-card__read-more">
            <a href="#" class="btn btn-secondary btn-sm">Đọc thêm</a>
        </div>
    </div>
</div>
<div class="post-card">
    <div class="post-card__image">
        <a href="https://snkrvn.com/tin-tuc/ngay-ra-mat-gia-noi-ban-giay-vans-vault-tropical-beach/">
            <img src="images/posts/post-2.jpg" alt="">
        </a>
    </div>
    <div class="post-card__info">
        <div class="post-card__category">
            <a href="#">Tin Mới</a>
        </div>
        <div class="post-card__name">
            <a href="https://snkrvn.com/tin-tuc/ngay-ra-mat-gia-noi-ban-giay-vans-vault-tropical-beach/">Vans Vault Summer Tropical Beach</a>
        </div>
        <div class="post-card__date">Tháng 9 5, 2019</div>
        <div class="post-card__content">Một mùa Hè sôi động đã đến gần kề, mọi người đã có kế hoạch vi vu đến đâu chưa? Trước khi xách ba lô lên và đi thì mình phải chuẩn bị hành trang trước nhỉ....</div>
        <div class="post-card__read-more">
            <a href="#" class="btn btn-secondary btn-sm">Read More</a>
        </div>
    </div>
</div>
<div class="post-card">
    <div class="post-card__image">
        <a href="https://snkrvn.com/review/review-nhung-doi-sneakers-nam-trong-chien-dich-vi-nu-quyen-buoc-ve-phia-mat-troi-tu-bitis-bitis-hunter/">
            <img src="images/posts/post-3.jpg" alt="">
        </a>
    </div>
    <div class="post-card__info">
        <div class="post-card__category">
            <a href="#">New Arrivals</a>
        </div>
        <div class="post-card__name">
            <a href="https://snkrvn.com/review/review-nhung-doi-sneakers-nam-trong-chien-dich-vi-nu-quyen-buoc-ve-phia-mat-troi-tu-bitis-bitis-hunter/">Bitis Hunter Captain Marvel Limited Edition</a>
        </div>
        <div class="post-card__date">Tháng 8 12, 2019</div>
        <div class="post-card__content">Ngày 8.3 vừa qua Biti’s và Biti’s Hunter cùng nhau tung ra những phiên bản sneakers khác nhau nằm trong chiến dịch vì nữ quyền ‘Bước Về Phía Mặt Trời’....</div>
        <div class="post-card__read-more">
            <a href="#" class="btn btn-secondary btn-sm">Read More</a>
        </div>
    </div>
</div>
<div class="post-card">
    <div class="post-card__image">
        <a href="https://snkrvn.com/review/adidas-originals-falcon-w-ca-tinh-va-noi-loan/">
            <img src="images/posts/post-4.jpg" alt="">
        </a>
    </div>
    <div class="post-card__info">
        <div class="post-card__category">
            <a href="#">Special Offers</a>
        </div>
        <div class="post-card__name">
            <a href="https://snkrvn.com/review/adidas-originals-falcon-w-ca-tinh-va-noi-loan/">adidas Originals FALCON W </a>
        </div>
        <div class="post-card__date">Tháng 7 30, 2019</div>
        <div class="post-card__content">Thời gian qua, chunky sneakers và phong cách retro nói chung chính là xu hướng chủ đạo trong giới sneakers và thời trang hiện đại...</div>
        <div class="post-card__read-more">
            <a href="#" class="btn btn-secondary btn-sm">Read More</a>
        </div>
    </div>
</div>
<div class="post-card">
    <div class="post-card__image">
        <a href="https://snkrvn.com/review/new-balance-revlite-x-90/">
            <img src="images/posts/post-5.jpg" alt="">
        </a>
    </div>
    <div class="post-card__info">
        <div class="post-card__category">
            <a href="#">New Arrivals</a>
        </div>
        <div class="post-card__name">
            <a href="https://snkrvn.com/review/new-balance-revlite-x-90/">New Balance REVlite X-90</a>
        </div>
        <div class="post-card__date">Tháng 8 12, 2019</div>
        <div class="post-card__content">Khi nhắc đến retro running shoes, chắc chắn bạn không thể không liệt kê New Balance. Nếu không phải là một người yêu và tìm hiểu về sneakers...</div>
        <div class="post-card__read-more">
            <a href="#" class="btn btn-secondary btn-sm">Read More</a>
        </div>
    </div>
</div>



</div>
</div>
</div>
</div>
<!-- .block-posts / end -->
<!-- .block-brands -->
</asp:Content>