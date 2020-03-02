<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            &nbsp;
            管理员界面<br />
            <br />
            <asp:Button ID="return_login" runat="server" OnClick="return_login_Click" Text="返回登录界面" />
        </div>
        <p>
            <asp:Button ID="Button1" runat="server" Text="显示所有账户信息" OnClick="Button1_Click" Width="156px" />
    &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="查询所有借阅信息" Width="156px" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="显示所有书籍信息" Width="156px" />
    </p>
        <p>
            <asp:GridView ID="usersGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="name_id" DataSourceID="usersSqlDataSource" Height="198px" Width="470px" OnSelectedIndexChanged="usersGridView_SelectedIndexChanged" Visible="False">
                <Columns>
                    <asp:BoundField DataField="name_id" HeaderText="帐号" ReadOnly="True" SortExpression="name_id" />
                    <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name"></asp:BoundField>
                    <asp:BoundField DataField="wallet" HeaderText="余额" SortExpression="wallet" />
                    <asp:BoundField DataField="pass_word" HeaderText="密码" SortExpression="pass_word" />
                    <asp:BoundField DataField="use_type" HeaderText="用户类型" SortExpression="use_type" ReadOnly="True" />
                    <asp:CommandField ShowEditButton="True" EditText="编辑" />
  <asp:TemplateField>

 <ItemTemplate>

        <asp:Button ID="delete_users_one" runat="server" CommandArgument='<%# Eval("name_id") %>'

                            onclick="delete_users_one_Click" Text="删除" />

    </ItemTemplate>
                    </asp:TemplateField>                   
                </Columns>
            </asp:GridView>
    </p>
        <p>
            <asp:Label ID="Label_delete_user" runat="server" Text="Label" Visible="False"></asp:Label>
    </p>
        <p>
            <asp:Label ID="Label_nameid" runat="server" Text="帐号" Visible="False"></asp:Label>
            <asp:TextBox ID="nameid_tx" runat="server" Visible="False" Width="80px"></asp:TextBox>
            <asp:Label ID="Label_name" runat="server" Text="姓名" Visible="False"></asp:Label>
            <asp:TextBox ID="name_tx" runat="server" Visible="False" Width="80px"></asp:TextBox>
            <asp:Label ID="Label_wallet" runat="server" Text="余额" Visible="False"></asp:Label>
            <asp:TextBox ID="wallet_tx" runat="server" Visible="False" Width="80px"></asp:TextBox>
            <asp:Label ID="Label_pwd" runat="server" Text="密码" Visible="False"></asp:Label>
            <asp:TextBox ID="password_tx" runat="server" Visible="False" Width="80px"></asp:TextBox>
            <asp:Label ID="Label_usetype" runat="server" Text="用户类型" Visible="False"></asp:Label>
            <asp:TextBox ID="usetype_tx" runat="server" Visible="False" Width="80px"></asp:TextBox>
            <asp:Button ID="insert_users" runat="server" Text="新建用户" Visible="False" OnClick="insert_users_Click" />
    </p>
        <p>
            <asp:Label ID="Label_nameid_search" runat="server" Text="帐号" Visible="False"></asp:Label>
            <asp:TextBox ID="TextBox_nameid_search" runat="server" Visible="False" Width="80px"></asp:TextBox>
            <asp:Button ID="Button_user_search" runat="server" OnClick="Button_user_search_Click" style="margin-left: 0px" Text="查找用户" Visible="False" />
    </p>
        <p>
            <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" DataKeyNames="name_id" DataSourceID="user_search_SqlDataSource" Height="50px" Visible="False" Width="125px">
                <Fields>
                    <asp:BoundField DataField="name_id" HeaderText="帐号" ReadOnly="True" SortExpression="name_id" />
                    <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name" />
                    <asp:BoundField DataField="wallet" HeaderText="钱包" SortExpression="wallet" />
                    <asp:BoundField DataField="use_type" HeaderText="账户类型" ReadOnly="True" SortExpression="use_type" />
                    <asp:CommandField EditText="编辑" ShowEditButton="True" />
                </Fields>
            </asp:DetailsView>
    </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Label ID="errorMsg" runat="server" Text="Label" Visible="False"></asp:Label>
    </p>
        <p>
            <asp:SqlDataSource ID="usersSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [users]" DeleteCommand="DELETE FROM [users] WHERE [name_id] = @name_id" InsertCommand="INSERT INTO [users] ([name_id], [name], [wallet], [pass_word], [use_type]) VALUES (@name_id, @name, @wallet, @pass_word, @use_type)" UpdateCommand="UPDATE [users] SET [name] = @name, [wallet] = @wallet, [pass_word] = @pass_word, [use_type] = @use_type WHERE [name_id] = @name_id">
                <DeleteParameters>
                    <asp:Parameter Name="name_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="name_id" Type="Int32" />
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="wallet" Type="Double" />
                    <asp:Parameter Name="pass_word" Type="String" />
                    <asp:Parameter Name="use_type" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="wallet" Type="Double" />
                    <asp:Parameter Name="pass_word" Type="String" />
                    <asp:Parameter Name="use_type" Type="Int32" />
                    <asp:Parameter Name="name_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
    </p>
            <asp:SqlDataSource ID="borrowSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [borrow]"></asp:SqlDataSource>
            <asp:GridView ID="borrowGridView" runat="server" DataSourceID="borrowSqlDataSource" Visible="False" AutoGenerateColumns="False" DataKeyNames="bookid,name_id">
                <Columns>
                    <asp:BoundField DataField="bookid" HeaderText="书号" ReadOnly="True" SortExpression="bookid" />
                    <asp:BoundField DataField="name_id" HeaderText="帐号" ReadOnly="True" SortExpression="name_id" />
                    <asp:BoundField DataField="borrow_time" HeaderText="借阅时间" SortExpression="borrow_time" />
                    <asp:BoundField DataField="time" HeaderText="借阅时长" SortExpression="time" />
                    <asp:BoundField DataField="return_time" HeaderText="归还时间" SortExpression="return_time" />
                    
    <asp:TemplateField >

    <ItemTemplate>

        <asp:Button ID="btnDelOne" runat="server" CommandArgument='<%# Eval("name_id") %>'

                            onclick="search_user" Text="借阅人信息" />

    </ItemTemplate>

