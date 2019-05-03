using System.Collections.Generic;
using PayPal.Api;

namespace ShoesStore.Paypal
{
    public class PaypalConfiguration
    {
        public static readonly string ClientId;
        public static readonly string ClientSecret;
        static PaypalConfiguration()
        {
            var config = GetConfig();
            ClientId = config["clientId"];
            ClientSecret = config["clientSecret"];
        }

        public static Dictionary<string, string> GetConfig()
        {
            return ConfigManager.Instance.GetProperties();
        }

        //Create access token
        private static string GetAccessToken()
        {
            string accessToken = new OAuthTokenCredential(ClientId, ClientSecret, GetConfig()).GetAccessToken();
            return accessToken;
        }

        //Return ApiContext object
        public static APIContext GetAPIContext()
        {
            var apiContext = new APIContext(GetAccessToken());
            apiContext.Config = GetConfig();
            return apiContext;
            //return new APIContext();
        }
    }
}