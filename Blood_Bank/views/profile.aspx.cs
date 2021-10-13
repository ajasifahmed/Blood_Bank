using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Blood_Bank.Model;
using System.IO;
namespace Blood_Bank.views
{
    public partial class profile : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("~/views/login.aspx");
            }
            if (!IsPostBack)
            {
               
                SqlConnection con = new SqlConnection(cs);

                string email = Session["email"].ToString();
                string q = "sp_Demo";
                SqlCommand command = new SqlCommand(q, con);

                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@email", email);

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
        void showImage()
        {
            SqlConnection con = new SqlConnection(cs);
            int id = Convert.ToInt32(Session["id"]);
            string q = "select * from Donor_Img where d_id=@d_id";
            SqlCommand command = new SqlCommand(q, con);
            command.Parameters.AddWithValue("@d_id", id);
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
                //Response.Write("<script>alert('--')</script>");
            }
            con.Close();
            //SqlDataAdapter sda = new SqlDataAdapter(q, con);
            //DataTable data = new DataTable();
            //sda.Fill(data);
            //Image1.ImageUrl = data.Rows[0]["img_path"].ToString();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            /////

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            DonorImage DI = new DonorImage();
            DI.d_id = Convert.ToInt32(Session["id"]);
            string im_path = Server.MapPath("~/img/");
            if (FileUpload1.HasFile)
            {
                string filename = Path.GetFileName(FileUpload1.FileName);
                string extension = Path.GetExtension(filename);
                HttpPostedFile postedFile = FileUpload1.PostedFile;
                int lenght = postedFile.ContentLength;
                if (extension.ToLower() == ".png" || extension.ToLower() == ".jpg")
                {
                    if (lenght <= 1000000)//
                    {
                        FileUpload1.SaveAs(im_path + filename);
                        DI.img_path = "~/img/" + filename;


                    }
                    else
                    {
                        Response.Write("<script>alert('File must be 2MB maximun!')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('File must be in .png or jpg!')</script>");
                }
            }
            else
            {
                //DI.img_path = "~/img/profile-icon-9.png";
                Response.Write("<script>alert('Please upload an image!')</script>");
            }
            Insert i = new Insert();

            string getmsg = i.insertDonorImage(DI);
            if (getmsg == "-1")
            {
                Response.Write("<script>alert('ERROR!')</script>");

            }
            else
            {
                //Response.Write("<script>alert('DONE!')</script>");
               // Response.Redirect("~/views/profile.aspx");
                showImage();
            }

        }
    }
}