﻿using System;
using System.IO;
using System.Net;
using System.Web.Script.Serialization;
using System.Web.UI;
using ShoesStore.Facebook;

namespace ShoesStore.Customer
{
    public partial class CallBack : Page
    {
        public const string FaceBookAppKey = "2062955750677936";
        private char[] userInfo;

        private static string GetFacebookUserJSON(string access_token)
        {
            var url = string.Format(
                "https://graph.facebook.com/me?access_token={0}&fields=email,name,first_name,last_name,link,birthday,cover,devices,gender",
                access_token);

            var wc = new WebClient();
            var data = wc.OpenRead(url);
            var reader = new StreamReader(data);
            var s = reader.ReadToEnd();
            data.Close();
            reader.Close();

            return s;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["access_token"]))
                return; //ERROR! No token returned from Facebook!!

            //let's send an http-request to facebook using the token            
            var json = GetFacebookUserJSON(Request.QueryString["access_token"]);


            //and Deserialize the JSON response
            var js = new JavaScriptSerializer();

            var oUser = js.Deserialize<FacebookUser>(json);
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
    }
}