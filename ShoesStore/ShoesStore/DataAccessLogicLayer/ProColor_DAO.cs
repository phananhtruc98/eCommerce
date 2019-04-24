using System;
using ShoesStore.Interfaces;

namespace ShoesStore.DataAccessLogicLayer
{
    public class ProColor_DAO : Table_DAO<ProColor>, IProColor
    {
        public ProColor GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public int GetLastestId()
        {
            throw new NotImplementedException();
        }

        public override bool IsExist(ProColor obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(ProColor obj)
        {
            throw new NotImplementedException();
        }
    }
}