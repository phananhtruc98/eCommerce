using System.Linq;
using System.Web;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Merchant
{
    public class MerchantSession
    {
        private static readonly MerchantSession _instance = null;

        public static object LoginMerchant
        {
            get => HttpContext.Current.Session["LoginMerchant"];
            set => HttpContext.Current.Session["LoginMerchant"] = value;
        }

        public static MerchantSession Instance => _instance ?? new MerchantSession();

        public static Mer LoginMer
        {
            get
            {
                try
                {
                    var usr = (Mer) HttpContext.Current.Session["LoginMerchant"];
                    var mer = new Mer_BUS().GetAll().FirstOrDefault(m => m.MerId == usr.MerId);
                    return mer;
                }
                catch
                {
                    return null;
                }
            }
        }
    }
}