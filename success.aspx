<%@ Page Language="C#" AutoEventWireup="true" CodeFile="success.aspx.cs" Inherits="success" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            学生界面<br />
            <br />
            <asp:Button ID="return_login" runat="server" OnClick="return_login_Click" Text="返回登录界面" />
            <br />
            <br />
            <asp:Button ID="personal" runat="server" Height="36px" OnClick="personal_Click" Text="查询个人信息" Width="105px" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="borrowButton" runat="server" Height="36px" OnClick="borrowButton_Click" Text="查询借阅信息" Width="107px" />
            <br />
            <br />
            <asp:Label ID="borrowMsg" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="name_id" DataSourceID="SqlDataSource2" Visible="False" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="name_id" HeaderText="账户" ReadOnly="True" SortExpression="name_id" />
                    <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name" ReadOnly="True" />
                    <asp:BoundField DataField="wallet" HeaderText="钱包" SortExpression="wallet" ReadOnly="True" />
                    <asp:BoundField DataField="pass_word" HeaderText="密码" SortExpression="pass_word" />
                    <asp:CommandField ShowEditButton="True" EditText="修改密码" />
                </Columns>
            </asp:GridView>
            <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [users] WHERE ([name_id] = @name_id)" OnSelecting="SqlDataSource2_Selecting">
            <SelectParameters>
                <asp:SessionParameter Name="name_id" SessionField="txtname" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
            <br />
            书名<br />
        </div>
        <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        <p>
            <asp:Button ID="search_book" runat="server" OnClick="search_book_Click" Text="查询" />
        </p>
        <p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [book_table] WHERE ([name] LIKE '%' + @name + '%')" OnSelecting="SqlDataSource1_Selecting">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="name" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="bookid" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged2">
            <Columns>
                <asp:BoundField DataField="name" HeaderText="书名" SortExpression="name" />
                <asp:BoundField DataField="writer" HeaderText="作者" SortExpression="writer" />
                <asp:BoundField DataField="publisher" HeaderText="出版社" SortExpression="publisher" />
                <asp:BoundField DataField="left" HeaderText="剩余量" SortExpression="left" />
                <asp:BoundField DataField="price" HeaderText="价格" SortExpression="price" />
                  
   <asp:TemplateField >

    <ItemTemplate>

        <asp:Button ID="btnDelOne" runat="server" CommandArgument='<%# Eval("bookid") %>'

                            onclick="btnDelOne_Click" Text="查询位置" />

    </ItemTemplate>

</asp:TemplateField>

                <asp:TemplateField >

    <ItemTemplate>

        <asp:Button ID="btnborrow" runat="server" CommandArgument='<%# Eval("bookid") %>'

                            onclick="btnborrow_Click" Text="借阅" />

    </ItemTemplate>

</asp:TemplateField>

            </Columns>
        </asp:GridView>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="bookid" DataSourceID="location" Height="50px" Visible="False" Width="125px">
            <Fields>
                <asp:BoundField DataField="floor" HeaderText="楼层" SortExpression="floor" />
                <asp:BoundField DataField="shelve" HeaderText="书架" SortExpression="shelve" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="location" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [location] WHERE ([bookid] = @bookid)" OnSelecting="location_Selecting">
            <SelectParameters>
                <asp:SessionParameter Name="bookid" SessionField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="bookid,name_id" DataSourceID="borrow" Visible="False" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="bookid" HeaderText="书号" ReadOnly="True" SortExpression="bookid" />
                <asp:BoundField DataField="name_id" HeaderText="帐号" ReadOnly="True" SortExpression="name_id" />
                <asp:BoundField DataField="borrow_time" HeaderText="借阅时间" SortExpression="borrow_time" />
                <asp:BoundField DataField="time" HeaderText="借阅天数" SortExpression="time" />
                <asp:BoundField DataField="return_time" HeaderText="归还时间" SortExpression="return_time" />
                 <asp:TemplateField >

    <ItemTemplate>

        <asp:Button ID="btnborrow" runat="server" CommandArgument='<%# Eval("bookid") %>'

                            onclick="bookinformation_Click" Text="详情" />

    </ItemTemplate>

</asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="borrow" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [borrow] WHERE ([name_id] = @name_id)">
            <SelectParameters>
                <asp:SessionParameter Name="name_id" SessionField="txtname" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="bookid" DataSourceID="bookinformation" Visible="False">
            <Fields>
                <asp:BoundField DataField="name" HeaderText="书名" SortExpression="name" />
                <asp:BoundField DataField="writer" HeaderText="作者" SortExpression="writer" />
                <asp:BoundField DataField="publisher" HeaderText="出版商" SortExpression="publisher" />
                <asp:BoundField DataField="price" HeaderText="价格" SortExpression="price" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="bookinformation" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [book_table] WHERE ([bookid] = @bookid)">
            <SelectParameters>
                <asp:SessionParameter Name="bookid" SessionField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
