<%@ Page Title="" Language="C#" MasterPageFile="~/MyYugiohStore.Master" AutoEventWireup="true" CodeBehind="Legal.aspx.cs" Inherits="MyYugiohStore.Legal1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="Header">
        <asp:Label ID="Label1" runat="server" CssClass="PageHeader" Text="Legal Page"></asp:Label>
    <br /><br />
    </div>

    <div>
        <asp:FormView ID="FormView1" runat="server" CellPadding="4" 
            DataSourceID="SqlDataSource1" ForeColor="#333333">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <EditItemTemplate>
                LegalText:
                <asp:TextBox ID="LegalTextTextBox" runat="server" 
                    Text='<%# Bind("LegalText") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                LegalText:
                <asp:TextBox ID="LegalTextTextBox" runat="server" 
                    Text='<%# Bind("LegalText") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="LegalTextLabel" runat="server" Text='<%# Bind("LegalText") %>' />
                <br />
            </ItemTemplate>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyYugiohStoreConnectionString %>" 
            SelectCommand="GetLegalText" SelectCommandType="StoredProcedure">
           <SelectParameters>
             <asp:QueryStringParameter DefaultValue="1" Name="LegalID" QueryStringField="t" 
                 Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <br /><br />

</asp:Content>
