using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataSetTableAdapters;

public partial class success : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void return_login_Click(object sender, EventArgs e)//返回登录界面
    {
        Response.Redirect("login.aspx");
    }

    protected void borrowButton_Click(object sender, EventArgs e) //查询借阅信息按钮
    {
        int nameid = Int32.Parse(Session["txtname"].ToString());
        if(GridView3.Rows.Count <= 0)
        {
            borrowMsg.Text = "没有借阅任何书籍";
            borrowMsg.Visible = true;
        }
        else
        {
            GridView3.Visible = true;
            GridView3.DataBind(); //刷新借阅信息
        }
       

    }

    protected void personal_Click(object sender, EventArgs e)//查询个人信息按钮
    {
        borrowMsg.Visible = false;
        GridView2.Visible = true;
        GridView2.DataBind(); //刷新个人信息
    }

    protected void search_book_Click(object sender, EventArgs e)//搜索书籍按钮
    {
        Label1.Visible = false;
        DetailsView1.Visible = false;
    }
     protected void btnDelOne_Click(object sender, EventArgs e)//查询书籍位置按钮
    {
        Button btn = (Button)sender;

        string id = btn.CommandArgument;
        
        Session["id"] = id;//获取书籍id
        DetailsView1.Visible = true;//书籍位置信息
        
    }
   
    protected void btnborrow_Click(object sender, EventArgs e)//借阅书籍按钮
    {
        borrowMsg.Visible = false;
        Label1.Visible = false;
        Button btn = (Button)sender;
        //int row = ((GridViewRow)((Button)sender).NamingContainer).RowIndex;
        string id = btn.CommandArgument;
        Session["id"] = id; //获取书籍id
        
        int bookid = Int32.Parse(id);
        int nameid = Int32.Parse(Session["txtname"].ToString());
        string time = DateTime.Now.ToString();
        int days = 90;
        string return_time = DateTime.Now.AddDays(days).ToString();

        borrowTableAdapter adprbook = new borrowTableAdapter();
        book_tableTableAdapter adpr = new book_tableTableAdapter();
        usersTableAdapter adpruser = new usersTableAdapter();
        var data = adpr.GetDataBy(bookid);//获取剩余书本量
        var singledata = data.Single();
        int left = singledata.left;
        var userdata = adpruser.GetDataBy(nameid);//获取余额
        var singleuserdate = userdata.Single();
        double wallet = singleuserdate.wallet;

        double cost = days * 0.01;
        
        if (left == 0)// 书籍剩余量为0，借阅失败
        {
            Label1.Text = "剩余量为0，无法借阅";
            Label1.Visible = true;
        }
        else
        {
            if (wallet < cost) //余额不足 借阅失败
            {
                Label1.Text = "余额不足";
                Label1.Visible = true;
            }

            else
            {
                 try
                 {
                     adprbook.InsertQuery(bookid, nameid, time,90,return_time);
                     GridView3.Visible = true;   
                     left = left - 1 ;
                     adpr.Updateleft(left,bookid);
                     GridView3.DataBind();//刷新借阅信息
                     GridView1.DataBind();//刷新书籍信息
                     wallet = wallet - cost;
                     adpruser.walletupdate(wallet,nameid);
                     GridView2.DataBind();//刷新个人信息
                 }
                 catch//已经借阅了此书，借阅失败
                {
                     Label1.Text = "已经借阅了此书，不能重复借阅";
                     Label1.Visible = true;
                     GridView3.Visible = true;
                 }

            }
           
        }
       
        
    }

    protected void bookinformation_Click(object sender, EventArgs e)//显示书籍详情按钮
    {

        Button btn = (Button)sender;
        string id = btn.CommandArgument;
        Session["id"] = id;
        DetailsView2.Visible = true;//书籍信息

    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }



    protected void GridView1_SelectedIndexChanged2(object sender, EventArgs e)
    {
        
    }

    protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void location_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void SqlDataSource3_Selecting1(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }



    protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

   
}