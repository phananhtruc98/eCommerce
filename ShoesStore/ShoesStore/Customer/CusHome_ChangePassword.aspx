<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SiteCus.Master" CodeBehind="CusHome_ChangePassword.aspx.cs" Inherits="ShoesStore.Customer.CusHome_ChangePassword" %>

<%@ MasterType VirtualPath="~/SiteCus.Master" %>
<asp:Content ID="BodyContent2" ContentPlaceHolderID="MainContent2" runat="server">
    <h2>Thay đổi mật khẩu</h2>
    <div class="row">
        <div class="col-12">
            <table id="ttmk" class="table table-responsive-sm table-responsive-xl table-by-truc">
                <tr>
                    <td>Tên đăng nhập</td>
                    <td class="form-group">
                        <asp:TextBox runat="server" CssClass="form-control-lg txt-by-truc" ID="txtLogin" Visible="false"></asp:TextBox>
                        <asp:Label runat="server" CssClass="form-control-lg txt-by-truc" ID="lblLogin"></asp:Label></td>
                </tr>
                <tr>
                    <td>Mật khẩu hiện tại</td>
                    <td class="form-group">
                        <asp:TextBox runat="server" CssClass="form-control-lg txt-by-truc" ID="txtPassword" Visible="false"></asp:TextBox>
                        <asp:Label runat="server" CssClass="form-control-lg txt-by-truc" ID="lblPassword"></asp:Label></td>
                </tr>
                <tr>
                    <td>Mật khẩu mới</td>
                    <td class="form-group">
                        <asp:TextBox runat="server" CssClass="form-control-lg txt-by-truc" ID="txtNewPassword" Visible="false"></asp:TextBox>
                        <asp:Label runat="server" CssClass="form-control-lg txt-by-truc" ID="lblNewPassword" ></asp:Label></td>
                </tr>
                <tr>
                    <td>Nhập lại mật khẩu</td>
                    <td class="form-group">
                        <asp:TextBox runat="server" CssClass="form-control-lg txt-by-truc" ID="txtRePassword" Visible="false"></asp:TextBox>
                        <asp:Label runat="server" CssClass="form-control-lg txt-by-truc" ID="lblRePassword" ></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="2" class="my-info__save">
                        <asp:LinkButton runat="server" ID="lblThaydoi" Text="Thay đổi thông tin" CssClass="txt-by-truc center" OnClick="lblThaydoi_Click"></asp:LinkButton>
                        <asp:LinkButton runat="server" ID="lbtnLuu" Text="Lưu" CssClass="txt-by-truc center" OnClick="lbtnLuu_Click" Visible="false"></asp:LinkButton>
                        <asp:LinkButton runat="server" ID="lbtnHuy" Text="Hủy" CssClass="txt-by-truc center margin__left" OnClick="lbtnHuy_Click" Visible="false"></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
    </div>

</asp:Content>
