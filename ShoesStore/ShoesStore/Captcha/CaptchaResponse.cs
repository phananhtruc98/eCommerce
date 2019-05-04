using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;
namespace ShoesStore.Captcha
{
    public class CaptchaResponse
    {

        [JsonPropertyAttribute("success")]
        public bool Success { get; set; }
        [JsonPropertyAttribute("error-codes")]
        public List<string> ErrorCodes { get; set; }
    }
}