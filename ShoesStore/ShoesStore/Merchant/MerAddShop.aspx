<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Merchant/SiteMerchant.Master" CodeBehind="MerAddShop.aspx.cs" Inherits="ShoesStore.Merchant.MerAddShop" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>--%>
<%--<%@ Register TagPrefix="cdt" Assembly="ShoesStore.ColorPickerExtender" Namespace="ShoesStore" %>--%>


<asp:Content ID="Content1" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <asp:PlaceHolder runat="server" ID="phdPage">
        <div class="container">
            <div class="row">
                <div class="card-body">
                    <h5 class="card-title text-center">Tạo Trang Bán Hàng</h5>
                    <div class="form-signin">
                        

                        
                        <hr />
                        <div>
                            <label>Hãy chọn tên của cửa hàng : </label>
                            <asp:TextBox runat="server" ID="inputProName" class="form-control col-12" />
                            <asp:RequiredFieldValidator ID="rfvEditNameAdd" runat="server" ErrorMessage="Chưa nhập tên sản phẩm" ControlToValidate="inputProName" Text="*" ForeColor="Red" ValidationGroup="Insert">
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
    </asp:PlaceHolder>
</asp:Content>
