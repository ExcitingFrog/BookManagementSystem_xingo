<%@ Page Language="C#" AutoEventWireup="true" CodeFile="visit.aspx.cs" Inherits="visit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            游客只能进行查询，请登录后进行其他操作。<br />
        </div>
        <asp:Button ID="return_index" runat="server" Height="34px" OnClick="return_index_Click" Text="返回主页面" Width="114px" />
        <br />
        <br />
        书名<br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [book_table] WHERE ([name] LIKE '%' + @name + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="name" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="bookid" DataSourceID="SqlDataSource1" style="margin-right: 1px" Visible="False">
            <Columns>
                <asp:BoundField DataField="bookid" HeaderText="书号" ReadOnly="True" SortExpression="bookid" />
                <asp:BoundField DataField="name" HeaderText="书名" SortExpression="name" />
                <asp:BoundField DataField="writer" HeaderText="作者" SortExpression="writer" />
                <asp:BoundField DataField="publisher" HeaderText="出版社" SortExpression="publisher" />
                <asp:BoundField DataField="left" HeaderText="余量" SortExpression="left" />
                <asp:BoundField DataField="price" HeaderText="价格" SortExpression="price" />
           
    

                
                <asp:TemplateField>

                    
    <ItemTemplate>

        <asp:Button ID="location" runat="server" CommandArgument='<%# Eval("bookid") %>'

                            onclick="btnborrow_Click" Text="查询位置" />

    </ItemTemplate>

                </asp:TemplateField>
           
    

                
            </Columns>
        </asp:GridView>


        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="bookid" DataSourceID="SqlDataSource2" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="floor" HeaderText="楼层" SortExpression="floor" />
                <asp:BoundField DataField="shelve" HeaderText="书架" SortExpression="shelve" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [location] WHERE ([bookid] = @bookid)">
            <SelectParameters>
                <asp:SessionParameter Name="bookid" SessionField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>


    </form>
</body>
</html>
