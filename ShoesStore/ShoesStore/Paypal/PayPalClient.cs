using System.IO;
using System.Runtime.Serialization.Json;
using System.Text;
using BraintreeHttp;
using PayPalCheckoutSdk.Core;

namespace ShoesStore.Paypal
{
    public class PayPalClient
    {
        /**
            Returns PayPalHttpClient instance to invoke PayPal APIs.
         */
        public static HttpClient client()
        {
            return new PayPalHttpClient(environment());
        }

        public static HttpClient client(string refreshToken)
        {
            return new PayPalHttpClient(environment(), refreshToken);
        }

        /**
            Set up PayPal environment with sandbox credentials.
            In production, use ProductionEnvironment.
         */
        public static PayPalEnvironment environment()
        {
            return new SandboxEnvironment("PAYPAL-SANDBOX-CLIENT-ID", "PAYPAL-SANDBOX-CLIENT-SECRET");
        }

        /**
            Use this method to serialize Object to a JSON string.
        */
        public static string ObjectToJSONString(object serializableObject)
        {
            var memoryStream = new MemoryStream();
            var writer = JsonReaderWriterFactory.CreateJsonWriter(
                memoryStream, Encoding.UTF8, true, true, "  ");
            var ser = new DataContractJsonSerializer(serializableObject.GetType(),
                new DataContractJsonSerializerSettings {UseSimpleDictionaryFormat = true});
            ser.WriteObject(writer, serializableObject);
            memoryStream.Position = 0;
            var sr = new StreamReader(memoryStream);
            return sr.ReadToEnd();
        }
    }
}