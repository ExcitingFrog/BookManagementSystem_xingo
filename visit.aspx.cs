using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class visit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void return_index_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }

    protected void btnborrow_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;

        string id = btn.CommandArgument;
        Session["id"] = id;

        DetailsView1.Visible = true;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
        DetailsView1.Visible = false;

    }
}