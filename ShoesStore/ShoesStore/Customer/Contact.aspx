<%@ Page Language="C#" Title="Liên Hệ" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="ShoesStore.Customer.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- site__body -->
    <div class="site__body">
        <div class="block About">
            <div class="About__image"></div>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12 col-xl-10">
                        <div class="About__body">
                            <h1 class="About__title">Về trang web</h1>
                            <div class="About__text typography">
                                <p>Là một trang web thương mại điện tử C2C về lĩnh vững giày sneaker.</p>
                                <p>Nhanh, đẹp, thuận tiện là mục tiêu của trang web này.</p>
                            </div>
                            <div class="About__team">
                                <h2 class="About__team-title">Chúng tôi là ai?</h2>
                                <div class="About__team-subtitle text-muted">
                                    Muốn tham gia với chúng tôi?<br>
                                    Liên hệ chúng tối quá số 0123456789 để được tham gia
                                </div>
                                <div class="About__teammates teammates">
                                    <div class="owl-carousel">
                                        <div class="teammates__item teammate">
                                            <div class="teammate__avatar">
                                                <img src="images/teammates/teammate-1.jpg" alt="">
                                            </div>
                                            <div class="teammate__name">Nguyễn Doãn Hiện</div>
                                            <div class="teammate__position text-muted">CEO</div>
                                        </div>
                                        <div class="teammates__item teammate">
                                            <div class="teammate__avatar">
                                                <img src="images/teammates/teammate-2.jpg" alt="">
                                            </div>
                                            <div class="teammate__name">Phan Anh Trúc</div>
                                            <div class="teammate__position text-muted">Marketing Officer</div>
                                        </div>
                                        <div class="teammates__item teammate">
                                            <div class="teammate__avatar">
                                                <img src="images/teammates/teammate-3.jpg" alt="">
                                            </div>
                                            <div class="teammate__name">???</div>
                                            <div class="teammate__position text-muted">???</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="site__body">
        <div class="page-header">
            <div class="page-header__container container">
                <div class="page-header__title">
                    <h1 style="text-align: center">Thông tin liên hệ</h1>
                </div>
            </div>
        </div>
        <div class="block">
            <div class="container">
                <div class="card mb-0 contact-us">
                    <div class="contact-us__map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.6696584241945!2d106.68006425077196!3d10.759922362401806!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f1b7c3ed289%3A0xa06651894598e488!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBTw6BpIEfDsm4!5e0!3m2!1svi!2s!4v1574825302750!5m2!1svi!2s" width="600" height="450" frameborder="0" style="border: 0;" allowfullscreen=""></iframe>
                    </div>
                    <div class="card-body">
                        <div class="contact-us__container">
                            <div class="row">
                                <div class="col-12 col-lg-6 pb-4 pb-lg-0">
                                    <h4 class="contact-us__header card-title">Địa chỉ</h4>
                                    <div class="contact-us__address">
                                        <p>
                                            273 An Dương Vương, Phường 3, Quận 5, Hồ Chí Minh<br>
                                            Email: toilati123vn@gmail.com<br>
                                            Phone Number: 0123456789
                                        </p>
                                        <p>
                                            <strong>Giờ hoạt động</strong><br>
                                            24/7
                                        </p>
                                        <p>
                                            <strong>Ghi chú</strong><br>
                                            Là trang web bán hàng C2C tốt nhât hiện nay, với sản phẩm là giày sneaker từ nhiều thương hiệu nối tiếng như Adidas, Nike...
                                        </p>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <h4 class="contact-us__header card-title">Để lại lời nhắn</h4>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="form-name" >Tên bạn</label>
                                            <input type="text" id="inpTen" runat="server" class="form-control" placeholder="Tên bạn">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="form-email" >Email</label>
                                            <input type="email" id="inpMail" runat="server" class="form-control" placeholder="Địa chỉ email">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="form-subject" >Chủ đề</label>
                                        <input type="text" id="inpChuDe" runat="server" class="form-control" placeholder="Chủ đề">
                                    </div>
                                    <div class="form-group">
                                        <label for="form-message">Nội dung</label>
                                        <textarea class="form-control" id="inpNoiDung" runat="server" rows="4"></textarea>
                                    </div>
                                    <asp:Button runat="server" ID="btnGui" OnClick="btnGui_OnClick" Text="Gửi" CssClass="btn btn-primary" />

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- site__body / end -->
</asp:Content>
