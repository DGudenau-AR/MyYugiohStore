using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyYugiohStore
{
    public partial class SpecialItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            Response.Redirect("ItemDetails.aspx?i=" + this.GridView1.SelectedValue.ToString().Trim());
        }
    }
}
