using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;

namespace Blood_Bank.views
{
    public partial class login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(cs);

            string query = "select *from User_Donors where d_email=@d_email and d_password=@d_password ";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@d_email", TextBox1.Text);
            cmd.Parameters.AddWithValue("@d_password", TextBox2.Text);

            //cmd2.Parameters.AddWithValue("@d_email",TextBox1.Text);

            MailAddress addr = new MailAddress(TextBox1.Text);
            string username = addr.User;
            Session["username"] = username;
            Session["email"] = TextBox1.Text;


            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    Session["name"] = dr.GetValue(4).ToString();
                    Session["id"] = dr.GetValue(0).ToString();
                }
                con.Close();
                //TO STORE NULL IMAGE
                string q2 = "insert into Donor_Img values('~/img/profile-icon-9.png',@id)";
                string q3 = "select count(@id) from Donor_Img where d_id=@id";

                SqlCommand cmd2 = new SqlCommand(q2, con);
                cmd2.Parameters.AddWithValue("@id", Session["id"]);

                SqlCommand cmd3 = new SqlCommand(q3, con);
                cmd3.Parameters.AddWithValue("@id", Session["id"]);

                con.Open();
                int count = Convert.ToInt32(cmd3.ExecuteScalar());
                if (count == 0)
                {
                    int a = cmd2.ExecuteNonQuery();
                    if (a > 0)
                    {
                        Response.Write("<script>alert('ok!')</script>");

                    }
                    else
                    {
                        Response.Write("<script>alert('not!')</script>");

                    }
                }
                con.Close();

                //
                //
                Response.Redirect("~/default.aspx");
            }
            else
            {
                Response.Write("<script>alert('ERROR!')</script>");
            }
            con.Close();

        }
    }
}