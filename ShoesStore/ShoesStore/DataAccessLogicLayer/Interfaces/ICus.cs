using System;
using ShoesStore.DataAccessLogicLayer.Tables_DAO;

namespace ShoesStore.DataAccessLogicLayer.Interfaces
{
    internal interface ICus : IUsr<Cus>
    {
        ICart iCart { get; set; }
        void AddCart(Pro pro);
        void Buy(ICart icart);

    }
}