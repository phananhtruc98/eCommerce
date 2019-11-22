<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcSearch.ascx.cs" Inherits="ShoesStore.UserControls.UcSearch" %>
<div class="input-group mb-3">
    <input runat="server" id="txtSearch" type="text" class="form-control" placeholder="Nhập tên sản phẩm" aria-label="Recipient's username" aria-describedby="basic-addon2">
    <div class="input-group-append">
        <button runat="server" id="btnSearch" class="btn btn-outline-secondary" type="button" onserverclick="btnSearch_ServerClick">Tìm</button>
    </div>
</div>