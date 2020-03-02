using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataSetTableAdapters;


public partial class admin : System.Web.UI.Page
{

    
   
    protected void Page_Load(object sender, EventArgs e)
    {
       // bookGridView.DataBind();
    }

    protected void usersGridView_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void return_login_Click(object sender, EventArgs e)//返回登录界面
    {
        Response.Redirect("login.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)//查询所有用户
    {

        //usersGridView.DataSource = usersSqlDataSource;
        usersGridView.Visible = true;

        Label_name.Visible = true;
        Label_nameid.Visible = true;
        Label_pwd.Visible = true;
        Label_usetype.Visible = true;
        Label_wallet.Visible = true;

        insert_users.Visible = true;

        name_tx.Visible = true;
        nameid_tx.Visible = true;
        password_tx.Visible = true;
        usetype_tx.Visible = true;
        wallet_tx.Visible = true;

        Label_nameid_search.Visible = true;
        TextBox_nameid_search.Visible = true;
        Button_user_search.Visible = true;

    }

    protected void insert_users_Click(object sender, EventArgs e)//增加用户
    {
        usersTableAdapter adpr = new usersTableAdapter();
        int nameid = Int32.Parse(nameid_tx.Text);
        string name = name_tx.Text;
        string pwd = password_tx.Text;
        double wallet = double.Parse(wallet_tx.Text);
        int use_type = Int32.Parse(usetype_tx.Text);
        try 
        {
            adpr.InsertQuery(nameid, name, wallet, pwd, use_type);
        }
        /**触发器NO_WALLET**/
        /**
         CREATE TRIGGER NO_WALLET ON users
            FOR INSERT
                    AS
                IF (
                        (
                            SELECT COUNT(*) FROM inserted 
                            WHERE inserted.wallet<0)>0

                    )
                rollback TRANSACTION;
        
                SELECT * FROM Sysobjects WHERE xtype = 'TR'
        **/
        catch (Exception)        
        {
            errorMsg.Text = "余额不能小于0";
            errorMsg.Visible = true;
        }

        

        usersGridView.DataBind();
    }

    protected void delete_users_one_Click(object sender, EventArgs e)//删除单个用户
    {
        Button btn = (Button)sender;
        string id = btn.CommandArgument;
        int nameid = Int32.Parse(id); 
        usersTableAdapter useradpr = new usersTableAdapter();
        try
        {
            useradpr.DeleteQuery(nameid);
            usersGridView.DataBind();
        }
        catch
        {
            Label_delete_user.Text = "删除了借阅书籍的用户";
            Label_delete_user.Visible = true;
        }
    }


    protected void Button2_Click(object sender, EventArgs e)//查询所有借阅信息
    {
        borrowGridView.Visible = true;
        Label_borrow.Visible = true;
        TextBox_borrow.Visible = true;
        Button_borrow.Visible = true;
    }

    protected void search_user(object sender, EventArgs e)//查询借阅用户信息
    {
        DetailsView3.Visible = false;
        Button btn = (Button)sender;
        string id = btn.CommandArgument;
        Session["nameid"] = id;//获取用户id   
        DetailsView2.Visible = true;

    }

    protected void delete_Click(object sender, EventArgs e)//删除借阅书籍记录
    {
        Button btn = (Button)sender;
        string id = btn.CommandArgument;
        Session["id"] = id;//获取书籍id            
        int bookid = Int32.Parse(id);
        borrowTableAdapter adpr = new borrowTableAdapter();
        adpr.DeleteQuery(bookid);

        book_tableTableAdapter bookadpr = new book_tableTableAdapter();//书籍信息更新
        var date = bookadpr.GetDataBy(bookid);//书籍余量加一
        var singledata = date.Single();
        int left = singledata.left;
        left = left + 1;
        bookadpr.Updateleft(left, bookid);
        //bookGridView.DataSource = date;

        borrowGridView.DataBind(); //刷新借阅信息
        bookGridView.DataBind();//刷新书籍信息
    }

    protected void Button3_Click(object sender, EventArgs e)//查询所有书籍
    {
        bookGridView.Visible = true;

        Label_bookid.Visible = true;
        Label_bookname.Visible = true;
        Label_left.Visible = true;
        Label_price.Visible = true;
        Label_publisher.Visible = true;
        Label_writer.Visible = true;

        TextBox_bookid.Visible = true;
        TextBox_bookname.Visible = true;
        TextBox_left.Visible = true;
        TextBox_price.Visible = true;
        TextBox_publisher.Visible = true;
        TextBox_writer.Visible = true;

        TextBox_shelve.Visible = true;
        TextBox_floor.Visible = true;
        Label_floor.Visible = true;
        Label_shelve.Visible = true;

        insert_book.Visible = true;

        TextBox_search_book.Visible = true;
        Label_search_book.Visible = true;
        Button_book_search.Visible = true;
    }

    protected void btnDelOne_Click(object sender, EventArgs e)//查询书籍位置按钮
    {
        Button btn = (Button)sender;

        string id = btn.CommandArgument;

        Session["id"] = id;//获取书籍id
        DetailsView1.Visible = true;//书籍位置信息

    }


    protected void delete_book(object sender, EventArgs e)//删除单个书籍记录
    {
        Button btn = (Button)sender;

        string id = btn.CommandArgument;

        
        int bookid = Int32.Parse(id);
        book_tableTableAdapter bookadpr = new book_tableTableAdapter();
        locationTableAdapter locationadpr = new locationTableAdapter();
        try
        {
            locationadpr.DeleteQuery(bookid);
            bookadpr.DeleteQuery(bookid);
            bookGridView.DataBind();
        }
        catch
        {
            Label_delete_book.Text = "不能删除有借阅记录的书";
            Label_delete_book.Visible = true;

        }
        


    }
    /**
 
CREATE TRIGGER no_price ON book_table
        FOR INSERT
                AS
            IF(
                    (
                        SELECT COUNT(*) FROM inserted
                        WHERE inserted.price<0

                        )>0

                )
        
					raiserror('价格不能小于0',16,11)
            rollback TRANSACTION;
 **/

    protected void insert_book_Click(object sender, EventArgs e)//添加书籍信息
    {
        book_tableTableAdapter adprbook = new book_tableTableAdapter();

        int id = Int32.Parse(TextBox_bookid.Text);
        string name = TextBox_bookname.Text;
        string writer = TextBox_writer.Text;
        string publisher = TextBox_publisher.Text;
        int left = Int32.Parse(TextBox_left.Text);
        float price = float.Parse(TextBox_price.Text);
        int floor = Int32.Parse(TextBox_floor.Text);
        int shelve = Int32.Parse(TextBox_shelve.Text);
        try
        {
            locationTableAdapter locationadpr = new locationTableAdapter();
            adprbook.InsertQuery(id,name,writer,publisher,left,price);
            
            locationadpr.InsertQuery(id,floor,shelve);
            bookGridView.DataBind();
            

           
        }
        catch(Exception exp)
        {
           
            bookinsertMsg.Text = exp.Message;
            //bookinsertMsg.Text = "输入数据错误";
            bookinsertMsg.Visible = true;
            //return;

        }

         
        

    }

    protected void Button_user_search_Click(object sender, EventArgs e)//搜索单个用户信息
    {
        DetailsView2.Visible = false;
        int nameid = Int32.Parse(TextBox_nameid_search.Text);
        usersTableAdapter useradpr = new usersTableAdapter();
        Session["nameid"] = nameid;
        DetailsView3.Visible = true;
    }

    protected void Button_book_search_Click(object sender, EventArgs e)//查找书籍
    {
        DetailsView_search_book.Visible = true;
    }

   protected void user_infromation_Click(object sender, EventArgs e)//用户信息
    {
        Button btn = (Button)sender;

        string id = btn.CommandArgument;

        Session["nameid"] = id;//获取用户id
        DetailsView2.Visible = true;
    }

    protected void DetailsView_search_book_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {
        bookGridView.DataBind();
    }

    protected void Button_borrow_Click(object sender, EventArgs e)
    {
        GridView_borrow_user.Visible = true;
    }
}