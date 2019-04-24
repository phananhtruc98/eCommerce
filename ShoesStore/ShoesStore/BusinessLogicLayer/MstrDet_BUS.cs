using ShoesStore.DataAccessLogicLayer;
using System;
namespace ShoesStore.BusinessLogicLayer
{
    public class MstrDet_BUS : Table_BUS<MstrDet, MstrDet_DAO>
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