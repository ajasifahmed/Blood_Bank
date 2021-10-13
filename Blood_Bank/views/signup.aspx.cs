using Blood_Bank.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Blood_Bank.Views
{
    
    public partial class signup : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<int> li = new List<int>();
                for (int i = 18; i <=50; i++)
                {
                    li.Add(i);
                }
                DropDownList3.DataSource = li;
                DropDownList3.DataBind();
                ListItem selectItem = new ListItem("select age", "select age");
                selectItem.Selected = true;
                DropDownList3.Items.Insert(0, selectItem);
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Donors donors = new Donors();
            donors.D_email = txtemail.Text;
            donors.D_age = Convert.ToInt32(DropDownList3.SelectedValue);
            donors.D_password = txtpassword.Text;
            donors.D_cninc = txtcnic.Text;
            donors.D_name = txtname.Text;
            donors.D_contact = TXTCONTCT.Text;
            donors.D_hostpital = Convert.ToInt32(DropDownList2.SelectedValue);
            donors.D_blood=DropDownList1.SelectedItem.ToString();
            Insert i = new Insert();
           string getmsg= i.isnsert_donor(donors);
            if (getmsg=="-1")
            {
                Response.Write("<script>alert('ERROR!')</script>");

            }
            else
            {
                //Response.Write("<script>alert('DONE!')</script>");
                //Response.Redirect("~/views/login.aspx");
            }
        }
    }
}