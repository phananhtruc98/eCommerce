//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ShoesStore.DataAccessLogicLayer
{
    using System;
    
    public partial class sp_Usr_Select_Result
    {
        public int UsrId { get; set; }
        public string UsrName { get; set; }
        public string Avatar { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        public string PasswordForget { get; set; }
        public bool Active { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public System.DateTime DateAdd { get; set; }
        public Nullable<System.DateTime> DateEdit { get; set; }
    }
}
