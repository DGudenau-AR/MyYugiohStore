using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace MyYugiohStore
{
    public partial class MyYugiohStore : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Membership.GetUser().ToString().Trim() == string.Empty)
                {
                    this.lblLoginMsg.Visible = false;
                }
                else
                {
                    this.lblLoginMsg.Visible = true;
                }

            }
            catch
            {
                this.lblLoginMsg.Visible = false;
            }

//            Session["UserName"] = Membership.GetUser().ToString().Trim();
        }
    }
}
