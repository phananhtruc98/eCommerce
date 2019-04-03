namespace ShoesStore.DataAccessLogicLayer
{
    public class DataProvider
    {
        private static ShoesStoreDBContext _instance;
        private static readonly object _syncLock = new object();
        protected DataProvider()
        {
        }

        public static ShoesStoreDBContext Instance
        {
            // Uses lazy initialization.

            // Note: this is not thread safe.
            get
            {

                if (_instance == null)
                {
                    lock (_syncLock)
                    {
                        if (_instance == null)
                        {
                            _instance = new ShoesStoreDBContext();
                        }
                    }
                }

                return _instance;
            }
        }
    }
}