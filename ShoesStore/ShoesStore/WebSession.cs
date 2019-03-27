using System.Web;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore
{
    public class WebSession
    {
        private static WebSession _instance = null;
        public static object LoginUsr
        {
            get => HttpContext.Current.Session["LoginUsr"];
            set => HttpContext.Current.Session["LoginUsr"] = value;
        }

        public static WebSession Instance
        {
            get { return _instance ?? new WebSession(); }
        }
    }
}