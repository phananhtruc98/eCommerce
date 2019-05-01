﻿<%@ Page Language="C#" Title="Quản lý sản phẩm" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageProduct.aspx.cs" Inherits="ShoesStore.Admin.ManageProduct" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<%@ MasterType VirtualPath="~/Admin/Admin.Master" %>
    <%@ Import Namespace="ShoesStore" %>
<div class="btn btn-lg custom_bar">Thông tin sản phẩm</div>
<div class="container">
<div class="row">
<div class="col-12 table-responsive">
Bảng sản phẩm
<asp:GridView ID="gvPro" ItemType="ShoesStore.DataAccessLogicLayer.Pro" class="custom_table" runat="server" AutoGeneratedColumns="false" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" AllowPaging="True" OnPageIndexChanging="gvPro_PageIndexChanging" PageSize="5">
<Columns>
    <%-- <asp:TemplateField>
<ItemTemplate>
<asp:LinkButton ID="lbEdit" CommandArgument='<%# Eval("ProId") %>' CommandName="EditRow" ForeColor="#8C4510" runat="server">Sửa</asp:LinkButton>
<asp:LinkButton ID="lbDelete" CommandArgument='<%# Eval("ProId") %>' CommandName="DeleteRow" ForeColor="#8C4510" runat="server" CausesValidation="false">Xóa</asp:LinkButton>
</ItemTemplate>
<EditItemTemplate>
<asp:LinkButton ID="lbUpdate" CommandArgument='<%# Eval("ProId") %>' CommandName="UpdateRow" ForeColor="#8C4510" runat="server">Cập nhật</asp:LinkButton>
<asp:LinkButton ID="lbCancel" CommandArgument='<%# Eval("ProId") %>' CommandName="CancelUpdate" ForeColor="#8C4510" runat="server" CausesValidation="false">Hủy</asp:LinkButton>
</EditItemTemplate>
<FooterTemplate>
<asp:LinkButton ID="lbInsert" ValidationGroup="Insert" runat="server" CommandName="InsertRow" ForeColor="#8C4510">Thêm</asp:LinkButton>
</FooterTemplate>
<HeaderStyle />
</asp:TemplateField>--%>
    <asp:TemplateField HeaderText="Mã sản phẩm">
        <ItemTemplate>
            <%# Item.ProId %>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Mã cửa hàng">
        <ItemTemplate>
            <%# Item.ShpId %>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox runat="server" ID="EditShpId" Text='<%# Bind("ShpId") %>'/>
        </EditItemTemplate>
        <%--<FooterTemplate>
            <asp:TextBox runat="server" ID="InsertShpId" Text=' <%# Bind("ShpId") %>'/>
            <asp:RequiredFieldValidator ID="rfvEditShpId" runat="server" ErrorMessage="Chưa nhập tên màu" ControlToValidate="InsertShpId" Text="*" ForeColor="Red" ValidationGroup="Insert">
            </asp:RequiredFieldValidator>
        </FooterTemplate>--%>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Tên cửa hàng">
        <ItemTemplate>
            <%# Item.Shp.ShpName %>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox runat="server" ID="EditShpName" Text='<%# Item.Shp.ShpName %>'/>
        </EditItemTemplate>
        <%--<FooterTemplate>
            <asp:TextBox runat="server" ID="InsertShpName" Text=' <%# Bind("ShpName") %>'/>
            <asp:RequiredFieldValidator ID="rfvEditShpName" runat="server" ErrorMessage="Chưa nhập tên màu" ControlToValidate="InsertShpName" Text="*" ForeColor="Red" ValidationGroup="Insert">
            </asp:RequiredFieldValidator>
        </FooterTemplate>--%>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Tên sản phẩm">
        <ItemTemplate>
            <%# Item.ProName %>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox runat="server" ID="EditProName" Text='<%# Item.ProName %>'/>
        </EditItemTemplate>
       <%-- <FooterTemplate>
            <asp:TextBox runat="server" ID="InsertProName" Text=' <%# Bind("ProName") %>'/>
            <asp:RequiredFieldValidator ID="rfvEditProName" runat="server" ErrorMessage="Chưa nhập tên màu" ControlToValidate="InsertProName" Text="*" ForeColor="Red" ValidationGroup="Insert">
            </asp:RequiredFieldValidator>
        </FooterTemplate>--%>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Tên loại sản phẩm">
        <ItemTemplate>
            <%# Item.ProCat.CatName %>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox runat="server" ID="EditCatName" Text='<%# Item.ProCat.CatName %>'/>
        </EditItemTemplate>
        <%--<FooterTemplate>
            <asp:TextBox runat="server" ID="InsertCatName" Text=' <%# Bind("CatName") %>'/>
            <asp:RequiredFieldValidator ID="rfvEditCatName" runat="server" ErrorMessage="Chưa nhập tên màu" ControlToValidate="InsertCatName" Text="*" ForeColor="Red" ValidationGroup="Insert">
            </asp:RequiredFieldValidator>
        </FooterTemplate>--%>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Tên thương hiệu">
        <ItemTemplate>
            <%# Item.ProBrand.BrandName %>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox runat="server" ID="EditBrandName" Text='<%# Item.ProBrand.BrandName %>'/>
        </EditItemTemplate>
        <%--<FooterTemplate>
            <asp:TextBox runat="server" ID="InsertBrandName" Text=' <%# Bind("BrandName") %>'/>
            <asp:RequiredFieldValidator ID="rfvEditBrandName" runat="server" ErrorMessage="Chưa nhập tên màu" ControlToValidate="InsertBrandName" Text="*" ForeColor="Red" ValidationGroup="Insert">
            </asp:RequiredFieldValidator>
        </FooterTemplate>--%>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Đơn giá">
        <ItemTemplate>
            <%# Item.Price %>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox runat="server" ID="EditPrice" Text='<%#  Item.Price %>'/>
        </EditItemTemplate>
        <%--<FooterTemplate>
            <asp:TextBox runat="server" ID="InsertPrice" Text=' <%# Bind("Price") %>'/>
            <asp:RequiredFieldValidator ID="rfvEditPrice" runat="server" ErrorMessage="Chưa nhập tên màu" ControlToValidate="InsertPrice" Text="*" ForeColor="Red" ValidationGroup="Insert">
            </asp:RequiredFieldValidator>
        </FooterTemplate>--%>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Giảm">
        <ItemTemplate>
            <%#  Item.Desc %>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox runat="server" ID="EditDesc" Text='<%# Item.Desc %>'/>
        </EditItemTemplate>
        <%--<FooterTemplate>
            <asp:TextBox runat="server" ID="InsertDesc" Text=' <%# Bind("Desc") %>'/>
            <asp:RequiredFieldValidator ID="rfvEditDesc" runat="server" ErrorMessage="Chưa nhập tên màu" ControlToValidate="InsertDesc" Text="*" ForeColor="Red" ValidationGroup="Insert">
            </asp:RequiredFieldValidator>
        </FooterTemplate>--%>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Đơn giá giảm">
        <ItemTemplate>
            <%# Item.PriceAfter %>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox runat="server" ID="EditPriceAfter" Text='<%# Item.PriceAfter %>'/>
        </EditItemTemplate>
        <%--<FooterTemplate>
            <asp:TextBox runat="server" ID="InsertPriceAfter" Text=' <%# Bind("PriceAfter") %>'/>
            <asp:RequiredFieldValidator ID="rfvEditPriceAfter" runat="server" ErrorMessage="Chưa nhập tên màu" ControlToValidate="InsertPriceAfter" Text="*" ForeColor="Red" ValidationGroup="Insert">
            </asp:RequiredFieldValidator>
        </FooterTemplate>--%>
    </asp:TemplateField>
  
    <asp:TemplateField HeaderText="Ngày thêm">
        <HeaderTemplate>Ngày thêm</HeaderTemplate>
        <ItemTemplate>
            <%# Item.DateAdd %>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox runat="server" ID="EditDateAdd" Text='<%# Item.DateAdd %>'/>
        </EditItemTemplate>
        <%--<FooterTemplate>
            <asp:TextBox runat="server" type="date" ID="InsertDateAdd" Text='<%# Bind("DateAdd") %>'/>
            <asp:RequiredFieldValidator ID="rfvEditDateAdd" runat="server" ErrorMessage="Chưa nhập địa chỉ" ControlToValidate="InsertDateAdd" Text="*" ForeColor="Red" ValidationGroup="Insert">
            </asp:RequiredFieldValidator>
        </FooterTemplate>--%>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Ngày sửa">
        <HeaderTemplate>Ngày sửa</HeaderTemplate>
        <ItemTemplate>
            <%# Item.DateEdit %>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox runat="server" ID="EditDateEdit" Text='<%# Item.DateEdit %>'/>
        </EditItemTemplate>
        <%--<FooterTemplate>
            <asp:TextBox runat="server" type="date" ID="InsertDateEdit" Text='<%# Bind("DateEdit") %>'/>
            <asp:RequiredFieldValidator ID="rfvEditDateEdit" runat="server" ErrorMessage="Chưa nhập số điện thoại" ControlToValidate="InsertDateEdit" Text="*" ForeColor="Red" ValidationGroup="Insert">
            </asp:RequiredFieldValidator>
        </FooterTemplate>--%>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Kích hoạt">
        <ItemTemplate>
            <asp:CheckBox Enabled="false" runat="server" Checked='<%# Item.Active %>'/>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:CheckBox runat="server" ID="EditActive" Checked='<%# Item.Active %>'/>
        </EditItemTemplate>
        <%--<FooterTemplate>
            <asp:CheckBox runat="server" ID="InsertActive" Text='<%# Bind("Active") %>'/>
        </FooterTemplate>--%>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Ảnh">
        <ItemTemplate>
            <img width="50" height="50" src="<%# MyLibrary.ProImgPath(Item) %>" />
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox runat="server" ID="EditImg" Text='<%# MyLibrary.ProImgPath(Item) %>'/>
        </EditItemTemplate>
        <%--<FooterTemplate>
            <asp:TextBox runat="server" ID="InsertImg" Text=' <%# Bind("Img") %>'/>
            <asp:RequiredFieldValidator ID="rfvEditImg" runat="server" ErrorMessage="Chưa nhập tên màu" ControlToValidate="InsertImg" Text="*" ForeColor="Red" ValidationGroup="Insert">
            </asp:RequiredFieldValidator>
        </FooterTemplate>--%>
    </asp:TemplateField>
