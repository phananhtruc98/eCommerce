<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SiteCus.Master" CodeBehind="~/Customer/CusHome.aspx.cs" Inherits="ShoesStore.Customer.CusHome" %>

<asp:Content ID="BodyContent2" ContentPlaceHolderID="MainContent2" runat="server">
    <div class="row">
        <div class="col-12">
            <asp:Image runat="server" ID="upava" />
                        <asp:FileUpload runat="server" ID="fupava" CssClass="file-upload" />
            <table id="ttcn" class="table table-responsive-sm table-responsive-xl table-by-truc">
                <tr>
                    <td>Họ và tên</td>
                    <td class="form-group">
                        <asp:TextBox runat="server" CssClass="form-control txt-by-truc" ID="txtUsrName" Visible="false" Text="Phan Anh Trúc"></asp:TextBox>
                        <asp:Label runat="server" CssClass="form-control txt-by-truc" ID="lblUsrName"></asp:Label></td>
                </tr>
                <tr>
                    <td>Số điện thoại</td>
                    <td class="form-group">
                        <asp:TextBox runat="server" CssClass="form-control txt-by-truc" ID="txtPhone"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Địa chỉ</td>
                    <td class="form-group">
                        <asp:TextBox runat="server" CssClass="form-control txt-by-truc" ID="txtAddress"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td class="form-group">
                        <asp:TextBox runat="server" CssClass="form-control txt-by-truc" ID="txtEmail"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="my-info__save"  >
                        <asp:LinkButton runat="server" ID="lbtnLuu" Text="Lưu" CssClass="txt-by-truc center" OnClick="lbtnLuu_Click"></asp:LinkButton>
                        <asp:LinkButton runat="server" ID="lbtnHuy" Text="Hủy" CssClass="txt-by-truc center" OnClick="lbtnHuy_Click"></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
    </div>

</asp:Content>


