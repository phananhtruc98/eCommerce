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
    
    public partial class Sub
    {
        public Sub()
        {
            this.SubDets = new HashSet<SubDet>();
        }
    
        public int SubId { get; set; }
        public string SubContent { get; set; }
        public int DurDay { get; set; }
        public string Price { get; set; }
    
        public virtual ICollection<SubDet> SubDets { get; set; }
    }
}
