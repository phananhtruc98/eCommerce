//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DTO
{
    using System;
    using System.Collections.Generic;
    
    public partial class ProColor
    {
        public ProColor()
        {
            this.ProDets = new HashSet<ProDet>();
        }
    
        public int ColorId { get; set; }
        public string ColorName { get; set; }
        public string ColorImg { get; set; }
    
        public virtual ICollection<ProDet> ProDets { get; set; }
    }
}
