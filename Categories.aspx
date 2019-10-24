<%@ Page Title="" Language="C#" MasterPageFile="~/MyYugiohStore.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="MyYugiohStore.Categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="Header">
        <asp:Label ID="Label1" runat="server" CssClass="PageHeader" Text="Item Categories"></asp:Label>
        <br /><br />
    </div>

    <div id="DataGrid">
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyYugiohStoreConnectionString %>" 
            SelectCommand="GetCategories" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataKeyNames="CategoryID" DataSourceID="SqlDataSource1" 
            ForeColor="Black" GridLines="Vertical" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
            <RowStyle BackColor="#F7F7DE" />
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" 
                    SortExpression="Category" />
                <asp:BoundField DataField="Category" HeaderText="Category" 
                    SortExpression="Category" />
                <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="CategoryID" 
                    Visible="False" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    
    </div>
          
    <br /><br />
</asp:Content>
