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
    using System.Collections.Generic;
    
    public partial class RcptBuyStaDet
    {
        public int StaId { get; set; }
        public int RcptBuyId { get; set; }
        public int StepId { get; set; }
        public Nullable<System.DateTime> AddDate { get; set; }
    
        public virtual RcptBuySta RcptBuySta { get; set; }
        public virtual RcptBuyStaStep RcptBuyStaStep { get; set; }
    }
}
