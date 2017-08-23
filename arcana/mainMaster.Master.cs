using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace arcana
{
    public partial class mainMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblusername.Text = "Welcome " + Session["username"].ToString(); // either writes welcome USERNAME or throws null reference error and skips to catch block meaning they are not logged in
                lblusername.Visible = true;//make welcome visible
            }
            catch
            {
                btnLogin.Visible = true;//if they arent logged in then make login button visible
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login");
        }
    }
}