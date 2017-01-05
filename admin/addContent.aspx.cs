using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using DataLayer;
using Com.Tools;
public partial class admin_addContent : System.Web.UI.Page
{
    DataContent obj = new DataContent();
    DataLayer.DataColumn objCol = new DataLayer.DataColumn();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getPower(TextBoxPower, TextBoxCity);
            banddrop();
            banddrop2(TextBoxCity.Text);
            //banddrop3(TextBoxCity.Text, DropDownList1.SelectedItem.Value);
            if (TextBoxPower.Text == "分站新闻编辑人")
            {
                DropDownList3.SelectedItem.Text = TextBoxCity.Text;
                DropDownList3.Enabled = false;                
            }
            HttpCookie cookie2 = Request.Cookies["Id"];
            string iAdminUser = cookie2.Value;
            if (iAdminUser == "11" || iAdminUser == "12")
            {
                DropDownList1.SelectedItem.Text = "专家讲坛";
                DropDownList1.SelectedItem.Value = "26";
                //DropDownList1.Enabled = false;
                banddrop3(TextBoxCity.Text, "26");
            }
            try
            {
                string sId = Request.QueryString["id"].ToString();
                DataSet ds = obj.selectContentById(sId);
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        DataRow dr = ds.Tables[0].Rows[0];
                        TextBox3.Text = dr["sTitle"].ToString();

                        CKEditor1.Text = dr["sContent"].ToString();
                        //DropDownList2.SelectedValue = dr["iColumnId"].ToString();
                        TextBox4.Text = dr["sKey"].ToString();

                        TextBox6.Text = dr["sRemark"].ToString();
                        DropDownList3.Text = dr["sCity"].ToString();

                        DataSet ds1 = objCol.selectColumnById(dr["iColumnId"].ToString());
                        if (ds1.Tables.Count > 0)
                        {
                            if (ds1.Tables[0].Rows.Count > 0)
                            {
                                string iPid = ds1.Tables[0].Rows[0]["sPid"].ToString();
                                //DropDownList2.SelectedItem.Value = dr["iColumnId"].ToString();
                                DropDownList1.SelectedValue = iPid;
                                banddrop3(TextBoxCity.Text, iPid);
                                DropDownList2.SelectedValue = dr["iColumnId"].ToString();

                            }
                        }
                    }
                }
                //DropDownList1.Enabled = false;
            }
            catch
            {

            }
           
        }
    }


    protected void getPower(TextBox tPower, TextBox tCity)
    {
        HttpCookie cookie2 = Request.Cookies["Id"];
        string sPower = "";
        string iAdminUser = cookie2.Value;
        DataWebAdmin obj = new DataWebAdmin();
        DataSet ds = obj.selectAdminuserByiId(iAdminUser);
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                tPower.Text = dr["sPower"].ToString();
                tCity.Text = dr["sCity"].ToString();
            }
        }
    }

    protected void banddrop()
    {
        DataCity objCity = new DataCity();
        DataSet ds = objCity.selectCity();
        DropDownList3.DataSource = ds.Tables[0].DefaultView;
        DropDownList3.DataValueField = "iId";
        DropDownList3.DataTextField = "sCity";
        DropDownList3.DataBind();
    }

    protected void banddrop2(string sCity)
    {
        DataLayer.DataColumn objCol = new DataLayer.DataColumn();
        DropDownList1.Items.Clear();
        DataSet ds = objCol.selectColumnByPid("0", sCity);
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    DropDownList1.Items.Add(new ListItem(ds.Tables[0].Rows[i][1].ToString(), ds.Tables[0].Rows[i][0].ToString()));
                }
                banddrop3(sCity,DropDownList1.SelectedItem.Value);
            }
            else
            {

            }
        }
        else
        {

        }
    }

    protected void banddrop3(string sCity,string sPid)
    {
        DataLayer.DataColumn objCol = new DataLayer.DataColumn();

        DropDownList2.Items.Clear();
        DataSet ds = objCol.selectColumnByPid(sPid, sCity);
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    DropDownList2.Items.Add(new ListItem(ds.Tables[0].Rows[i][1].ToString(), ds.Tables[0].Rows[i][0].ToString()));
                }
                DropDownList2.Visible = true;
            }
            else
            {
                DropDownList2.Visible = false;
            }
        }
        else
        {
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        
        string sTitle = TextBox3.Text;
        string sContent = CKEditor1.Text;
        int iColumnId = int.Parse(DropDownList2.SelectedValue);
        string sKey = TextBox4.Text;
        HttpCookie cookie2 = Request.Cookies["Id"];
        int iAdminUser = int.Parse(cookie2.Value);
        string sTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        int iClick = 0;
        string sRemark = TextBox6.Text;
        string sCity = DropDownList3.SelectedItem.Text;

        string sAction = "add";
        string sId = "";
        try
        {
            sId = Request.QueryString["id"].ToString();
            sAction = "update";
        }
        catch
        { 
            
        }
        if (sAction == "add")
        {
            int id = obj.insertContent(sTitle, sContent, iColumnId, sKey, iAdminUser, sTime, iClick, sRemark, sCity);
            Temp T = new Temp();
            T.Temp_Ok(id.ToString(), iColumnId.ToString());
        }
        else
        {
            obj.updateContent(int.Parse(sId), sTitle, sContent, iColumnId, sKey, sRemark, sCity);
            Temp T = new Temp();
            T.Temp_Ok(sId, iColumnId.ToString());
        }
        Response.Redirect("ContentManage.aspx");
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        banddrop3(TextBoxCity.Text,DropDownList1.SelectedItem.Value);
    }
}
