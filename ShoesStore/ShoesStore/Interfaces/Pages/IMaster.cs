using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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
