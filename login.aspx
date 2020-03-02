<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        帐号：<asp:TextBox ID="account" runat="server" Width="132px" OnTextChanged="account_TextChanged"></asp:TextBox>
        </div>
        密码：<asp:TextBox ID="password" runat="server" Width="132px" OnTextChanged="password_TextChanged" TextMode="Password"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="login_txt" runat="server" Text="登录失败" Visible="False"></asp:Label>
        <p>
        <asp:Button ID="login_in" runat="server" Height="27px" Text="登录" Width="93px"  
            OnClick="login_in_Click" />
        </p>
        <p>
            <asp:Button ID="visit" runat="server" Height="29px" OnClick="visit_Click" Text="游客登录" Width="92px" />
        </p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT * FROM [users] WHERE (([name_id] = @name_id) AND ([pass_word] = @pass_word))" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>">
            <SelectParameters>
                <asp:ControlParameter ControlID="account" Name="name_id" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="password" Name="pass_word" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="name_id" DataSourceID="SqlDataSource1" Visible="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="name_id" HeaderText="name_id" ReadOnly="True" SortExpression="name_id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="wallet" HeaderText="wallet" SortExpression="wallet" />
            </Columns>
        </asp:GridView>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
