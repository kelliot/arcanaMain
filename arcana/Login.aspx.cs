using System;
using System.Configuration;
using System.Data.SqlClient;

namespace opticallwebsite
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void RadLogin_Click(object sender, EventArgs e)
        {
            SqlCommand cmdSelectAbout = new SqlCommand();
            SqlDataReader drAbout = default(SqlDataReader);
            cmdSelectAbout.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["optical"].ToString());
            cmdSelectAbout.Connection.Open();
            cmdSelectAbout.CommandText = "select * from tblUserList where username = '" + txtusername.Text + "'  and password = '" + txtpassword.Text + "'";

            drAbout = cmdSelectAbout.ExecuteReader();
            if (drAbout.Read())
            {
                Session["username"] = txtusername.Text;
                Response.Redirect("~/mainPage.aspx");
            }
            else
            {
                lblincorrect.Visible = true;
                lblincorrect.Text = "Username or password incorrect please try again";
            }

        }

        protected void RadCreateUser_Click(object sender, EventArgs e)
        {
            SqlCommand cmdSelectAbout = new SqlCommand();
            SqlDataReader drAbout = default(SqlDataReader);
            cmdSelectAbout.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["optical"].ToString());
            cmdSelectAbout.Connection.Open();
            cmdSelectAbout.CommandText = "select * from tblUserList where username = '" + txtusername.Text + "'";

            drAbout = cmdSelectAbout.ExecuteReader();
            if (drAbout.Read())
            {
                lblincorrect.Visible = true;
                lblincorrect.Text = "Sorry this username already exists";
            }
            else
            {
                SqlCommand cmdSelectAbout2 = new SqlCommand();
                cmdSelectAbout2.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["optical"].ToString());
                cmdSelectAbout2.Connection.Open();
                cmdSelectAbout2.CommandText = "insert into tblUserList (username,password) values ('" + txtusername.Text + "','" + txtpassword.Text + "')";
                cmdSelectAbout2.ExecuteNonQuery();
                Session["username"] = txtusername.Text;
                Response.Redirect("~/mainPage.aspx");

            }

        }
    }
}