using System.Web;

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

    }

}