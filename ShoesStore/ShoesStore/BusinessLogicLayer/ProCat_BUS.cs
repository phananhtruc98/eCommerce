
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ShoesStore.DataAccessLogicLayer;
namespace ShoesStore.BusinessLogicLayer
{
    class ProCat_BUS:IProCat_BUS
    {
        private IProCat _dao = new ProCat_DAO();

        public void Delete(ProCat obj)
        {
            throw new NotImplementedException();
        }

        public List<ProCat> GetAll()
        {
            return _dao.GetAll();
        }

        public ProCat GetById(int id)
        {
            throw new NotImplementedException();
        }

        public ProCat Insert(ProCat obj)
        {
            throw new NotImplementedException();
        }

        public void Update(ProCat obj)
        {
            throw new NotImplementedException();
        }
    }
}
