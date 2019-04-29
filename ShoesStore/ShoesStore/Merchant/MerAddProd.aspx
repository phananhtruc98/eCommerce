<%@ Page Language="C#" Title="Trang Shop Cá Nhân" MasterPageFile="~/Merchant/SiteMerchant.Master" AutoEventWireup="true" CodeBehind="MerAddProd.aspx.cs" Inherits="ShoesStore.Merchant.MerAddProd" %>



<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>--%>
<%--<%@ Register TagPrefix="cdt" Assembly="ShoesStore.ColorPickerExtender" Namespace="ShoesStore" %>--%>

<asp:Content ID="ScriptContent" ContentPlaceHolderID="cphScriptManager" runat="server">
    <%--<cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></cc1:ToolkitScriptManager>--%>
          <asp:ScriptManager runat="server">
                <Scripts>
                    <asp:ScriptReference Name="MsAjaxBundle" />
                    <asp:ScriptReference Name="jquery" />
                    <asp:ScriptReference Name="bootstrap" />
                    <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                    <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                    <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                    <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                    <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                    <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                    <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                    <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                    <asp:ScriptReference Name="WebFormsBundle" />
                </Scripts>
            </asp:ScriptManager>
</asp:Content>
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
                                        <asp:DropDownList ID="ddlColor" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <br />
                                <div>
                                    Chọn khác:  
                                    <asp:TextBox runat="server" ID="txtInsertColor" PlaceHolder="Tên màu"></asp:TextBox>
                                    <asp:ImageButton runat="server"  ID="imgbtnColor" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa đặt tên" ControlToValidate="txtInsertColor" Text="*" ForeColor="Red" ValidationGroup="InsertColor">
                                    </asp:RequiredFieldValidator><asp:TextBox ID="TextBox1" runat="server" Columns="7" MaxLength="7" />
                                    
                                    <cc1:ColorPickerExtender ID="ColorPickerExtender1" runat="server" TargetControlID="txtInsertColor" PopupButtonID="imgbtnColor">


                                    </cc1:ColorPickerExtender>

                                    <asp:LinkButton runat="server" ID="lbtnInsertColor" ValidationGroup="InsertColor" Text="Thêm" CssClass="btn btn-primary" OnClick="lbtnInsertColor_Click"></asp:LinkButton>
                                </div>
                                <hr />
                                <div>
                                    <label>Kích thước</label>
                                    <div style="float: right">
                                        <asp:DropDownList ID="ddlSize" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <hr />
                                <div>
                                    <label>Số Lượng</label>
                                    <div style="float: right">
                                        <asp:TextBox runat="server" min="1" Text="1" TextMode="Number" ID="intputProQuantity" class="form-control" />
                                    </div>
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
