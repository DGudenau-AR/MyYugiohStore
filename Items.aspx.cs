using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;


namespace MyYugiohStore
{
    public partial class Items : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int count = 0;
            cFunctions oFunctions = new cFunctions();
            string itemID;

            itemID = Request.QueryString["c"].ToString().Trim();
            if (itemID == string.Empty)
            {
                count = 0;
            }
            else
            {
                count = oFunctions.GetCount("SELECT count(*) from dbo.Items WHERE CategoryID = " + Request.QueryString["c"].ToString().Trim());
            }
            if (count == 0)
            {
                this.lblNoItems.Visible = true;
            }
            else
            {
                this.lblNoItems.Visible = false;
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("ItemDetails.aspx?i=" + this.GridView1.SelectedValue.ToString().Trim());
        }
    }
}
