using ShoesStore.Facebook;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Customer
{
    public partial class CallBack : System.Web.UI.Page
    {
        public const string FaceBookAppKey = "2062955750677936";
        private char[] userInfo;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["access_token"])) return; //ERROR! No token returned from Facebook!!

            //let's send an http-request to facebook using the token            
            string json = GetFacebookUserJSON(Request.QueryString["access_token"]);


            //and Deserialize the JSON response
            JavaScriptSerializer js = new JavaScriptSerializer();

            FacebookUser oUser = js.Deserialize<FacebookUser>(json);
            if (oUser != null)
            {
                Response.Write("Welcome, " + oUser.name);
                // Response.Write("<br />id, " + oUser.id);
                Response.Write("<br />Email : " + oUser.email);
                Response.Write("<br />First_name: " + oUser.first_name);
                Response.Write("<br />Last_name: " + oUser.last_name);
                Response.Write("<br />Gender: " + oUser.gender);
                Response.Write("<br />Link: " + oUser.link);

            }

        }
        private static string GetFacebookUserJSON(string access_token)
        {
            string url = string.Format("https://graph.facebook.com/me?access_token={0}&fields=email,name,first_name,last_name,link,birthday,cover,devices,gender", access_token);

            WebClient wc = new WebClient();
            Stream data = wc.OpenRead(url);
            StreamReader reader = new StreamReader(data);
            string s = reader.ReadToEnd();
            data.Close();
            reader.Close();

            return s;
        }
    }
}