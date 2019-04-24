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
                    Usr usr = (Usr)HttpContext.Current.Session["LoginMerchant"];
                    Mer mer = new Mer_BUS().GetAll().FirstOrDefault(m => m.MerId == usr.UsrId);
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