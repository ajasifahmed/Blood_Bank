using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Blood_Bank.Model
{
    public class Comments
    {
        public string com_txt { get; set; }
        public int com_fk_on { get; set; }
        public int com_fk_from { get; set; }
    }
}