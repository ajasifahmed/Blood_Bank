using Blood_Bank.Model;
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
    public partial class view_profile : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        void getCommnets()
        {
            SqlConnection con = new SqlConnection(cs);
            HiddenField1.Value = Request.QueryString["view"];
            string q = "select a.com_id,a.com_txt,bb.d_name,a.com_date,c.img_path from Comments as a inner join User_Donors as b on a.com_fk_on = b.d_id inner join User_Donors as bb on a.com_fk_from = bb.d_id inner join Donor_Img as c on c.d_id = bb.d_id where com_fk_on =" + HiddenField1.Value + "order by a.com_id desc";
            SqlDataAdapter sda = new SqlDataAdapter(q, con);
            DataTable data = new DataTable();
            sda.Fill(data);
            Repeater1.DataSource = data;
            Repeater1.DataBind();
        }
        void showImage()
        {
            SqlConnection con = new SqlConnection(cs);
            HiddenField1.Value = Request.QueryString["view"];
            // int id = Convert.ToInt32(Session["id"]);
            string q = "select * from Donor_Img where d_id=@d_id";
            SqlCommand command = new SqlCommand(q, con);
            command.Parameters.AddWithValue("@d_id", HiddenField1.Value);
            con.Open();
            SqlDataReader dr = command.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {

                    Image1.ImageUrl = dr.GetValue(1).ToString();

                }
            }
            else
            {

                Image1.ImageUrl = "~/img/profile-icon-9.png";
            }
            con.Close();

        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            getCommnets();
            if (!IsPostBack)
            {

                HiddenField1.Value = Request.QueryString["view"];
                SqlConnection con = new SqlConnection(cs);
                string q = "sp_view_profile";
                SqlCommand command = new SqlCommand(q, con);

                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@id", HiddenField1.Value);

                con.Open();
                SqlDataReader dr = command.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Label1.Text = dr.GetValue(0).ToString();
                        Label2.Text = dr.GetValue(1).ToString();
                        Label3.Text = dr.GetValue(2).ToString();
                        Label4.Text = dr.GetValue(3).ToString();
                        Label5.Text = dr.GetValue(4).ToString();
                        Label6.Text = dr.GetValue(5).ToString();
                        Label7.Text = dr.GetValue(6).ToString();

                    }
                }
                else
                {
                    Response.Write("<script>alert('Not found!')</script>");
                }
                con.Close();
                showImage();
            }
            if (IsPostBack)
            {
                showImage();
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Comments comments = new Comments()
                {
                    com_txt = TextBox1.Text,
                    com_fk_from = Convert.ToInt32(Session["id"]),
                    com_fk_on = Convert.ToInt32(HiddenField1.Value)
                };
                Insert i = new Insert();
                string getmsg = i.insert_commnet(comments);
                if (getmsg == "-1")
                {
                    Response.Write("<script>alert('ERROR!')</script>");

                }
                else
                {
                    TextBox1.Text = "";
                    getCommnets();
                    //Response.Write("<script>alert('DONE!')</script>");
                }
            }
            else
            {
                 Response.Redirect("~/views/login.aspx");
                
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            getCommnets();
        }
    }
}