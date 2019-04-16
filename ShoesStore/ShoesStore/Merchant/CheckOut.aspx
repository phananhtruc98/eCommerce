<%@ Page Language="C#" Title="Check Out" MasterPageFile="~/Merchant/Merchant.Master" AutoEventWireup="true" CodeFile="CheckOut.aspx.cs" Inherits="ShoesStore.Merchant.CheckOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- site__body -->
    <div class="site__body">
        <div class="page-header">
            <div class="page-header__container container">
                <div class="page-header__breadcrumb">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.aspx">Home</a>
                                <svg class="breadcrumb-arrow" width="6px" height="9px">
                                    <use xlink:href="images/sprite.svg#arrow-rounded-right-6x9"></use></svg></li>
                            <li class="breadcrumb-item"><a href="#">Breadcrumb</a>
                                <svg class="breadcrumb-arrow" width="6px" height="9px">
                                    <use xlink:href="images/sprite.svg#arrow-rounded-right-6x9"></use></svg></li>
                            <li class="breadcrumb-item active" aria-current="page">CheckOut</li>
                        </ol>
                    </nav>
                </div>
                <div class="page-header__title">
                    <h1>CheckOut</h1>
                </div>
            </div>
        </div>
        <div class="CheckOut block">
            <div class="container">
                <div class="row">
                    <div class="col-12 mb-3">
                        <div class="alert alert-lg alert-primary">Returning customer? <a href="#">Click here to login</a></div>
                    </div>
                    <div class="col-12 col-lg-6 col-xl-7">
                        <div class="card mb-lg-0">
                            <div class="card-body">
                                <h3 class="card-title">Billing details</h3>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="CheckOut-first-name">First Name</label>
                                        <input type="text" class="form-control" id="CheckOut-first-name" placeholder="First Name">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="CheckOut-last-name">Last Name</label>
                                        <input type="text" class="form-control" id="CheckOut-last-name" placeholder="Last Name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="CheckOut-company-name">Company Name <span class="text-muted">(Optional)</span></label>
                                    <input type="text" class="form-control" id="CheckOut-company-name" placeholder="Company Name">
                                </div>
                                <div class="form-group">
                                    <label for="CheckOut-country">Country</label>
                                    <select id="CheckOut-country" class="form-control">
                                        <option>Select a country...</option>
                                        <option>United States</option>
                                        <option>Russia</option>
                                        <option>Italy</option>
                                        <option>France</option>
                                        <option>Ukraine</option>
                                        <option>Germany</option>
                                        <option>Australia</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="CheckOut-street-address">Street Address</label>
                                    <input type="text" class="form-control" id="CheckOut-street-address" placeholder="Street Address">
                                </div>
                                <div class="form-group">
                                    <label for="CheckOut-address">Apartment, suite, unit etc. <span class="text-muted">(Optional)</span></label>
                                    <input type="text" class="form-control" id="CheckOut-address">
                                </div>
                                <div class="form-group">
                                    <label for="CheckOut-city">Town / City</label>
                                    <input type="text" class="form-control" id="CheckOut-city">
                                </div>
                                <div class="form-group">
                                    <label for="CheckOut-state">State / County</label>
                                    <input type="text" class="form-control" id="CheckOut-state">
                                </div>
                                <div class="form-group">
                                    <label for="CheckOut-postcode">Postcode / ZIP</label>
                                    <input type="text" class="form-control" id="CheckOut-postcode">
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="CheckOut-email">Email address</label>
                                        <input type="email" class="form-control" id="CheckOut-email" placeholder="Email address">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="CheckOut-phone">Phone</label>
                                        <input type="text" class="form-control" id="CheckOut-phone" placeholder="Phone">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="form-check">
                                        <span class="form-check-input input-check"><span class="input-check__body">
                                            <input class="input-check__input" type="checkbox" id="CheckOut-create-account">
                                            <span class="input-check__box"></span>
                                            <svg class="input-check__icon" width="9px" height="7px">
                                                <use xlink:href="images/sprite.svg#check-9x7"></use></svg>
                                        </span></span>
                                        <label class="form-check-label" for="CheckOut-create-account">Create an account?</label>
                                    </div>
                                </div>
                            </div>
                            <div class="card-divider"></div>
                            <div class="card-body">
                                <h3 class="card-title">Shipping Details</h3>
                                <div class="form-group">
                                    <div class="form-check">
                                        <span class="form-check-input input-check"><span class="input-check__body">
                                            <input class="input-check__input" type="checkbox" id="CheckOut-different-address">
                                            <span class="input-check__box"></span>
                                            <svg class="input-check__icon" width="9px" height="7px">
                                                <use xlink:href="images/sprite.svg#check-9x7"></use></svg>
                                        </span></span>
                                        <label class="form-check-label" for="CheckOut-different-address">Ship to a different address?</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="CheckOut-comment">Order notes <span class="text-muted">(Optional)</span></label>
                                    <textarea id="CheckOut-comment" class="form-control" rows="4"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-6 col-xl-5 mt-4 mt-lg-0">
                        <div class="card mb-0">
                            <div class="card-body">
                                <h3 class="card-title">Your Order</h3>
                                <table class="CheckOut__totals">
                                    <thead class="CheckOut__totals-header">
                                        <tr>
                                            <th>Product</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody class="CheckOut__totals-products">
                                        <tr>
                                            <td>Electric Planer Brandix KL370090G 300 Watts × 2</td>
                                            <td>$1,398.00</td>
                                        </tr>
                                        <tr>
                                            <td>Undefined Tool IRadix DPS3000SY 2700 watts × 1</td>
                                            <td>$849.00</td>
                                        </tr>
                                        <tr>
                                            <td>Brandix Router Power Tool 2017ERXPK × 3</td>
                                            <td>$3,630.00</td>
                                        </tr>
                                    </tbody>
                                    <tbody class="CheckOut__totals-subtotals">
                                        <tr>
                                            <th>Subtotal</th>
                                            <td>$5,877.00</td>
                                        </tr>
                                        <tr>
                                            <th>Store Credit</th>
                                            <td>$-20.00</td>
                                        </tr>
                                        <tr>
                                            <th>Shipping</th>
                                            <td>$25.00</td>
                                        </tr>
                                    </tbody>
                                    <tfoot class="CheckOut__totals-footer">
                                        <tr>
                                            <th>Total</th>
                                            <td>$5,882.00</td>
                                        </tr>
                                    </tfoot>
                                </table>
                                <div class="payment-methods">
                                    <ul class="payment-methods__list">
                                        <li class="payment-methods__item payment-methods__item--active">
                                            <label class="payment-methods__item-header">
                                                <span class="payment-methods__item-radio input-radio"><span class="input-radio__body">
                                                    <input class="input-radio__input" name="CheckOut_payment_method" type="radio" checked="checked">
                                                    <span class="input-radio__circle"></span></span></span><span class="payment-methods__item-title">Direct bank transfer</span></label><div class="payment-methods__item-container">
                                                        <div class="payment-methods__item-description text-muted">Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order will not be shipped until the funds have cleared in our account.</div>
                                                    </div>
                                        </li>
                                        <li class="payment-methods__item">
                                            <label class="payment-methods__item-header">
                                                <span class="payment-methods__item-radio input-radio"><span class="input-radio__body">
                                                    <input class="input-radio__input" name="CheckOut_payment_method" type="radio">
                                                    <span class="input-radio__circle"></span></span></span><span class="payment-methods__item-title">Check payments</span></label><div class="payment-methods__item-container">
                                                        <div class="payment-methods__item-description text-muted">Please send a check to Store Name, Store Street, Store Town, Store State / County, Store Postcode.</div>
                                                    </div>
                                        </li>
                                        <li class="payment-methods__item">
                                            <label class="payment-methods__item-header">
                                                <span class="payment-methods__item-radio input-radio"><span class="input-radio__body">
                                                    <input class="input-radio__input" name="CheckOut_payment_method" type="radio">
                                                    <span class="input-radio__circle"></span></span></span><span class="payment-methods__item-title">Cash on delivery</span></label><div class="payment-methods__item-container">
                                                        <div class="payment-methods__item-description text-muted">Pay with cash upon delivery.</div>
                                                    </div>
                                        </li>
                                        <li class="payment-methods__item">
                                            <label class="payment-methods__item-header">
                                                <span class="payment-methods__item-radio input-radio"><span class="input-radio__body">
                                                    <input class="input-radio__input" name="CheckOut_payment_method" type="radio">
                                                    <span class="input-radio__circle"></span></span></span><span class="payment-methods__item-title">PayPal</span></label><div class="payment-methods__item-container">
                                                        <div class="payment-methods__item-description text-muted">Pay via PayPal; you can pay with your credit card if you don’t have a PayPal account.</div>
                                                    </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="CheckOut__agree form-group">
                                    <div class="form-check">
                                        <span class="form-check-input input-check"><span class="input-check__body">
                                            <input class="input-check__input" type="checkbox" id="CheckOut-terms">
                                            <span class="input-check__box"></span>
                                            <svg class="input-check__icon" width="9px" height="7px">
                                                <use xlink:href="images/sprite.svg#check-9x7"></use></svg>
                                        </span></span>
                                        <label class="form-check-label" for="CheckOut-terms">I have read and agree to the website <a target="_blank" href="terms-and-conditions.aspx">terms and conditions</a>*</label>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary btn-xl btn-block">Place Order</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- site__body / end -->
</asp:Content>
