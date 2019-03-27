using ShoesStore.DataAccessLogicLayer;
using System.Data.Objects;

namespace ShoesStore.Interfaces
{
    internal interface ICus : IUsr<Cus>
    {
        ICart iCart { get; set; }
        void AddCart(Pro pro);
        void Buy(ICart icart);
        void ActCode();
        bool IsActCode();
        ObjectResult<Cus_Info_Result> Get_Cus_Info();
    }
}