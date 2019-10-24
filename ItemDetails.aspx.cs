using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Web.Security;

namespace MyYugiohStore
{
    public partial class ItemDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cFunctions oFunctions = new cFunctions();
            String path = "";
            int count = 0;

            try
            {
                if (Membership.GetUser().ToString().Trim() == string.Empty)
                {
                    Response.Redirect("Login.aspx");
                }
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }

            try
            {
                if (Request.QueryString["i"].ToString().Trim() == string.Empty)
                {
                    Response.Redirect("Categories.aspx");
                }
            }
            catch
            {
                Response.Redirect("Categories.aspx");
            }

            if (oFunctions.GetStringBool("SELECT ReleaseDate FROM dbo.Items WHERE ItemID = " + Request.QueryString["i"].ToString().Trim()) != true)
            {
                this.btnAddToCart.Enabled = true;
                this.lblNote.Visible = false;
            }
            else
            {
                this.btnAddToCart.Enabled = false;
                this.lblNote.Visible = true;
            }

            path = oFunctions.GetString("SELECT ImageURL FROM dbo.Items WHERE ItemID = " + Request.QueryString["i"].ToString().Trim());
            if (path != String.Empty)
                this.Image1.ImageUrl = path;
            else
                this.Image1.ImageUrl = "";

            count = oFunctions.GetCount("SELECT count(*) from dbo.Items WHERE ItemID = " + Request.QueryString["i"].ToString().Trim());
            if (count == 0)
            {
                this.Label2.Visible = true;
                this.lblNote.Visible = false;
            }
            else
            {
                this.Label2.Visible = false;
            }
        }

        protected void btnAddToCart_Click1(object sender, EventArgs e)
        {
            cFunctions oFunctions = new cFunctions();
            Hashtable oHashTable = new Hashtable();

            oHashTable.Add("@UserName", Membership.GetUser().ToString().Trim());
            oHashTable.Add("@ItemID", Request.QueryString["i"].ToString().Trim());

            if (!oFunctions.RunSprocBool("AddToShoppingCart", oHashTable))
            {
                Response.Write("Error");
                Response.End();
            }

            Response.Redirect("ShoppingCart.aspx?m=n");      

        }
    }
}
