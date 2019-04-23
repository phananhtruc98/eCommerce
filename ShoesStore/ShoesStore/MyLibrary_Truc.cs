using System.Collections.Generic;
using System.Text;

namespace ShoesStore
{
    public partial class MyLibrary
    {
        public static bool IsValidEmailAddress(string email)
        {
            try
            {
                var emailChecked = new System.Net.Mail.MailAddress(email);
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static string DrawStar(int star)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" <div class='rating__body'>");
            for (int i = 1; i <= 5; i++)
            {
                string hasStar=(i<=star)?"rating__star--active":"";
                sb.Append($@"<svg
                                                                                class='rating__star {hasStar}'
                                                                                width='13px' height='12px'>
                                                                                <g class='rating__fill'>
                                                                                    <use
                                                                                        href='/images/sprite.svg#star-normal'>
                                                                                    </use>
                                                                                </g>
                                                                                <g class='rating__stroke'>
                                                                                    <use
                                                                                        href='/images/sprite.svg#star-normal-stroke'>
                                                                                    </use>
                                                                                </g>
                                                                            </svg>
                                                                            <div
                                                                                class='rating__star rating__star--only-edge rating__star--active'>
                                                                                <div class='rating__fill'>
                                                                                    <div class='fake-svg-icon'></div>
                                                                                </div>
                                                                                <div class='rating__stroke'>
                                                                                    <div class='fake-svg-icon'></div>
                                                                                </div>
                                                                            </div>");
            }

            sb.Append("</div>");
            //string s = "";
            //List<string> list = new List<string>();

            //for (int i = 0; i < star; i++)
            //{
            //    list.Add("*");
            //}
            //s = string.Join(Environment.NewLine, list.ToArray());
            //return s;
            return sb.ToString();
        }
        public static string DisplayImg (List<string> lst)
        {
            string s = "";
            string p = "";
            foreach(string item in lst)
            {
                p = "<img class='img-thumbnail' style='width:50px; height:50px' src= '/images/products/kickz/UltraBoost 19/slides/" + item + "'>";
                s = s + p;
            }
            return s;
        }

    }


}