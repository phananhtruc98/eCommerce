<%@ Page Language="C#" Title="Trang Shop Cá Nhân" MasterPageFile="~/Merchant/SiteMerchant.Master" AutoEventWireup="true" CodeBehind="MerAddProd.aspx.cs" Inherits="ShoesStore.Merchant.MerAddProd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <div style="margin-top: -30px;" class="container1">
        <div class="row">
            <div class="col-lg-50    col-xl-50 mx-auto">
                <div class="card card-signin flex-row my-5">
                    <div class="card-img-left d-none d-md-flex">
                        <!-- Background image for card set in CSS! -->
                    </div>
                    <div class="card-body">
                        <h5 class="card-title text-center">Thêm Sản Phẩm</h5>
                        <form class="form-signin">
                            <div class="dropdown">
                                <label for="inputCatId">Mã Loại Sản Phẩm</label>
                                <button style="float: right" class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
                                    x
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="#">HTML</a>
                                    </li>
                                    <li>
                                        <a href="#">CSS</a>
                                    </li>
                                    <li>
                                        <a href="#">JavaScript</a>
                                    </li>
                                </ul>
                            </div>
                            <hr/>
                            <div class="dropdown">
                                <label for="inputBrandId">Mã Thương Hiệu</label>
                                <button style="float: right" class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
                                    x
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="#">HTML</a>
                                    </li>
                                    <li>
                                        <a href="#">CSS</a>
                                    </li>
                                    <li>
                                        <a href="#">JavaScript</a>
                                    </li>
                                </ul>
                            </div>
                            <hr/>
                            <div class="form-label-group1">
                                <label for="intputProQuantity">Số Lượng Sản Phẩm</label>
                                <input type="text" id="intputProQuantity" class="form-control" placeholder="ProQuantity" required/>
                            </div>
                            <hr/>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="optradio">Còn Hàng
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="optradio">Hết Hàng
                                </label>
                            </div>
                            <hr/>
                            <div class="form-label-group1">
                                <label for="inputProName">Tên Sản Phẩm</label>
                                <input type="text" id="inputProName" class="form-control" placeholder="ProName" required/>
                            </div>
                            <hr/>
                            <div class="form-label-group1">
                                <label for="imageUpload">Upload Hình</label>
                                <input type="file" id="imageUpload" accept=".png, .jpg, .jpeg"/>
                            </div>
                            <hr/>
                            <div class="form-label-group1">
                                <label for="inputDesc">Mô Tả</label>
                                <input type="text" id="inputDesc" class="form-control" placeholder="Desc" required>
                            </div>
                            <hr/>
                            <div class="form-label-group1">
                                <label for="inputDescShort">Summary</label>
                                <input type="text" id="inputDescShort" class="form-control" placeholder="DescShort" required>
                            </div>
                            <hr/>
                            <div class="form-label-group1">
                                <label for="inputPrice">Giá Tiền</label>
                                <input type="text" id="inputPrice" class="form-control" placeholder="Price" required>
                            </div>
                            <hr/>
                            <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Gửi</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>