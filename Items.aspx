<%@ Page Title="" Language="C#" MasterPageFile="~/MyYugiohStore.Master" AutoEventWireup="true" CodeBehind="Items.aspx.cs" Inherits="MyYugiohStore.Items" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="Header">
        <asp:Label ID="Label1" runat="server" CssClass="PageHeader" Text="Items"></asp:Label>
        <br /><br />
    </div>

    <div id="Grid">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataKeyNames="ItemID" DataSourceID="SqlDataSource1" 
            ForeColor="Black" GridLines="Vertical" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
            <RowStyle BackColor="#F7F7DE" />
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
                <asp:BoundField DataField="ReleaseDate" HeaderText="Release Date" 
                    SortExpression="ReleaseDate" />
                <asp:BoundField DataField="SalePrice" DataFormatString="{0:c}" 
                    HeaderText="Sale Price" HtmlEncode="False" ReadOnly="True" 
                    SortExpression="SalePrice" />
                <asp:BoundField DataField="RegularPrice" HeaderText="RegularPrice" 
                    SortExpression="RegularPrice" Visible="False" />
                <asp:BoundField DataField="Discount" HeaderText="Discount" 
                    SortExpression="Discount" Visible="False" />
                <asp:CheckBoxField DataField="FutureItem" HeaderText="FutureItem" 
                    SortExpression="FutureItem" Visible="False" />
                <asp:BoundField DataField="ImageURL" HeaderText="ImageURL" 
                    SortExpression="ImageURL" Visible="False" />
                <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" 
                    SortExpression="CategoryID" Visible="False" />
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
            SelectCommand="GetItemsByCategory" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="CategoryID" QueryStringField="c" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br /><br />
    </div>
    
    <div id="Div1">
        <asp:Label ID="lblNoItems" runat="server" CssClass="PageHeader" Text="Sorry, we are out of stock for that category." Visible="False"></asp:Label>
    </div>
    
    <br /><br />
</asp:Content>
