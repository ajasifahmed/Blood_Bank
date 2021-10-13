using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Blood_Bank.Model
{

    public class Insert
    {

        private string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        public string insert_commnet(Comments comments)
        {
            string msg = "-1";
            SqlConnection con = new SqlConnection(cs);
            try
            {

                string query = "sp_insert_comment";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@com_txt", comments.com_txt);
                cmd.Parameters.AddWithValue("@com_fk_on", comments.com_fk_on);
                cmd.Parameters.AddWithValue("@com_fk_from", comments.com_fk_from);
                con.Open();
                msg = cmd.ExecuteNonQuery().ToString();
            }
            catch (Exception)
            {


            }
            finally
            {
                con.Close();

            }

            return msg;

        }

        public string isnsert_donor(Donors d)
        {
            string msg = "-1";
            SqlConnection con = new SqlConnection(cs);
            try
            {

                string query = "sp_insert_donor";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@d_email", d.D_email);
                cmd.Parameters.AddWithValue("@d_password", d.D_password);
                cmd.Parameters.AddWithValue("@d_cninc", d.D_cninc);
                cmd.Parameters.AddWithValue("@d_name", d.D_name);
                cmd.Parameters.AddWithValue("@d_age", d.D_age);
                cmd.Parameters.AddWithValue("@d_hospital", d.D_hostpital);
                cmd.Parameters.AddWithValue("@d_contact", d.D_contact);
                cmd.Parameters.AddWithValue("@d_blood", d.D_blood);

                con.Open();
                msg = cmd.ExecuteNonQuery().ToString();
            }
            catch (Exception)
            {


            }
            finally
            {
                con.Close();
              
            }

            return msg;

        }
        public string insertDonorImage(DonorImage donorImage)
        {
            string msg = "-1";
            SqlConnection con = new SqlConnection(cs);
            try
            {

                string query = "sp_insert_img";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@img_path", donorImage.img_path);
                cmd.Parameters.AddWithValue("@d_id", donorImage.d_id);
                con.Open();
                msg = cmd.ExecuteNonQuery().ToString();
            }
            catch (Exception)
            {


            }
            finally
            {
                con.Close();
            }
            return msg;
        }
    }
}