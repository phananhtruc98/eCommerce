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
                            <h1 class="About__title">About Us</h1>
                            <div class="About__text typography">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras lacus metus, convallis ut leo nec, tincidunt eleifend justo. Ut felis orci, hendrerit a pulvinar et, gravida ac lorem. Sed vitae molestie sapien, at sollicitudin tortor.</p>
                                <p>Duis id volutpat libero, id vestibulum purus.Donec euismod accumsan felis,egestas lobortis velit tempor vitae. Integer eget velit fermentum, dignissim odio non, bibendum velit.</p>
                            </div>
                            <div class="About__team">
                                <h2 class="About__team-title">Meat Our Team</h2>
                                <div class="About__team-subtitle text-muted">
                                    Want to work in our friendly team?<br>
                                    <a href="Contact.aspx">Contact us</a> and we will consider your candidacy.
                                </div>
                                <div class="About__teammates teammates">
                                    <div class="owl-carousel">
                                        <div class="teammates__item teammate">
                                            <div class="teammate__avatar">
                                                <img src="images/teammates/teammate-1.jpg" alt="">
                                            </div>
                                            <div class="teammate__name">Michael Russo</div>
                                            <div class="teammate__position text-muted">Chief Executive Officer</div>
                                        </div>
                                        <div class="teammates__item teammate">
                                            <div class="teammate__avatar">
                                                <img src="images/teammates/teammate-2.jpg" alt="">
                                            </div>
                                            <div class="teammate__name">Katherine Miller</div>
                                            <div class="teammate__position text-muted">Marketing Officer</div>
                                        </div>
                                        <div class="teammates__item teammate">
                                            <div class="teammate__avatar">
                                                <img src="images/teammates/teammate-3.jpg" alt="">
                                            </div>
                                            <div class="teammate__name">Anthony Harris</div>
                                            <div class="teammate__position text-muted">Finance Director</div>
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
                        <iframe src="https://maps.google.com/maps?q=Holbrook-Palmer%20Park&amp;t=&amp;z=13&amp;ie=UTF8&amp;iwloc=&amp;output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                    </div>
                    <div class="card-body">
                        <div class="contact-us__container">
                            <div class="row">
                                <div class="col-12 col-lg-6 pb-4 pb-lg-0">
                                    <h4 class="contact-us__header card-title">Our Address</h4>
                                    <div class="contact-us__address">
                                        <p>
                                            715 Fake Ave, Apt. 34, New York, NY 10021 USA<br>
                                            Email: stroyka@example.com<br>
                                            Phone Number: +1 754 000-00-00
                                        </p>
                                        <p>
                                            <strong>Opening Hours</strong><br>
                                            Monday to Friday: 8am-8pm<br>
                                            Saturday: 8am-6pm<br>
                                            Sunday: 10am-4pm
                                        </p>
                                        <p>
                                            <strong>Comment</strong><br>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur suscipit suscipit mi, non tempor nulla finibus eget. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                        </p>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <h4 class="contact-us__header card-title">Leave us a Message</h4>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="form-name">Your Name</label>
                                            <input type="text" id="form-name" class="form-control" placeholder="Your Name">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="form-email">Email</label>
                                            <input type="email" id="form-email" class="form-control" placeholder="Email Address">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="form-subject">Subject</label>
                                        <input type="text" id="form-subject" class="form-control" placeholder="Subject">
                                    </div>
                                    <div class="form-group">
                                        <label for="form-message">Message</label>
                                        <textarea id="form-message" class="form-control" rows="4"></textarea>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Send Message</button>
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