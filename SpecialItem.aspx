<%@ Page Title="" Language="C#" MasterPageFile="~/MyYugiohStore.Master" AutoEventWireup="true" CodeBehind="SpecialItem.aspx.cs" Inherits="MyYugiohStore.SpecialItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="Header">
        <asp:Label ID="Label1" runat="server" CssClass="PageHeader" Text="Sale Items"></asp:Label>
        <br /><br />
    </div>

    <div id="Grid">
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataKeyNames="ItemID" DataSourceID="SqlDataSource1" 
            ForeColor="Black" GridLines="Vertical" 
            onselectedindexchanged="GridView1_SelectedIndexChanged1">
            <RowStyle BackColor="#F7F7DE" />
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
                <asp:BoundField DataField="RegularPrice" HeaderText="Regular Price" 
                    SortExpression="RegularPrice" DataFormatString="{0:c}" 
                    HtmlEncode="False" />
                <asp:BoundField DataField="DiscountPrice" HeaderText="Sale Price" 
                    ReadOnly="True" SortExpression="DiscountPrice" DataFormatString="{0:c}" 
                    HtmlEncode="False" />
                <asp:BoundField DataField="Discount" HeaderText="Discount" 
                    SortExpression="Discount" Visible="False" />
                <asp:CheckBoxField DataField="FutureItem" HeaderText="FutureItem" 
                    SortExpression="FutureItem" Visible="False" />
                <asp:BoundField DataField="ItemID" HeaderText="ItemID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ItemID" Visible="False" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyYugiohStoreConnectionString %>" 
            SelectCommand="GetSaleItems" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
    
    </div>

    <br /><br />

    </asp:Content>
