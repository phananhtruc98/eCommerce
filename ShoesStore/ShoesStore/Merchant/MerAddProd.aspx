<%@ Page Language="C#" Title="Trang Shop Cá Nhân" MasterPageFile="~/Merchant/SiteMerchant.Master" AutoEventWireup="true" CodeBehind="MerAddProd.aspx.cs" Inherits="ShoesStore.Merchant.MerAddProd" %>



<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>--%>
<%--<%@ Register TagPrefix="cdt" Assembly="ShoesStore.ColorPickerExtender" Namespace="ShoesStore" %>--%>


<asp:Content ID="Content1" ContentPlaceHolderID="MainPlaceHolder" runat="server">


    <asp:Panel ID="pnlThem" runat="server" DefaultButton="lbSubmit" Width="100%">
        <div style="margin-top: -30px;" class="container1">
            <div class="row">
                <div class="col-lg-10 col-12 col-xl-50 mx-auto">
                    <div class="card card-signin flex-row my-5">
                        <div class="card-img-left d-none d-md-flex">
                            <!-- Background image for card set in CSS! -->
                        </div>
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
                                    <asp:RequiredFieldValidator ID="rfvEditPricetAdd" runat="server" ErrorMessage="Chưa nhập tóm tắt" ControlToValidate="inputPrice" Text="*" ForeColor="Red" ValidationGroup="Insert">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <hr />
                                <div>
                                    <label>Màu</label>
                                    <div style="float: right">
                                        <asp:CheckBoxList CellSpacing="5" CellPadding="5" ID="ckbColor" runat="server" RepeatDirection="Horizontal"></asp:CheckBoxList><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                        <asp:LinkButton ID="lbtnColor" runat="server" OnClick="lbtnColor_Click">LinkButton</asp:LinkButton>
                                    </div>
                                </div>
                                <br />
                                <div>
                                </div>
                                <hr />
                                <div>
                                    <label>Kích thước</label>
                                    <div style="float: right">
                                        <asp:CheckBoxList ID="ckbSize" CellPadding="5" CellSpacing="5" runat="server" RepeatDirection="Horizontal"></asp:CheckBoxList>
                                        <asp:LinkButton ID="lbtnChon" runat="server" OnClick="lbtnChon_Click">LinkButton</asp:LinkButton>
                                    </div>
                                </div>
                                <hr />
                                <div><asp:ListView ID="lvColoSize" runat="server" OnItemDataBound="lvColoSize_ItemDataBound">
                                    <LayoutTemplate>
                                        <table class="table">
                                            <tr>
                                                <th>Kích thước</th>
                                                <th>Màu sắc và số lượng</th>
                                                <th>Danh sách màu đã chọn</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server" />
                                        </table>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label runat="server" ID="lbSizeName" Text="<%# Eval("Index") %>"></asp:Label></td>
                                            <td>
                                                <asp:DropDownList ID="ddlProColor" runat="server"></asp:DropDownList>
                                                <asp:TextBox ID="txtQty" TextMode="Number" runat="server"></asp:TextBox>
                                                <asp:ImageButton ID="imgbtnChon" runat="server" CssClass="glyphicon glyphicon-arrow-right"/></td>
                                            <td>
                                                <asp:Label runat="server" ID="ltrDurday"></asp:Label></td>
                                            
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                </div>
                                <hr />
                                <div>
                                    <label>Ảnh chính</label>
                                    <asp:FileUpload ID="fulImgChinh" runat="server" />
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
                                </div>
                                <script>
                                    CKEDITOR.replace('MainPlaceHolder_editor1', { htmlEncodeOutput: true });
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