</Columns>
<FooterStyle BackColor="#FFFFCC" ForeColor="#330099" Wrap="false"/>
<HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" Wrap="false"/>
<PagerSettings FirstPageText="Trang đầu" LastPageText="Trang cuối" Mode="NumericFirstLast" NextPageText="Trang kế" PageButtonCount="3" PreviousPageText="Trang trước"/>
<PagerStyle BackColor="#FFFFCC" ForeColor="Red" HorizontalAlign="Left" VerticalAlign="Middle" Wrap="False"/>
<RowStyle BackColor="White" ForeColor="#330099" Wrap="false"/>
<SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399"/>
<SortedAscendingCellStyle BackColor="#FEFCEB"/>
<SortedAscendingHeaderStyle BackColor="#AF0101"/>
<SortedDescendingCellStyle BackColor="#F6F0C0"/>
<SortedDescendingHeaderStyle BackColor="#7E0000"/>
</asp:GridView>
<asp:ValidationSummary ID="ValidationSummary4" ValidationGroup="Insert" ForeColor="Red" runat="server"/>
</div>
</div>
<div class="row">
    <div class="col-6 table-responsive">
        Bảng màu
        <asp:GridView ID="gvProColor" class="custom_table" runat="server" AutoGeneratedColumns="false" BorderWidth="1px" AutoGenerateColumns="False" Width="353px" BackColor="White" BorderColor="#CC9966" BorderStyle="None" CellPadding="4">
            <Columns>
                <%--<asp:TemplateField>
