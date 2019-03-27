namespace ShoesStore.DataAccessLogicLayer
{
    public class DataProvider
    {
        private static ShoesStoreDBContext _instance = null;

        protected DataProvider()
        {
            var db = new ShoesStoreDBContext();
        }

        public static ShoesStoreDBContext Instance()
        {
            return _instance ?? new ShoesStoreDBContext();
        }
    }
}