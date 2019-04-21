using ShoesStore.Interfaces;
using System;

namespace ShoesStore.DataAccessLogicLayer
{
    public class MstrDet_DAO : Table_DAO<MstrDet>, IMstrDet
    {
        public override bool IsExist(MstrDet obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(MstrDet obj)
        {
            throw new NotImplementedException();
        }
    }
}