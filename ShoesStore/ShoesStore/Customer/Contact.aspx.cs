using System;
using System.Web.UI;
using Utilities;
namespace ShoesStore.Customer
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnGui_OnClick(object sender, EventArgs e)
        {
            Email.SendGmail("toilati123vn@gmail.com", inpChuDe.Value, $"Gửi từ {inpTen.Value} ({inpMail.Value}) với nội dung {inpNoiDung.Value}");
            MyLibrary.Show("Đã gửi thành công", "lien-he");
        }
    }
}