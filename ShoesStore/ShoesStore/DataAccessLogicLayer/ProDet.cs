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
    public partial class ProDet
    {
        public int ShpId { get; set; }
        public int ProId { get; set; }
        public int ColorId { get; set; }
        public int SizeId { get; set; }
        public virtual Pro Pro { get; set; }
        public virtual ProColor ProColor { get; set; }
        public virtual ProSize ProSize { get; set; }
    }
}
