using System.Web;

namespace ShoesStore.Admin
{
    public class AdminSession
    {
        private static readonly AdminSession _instance = null;

        public static object LoginAdmin
        {
            get => HttpContext.Current.Session["LoginAdmin"];
            set => HttpContext.Current.Session["LoginAdmin"] = value;
        }

        public static AdminSession Instance => _instance ?? new AdminSession();
    }
}