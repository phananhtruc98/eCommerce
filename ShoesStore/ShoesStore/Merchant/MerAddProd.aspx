<%@ Page Language="C#" Title="Trang Shop Cá Nhân" MasterPageFile="~/Merchant/SiteMerchant.Master" AutoEventWireup="true" CodeBehind="MerAddProd.aspx.cs" Inherits="ShoesStore.Merchant.MerAddProd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <asp:Panel ID="pnlThem" runat="server" DefaultButton="lbSubmit" Width="100%">
        <div style="margin-top: -30px;" class="container1">
            <div class="row">
                <div class="col-lg-10 col-12 col-xl-50 mx-auto">
                    <div class="card card-signin flex-row my-5">
                        <div class="card-img-left d-none d-md-flex">
                            <!-- Background image for card set in CSS! -->
                        </div>
                        <div class="card-body">
                            <h5 class="card-title text-center">Thêm Sản Phẩm</h5>
                            <div class="form-signin">

                                <!--Button-->
                                <div>
                                    <label for="inputCatId">Mã Loại Sản Phẩm</label>
                                    <div style="float: right">
                                        <asp:DropDownList ID="DropDownListCat" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <!--Button/END-->


                                <hr />

                                <!--Button-->
                                <div>
                                    <label for="inputCatId">Thương Hiệu</label>
                                    <div style="float: right">
                                        <asp:DropDownList ID="DropDownListBrand" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <!--Button/END-->


                                <hr />
                                <div>
                                    <label for="intputProQuantity">Số Lượng Sản Phẩm</label>
                                    
                                        <asp:TextBox runat="server" Text=' <%# Bind("Pro.ProQuantity") %>' ID="intputProQuantity" class="form-control" placeholder="Số Lượng" />
                                        <asp:RequiredFieldValidator ID="rfvEditQtityAdd" runat="server" ErrorMessage="Chưa nhập số lượng" ControlToValidate="intputProQuantity" Text="*" ForeColor="Red" ValidationGroup="Insert">
                                        </asp:RequiredFieldValidator>
                                 

                                </div>
                                <hr />

                                <div  >
                                    <label for="inputProName">Tên Sản Phẩm</label>

                                    <asp:TextBox runat="server" Text=' <%# Bind("Pro.ProName") %>' type="text" ID="inputProName" class="form-control" placeholder="Tên " />
                                    <asp:RequiredFieldValidator ID="rfvEditNameAdd" runat="server" ErrorMessage="Chưa nhập tên sản phẩm" ControlToValidate="inputProName" Text="*" ForeColor="Red" ValidationGroup="Insert">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <hr />
                                <div  >
                                    <label for="imageUpload">Upload Hình</label>
                                    <input type="file" id="imageUpload" accept=".png, .jpg, .jpeg" />
                                </div>
                                <hr />
                                <div  >
                                    <label for="inputDesc">Mô Tả</label>
                                    <asp:TextBox runat="server" Text=' <%# Bind("Pro.Desc") %>' ID="inputDesc" class="form-control" placeholder="Mô Tả" />
                                    <asp:RequiredFieldValidator ID="rfvEditDescAdd" runat="server" ErrorMessage="Chưa nhập mô tả sản phẩm" ControlToValidate="inputDesc" Text="*" ForeColor="Red" ValidationGroup="Insert">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <hr />
                                <div  >
                                    <label for="inputDescShort">Summary</label>

                                    <asp:TextBox runat="server" Text=' <%# Bind("Pro.DescShort") %>' ID="inputDescShort" class="form-control" placeholder="Tóm Tắt" />
                                    <asp:RequiredFieldValidator ID="rfvEditDescShortAdd" runat="server" ErrorMessage="Chưa nhập tóm tắt" ControlToValidate="inputDescShort" Text="*" ForeColor="Red" ValidationGroup="Insert">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <hr />
                                <div  >
                                    <label for="inputPrice">Giá Tiền</label>
                                    <asp:TextBox runat="server" Text=' <%# Bind("Pro.Price") %>' ID="inputPrice" class="form-control" placeholder="Giá Tiền" />
                                    <asp:RequiredFieldValidator ID="rfvEditPricetAdd" runat="server" ErrorMessage="Chưa nhập tóm tắt" ControlToValidate="inputPrice" Text="*" ForeColor="Red" ValidationGroup="Insert">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <hr />

                                <asp:LinkButton ID="lbSubmit" ValidationGroup="Insert" OnClick="btnSubmit_OnClick" CommandName="Submit" ForeColor="#8C4510" runat="server" class="btn btn-lg btn-primary btn-block text-uppercase">Gửi</asp:LinkButton>
        </div>
        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
