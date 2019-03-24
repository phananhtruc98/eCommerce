using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class DataProvider
    {
        private static ShoesStoreDBContext _instance;
        protected DataProvider()
        {

        }
        public static ShoesStoreDBContext Instance()
        {
            if (_instance == null)
            {
                _instance = new ShoesStoreDBContext();
            }

            return _instance;
        }
    }
}
