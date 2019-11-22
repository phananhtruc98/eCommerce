<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="Usr_Det.aspx.cs" Inherits="ShoesStore.Admin.Usr_Det" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="btn btn-lg custom_bar">Thông tin người dùng</div>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div>
                            <table class="table table-bordered">
                                <tr>
                                    <td>Ảnh đại diện</td>
                                    <td>
                                        <asp:Image CssClass="rounded" runat="server" Style="height: 300px; width: 300px;" ID="avatar"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Mã người dùng </td>
                                    <td>
                                        <asp:Label runat="server" ID="lbUsrId"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Loại người dùng</td>
                                    <td>
                                        <asp:Label runat="server" ID="lbUsrType"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Tên người dùng</td>
                                    <td>
                                        <asp:Label runat="server" ID="lbUsrName"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Địa chỉ</td>
                                    <td>
                                        <asp:Label runat="server" ID="lbAddress"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Số điện thoại</td>
                                    <td>
                                        <asp:Label runat="server" ID="lbPhone"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td>
                                        <asp:Label runat="server" ID="lbEmail"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ngày thêm</td>
                                    <td>
                                        <asp:Label runat="server" ID="lbDateAdd"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ngày sửa</td>
                                    <td>
                                        <asp:Label runat="server" ID="lbDateEdit"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>