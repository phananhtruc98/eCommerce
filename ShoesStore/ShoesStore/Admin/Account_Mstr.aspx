<%@ Page Language="C#" Title="Quản lý người mua" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Account_Mstr.aspx.cs" Inherits="ShoesStore.Admin.Account_Mstr" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Thông tin cá nhân</h2>
    <div class="row">
        <div class="col-12">
            <table id="ttcn" class="table table-striped table-responsive-sm table-responsive-xl table-by-truc">
                <tr>
                    <td>Ảnh đại diện</td>
                    <td class="form-group">
                        <img src="images/default.jpg" />
                        <asp:FileUpload runat="server" ID="upava" />
                    </td>

                </tr>
                <tr>
                    <td>Họ và tên</td>
                    <td class="form-group">
                        <asp:TextBox runat="server" CssClass="form-control txt-by-truc"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Số điện thoại</td>
                    <td class="form-group">
                        <asp:TextBox runat="server" CssClass="form-control txt-by-truc"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Địa chỉ</td>
                    <td class="form-group">
                        <asp:TextBox runat="server" CssClass="form-control txt-by-truc"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td class="form-group">
                        <asp:TextBox runat="server" CssClass="form-control txt-by-truc"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="my-info__save"  >
                        <asp:LinkButton runat="server" ID="LinkButton1" Text="Lưu" CssClass="txt-by-truc center"></asp:LinkButton>
                        <asp:LinkButton runat="server" ID="LinkButton2" Text="Hủy" CssClass="txt-by-truc center"></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    
    <br />
    <h2>Thay đổi mật khẩu</h2>
    <div class="row">
        <div class="col-12">
            <table id="ttmk" class="table table-striped table-responsive-sm table-responsive-xl table-by-truc my-info">
                <tr>
                    <td>Tên tài khoản</td>
                    <td class="form-group">
                        <asp:TextBox runat="server" CssClass="form-control txt-by-truc"></asp:TextBox>
                    </td>

                </tr>
                <tr>
                    <td>Mật khẩu hiện tại</td>
                    <td class="form-group">
                        <asp:TextBox runat="server" TextMode="Password" CssClass="form-control txt-by-truc"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Mật khẩu mới</td>
                    <td class="form-group">
                        <asp:TextBox runat="server" TextMode="Password" CssClass="form-control txt-by-truc"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Xác nhận mật khẩu mới</td>
                    <td class="form-group">
                        <asp:TextBox runat="server" TextMode="Password" CssClass="form-control txt-by-truc"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="my-info__save"  >
                        <asp:LinkButton runat="server" ID="lbtnSave" Text="Lưu" CssClass="txt-by-truc center"></asp:LinkButton>
                        <asp:LinkButton runat="server" ID="lbtnCancel" Text="Hủy" CssClass="txt-by-truc center"></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
