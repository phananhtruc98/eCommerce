﻿<%@ Page Language="C#" Title="Trang Cá Nhân" MasterPageFile="~/Merchant/SiteMerchant.Master" AutoEventWireup="true" CodeBehind="MerProfile.aspx.cs" Inherits="ShoesStore.Merchant.MerProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <!-- site__body -->
    <div class="row">
        <div class="col-12">
            <h3>Hồ sơ của tôi</h3>
            <div class="float-left">Ảnh đại diện</div>
            <div class="float-left">
                <asp:Image runat="server" ID="avaimg" class="rounded-circle"/>
            </div>
            <table id="ttcn" class="table table-responsive-sm table-responsive-xl table-by-truc">
                <tr>
                    <td>Họ và tên</td>
                    <td class="form-group">
                        <asp:TextBox runat="server" CssClass="form-control-lg txt-by-truc" ID="txtUsrName" Visible="false"></asp:TextBox>
                        <asp:Label runat="server" CssClass="form-control-lg txt-by-truc" ID="lblUsrName"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Số điện thoại</td>
                    <td class="form-group">
                        <asp:TextBox runat="server" CssClass="form-control-lg txt-by-truc" ID="txtPhone" Visible="false"></asp:TextBox>
                        <asp:Label runat="server" CssClass="form-control-lg txt-by-truc" ID="lblPhone"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Địa chỉ</td>
                    <td class="form-group">
                        <asp:TextBox runat="server" CssClass="form-control-lg txt-by-truc" ID="txtAddress" Visible="false"></asp:TextBox>
                        <asp:Label runat="server" CssClass="form-control-lg txt-by-truc" ID="lblAddress"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td class="form-group">
                        <asp:TextBox runat="server" CssClass="form-control-lg txt-by-truc" ID="txtEmail" Visible="false"></asp:TextBox>
                        <asp:Label runat="server" CssClass="form-control-lg txt-by-truc" ID="lblEmail"></asp:Label>
                    </td>
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
    <!-- site__body / end -->
</asp:Content>