</asp:TemplateField>

                    <asp:TemplateField>

 <ItemTemplate>

        <asp:Button ID="btnborrow" runat="server" CommandArgument='<%# Eval("bookid") %>'

                            onclick="delete_Click" Text="删除" />

    </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
               
            </asp:GridView>
        <p>
            <asp:DetailsView ID="DetailsView2" runat="server" DataSourceID="user_search_SqlDataSource" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="name_id" Visible="False">
                <Fields>
                    <asp:BoundField DataField="name_id" HeaderText="帐号" ReadOnly="True" SortExpression="name_id" />
                    <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name" />
                    <asp:BoundField DataField="wallet" HeaderText="钱包" SortExpression="wallet" />
                </Fields>
            </asp:DetailsView>
    </p>
        <p>
            <asp:Label ID="Label_borrow" runat="server" Text="借阅人帐号" Visible="False"></asp:Label>
            <asp:TextBox ID="TextBox_borrow" runat="server" Visible="False"></asp:TextBox>
            <asp:Button ID="Button_borrow" runat="server" OnClick="Button_borrow_Click" Text="查询借阅信息" Visible="False" />
    </p>
        <p>
            <asp:GridView ID="GridView_borrow_user" runat="server" AutoGenerateColumns="False" DataKeyNames="bookid,name_id" DataSourceID="SqlDataSource_borrow_user" Visible="False">
                <Columns>
                    <asp:BoundField DataField="bookid" HeaderText="bookid" ReadOnly="True" SortExpression="bookid" />
                    <asp:BoundField DataField="name_id" HeaderText="name_id" ReadOnly="True" SortExpression="name_id" />
                    <asp:BoundField DataField="borrow_time" HeaderText="borrow_time" SortExpression="borrow_time" />
                    <asp:BoundField DataField="time" HeaderText="time" SortExpression="time" />
                    <asp:BoundField DataField="return_time" HeaderText="return_time" SortExpression="return_time" />
           <asp:TemplateField>

 <ItemTemplate>

        <asp:Button ID="user_infromation" runat="server" CommandArgument='<%# Eval("name_id") %>'

                            onclick="user_infromation_Click" Text="用户信息" />

    </ItemTemplate>
                    </asp:TemplateField>       
                
                </Columns>
            </asp:GridView>
    </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <asp:SqlDataSource ID="SqlDataSource_borrow_user" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [borrow] WHERE ([name_id] = @name_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox_borrow" Name="name_id" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
    </p>
        <p>
            <asp:SqlDataSource ID="user_search_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [users] WHERE [name_id] = @name_id" InsertCommand="INSERT INTO [users] ([name_id], [name], [wallet], [use_type]) VALUES (@name_id, @name, @wallet, @use_type)" SelectCommand="SELECT [name_id], [name], [wallet], [use_type] FROM [users] WHERE ([name_id] = @name_id)" UpdateCommand="UPDATE [users] SET [name] = @name, [wallet] = @wallet, [use_type] = @use_type WHERE [name_id] = @name_id">
                <DeleteParameters>
                    <asp:Parameter Name="name_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="name_id" Type="Int32" />
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="wallet" Type="Double" />
                    <asp:Parameter Name="use_type" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="name_id" SessionField="nameid" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="wallet" Type="Double" />
                    <asp:Parameter Name="use_type" Type="Int32" />
                    <asp:Parameter Name="name_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
    </p>
        <p>
            <asp:GridView ID="bookGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="bookid" DataSourceID="bookSqlDataSource1" Visible="False">
                <Columns>
                    <asp:BoundField DataField="bookid" HeaderText="书号" ReadOnly="True" SortExpression="bookid" />
                    <asp:BoundField DataField="name" HeaderText="书名" SortExpression="name" />
                    <asp:BoundField DataField="writer" HeaderText="作者" SortExpression="writer" />
                    <asp:BoundField DataField="publisher" HeaderText="出版社" SortExpression="publisher" />
                    <asp:BoundField DataField="left" HeaderText="余量" SortExpression="left" />
                    <asp:BoundField DataField="price" HeaderText="价格" SortExpression="price" />
                    <asp:CommandField ShowEditButton="True" EditText="编辑" />
                   
<asp:TemplateField >

    <ItemTemplate>

        <asp:Button ID="deletebook" runat="server" CommandArgument='<%# Eval("bookid") %>'

                            onclick="delete_book" Text="删除" />

    </ItemTemplate>

</asp:TemplateField>
                     <asp:TemplateField >

    <ItemTemplate>

        <asp:Button ID="btnDelOne" runat="server" CommandArgument='<%# Eval("bookid") %>'

                            onclick="btnDelOne_Click" Text="查询位置" />

    </ItemTemplate>

</asp:TemplateField>

                </Columns>
            </asp:GridView>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="bookid" DataSourceID="locationSqlDataSource" Height="50px" Width="125px" Visible="False">
                <Fields>
                    <asp:BoundField DataField="floor" HeaderText="楼层" SortExpression="floor" />
                    <asp:BoundField DataField="shelve" HeaderText="书架" SortExpression="shelve" />
                </Fields>
            </asp:DetailsView>
    </p>
        <p>
            <asp:Label ID="Label_delete_book" runat="server" Text="Label" Visible="False"></asp:Label>
        </p>
        <asp:SqlDataSource ID="locationSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [location] WHERE ([bookid] = @bookid)">
            <SelectParameters>
                <asp:SessionParameter Name="bookid" SessionField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <p>
            <asp:Label ID="Label_bookid" runat="server" Text="书号" Visible="False"></asp:Label>
            <asp:TextBox ID="TextBox_bookid" runat="server" Visible="False" Width="80px"></asp:TextBox>
            <asp:Label ID="Label_bookname" runat="server" Text="书名" Visible="False"></asp:Label>
            <asp:TextBox ID="TextBox_bookname" runat="server" Visible="False" Width="80px"></asp:TextBox>
            <asp:Label ID="Label_writer" runat="server" Text="作者" Visible="False"></asp:Label>
            <asp:TextBox ID="TextBox_writer" runat="server" Visible="False" Width="80px"></asp:TextBox>
            <asp:Label ID="Label_publisher" runat="server" Text="出版社" Visible="False"></asp:Label>
            <asp:TextBox ID="TextBox_publisher" runat="server" Visible="False" Width="80px"></asp:TextBox>
            <asp:Label ID="Label_left" runat="server" Text="余量" Visible="False"></asp:Label>
            <asp:TextBox ID="TextBox_left" runat="server" Visible="False" Width="80px"></asp:TextBox>
            <asp:Label ID="Label_price" runat="server" Text="价格" Visible="False"></asp:Label>
            <asp:TextBox ID="TextBox_price" runat="server" Visible="False" Width="80px"></asp:TextBox>
    </p>
        <p>
            <asp:Label ID="Label_floor" runat="server" Text="楼层" Visible="False"></asp:Label>
            <asp:TextBox ID="TextBox_floor" runat="server" Visible="False" Width="80px"></asp:TextBox>
            <asp:Label ID="Label_shelve" runat="server" Text="书架" Visible="False"></asp:Label>
            <asp:TextBox ID="TextBox_shelve" runat="server" Visible="False" Width="80px"></asp:TextBox>
&nbsp;<asp:Button ID="insert_book" runat="server" OnClick="insert_book_Click" Text="新建书籍" Visible="False" />
    </p>
        <p>
            <asp:Label ID="bookinsertMsg" runat="server" Text="Label" Visible="False"></asp:Label>
    </p>
        <p>
            <asp:Label ID="Label_search_book" runat="server" Text="书名" Visible="False"></asp:Label>
            <asp:TextBox ID="TextBox_search_book" runat="server" Visible="False"></asp:TextBox>
            <asp:Button ID="Button_book_search" runat="server" OnClick="Button_book_search_Click" Text="查找书籍" Visible="False" />
            <asp:DetailsView ID="DetailsView_search_book" runat="server" AutoGenerateRows="False" DataKeyNames="bookid" DataSourceID="SqlDataSource_booklistview" Height="50px" OnPageIndexChanging="DetailsView_search_book_PageIndexChanging" Visible="False" Width="125px">
                <Fields>
                    <asp:BoundField DataField="bookid" HeaderText="书号" ReadOnly="True" SortExpression="bookid" />
                    <asp:BoundField DataField="name" HeaderText="书名" SortExpression="name" />
                    <asp:BoundField DataField="writer" HeaderText="作者" SortExpression="writer" />
                    <asp:BoundField DataField="publisher" HeaderText="出版社" SortExpression="publisher" />
                    <asp:BoundField DataField="left" HeaderText="余量" SortExpression="left" />
                    <asp:BoundField DataField="price" HeaderText="价格" SortExpression="price" />
                    <asp:CommandField EditText="编辑" ShowEditButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource_search_location" runat="server"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource_booklistview" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [book_table] WHERE [bookid] = @bookid" InsertCommand="INSERT INTO [book_table] ([bookid], [name], [writer], [publisher], [left], [price]) VALUES (@bookid, @name, @writer, @publisher, @left, @price)" SelectCommand="SELECT * FROM [book_table] WHERE ([name] LIKE '%' + @name + '%')" UpdateCommand="UPDATE [book_table] SET [name] = @name, [writer] = @writer, [publisher] = @publisher, [left] = @left, [price] = @price WHERE [bookid] = @bookid">
                <DeleteParameters>
                    <asp:Parameter Name="bookid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="bookid" Type="Int32" />
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="writer" Type="String" />
                    <asp:Parameter Name="publisher" Type="String" />
                    <asp:Parameter Name="left" Type="Int32" />
                    <asp:Parameter Name="price" Type="Double" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox_search_book" Name="name" PropertyName="Text" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="writer" Type="String" />
                    <asp:Parameter Name="publisher" Type="String" />
                    <asp:Parameter Name="left" Type="Int32" />
                    <asp:Parameter Name="price" Type="Double" />
                    <asp:Parameter Name="bookid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
        <br />
    </p>
        <asp:SqlDataSource ID="bookSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [book_table] WHERE [bookid] = @bookid" InsertCommand="INSERT INTO [book_table] ([bookid], [name], [writer], [publisher], [left], [price]) VALUES (@bookid, @name, @writer, @publisher, @left, @price)" SelectCommand="SELECT * FROM [book_table]" UpdateCommand="UPDATE [book_table] SET [name] = @name, [writer] = @writer, [publisher] = @publisher, [left] = @left, [price] = @price WHERE [bookid] = @bookid">
            <DeleteParameters>
                <asp:Parameter Name="bookid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="bookid" Type="Int32" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="writer" Type="String" />
                <asp:Parameter Name="publisher" Type="String" />
                <asp:Parameter Name="left" Type="Int32" />
                <asp:Parameter Name="price" Type="Double" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="writer" Type="String" />
                <asp:Parameter Name="publisher" Type="String" />
                <asp:Parameter Name="left" Type="Int32" />
                <asp:Parameter Name="price" Type="Double" />
                <asp:Parameter Name="bookid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
    </body>
</html>
