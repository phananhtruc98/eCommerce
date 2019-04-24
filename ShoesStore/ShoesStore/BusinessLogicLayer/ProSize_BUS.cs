using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using System;
namespace ShoesStore.BusinessLogicLayer
{
    public class ProSize_BUS : Table_DAO<ProSize>, IProSize
    {
        public ProSize GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }
        public int GetLastestId()
        {
            throw new NotImplementedException();
        }
        public override bool IsExist(ProSize obj)
        {
            throw new NotImplementedException();
        }
        public override void SetActive(ProSize obj)
        {
            throw new NotImplementedException();
        }
    }
}