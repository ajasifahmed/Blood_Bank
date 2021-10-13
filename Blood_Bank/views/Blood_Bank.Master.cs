using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Blood_Bank.views
{
    public partial class Blood_Bank : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"]==null)
            {
                LinkButton1.Text="Login";
                LinkButton2.Text = "SIGNUP";
            }
            else
            {
                LinkButton1.Text =Session["username"].ToString();
                LinkButton2.Text = "LOGOUT";
            }
           
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (Session["username"]==null)
            {
                Response.Redirect("~/views/login.aspx");
            }
            else
            {
                Response.Redirect("~/views/profile.aspx");
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("~/views/signup.aspx");
            }
            else
            {
                Response.Redirect("~/views/logout.aspx");
            }

        }
    }
}