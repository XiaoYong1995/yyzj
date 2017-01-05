using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_BlackList : System.Web.UI.Page
{
    public DataLayer.BlackList Block = new DataLayer.BlackList();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {

            Repeater1.DataSource = Block.selectBlackList();
            Repeater1.DataBind();
        }
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        switch(e.CommandName)
        {
            case "Del":
                if (Block.DeleteBlackList(e.CommandArgument.ToString()))
                {
                    Response.Redirect("BlackList.aspx");
                }
                break;
        }
    }
}