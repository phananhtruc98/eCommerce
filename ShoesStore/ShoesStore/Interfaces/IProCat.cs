using System.Collections.Generic;
using System.Web.UI;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Interfaces
{
    public interface IProCat : ITableOnePrimary<ProCat>
    {
        /// <summary>
        /// Lấy top n nhóm sản phẩm được mua nhiều nhất
        /// +Liên hệ đến danh sách hóa đơn
        /// </summary>
        /// <param name="n"></param>
        /// <returns>Danh sách nhóm sản phẩm</returns>
        List<ProCat> GetPopularProCats(int n);
    }
}