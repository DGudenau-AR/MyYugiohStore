<%@ Page Title="" Language="C#" MasterPageFile="~/MyYugiohStore.Master" AutoEventWireup="true" CodeBehind="ThankYou.aspx.cs" Inherits="MyYugiohStore.ThankYou" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="Header">
        <asp:Label ID="Label1" runat="server" CssClass="PageHeader" Text="Thank You for Your Order"></asp:Label>
        <br /><br />
    </div>

    <div id="Order">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" 
            GridLines="Vertical">
            <RowStyle BackColor="#F7F7DE" />
            <Columns>
                <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
                <asp:BoundField DataField="Category" HeaderText="Category" 
                    SortExpression="Category" />
                <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" 
                    SortExpression="TotalPrice" ReadOnly="True" DataFormatString="{0:c}" 
                    HtmlEncode="False">
                </asp:BoundField>
                <asp:BoundField DataField="OrderDate" 
                    HeaderText="OrderDate" SortExpression="OrderDate" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyYugiohStoreConnectionString %>" 
            SelectCommand="GetRecentOrder" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="UserName" SessionField="UserName" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    <div id="Header2">
        <asp:Label ID="Label2" runat="server" CssClass="PageHeader" Text="Shipping Information"></asp:Label>
    </div>
    <br />
    <div id="UserDetails">
        
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px"  
            AutoGenerateRows="False" BackColor="White" BorderColor="#DEDFDE" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Vertical">
        <FooterStyle BackColor="#CCCC99" />
        <RowStyle BackColor="#F7F7DE" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <Fields>
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                SortExpression="FirstName" />
            <asp:BoundField DataField="MI" HeaderText="MI" SortExpression="MI" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" 
                SortExpression="LastName" />
            <asp:BoundField DataField="Address" HeaderText="Address" 
                SortExpression="Address" />
            <asp:BoundField DataField="City" HeaderText="City" 
                SortExpression="City" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" 
                SortExpression="ZipCode" />
            <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" 
                SortExpression="PhoneNumber" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        </Fields>
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyYugiohStoreConnectionString %>" 
            SelectCommand="GetUserDetails" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="UserName" SessionField="UserName" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </div>

</asp:Content>
