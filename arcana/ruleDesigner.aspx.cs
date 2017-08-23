using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace arcana
{
    public partial class ruleDesigner : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack) {
                try
            {
                int ruleID = Convert.ToInt32(Session["currentRules"].ToString());
                SqlDataReader drSave = default(SqlDataReader);
                SqlCommand cmdSave = new SqlCommand();
                cmdSave.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["optical"].ToString());
                cmdSave.Connection.Open();
                cmdSave.CommandText = "select * from tblRulesList left join tblRulesData on tblRulesList.id = tblRulesData.id where tblRulesList.id = "+ruleID+" order by localID";
                drSave = cmdSave.ExecuteReader();
                while(drSave.Read())
                {
                    txtTitle.Text = drSave["title"].ToString();
                    if(drSave["type"].ToString() == "zone")
                    {
                        zoneTracker.Text = zoneTracker.Text + drSave["localID"].ToString() + "," + drSave["locationX"].ToString() + "," + drSave["locationY"].ToString() + ";";
                    }
                    else
                    {
                        textTracker.Text = textTracker.Text + drSave["parent"].ToString() + "," + drSave["localID"].ToString() + "," + drSave["locationX"].ToString() + "," + drSave["locationY"].ToString() + "," + drSave["data"].ToString() + ";";
                    }
                }
            }
            catch(Exception err)
            {}

             }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlDataReader drSave = default(SqlDataReader);
            SqlCommand cmdSave = new SqlCommand();
            cmdSave.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["optical"].ToString());
            cmdSave.Connection.Open();
            cmdSave.CommandText = "insert into tblRulesList (title,owner,gameTags,isPublic) values ('"+ txtTitle.Text + "','"+Session["username"].ToString()+ "','arcana',1); SELECT SCOPE_IDENTITY() as id;";
            drSave = cmdSave.ExecuteReader();
            //for each record in datareader
            string id = "0";
            if (drSave.Read())
            {
                 id = drSave["id"].ToString();
            }
            drSave.Close();
                string[][] sa = new string[2][]; 
                string[] temp = new string[zoneTracker.Text.Split(';').Length];
                string[] temp2 = new string[zoneTracker.Text.Split(';').Length];
                sa[0] = temp;
                sa[1] = temp2;
                foreach (string s in zoneTracker.Text.Split(';'))
                {
                    if(s!="")
                    { 
                        sa[0][Convert.ToInt32(s.Split(',')[0])] = s.Split(',')[1];
                        sa[1][Convert.ToInt32(s.Split(',')[0])] = s.Split(',')[2];
                    }
                }
                int i = 0;
                foreach (string s in sa[0])
                {
                    if(s!=""&& s!=null)
                    {
                        cmdSave.CommandText = "insert into tblRulesData (id,type,locationX,locationY,localID) values ("+id+",'zone',"+s+","+sa[1][i]+","+i+")";
                        cmdSave.ExecuteNonQuery();
                    }
                    i++;
                }
                string[][] sa2 = new string[4][];
                string[] temp3 = new string[textTracker.Text.Split(';').Length];
                string[] temp4 = new string[textTracker.Text.Split(';').Length];
                string[] temp5 = new string[textTracker.Text.Split(';').Length];
                string[] temp6 = new string[textTracker.Text.Split(';').Length];
                sa2[0] = temp3;
                sa2[1] = temp4;
                sa2[2] = temp5;
                sa2[3] = temp6;
            foreach (string s in textTracker.Text.Split(';'))
                {
                    if (s != "")
                    {
                        sa2[0][Convert.ToInt32(s.Split(',')[1])] = s.Split(',')[2];
                        sa2[1][Convert.ToInt32(s.Split(',')[1])] = s.Split(',')[3];
                        sa2[2][Convert.ToInt32(s.Split(',')[1])] = s.Split(',')[4];
                        sa2[3][Convert.ToInt32(s.Split(',')[1])] = s.Split(',')[0];
                }
                }
                i = 0;
                foreach (string s in sa2[0])
                {
                if (s != "" && s != null)
                {
                        cmdSave.CommandText = "insert into tblRulesData (id,type,parent,locationX,locationY,data,localID) values (" + id + ",'text',"+(Convert.ToInt32(sa2[3][i]))+"," + s + "," + sa2[1][i] + ",'"+ sa2[2][i] + "'," + i + ")";
                        cmdSave.ExecuteNonQuery();
                    }
                    i++;
                }
            zoneTracker.Text = "";
            textTracker.Text = "";
            Session["currentRules"] = Convert.ToInt32(id);
            Response.Redirect("ruleDesigner");

            //cmdSave.CommandText = "(select * from tblArcanaHeading ) union (select * from tblArcanaAbout) union (select * from tblArcanaRules ) union (select * from tblDonate)";
        }
    }
}