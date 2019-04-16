<%@ Page Language="C#" Title="About Us" MasterPageFile="~/Merchant/Merchant.Master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="ShoesStore.Merchant.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

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
            <!-- site__body / end -->
            
</asp:Content>
