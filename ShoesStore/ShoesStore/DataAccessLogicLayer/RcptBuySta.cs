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
    
    public partial class RcptBuySta
    {
        public RcptBuySta()
        {
            this.RcptBuyStaDet = new HashSet<RcptBuyStaDet>();
        }
    
        public int StaId { get; set; }
        public int RcptBuyId { get; set; }
    
        public virtual RcptBuy RcptBuy { get; set; }
        public virtual ICollection<RcptBuyStaDet> RcptBuyStaDet { get; set; }
    }
}
