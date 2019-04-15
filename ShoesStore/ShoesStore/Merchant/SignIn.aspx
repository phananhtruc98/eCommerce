<%@ Page Language="C#" Title="Đăng Nhập" MasterPageFile="~/Merchant/Merchant.Master" AutoEventWireup="true" CodeFile="SignIn.aspx.cs" Inherits="ShoesStore.Merchant.SignIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- site__body -->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
    <div class="container">
        <br>
        <p class="text-center">More bootstrap 4 components on <a href="http://webublogoverflow.com/">webublogoverflow.com</a></p>
        <hr>
        <div class="row">
            <aside class="col-sm-4">
                <p>with us</p>
                <div class="card">
                    <article class="card-body">
                        <a href="" class="float-right btn btn-outline-primary">Sign up</a>
                        <h4 class="card-title mb-4 mt-1">Choose us</h4>
                        <form>
                            <div class="form-group">
                                <label>Your email</label>
                                <input name="" class="form-control" placeholder="Email" type="email">
                            </div>
                            <!-- form-group// -->
                            <div class="form-group">
                                <a class="float-right" href="#">Forgot?</a>
                                <label>Your password</label>
                                <input class="form-control" placeholder="******" type="password">
                            </div>
                            <!-- form-group// -->
                            <div class="form-group">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox">
                                        Save password
                                    </label>
                                </div>
                                <!-- checkbox .// -->
                            </div>
                            <!-- form-group// -->
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-block">Login  </button>
                            </div>
                            <!-- form-group// -->
                        </form>
                    </article>
                </div>
                <!-- card.// -->
            </aside>
            <!-- col.// -->
            <aside class="col-sm-4">
                <p>Inter in</p>
                <div class="card">
                    <article class="card-body">
                        <a href="" class="float-right btn btn-outline-primary">Sign up</a>
                        <h4 class="card-title mb-4 mt-1">Sign in</h4>
                        <p>
                            <a href="" class="btn btn-block btn-outline-info"><i class="fab fa-twitter"></i>Login via Twitter</a>
                            <a href="" class="btn btn-block btn-outline-primary"><i class="fab fa-facebook-f"></i>Login via facebook</a>
                        </p>
                        <hr>
                        <form>
                            <div class="form-group">
                                <input name="" class="form-control" placeholder="Email or login" type="email">
                            </div>
                            <!-- form-group// -->
                            <div class="form-group">
                                <input class="form-control" placeholder="******" type="password">
                            </div>
                            <!-- form-group// -->
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary btn-block">Login  </button>
                                    </div>
                                    <!-- form-group// -->
                                </div>
                                <div class="col-md-6 text-right">
                                    <a class="small" href="#">Forgot password?</a>
                                </div>
                            </div>
                            <!-- .row// -->
                        </form>
                    </article>
                </div>
                <!-- card.// -->
            </aside>
            <!-- col.// -->
            <aside class="col-sm-4">
                <p>Our map</p>
                <div class="card">
                    <article class="card-body">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d15916.085640414378!2d33.185751550000006!3d-4.2160796!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2stz!4v1538627227928" width="320" height="330" frameborder="0" style="border: 0" allowfullscreen></iframe>
                    </article>
                </div>
                <!-- card.// -->
            </aside>
            <!-- col.// -->
        </div>
        <!-- row.// -->
    </div>
    <!--container end.//-->
    <br>
    <br>
    <br>


    <!-- site__body / end -->
</asp:Content>
