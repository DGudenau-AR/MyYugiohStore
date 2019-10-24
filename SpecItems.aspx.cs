using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyYugiohStore
{
    public partial class SpecItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("ItemDetails.aspx?i=" + this.GridView1.SelectedValue.ToString().Trim());
        }

        protected void btnOne_Click(object sender, EventArgs e)
        {
            Response.Redirect("ItemDetails.aspx?i=4");
        }

        protected void btnTwo_Click(object sender, EventArgs e)
        {
            Response.Redirect("ItemDetails.aspx?i=7");
        }

        protected void btnThree_Click(object sender, EventArgs e)
        {
            Response.Redirect("ItemDetails.aspx?i=20");
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("Items.aspx?c=" + this.GridView1.SelectedValue.ToString().Trim());
        }
    }
}