<ItemTemplate>
<asp:LinkButton ID="lbEdit" CommandArgument='<%# Eval("ColorId") %>' CommandName="EditRow" ForeColor="#8C4510" runat="server">Sửa</asp:LinkButton>
<asp:LinkButton ID="lbDelete" CommandArgument='<%# Eval("ColorId") %>' CommandName="DeleteRow" ForeColor="#8C4510" runat="server" CausesValidation="false">Xóa</asp:LinkButton>
</ItemTemplate>
<EditItemTemplate>
<asp:LinkButton ID="lbUpdate" CommandArgument='<%# Eval("ColorId") %>' CommandName="UpdateRow" ForeColor="#8C4510" runat="server">Cập nhật</asp:LinkButton>
<asp:LinkButton ID="lbCancel" CommandArgument='<%# Eval("ColorId") %>' CommandName="CancelUpdate" ForeColor="#8C4510" runat="server" CausesValidation="false">Hủy</asp:LinkButton>
</EditItemTemplate>
<FooterTemplate>
<asp:LinkButton ID="lbInsert" ValidationGroup="Insert" runat="server" CommandName="InsertRow" ForeColor="#8C4510">Thêm</asp:LinkButton>
</FooterTemplate>
<HeaderStyle Wrap="False" />
<ItemStyle Wrap="False" />
</asp:TemplateField>--%>
                <asp:TemplateField HeaderText="Mã màu">
                    <ItemTemplate>
                        <%# Eval("ColorId") %>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False"/>
                    <ItemStyle Wrap="False"/>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tên màu">
                    <ItemTemplate>
                        <%# Eval("ColorName") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="EditColorName" Text='<%# Bind("ColorName") %>'/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox runat="server" ID="InsertColorName" Text=' <%# Bind("ColorName") %>'/>
                        <asp:RequiredFieldValidator ID="rfvEditColorName" runat="server" ErrorMessage="Chưa nhập tên màu" ControlToValidate="InsertColorName" Text="*" ForeColor="Red" ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <FooterStyle Wrap="False"/>
                    <HeaderStyle Wrap="False"/>
                    <ItemStyle Wrap="False"/>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099"/>
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC"/>
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center"/>
            <RowStyle BackColor="White" ForeColor="#330099"/>
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399"/>
            <SortedAscendingCellStyle BackColor="#FEFCEB"/>
            <SortedAscendingHeaderStyle BackColor="#AF0101"/>
            <SortedDescendingCellStyle BackColor="#F6F0C0"/>
            <SortedDescendingHeaderStyle BackColor="#7E0000"/>
        </asp:GridView>
        <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="Insert" ForeColor="Red" runat="server"/>
    </div>
    <div class="col-6 table-responsive">
        Bảng thương hiệu
        <asp:GridView ID="gvBrand" class="custom_table" runat="server" AutoGeneratedColumns="false" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
            <Columns>
                <%--<asp:TemplateField>
