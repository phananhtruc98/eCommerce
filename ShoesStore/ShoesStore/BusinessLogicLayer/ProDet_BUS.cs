using System;
using ShoesStore.DataAccessLogicLayer;
namespace ShoesStore.BusinessLogicLayer
{
    public class ProDet_BUS:Table_BUS<ProDet,ProDet_DAO>
    {
        public override bool IsExist(ProDet obj)
        {
            throw new NotImplementedException();
        }
        public override void SetActive(ProDet obj)
        {
            throw new NotImplementedException();
        }
    }
}