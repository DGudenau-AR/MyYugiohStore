<%@ Page Title="" Language="C#" MasterPageFile="~/MyYugiohStore.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="MyYugiohStore.OrderHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div id="Header">
        <asp:Label ID="Label1" runat="server" CssClass="PageHeader" Text="Order History"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblThankYou" runat="server" CssClass="FormText" 
            Text="Thank You for Your Business!"></asp:Label>
        <br /><br />
    </div>
    
    
    <div id="Grid">
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" 
            GridLines="Vertical">
            <RowStyle BackColor="#F7F7DE" />
            <Columns>
                <asp:BoundField DataField="OrderStatus" HeaderText="OrderStatus" 
                    SortExpression="OrderStatus" />
                <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" 
                    SortExpression="OrderDate" />
                <asp:BoundField DataField="TotalPrice" HeaderText="TotalPrice" 
                    SortExpression="TotalPrice" DataFormatString="{0:c}" HtmlEncode="False" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyYugiohStoreConnectionString %>" 
            SelectCommand="GetOrders" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="UserName" SessionField="UserName" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        
    </div>



</asp:Content>
