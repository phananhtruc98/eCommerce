<%@ Page Language="C#" Title="Trang Shop Cá Nhân" MasterPageFile="~/Merchant/SiteMerchant.Master" AutoEventWireup="true" CodeBehind="MerAddProd.aspx.cs" Inherits="ShoesStore.Merchant.MerAddProd" %>



<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>--%>
<%--<%@ Register TagPrefix="cdt" Assembly="ShoesStore.ColorPickerExtender" Namespace="ShoesStore" %>--%>


<asp:Content ID="Content1" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <asp:PlaceHolder runat="server" ID="phdPage">
        <div class="container">
            <div class="row">
                <div class="card-body">
                    <h5 class="card-title text-center">Thêm Sản Phẩm</h5>
                    <div class="form-signin">
                        <!--Button-->
                        <div>
                            <label for="inputCatId">Loại Sản Phẩm</label>
                            <div style="float: right">
                                <asp:DropDownList ID="DropDownListCat" runat="server">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <!--Button/END-->
                        <hr />

                        <!--Button-->
                        <div>
                            <label for="inputCatId">Thương Hiệu</label>
                            <div style="float: right">
                                <asp:DropDownList ID="DropDownListBrand" runat="server">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <!--Button/END-->

                        <hr />
                        <div>
                            <label>Tên Sản Phẩm</label>
                            <asp:TextBox runat="server" ID="inputProName" class="form-control col-12" />
                            <asp:RequiredFieldValidator ID="rfvEditNameAdd" runat="server" ErrorMessage="Chưa nhập tên sản phẩm" ControlToValidate="inputProName" Text="*" ForeColor="Red" ValidationGroup="Insert">
                            </asp:RequiredFieldValidator>
                        </div>
                        <hr />
                        <div>
                            <label>Giá Tiền</label>
                            <div style="float: right">
                                <asp:TextBox runat="server" TextMode="Number" ID="inputPrice" class="form-control" />
                            </div>
                            <asp:RequiredFieldValidator ID="rfvEditPricetAdd" runat="server" ErrorMessage="Chưa nhập giá tiền" ControlToValidate="inputPrice" Text="*" ForeColor="Red" ValidationGroup="Insert">
                            </asp:RequiredFieldValidator>
                        </div>
                        <hr />
                        <div>
                            <label>Màu</label>
                            <asp:CheckBoxList CellSpacing="5" CellPadding="5" ID="ckbColor" runat="server" RepeatDirection="Horizontal"></asp:CheckBoxList><asp:LinkButton ID="lbtnColor" runat="server" OnClick="lbtnColor_Click">Chọn</asp:LinkButton>
                        </div>
                        <hr />
                        <div>
                            <label>Kích thước</label>
                            <asp:CheckBoxList ID="ckbSize" CellPadding="5" CellSpacing="5" runat="server" RepeatDirection="Horizontal"></asp:CheckBoxList><asp:LinkButton ID="lbtnSize" runat="server" OnClick="lbtnSize_Click">Chọn</asp:LinkButton>
                        </div>
                        <div>
                            Kích cỡ:
                                    <asp:DropDownList runat="server" ID="ddlSizeSelected"></asp:DropDownList>Màu:
                                    <asp:DropDownList runat="server" ID="ddlColorSelected"></asp:DropDownList><asp:LinkButton runat="server" ID="lbtnChon" Text="Chọn" OnClick="lbtnChon_Click"></asp:LinkButton>
                       
                            </div>
                        <div>
                            <asp:ListView ID="lvColoSize" runat="server" OnItemCommand="lvColoSize_ItemCommand">
                                <LayoutTemplate>
                                    <table class="table">
                                        <tr>
                                            <th>Kích thước</th>
                                            <th>Màu sắc</th>
                                            <th>Số lượng</th>
                                            <th>Danh sách màu đã chọn</th>
                                            <th>Xóa</th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server" />
                                    </table>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server" ID="lbSizeName" Text='<%# Eval("Size.SizeName") %>'></asp:Label></td>
                                        <td>
                                            <asp:Label runat="server" ID="lbColorName" Text='<%# Eval("Color.ColorName") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtQty" min="1" PlaceHolder="Nhập số lượng" TextMode="Number" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvEditQty" runat="server" ErrorMessage="Chưa nhập số lượng" ControlToValidate="txtQty" Text="*" ForeColor="Red" ValidationGroup="InsertQty">
                                            </asp:RequiredFieldValidator>
                                            <asp:LinkButton ValidationGroup="InsertQty" runat="server" ID="ltbnThem" CommandName="Sel" CommandArgument='<%# Container.DataItemIndex %>'><i class="fas fa-arrow-right"></i></asp:LinkButton></td>
                                        <td>
                                            <asp:Label runat="server" ID="lblKl"></asp:Label></td>
                                        <td>
                                            <asp:LinkButton runat="server" ID="lbtnDelete" CommandName="Del" CommandArgument='<%# Container.DataItemIndex %>'><i class="far fa-times-circle"></i></asp:LinkButton></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                        <hr />
                        <div>
                            <label>Ảnh chính</label>
                            <asp:FileUpload ID="fulImgChinh" runat="server" ClientIDMode="Static" />
                            <asp:Image runat="server" ID="imgPrimary" />
                        </div>

                        <div>
                            <label>Ảnh phụ</label>
                            <asp:FileUpload ID="fulImgPhu" AllowMultiple="true" runat="server" />
                        </div>
                        <hr />
                        <div>
                            <label for="inputDescShort">Mô tả ngắn gọn</label>
                            <asp:TextBox runat="server" ID="inputDescShort" class="form-control col-12" />
                            <asp:RequiredFieldValidator ID="rfvEditDescShortAdd" runat="server" ErrorMessage="Mô tả ngắn gọn" ControlToValidate="inputDescShort" Text="*" ForeColor="Red" ValidationGroup="Insert">
                            </asp:RequiredFieldValidator>
                        </div>
                        <hr />
                        <div>
                            <label for="inputDesc">Mô tả chi tiết</label>
                        </div>
                        <div>
                            <asp:TextBox TextMode="MultiLine" runat="server" ID="editor1" name="editor1"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Mô tả chi tiết" ControlToValidate="inputDescShort" Text="*" ForeColor="Red" ValidationGroup="Insert">
                            </asp:RequiredFieldValidator>
                        </div>
                        <script>
                            CKEDITOR.replace('MainPlaceHolder_editor1', { htmlEncodeOutput: false });
                            CKEDITOR.config.toolbar = [

                                { name: 'clipboard', items: ['Cut', 'Copy', 'Paste', 'PasteText', '-', 'Undo', 'Redo'] },

                                { name: 'editing', items: ['Find', 'Replace', '-', 'SelectAll'] },

                                { name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript'] },

                                {
                                    name: 'paragraph', items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-',
                                        '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock']
                                },

                                { name: 'styles', items: ['Styles', 'Format', 'Font', 'FontSize'] },

                                { name: 'colors', items: ['TextColor', 'BGColor'] }];
                            CKEDITOR.config.FileTypesPath["Image"]('C:\eCommerce\ShoesStore\ShoesStore\Admin\images\faces');
                        </script>
                        <hr />
                        <asp:LinkButton ID="lbSubmit" ValidationGroup="Insert" OnClick="btnSubmit_OnClick" CommandName="Submit" ForeColor="#8C4510" runat="server" class="btn btn-lg btn-primary btn-block text-uppercase">Đăng bài</asp:LinkButton>
                        <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="Insert" runat="server" />
                        <asp:Label runat="server" ID="lbError"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </asp:PlaceHolder>
</asp:Content>
