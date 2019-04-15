<%@ Page Language="C#" Title="Trang Chủ" MasterPageFile="~/Merchant/Merchant.Master" AutoEventWireup="true" CodeFile="MerHome.aspx.cs" Inherits="ShoesStore.Merchant.MerHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- site__body -->
    <div class="site__body" style="margin-bottom: 100px">
        <div class="row">
            <div class="column">
                <div class="row justify-content-center">
                    <div class="col-sm-8">
                        <div class="card flex-grow-1 mb-0 mt-5">
                            <div class="card-body">
                                <div class="card-title text-center">
                                    <h1>Gói Sub 1</h1>
                                </div>
                                <p class="mb-4 pt-2">Nội dung của gói sub 1</p>
                                <form>
                                    <div class="form-group">
                                        <label for="track-order-id">Order ID</label>
                                        <input id="track-order-id" type="text" class="form-control" placeholder="Order ID">
                                    </div>
                                    <div class="form-group">
                                        <label for="track-email">Email address</label>
                                        <input id="track-email" type="email" class="form-control" placeholder="Email address">
                                    </div>
                                    <div class="form-group">
                                        <label>Default</label>
                                        <select class="form-control">
                                            <option>Select value...</option>
                                        </select>
                                    </div>
                                    <div class="pt-3">
                                        <button type="submit" class="btn btn-primary btn-lg btn-block">Chọn Mua</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="column">
                <div class="row justify-content-center">
                    <div class="col-sm-8">
                        <div class="card flex-grow-1 mb-0 mt-5">
                            <div class="card-body">
                                <div class="card-title text-center">
                                    <h1>Gói Sub 2</h1>
                                </div>
                                <p class="mb-4 pt-2">Nội dung của gói sub 2</p>
                                <form>
                                    <div class="form-group">
                                        <label for="track-order-id">Order ID</label>
                                        <input id="track-order-id" type="text" class="form-control" placeholder="Order ID">
                                    </div>
                                    <div class="form-group">
                                        <label for="track-email">Email address</label>
                                        <input id="track-email" type="email" class="form-control" placeholder="Email address">
                                    </div>
                                    <div class="form-group">
                                        <label>Default</label>
                                        <select class="form-control">
                                            <option>Select value...</option>
                                        </select>
                                    </div>
                                    <div class="pt-3">
                                        <button type="submit" class="btn btn-primary btn-lg btn-block">Chọn Mua</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- site__body / end -->
</asp:Content>
