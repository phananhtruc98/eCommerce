using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Interfaces
{
    internal interface ICus : IUsr<Cus>
    {
        ICart iCart { get; set; }
        void AddCart(Pro pro);
        void Buy(ICart icart);

    }
}