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
    
    public partial class RcptBuy
    {
        public RcptBuy()
        {
            this.RcptBuyDet = new HashSet<RcptBuyDet>();
            this.RcptBuySta = new HashSet<RcptBuySta>();
        }
    
        public int RcptBuyId { get; set; }
        public int ShpId { get; set; }
        public int CusId { get; set; }
        public string CusMessage { get; set; }
        public string MerMessage { get; set; }
        public Nullable<int> CusPoint { get; set; }
        public Nullable<int> MerPoint { get; set; }
    
        public virtual Cus Cus { get; set; }
        public virtual Rcpt Rcpt { get; set; }
        public virtual Shp Shp { get; set; }
        public virtual RcptBuyStaDet RcptBuyStaDet { get; set; }
        public virtual ICollection<RcptBuyDet> RcptBuyDet { get; set; }
        public virtual ICollection<RcptBuySta> RcptBuySta { get; set; }
    }
}
