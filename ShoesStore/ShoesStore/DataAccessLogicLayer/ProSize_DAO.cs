using ShoesStore.Interfaces;
using System;
namespace ShoesStore.DataAccessLogicLayer
{
    public class ProSize_DAO : Table_DAO<ProSize>, IProSize
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