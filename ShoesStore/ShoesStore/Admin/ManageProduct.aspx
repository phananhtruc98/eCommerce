<%@ Page Language="C#" Title="Quản lý sản phẩm" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageProduct.aspx.cs" Inherits="ShoesStore.Admin.ManageProduct" %>
<%@ Import Namespace="ShoesStore.MyExtensions" %>
<%@ Import Namespace="ShoesStore" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%@ MasterType VirtualPath="~/Admin/Admin.Master" %>
    <%@ Import Namespace="ShoesStore" %>
    <div class="btn btn-lg custom_bar">Thông tin sản phẩm</div>
    <div class="container">
        <div class="row">
            <div class="col-3"></div>
            <div class="col-9">
                <asp:TextBox runat="server" placeholder="Gõ vào đây..." ID="txtTimKiem"></asp:TextBox>
                <asp:Button runat="server" ID="btnTimKiem" Text="Tìm" CssClass="btn btn-inverse-dark" OnClick="btnTimKiem_Click" />
            </div>
        </div>
        <div class="row">
            <div class="table-responsive">
                            <asp:ListView ID="lvPro" OnPagePropertiesChanging="lvPro_PagePropertiesChanging" ItemType="ShoesStore.DataAccessLogicLayer.Pro" runat="server"  OnItemCommand="lvPro_ItemCommand">
                                <LayoutTemplate>
                                    <table class="table">
                                        <tr>
                                            <th>Xem chi tiết</th>
                                            <th>Tên cửa hàng</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Ảnh</th>
                                            <th>Loại sản phẩm</th>
                                            <th>Thương hiệu</th>
                                            <th>Gía</th>
                                           
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server" />
                                    </table>
                                </LayoutTemplate>

                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:LinkButton runat="server" ID="lbtnDetail" CommandName="Sel" CommandArgument='<%# Item.ProId %>' CssClass="btn btn-icons btn-rounded btn-outline-warning"><i class="fas fa-info"></i></asp:LinkButton></td>
                                        <td>
                                            <asp:HiddenField ID="hdfShpId" runat="server" Value="<%# Item.ShpId %>" />
                                            <asp:Label runat="server" ID="lbShpName" Text="<%# Item.Shp.ShpName %>"></asp:Label></td>
                                        <td>
                                            <asp:Label runat="server" ID="lbProName" Text="<%# Item.ProName %>"></asp:Label></td>
                                        <td>
                                            <img class="img-listview-pro rounded" src="<%# MyLibrary.ProImgPath(Item) %>" /></td>
                                        <td>
                                            <asp:Label runat="server" ID="lbCatName" Text="<%# Item.ProCat.CatName %>"></asp:Label></td>
                                        <td>
                                            <asp:Label runat="server" ID="lbBrandName" Text="<%# Item.ProBrand.BrandName %>"></asp:Label></td>
                                        <td>
                                            <asp:Label runat="server" ID="lbPrice" Text="<%# Item.Price.ToFormatMoney() %>"></asp:Label></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="5"
                                PagedControlID="lvPro">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="True"
                                        ShowNextPageButton="False" ShowPreviousPageButton="true" FirstPageText="Đầu" LastPageText="Cuối" NextPageText="Kế" PreviousPageText="Trước" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True"
                                        ShowNextPageButton="true" ShowPreviousPageButton="False" FirstPageText="Đầu" LastPageText="Cuối" NextPageText="Kế" PreviousPageText="Trước" />
                                </Fields>
                            </asp:DataPager>
                            <asp:Label runat="server" ID="lbEmpty" Text="Không có sản phẩm cần duyệt" Visible="false"></asp:Label>
                        </div>
        </div>
        <div class="row">
            <div class="col-6 table-responsive">
                Bảng kích cỡ giày
        <asp:GridView ID="gvProSize" AllowPaging="True"
            EmptyDataText="Không có dữ liệu"  class="custom_table" runat="server" ShowFooter="true" AutoGeneratedColumns="false" BorderWidth="1px" AutoGenerateColumns="False" Width="353px" BackColor="White" BorderColor="#CC9966" BorderStyle="None" CellPadding="4" OnRowCommand="gvProSize_RowCommand" OnPageIndexChanging="gvProSize_PageIndexChanging" PageSize="5">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbEdit" CommandArgument='<%# Eval("SizeId") %>' CommandName="EditRow" ForeColor="#8C4510" runat="server">Sửa</asp:LinkButton>
                        <asp:LinkButton ID="lbDelete" CommandArgument='<%# Eval("SizeId") %>' CommandName="DeleteRow" ForeColor="#8C4510" runat="server" CausesValidation="false">Xóa</asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="lbUpdate" CommandArgument='<%# Eval("SizeId") %>' CommandName="UpdateRow" ForeColor="#8C4510" runat="server">Cập nhật</asp:LinkButton>
                        <asp:LinkButton ID="lbCancel" CommandArgument='<%# Eval("SizeId") %>' CommandName="CancelUpdate" ForeColor="#8C4510" runat="server" CausesValidation="false">Hủy</asp:LinkButton>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="lbInsert" ValidationGroup="Insert" runat="server" CausesValidation="false" CommandName="InsertRow" ForeColor="#8C4510">Thêm</asp:LinkButton>
                    </FooterTemplate>
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mã kích cỡ">
                    <ItemTemplate>
                        <%# Eval("SizeId") %>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Kích cỡ">
                    <ItemTemplate>
                        <%# Eval("SizeName") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="EditSizeName" Text='<%# Bind("SizeName") %>' />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox runat="server" ID="InsertSizeName" Text='<%# Bind("SizeName") %>' />
                        <asp:RequiredFieldValidator ID="rfvEditSizeName" runat="server" ErrorMessage="Chưa nhập tên màu" ControlToValidate="InsertSizeName" Text="*" ForeColor="Red" ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <FooterStyle Wrap="False" />
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" Wrap="false" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" Wrap="false" />
            <PagerSettings FirstPageText="Đầu" PageButtonCount="3" LastPageText="Cuối" NextPageText="Kế" PreviousPageText="Trước" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" Wrap="false" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
                <asp:ValidationSummary ID="ValidationSummary2" ValidationGroup="Insert" ForeColor="Red" runat="server" />

            </div>
            <div class="col-6 table-responsive">
                Bảng thương hiệu
        <asp:GridView ID="gvBrand" AllowPaging="True"
            EmptyDataText="Không có dữ liệu" OnPageIndexChanging="gvBrand_PageIndexChanging"  OnRowCommand="gvBrand_RowCommand" class="custom_table" ShowFooter="true" runat="server" AutoGeneratedColumns="false" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" PageSize="5">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbEdit" CommandArgument='<%# Eval("BrandId") %>' CommandName="EditRow" ForeColor="#8C4510" runat="server">Sửa</asp:LinkButton>
                        <asp:LinkButton ID="lbDelete" CommandArgument='<%# Eval("BrandId") %>' CommandName="DeleteRow" ForeColor="#8C4510" runat="server" CausesValidation="false">Xóa</asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="lbUpdate" CommandArgument='<%# Eval("BrandId") %>' CommandName="UpdateRow" ForeColor="#8C4510" runat="server">Cập nhật</asp:LinkButton>
                        <asp:LinkButton ID="lbCancel" CommandArgument='<%# Eval("BrandId") %>' CommandName="CancelUpdate" ForeColor="#8C4510" runat="server" CausesValidation="false">Hủy</asp:LinkButton>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="lbInsert" ValidationGroup="Insert" runat="server" CausesValidation="false" CommandName="InsertRow" ForeColor="#8C4510">Thêm
                        </asp:LinkButton>
                    </FooterTemplate>
                    <HeaderStyle />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mã thương hiệu">
                    <ItemTemplate>
                        <%# Eval("BrandId") %>
                    </ItemTemplate>
                    <HeaderStyle />
                    <ItemStyle />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tên thương hiệu">
                    <ItemTemplate>
                        <%# Eval("BrandName") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="EditBrandName" Text='<%# Bind("BrandName") %>' />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox runat="server" ID="InsertBrandName" Text=' <%# Bind("BrandName") %>' />
                        <asp:RequiredFieldValidator ID="rfvEditBrandName" runat="server" ErrorMessage="Chưa nhập tên màu" ControlToValidate="InsertBrandName" Text="*" ForeColor="Red" ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
                <asp:ValidationSummary ID="ValidationBrand" ValidationGroup="Insert" ForeColor="Red" runat="server" />
            </div>
        </div>
        <div class="row">
            <div class="col-6 table-responsive">
                Bảng màu
        <asp:GridView ID="gvProColor" AllowPaging="True"
            EmptyDataText="Không có dữ liệu" OnPageIndexChanging="gvProColor_PageIndexChanging" class="custom_table" ShowFooter="true" runat="server" AutoGeneratedColumns="false" BorderWidth="1px" AutoGenerateColumns="False" Width="353px" BackColor="White" BorderColor="#CC9966" BorderStyle="None" CellPadding="4" OnRowCommand="gvProColor_RowCommand" PageSize="5">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbEdit" CommandArgument='<%# Eval("ColorId") %>' CommandName="EditRow" ForeColor="#8C4510" runat="server">Sửa</asp:LinkButton>
                        <asp:LinkButton ID="lbDelete" CommandArgument='<%# Eval("ColorId") %>' CommandName="DeleteRow" ForeColor="#8C4510" runat="server" CausesValidation="false">Xóa</asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="lbUpdate" CommandArgument='<%# Eval("ColorId") %>' CommandName="UpdateRow" ForeColor="#8C4510" runat="server">Cập nhật</asp:LinkButton>
                        <asp:LinkButton ID="lbCancel" CommandArgument='<%# Eval("ColorId") %>' CommandName="CancelUpdate" ForeColor="#8C4510" runat="server" CausesValidation="false">Hủy</asp:LinkButton>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="lbInsert" ValidationGroup="Insert" runat="server" CausesValidation="false" CommandName="InsertRow" ForeColor="#8C4510">Thêm</asp:LinkButton>
                    </FooterTemplate>
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mã màu">
                    <ItemTemplate>
                        <%# Eval("ColorId") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tên màu" ItemStyle-Width="100px">
                    <ItemTemplate>
                        <%# Eval("ColorName") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox Width="100px" runat="server" ID="EditColorName" Text='<%# Bind("ColorName") %>' />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox Width="100px" runat="server" ID="InsertColorName" Text='<%# Bind("ColorName") %>' />
                        <asp:RequiredFieldValidator ID="rfvEditColorName" runat="server" ErrorMessage="Chưa nhập tên màu" ControlToValidate="InsertColorName" Text="*" ForeColor="Red" ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ControlStyle Width="50px" />
                    <FooterStyle Width="50px" />
                    <HeaderStyle Width="50px" />

                    <ItemStyle Width="50px" Wrap="False"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="HexCode" ItemStyle-Width="100px">
                    <ItemTemplate>
                        <%# Eval("HexCode") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox Width="100px" runat="server" ID="EditHexCode" Text='<%# Bind("HexCode") %>' />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox runat="server" Width="100px" ID="InsertHexCode" Text=' <%# Bind("HexCode") %>' />
                        <asp:RequiredFieldValidator ID="rfvEditHexCode" runat="server" ErrorMessage="Chưa nhập mã hex" ControlToValidate="InsertHexCode" Text="*" ForeColor="Red" ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <FooterStyle Width="30%" />
                    <HeaderStyle Width="30%" />

                    <ItemStyle Width="30%" Wrap="True"></ItemStyle>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" Wrap="False" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" Wrap="False" Width="50px" />
            <PagerSettings FirstPageText="Đa" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" Wrap="False" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
                <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="Insert" ForeColor="Red" runat="server" />
            </div>

            <div class="col-6 table-responsive">
                Bảng loại sản phẩm
        <asp:GridView ID="gvProCat" AllowPaging="True"
            EmptyDataText="Không có dữ liệu" OnPageIndexChanging="gvProCat_PageIndexChanging" OnRowCommand="gvProCat_RowCommand" class="custom_table" ShowFooter="true" runat="server" AutoGeneratedColumns="false" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" PageSize="5">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbEdit" CommandArgument='<%# Eval("CatId") %>' CommandName="EditRow" ForeColor="#8C4510" runat="server">Sửa</asp:LinkButton>
                        <asp:LinkButton ID="lbDelete" CommandArgument='<%# Eval("CatId") %>' CommandName="DeleteRow" ForeColor="#8C4510" runat="server" CausesValidation="false">Xóa</asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="lbUpdate" CommandArgument='<%# Eval("CatId") %>' CommandName="UpdateRow" ForeColor="#8C4510" runat="server">Cập nhật</asp:LinkButton>
                        <asp:LinkButton ID="lbCancel" CommandArgument='<%# Eval("CatId") %>' CommandName="CancelUpdate" ForeColor="#8C4510" runat="server" CausesValidation="false">Hủy</asp:LinkButton>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="lbInsert" ValidationGroup="Insert" runat="server" CausesValidation="false" CommandName="InsertRow" ForeColor="#8C4510">Thêm</asp:LinkButton>
                    </FooterTemplate>
                    <HeaderStyle />
                </asp:TemplateField>
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
                        <asp:TextBox runat="server" ID="EditCatName" Text='<%# Bind("CatName") %>' />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox runat="server" ID="InsertCatName" Text=' <%# Bind("CatName") %>' />
                        <asp:RequiredFieldValidator ID="rfvEditCatName" runat="server" ErrorMessage="Chưa nhập tên màu" ControlToValidate="InsertCatName" Text="*" ForeColor="Red" ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" Wrap="false" />
            <PagerSettings FirstPageText="Đầu" LastPageText="Cuối" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" Wrap="false" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
                <asp:ValidationSummary ID="ValidationSummary3" ValidationGroup="Insert" ForeColor="Red" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
