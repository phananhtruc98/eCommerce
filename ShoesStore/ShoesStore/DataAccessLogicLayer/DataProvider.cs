namespace ShoesStore.DataAccessLogicLayer
{
    public class DataProvider
    {
        private static ShoesStoreDBContext _instance;

        protected DataProvider()
        {
            var db = new ShoesStoreDBContext();
        }

        public static ShoesStoreDBContext Instance()
        {
            if (_instance == null) _instance = new ShoesStoreDBContext();

            return _instance;
        }
    }
}