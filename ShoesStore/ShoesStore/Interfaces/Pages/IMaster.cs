using ShoesStore.Interfaces.MasterPage;

namespace ShoesStore.Interfaces.Pages
{
    interface IMaster:IValidation
    {
        bool IsValidLogin();
        bool IsValidRegister();
        bool CheckLoginSession();
    }
}
