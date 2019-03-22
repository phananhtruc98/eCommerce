using System;

namespace DTO
{
    public class UsrMerShpProCat
    {
        public int CatId { get; set; }
        public string CatName { get; set; }
        public bool? Active { get; set; }
        public DateTime? DateAdd { get; set; }
        public DateTime? DateEdit { get; set; }
    }
}