<ItemTemplate>
<asp:LinkButton ID="lbEdit" CommandArgument='<%# Eval("BrandId") %>' CommandName="EditRow" ForeColor="#8C4510" runat="server">Sửa</asp:LinkButton>
<asp:LinkButton ID="lbDelete" CommandArgument='<%# Eval("BrandId") %>' CommandName="DeleteRow" ForeColor="#8C4510" runat="server" CausesValidation="false">Xóa</asp:LinkButton>
</ItemTemplate>
<EditItemTemplate>
<asp:LinkButton ID="lbUpdate" CommandArgument='<%# Eval("BrandId") %>' CommandName="UpdateRow" ForeColor="#8C4510" runat="server">Cập nhật</asp:LinkButton>
<asp:LinkButton ID="lbCancel" CommandArgument='<%# Eval("BrandId") %>' CommandName="CancelUpdate" ForeColor="#8C4510" runat="server" CausesValidation="false">Hủy</asp:LinkButton>
</EditItemTemplate>
<FooterTemplate>
<asp:LinkButton ID="lbInsert" ValidationGroup="Insert" runat="server" CommandName="InsertRow" ForeColor="#8C4510">Thêm</asp:LinkButton>
</FooterTemplate>
<HeaderStyle />
</asp:TemplateField>--%>
                <asp:TemplateField HeaderText="Mã thương hiệu">
                    <ItemTemplate>
                        <%# Eval("BrandId") %>
                    </ItemTemplate>
                    <HeaderStyle/>
                    <ItemStyle/>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tên thương hiệu">
                    <ItemTemplate>
                        <%# Eval("BrandName") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="EditColorName" Text='<%# Bind("BrandName") %>'/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox runat="server" ID="InsertBrandName" Text=' <%# Bind("BrandName") %>'/>
                        <asp:RequiredFieldValidator ID="rfvEditBrandName" runat="server" ErrorMessage="Chưa nhập tên màu" ControlToValidate="InsertBrandName" Text="*" ForeColor="Red" ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099"/>
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC"/>
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center"/>
            <RowStyle BackColor="White" ForeColor="#330099"/>
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399"/>
            <SortedAscendingCellStyle BackColor="#FEFCEB"/>
            <SortedAscendingHeaderStyle BackColor="#AF0101"/>
            <SortedDescendingCellStyle BackColor="#F6F0C0"/>
            <SortedDescendingHeaderStyle BackColor="#7E0000"/>
        </asp:GridView>
        <asp:ValidationSummary ID="ValidationBrand" ValidationGroup="Insert" ForeColor="Red" runat="server"/>
    </div>
