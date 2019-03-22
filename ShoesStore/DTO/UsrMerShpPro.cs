using System;

namespace DTO
{
    public class UsrMerShpPro
    {
        public int ShpId { get; set; }
        public int ProId { get; set; }
        public int? CatId { get; set; }
        public int? BrandId { get; set; }
        public int? ProQuantity { get; set; }
        public bool? IsOutOfStock { get; set; }
        public int? Unit { get; set; }
        public string ProName { get; set; }
        public string Img { get; set; }
        public string Desc { get; set; }
        public string Price { get; set; }
        public string PriceAfter { get; set; }
        public bool? Active { get; set; }
        public DateTime? DateAdd { get; set; }
        public DateTime? DateEdit { get; set; }
    }
}
