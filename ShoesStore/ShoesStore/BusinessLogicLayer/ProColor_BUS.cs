using System;
using System.Collections.Generic;
using System.Linq;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;

namespace ShoesStore.BusinessLogicLayer
{
    public class ProColor_BUS : Table_BUS<ProColor, ProColor_DAO>, IProColor
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

        public List<ProColor> Filter(ProColor obj)
        {
            throw new NotImplementedException();
        }

        public ProColor GetById(int id)
        {
            return GetAll().FirstOrDefault(x => x.ColorId == id);
        }

        public void SetActive()
        {
            throw new NotImplementedException();
        }
    }
}