</div>
<div class="row">
    <div class="col-12 table-responsive">
        Bảng kích cỡ giày
        <asp:GridView ID="gvProSize" class="custom_table" runat="server" AutoGeneratedColumns="false" BorderWidth="1px" AutoGenerateColumns="False" Width="353px" BackColor="White" BorderColor="#CC9966" BorderStyle="None" CellPadding="4">
            <Columns>
                <%--<asp:TemplateField>
<ItemTemplate>
<asp:LinkButton ID="lbEdit" CommandArgument='<%# Eval("SizeId") %>' CommandName="EditRow" ForeColor="#8C4510" runat="server">Sửa</asp:LinkButton>
<asp:LinkButton ID="lbDelete" CommandArgument='<%# Eval("SizeId") %>' CommandName="DeleteRow" ForeColor="#8C4510" runat="server" CausesValidation="false">Xóa</asp:LinkButton>
</ItemTemplate>
<EditItemTemplate>
<asp:LinkButton ID="lbUpdate" CommandArgument='<%# Eval("SizeId") %>' CommandName="UpdateRow" ForeColor="#8C4510" runat="server">Cập nhật</asp:LinkButton>
<asp:LinkButton ID="lbCancel" CommandArgument='<%# Eval("SizeId") %>' CommandName="CancelUpdate" ForeColor="#8C4510" runat="server" CausesValidation="false">Hủy</asp:LinkButton>
</EditItemTemplate>
<FooterTemplate>
<asp:LinkButton ID="lbInsert" ValidationGroup="Insert" runat="server" CommandName="InsertRow" ForeColor="#8C4510">Thêm</asp:LinkButton>
</FooterTemplate>
<HeaderStyle Wrap="False" />
<ItemStyle Wrap="False" />
</asp:TemplateField>--%>
                <asp:TemplateField HeaderText="Mã kích cỡ">
                    <ItemTemplate>
                        <%# Eval("SizeId") %>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False"/>
                    <ItemStyle Wrap="False"/>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tên màu">
                    <ItemTemplate>
                        <%# Eval("SizeName") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="EditSizeName" Text='<%# Bind("SizeName") %>'/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox runat="server" ID="InsertSizeName" Text=' <%# Bind("SizeName") %>'/>
                        <asp:RequiredFieldValidator ID="rfvEditSizeName" runat="server" ErrorMessage="Chưa nhập tên màu" ControlToValidate="InsertSizeName" Text="*" ForeColor="Red" ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <FooterStyle Wrap="False"/>
                    <HeaderStyle Wrap="False"/>
                    <ItemStyle Wrap="False"/>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ảnh">
                    <ItemTemplate>
                        <%# Eval("SizeImg") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="EditSizeImg" Text='<%# Bind("SizeImg") %>'/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox runat="server" ID="InsertSizeImg" Text=' <%# Bind("SizeImg") %>'/>
                        <asp:RequiredFieldValidator ID="rfvEditSizeImg" runat="server" ErrorMessage="Chưa nhập tên màu" ControlToValidate="InsertSizeImg" Text="*" ForeColor="Red" ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" Wrap="false"/>
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" Wrap="false"/>
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center"/>
            <RowStyle BackColor="White" ForeColor="#330099" Wrap="false"/>
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399"/>
            <SortedAscendingCellStyle BackColor="#FEFCEB"/>
            <SortedAscendingHeaderStyle BackColor="#AF0101"/>
            <SortedDescendingCellStyle BackColor="#F6F0C0"/>
            <SortedDescendingHeaderStyle BackColor="#7E0000"/>
        </asp:GridView>
        <asp:ValidationSummary ID="ValidationSummary2" ValidationGroup="Insert" ForeColor="Red" runat="server"/>
    </div>
</div>
<div class="row">
    <div class="col-12 table-responsive">
        Bảng loại sản phẩm
        <asp:GridView ID="gvProCat" class="custom_table" runat="server" AutoGeneratedColumns="false" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
            <Columns>
                <%--<asp:TemplateField>
