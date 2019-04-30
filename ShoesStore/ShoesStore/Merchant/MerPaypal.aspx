<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MerPaypal.aspx.cs" Inherits="ShoesStore.Merchant.MerPaypal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <script
                src="https://www.paypal.com/sdk/js?client-id=AW70rNk98eTP9zPPpkP4nJfOulOCt8yvtXtGseUz9_m5JX_NkY1_FlD3bN0oxizRTN3lZ5ZVAYJAnnMW">
            </script>
            <div id="paypal-button-container"></div>
            <script>
                paypal.Buttons().render('#paypal-button-container');
            </script>

            <script>
                paypal.Buttons({
                    createOrder: function (data, actions) {
                        // Set up the transaction
                        return actions.order.create({
                            purchase_units: [{
                                amount: {
                                    value: '0.21'
                                }
                            }]
                        });
                    }
                }).render('#paypal-button-container');
            </script>

            <script>
                paypal.Buttons({
                    createOrder: function (data, actions) {
                        return actions.order.create({
                            purchase_units: [{
                                amount: {
                                    value: '0.01'
                                }
                            }]
                        });
                    },
                    onApprove: function (data, actions) {
                        // Capture the funds from the transaction
                        return actions.order.capture().then(function (details) {
                            // Show a success message to your buyer
                            alert('Transaction completed by ' + details.payer.name.given_name);
                        });
                    }
                }).render('#paypal-button-container');
            </script>

            <script>
                paypal.Buttons({
                    createOrder: function (data, actions) {
                        return actions.order.create({
                            purchase_units: [{
                                amount: {
                                    value: '0.01'
                                }
                            }]
                        });
                    },
                    onApprove: function (data, actions) {
                        return actions.order.capture().then(function (details) {
                            alert('Transaction completed by ' + details.payer.name.given_name);
                            debugger;
                            // Call your server to save the transaction
                            return fetch('/paypal-transaction-complete', {
                                method: 'post',
                                headers: {
                                    'content-type': 'application/json'
                                },
                                body: JSON.stringify({
                                    orderID: data.orderID
                                })
                            });
                        });
                    }
                }).render('#paypal-button-container');
            </script>
            <div class="order-here"></div>
        </div>
    </form>
</body>
</html>
