using ShoesStore.Interfaces.MasterPage;

namespace ShoesStore.Interfaces.Pages
{
    internal interface IMaster : IValidation
    {
        bool IsValidLogin();
        bool IsValidRegister();
    }
}