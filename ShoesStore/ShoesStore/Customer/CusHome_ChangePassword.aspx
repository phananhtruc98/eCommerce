<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SiteCus.Master" CodeBehind="CusHome_ChangePassword.aspx.cs" Inherits="ShoesStore.Customer.CusHome_ChangePassword" %>

<%@ MasterType VirtualPath="~/SiteCus.Master" %>
<asp:Content ID="BodyContent2" ContentPlaceHolderID="MainContent2" runat="server">
    <h2>Thay đổi mật khẩu</h2>
    <div class="row">
        <div class="col-12">
            <table id="ttmk" class="table table-striped table-responsive-sm table-responsive-xl table-by-truc my-info">
                <tr>
                    <td>Tên tài khoản</td>
                    <td class="form-group">
                        <asp:TextBox runat="server" CssClass="form-control txt-by-truc" ID="txtLogin"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Mật khẩu hiện tại</td>
                    <td class="form-group">
                        <asp:TextBox runat="server" TextMode="Password" CssClass="form-control txt-by-truc" ID="txtPasswordOld"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Mật khẩu mới</td>
                    <td class="form-group">
                        <asp:TextBox runat="server" TextMode="Password" CssClass="form-control txt-by-truc" ID="txtPassword"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Xác nhận mật khẩu mới</td>
                    <td class="form-group">
                        <asp:TextBox runat="server" TextMode="Password" CssClass="form-control txt-by-truc" ID="txtRePassword"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="my-info__save">
                        <asp:LinkButton runat="server" ID="lbtnSave" Text="Lưu" CssClass="txt-by-truc center" OnClick="lbtnSave_Click"></asp:LinkButton>
                        <asp:LinkButton runat="server" ID="lbtnCancel" Text="Hủy" CssClass="txt-by-truc center" OnClick="lbtnCancel_Click"></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
    </div>

</asp:Content>
