using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataSetTableAdapters;


public partial class login : System.Web.UI.Page
{
   

    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }

    protected void login_in_Click(object sender, EventArgs e)
    {

        
        
        //usersTableAdapter adpuser = new usersTableAdapter();
        //login_txt.Visible = false; 
        string pwd = password.Text;
        string acount = account.Text;
        Session["txtname"] = acount; 
        int userid = Int32.Parse(acount);
        usersTableAdapter adpr = new usersTableAdapter();
        var data = adpr.GetDataBy(userid);
            

            if (GridView1.Rows.Count < 1)
            {
            login_txt.Text = "帐号或密码错误";
            login_txt.Visible = true;
            //return ;
            //Response.Redirect("login.aspx");
            }
            else
            {
            var singledata = data.Single();
            int usertype = singledata.use_type;
            
                if (usertype == 2)
                {
                Response.Redirect("admin.aspx");
                }

            Response.Redirect("success.aspx");

            }
        
        

        

    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void account_TextChanged(object sender, EventArgs e)
    {
        
    }

    protected void password_TextChanged(object sender, EventArgs e)
    {
        
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void visit_Click(object sender, EventArgs e)
    {
        Response.Redirect("visit.aspx");
    }
}