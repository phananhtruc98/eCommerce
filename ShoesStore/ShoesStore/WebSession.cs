using System.Linq;
using System.Web;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
namespace ShoesStore
{
    public class WebSession
    {
        private static readonly WebSession _instance = null;
        public static object LoginUsr
        {
            get => HttpContext.Current.Session["LoginUsr"];
            set => HttpContext.Current.Session["LoginUsr"] = value;
        }
        public static WebSession Instance => _instance ?? new WebSession();
        public static Cus LoginCus
        {
            get
            {
                try
                {
                    Usr usr = (Usr) HttpContext.Current.Session["LoginUsr"];
                    Cus cus = new Cus_BUS().GetAll().FirstOrDefault(m => m.CusId == usr.UsrId);
                    return cus;
                }
                catch
                {
                    return null;
                }
            }
        }
    }
}