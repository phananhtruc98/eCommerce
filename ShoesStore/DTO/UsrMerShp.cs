using System;

namespace DTO
{
    public class UsrMerShp
    {
        public int ShpId { get; set; }
        public int? MerId { get; set; }
        public string ShpName { get; set; }
        public DateTime? DateStart { get; set; }
        public bool? Active { get; set; }
    }
}
