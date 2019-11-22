<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Merchant/SiteMerchant.Master" CodeBehind="MerAddShop.aspx.cs" Inherits="ShoesStore.Merchant.MerAddShop" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>--%>
<%--<%@ Register TagPrefix="cdt" Assembly="ShoesStore.ColorPickerExtender" Namespace="ShoesStore" %>--%>


<asp:Content ID="Content1" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <asp:PlaceHolder runat="server" ID="phdPage">
        <div class="container">
            <div class="row">
                <div class="card-body">
                    <h5 class="card-title text-center">Tạo Trang Bán Hàng</h5>
                    <div class="form-signin">


                        <hr/>
                        <div>
                            <label>Hãy chọn tên của cửa hàng : </label>
                            <asp:TextBox runat="server" ID="inputShpName" class="form-control col-12"/>
                            <asp:RequiredFieldValidator ID="rfvEditNameAdd" runat="server" ErrorMessage="Chưa nhập tên cửa hàng" ControlToValidate="inputShpName" Text="*" ForeColor="Red" ValidationGroup="Insert">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <label for="inputDesc">Mô tả chi tiết :</label>
                            <asp:TextBox runat="server" ID="inputDesc" class="form-control col-12"/>

                        </div>
                        <div>
                            <label for="inputAddr">Địa chỉ cửa hàng : </label>
                            <asp:TextBox runat="server" ID="inputAddr" class="form-control col-12"/>
                            <asp:RequiredFieldValidator ID="rfvEditAddrAdd" runat="server" ErrorMessage="Chưa nhập địa chỉ cửa hàng" ControlToValidate="inputAddr" Text="*" ForeColor="Red" ValidationGroup="Insert">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <label for="inputNum">Số điện thoại liên hệ :</label>
                            <asp:TextBox runat="server" ID="inputNum" class="form-control col-12"/>
                            <asp:RequiredFieldValidator ID="rfvEditNumAdd" runat="server" ErrorMessage="Chưa nhập số điện thoại để liên hệ cửa hàng" ControlToValidate="inputNum" Text="*" ForeColor="Red" ValidationGroup="Insert">
                            </asp:RequiredFieldValidator>
                        </div>

                        <hr/>
                        <asp:LinkButton ID="lbSubmit" ValidationGroup="Insert" OnClick="btnSubmit_OnClick" CommandName="Submit" ForeColor="#8C4510" runat="server" class="btn btn-lg btn-primary btn-block text-uppercase">Tạo Cửa Hàng Ngay</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </asp:PlaceHolder>
</asp:Content>