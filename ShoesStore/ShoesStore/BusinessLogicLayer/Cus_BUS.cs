using System;
using System.Collections.Generic;
using System.Data.Objects;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using System.Linq;
namespace ShoesStore.BusinessLogicLayer
{
    public class Cus_BUS : Table_BUS<Cus, Cus_DAO>, ICus
    {
        public UsrAct_DAO UsrAct { get; set; }

        public UsrAct GetUsrAct(int usrId)
        {
            throw new NotImplementedException();
        }

        public void Register(Cus obj)
        {
            throw new NotImplementedException();
        }

        public void CreateActCode(Cus obj)
        {
            throw new NotImplementedException();
        }

        public ICart iCart { get; set; }

        public void AddCart(Pro pro)
        {
            throw new NotImplementedException();
        }

        public void Buy(ICart icart)
        {
            throw new NotImplementedException();
        }

        public void ActCode()
        {
            throw new NotImplementedException();
        }

        public bool IsActCode()
        {
            throw new NotImplementedException();
        }

        Cus IUsr<Cus>.Login(string login, string pwd)
        {
            throw new NotImplementedException();
        }

        public ObjectResult<sp_Cus_Info_Result> Get_Cus_Info()
        {
            return _dao.Get_Cus_Info();
        }

        public List<Cus> Filter(Cus obj)
        {
            throw new NotImplementedException();
        }

        public Cus GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public int GetLastestId()
        {
            throw new NotImplementedException();
        }

        public Cus Login(string username, string password)
        {
            Usr usr = MyLibrary.Usr_BUS.Login(username, password);
            if (usr != null)
                return GetAll().FirstOrDefault(cus => cus.CusId == usr.UsrId);
            return null;
        }

        public void SetActive()
        {
            throw new NotImplementedException();
        }

        public override bool IsExist(Cus obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(Cus obj)
        {
            throw new NotImplementedException();
        }

        System.Data.Objects.ObjectResult<sp_Cus_Info_Result> ICus.Get_Cus_Info()
        {
            throw new NotImplementedException();
        }
        public int AverageStar(Cus obj)
        {
            try
            {


                var doub = MyLibrary.RcptBuyDet_BUS.GetAll().Where(m => m.RcptBuy.CusId == obj.CusId)
                    .Where(m => m.RcptBuy.MerMessage != null)
                    .Average(m => m.RcptBuy.MerPoint);
                return doub == null ? 0 : Convert.ToInt32(doub);
            }

            catch
            {
                return 0;
            }
        }
    }
}