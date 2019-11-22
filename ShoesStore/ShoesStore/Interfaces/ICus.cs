using System.Data.Objects;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Interfaces
{
    internal interface ICus : IUsr<Cus>
    {
        ICart iCart { get; set; }
        void ActCode();
        void AddCart(Pro pro);
        void Buy(ICart icart);
        ObjectResult<sp_Cus_Info_Result> Get_Cus_Info();
        bool IsActCode();
    }
}