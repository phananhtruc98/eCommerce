using System;
using System.Threading.Tasks;
using System.Web.UI;
using BraintreeHttp;
using PayPalCheckoutSdk.Orders;
using ShoesStore.Paypal;

namespace ShoesStore.Merchant
{
    public partial class MerPaypal : Page
    {
        public static async Task<HttpResponse> GetOrder(string orderId, bool debug = false)
        {
            var request = new OrdersGetRequest(orderId);
            //3. Call PayPal to get the transaction
            var response = await PayPalClient.client().Execute(request);
            //4. Save the transaction in your database. Implement logic to save transaction to your database for future reference.
            var result = response.Result<Order>();
            Console.WriteLine("Retrieved Order Status");
            Console.WriteLine("Status: {0}", result.Status);
            Console.WriteLine("Order Id: {0}", result.Id);
            Console.WriteLine("Intent: {0}", result.Intent);
            Console.WriteLine("Links:");
            foreach (var link in result.Links)
                Console.WriteLine("\t{0}: {1}\tCall Type: {2}", link.Rel, link.Href, link.Method);
            var amount = result.PurchaseUnits[0].Amount;
            Console.WriteLine("Total Amount: {0} {1}", amount.CurrencyCode, amount.Value);

            return response;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //  GetOrder("67C810523M8993452").Wait();
        }
    }
}