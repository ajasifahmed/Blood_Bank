using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Blood_Bank
{
    public partial class _default : System.Web.UI.Page
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
           
            if (!IsPostBack)
            {
                DataTable dt = getData();
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
                //
                
          
                //

            }

        }
        DataTable getData()
        {
            SqlConnection con = new SqlConnection(cs);
            string q = "sp_getProfile";
            SqlDataAdapter sda = new SqlDataAdapter(q, con);
            DataTable data = new DataTable();
            sda.Fill(data);
            return data;
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            DataTable dt = getData();
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }
    }
}