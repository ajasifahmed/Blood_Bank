using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Blood_Bank.Model
{
    public class Donors
    {
        public int D_age { get; set; }
        public string D_email { get; set; }
        public string D_password { get; set; }
        public string D_cninc { get; set; }
        public string D_name { get; set; }
        public string D_contact { get; set; }
        public int D_hostpital { get; set; }
        public string D_blood { get; set; }
    }
}