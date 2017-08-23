using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace arcana
{
    public partial class mainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RadButton1_Click(object sender, EventArgs e)
        {
            if(RadTextBox1.Text!="")
            {
Session["currentRules"] = Convert.ToInt32(RadTextBox1.Text);
            }
            
            Response.Redirect("ruleDesigner");
        }
    }
}