<ItemTemplate>
<asp:LinkButton ID="lbEdit" CommandArgument='<%# Eval("CatId") %>' CommandName="EditRow" ForeColor="#8C4510" runat="server">Sửa</asp:LinkButton>
<asp:LinkButton ID="lbDelete" CommandArgument='<%# Eval("CatId") %>' CommandName="DeleteRow" ForeColor="#8C4510" runat="server" CausesValidation="false">Xóa</asp:LinkButton>
</ItemTemplate>
<EditItemTemplate>
<asp:LinkButton ID="lbUpdate" CommandArgument='<%# Eval("CatId") %>' CommandName="UpdateRow" ForeColor="#8C4510" runat="server">Cập nhật</asp:LinkButton>
<asp:LinkButton ID="lbCancel" CommandArgument='<%# Eval("CatId") %>' CommandName="CancelUpdate" ForeColor="#8C4510" runat="server" CausesValidation="false">Hủy</asp:LinkButton>
</EditItemTemplate>
<FooterTemplate>
<asp:LinkButton ID="lbInsert" ValidationGroup="Insert" runat="server" CommandName="InsertRow" ForeColor="#8C4510">Thêm</asp:LinkButton>
</FooterTemplate>
<HeaderStyle />
</asp:TemplateField>--%>
                <asp:TemplateField HeaderText="Mã loại sản phẩm">
                    <ItemTemplate>
                        <%# Eval("CatId") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tên loại sản phẩm">
                    <ItemTemplate>
                        <%# Eval("CatName") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="EditCatName" Text='<%# Bind("CatName") %>'/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox runat="server" ID="InsertCatName" Text=' <%# Bind("CatName") %>'/>
                        <asp:RequiredFieldValidator ID="rfvEditCatName" runat="server" ErrorMessage="Chưa nhập tên màu" ControlToValidate="InsertCatName" Text="*" ForeColor="Red" ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ngày thêm">
                    <HeaderTemplate>Ngày thêm</HeaderTemplate>
                    <ItemTemplate>
                        <%# Eval("DateAdd") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="EditDateAdd" Text='<%# Bind("DateAdd") %>'/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox runat="server" type="date" ID="InsertDateAdd" Text='<%# Bind("DateAdd") %>'/>
                        <asp:RequiredFieldValidator ID="rfvEditDateAdd" runat="server" ErrorMessage="Chưa nhập địa chỉ" ControlToValidate="InsertDateAdd" Text="*" ForeColor="Red" ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ngày sửa">
                    <HeaderTemplate>Ngày sửa</HeaderTemplate>
                    <ItemTemplate>
                        <%# Eval("DateEdit") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="EditDateEdit" Text='<%# Bind("DateEdit") %>'/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox runat="server" type="date" ID="InsertDateEdit" Text='<%# Bind("DateEdit") %>'/>
                        <asp:RequiredFieldValidator ID="rfvEditDateEdit" runat="server" ErrorMessage="Chưa nhập số điện thoại" ControlToValidate="InsertDateEdit" Text="*" ForeColor="Red" ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Kích hoạt">
                    <ItemTemplate>
                        <asp:CheckBox Enabled="false" runat="server" Checked='<%# Eval("Active") %>'/>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:CheckBox runat="server" ID="EditActive" Checked='<%# Bind("Active") %>'/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:CheckBox runat="server" ID="InsertActive" Text='<%# Bind("Active") %>'/>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099"/>
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" Wrap="false"/>
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center"/>
            <RowStyle BackColor="White" ForeColor="#330099" Wrap="false"/>
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399"/>
            <SortedAscendingCellStyle BackColor="#FEFCEB"/>
            <SortedAscendingHeaderStyle BackColor="#AF0101"/>
            <SortedDescendingCellStyle BackColor="#F6F0C0"/>
            <SortedDescendingHeaderStyle BackColor="#7E0000"/>
        </asp:GridView>
        <asp:ValidationSummary ID="ValidationSummary3" ValidationGroup="Insert" ForeColor="Red" runat="server"/>
    </div>
</div>
</div>
<div class="btn btn-lg custom_bar">Thêm bảng sản phẩm</div>
<div class="btn btn-lg custom_bar">Kiểm duyệt bài đăng sản phẩm ở đây</div>
</asp:Content>