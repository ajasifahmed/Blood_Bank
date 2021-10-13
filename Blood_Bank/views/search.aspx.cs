using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Blood_Bank.views
{
    public partial class search : System.Web.UI.Page
    {
        private string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected string get(object obj)
        {
            SqlConnection con = new SqlConnection(cs);
            string q = "select count(com_id) from Comments where com_fk_on=@obj";
            SqlCommand cmd = new SqlCommand(q, con);
            cmd.Parameters.AddWithValue("@obj", obj);
            con.Open();
            string a = cmd.ExecuteScalar().ToString();
            con.Close();
            return a;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string q = "select a.d_id,a.d_name,a.d_email,a.d_age,a.d_contact,a.d_blood,b.host_name,c.img_path from User_Donors as a inner join Hospitals as b on A.d_hospital = B.host_id inner join Donor_Img as c on A.d_id = C.d_id where b.host_id = " + DropDownList1.SelectedValue + "and a.d_blood ='" + DropDownList2.SelectedItem + "'order by a.d_id";

            string q2 = "select count(a.d_id) from User_Donors as a inner join Hospitals as b on A.d_hospital = B.host_id inner join Donor_Img as c on A.d_id = C.d_id where b.host_id = " + DropDownList1.SelectedValue + "and a.d_blood ='" + DropDownList2.SelectedItem + "'";
            SqlCommand cmd = new SqlCommand(q2,con);
            con.Open();
            int count = (int)cmd.ExecuteScalar();
            con.Close();
            Label7.Text = "Records found="+count.ToString();
            SqlDataAdapter sda = new SqlDataAdapter(q, con);
            DataTable data = new DataTable();
            sda.Fill(data);
            Repeater1.DataSource = data;
            Repeater1.DataBind();
        }
    }
}