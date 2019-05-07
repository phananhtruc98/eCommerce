using System;
using System.Collections.Generic;
using System.Linq;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.BusinessLogicLayer
{
    public class ProSlide_BUS : Table_BUS<ProSlide, ProSlide_DAO>
    {
        public override bool IsExist(ProSlide obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(ProSlide obj)
        {
            throw new NotImplementedException();
        }

        public List<ProSlide> GetProSlides(Pro pro)
        {
            return GetAll().Where(m => m.ProId == pro.ProId && m.ShpId == pro.ShpId).ToList();
        }
    }
}