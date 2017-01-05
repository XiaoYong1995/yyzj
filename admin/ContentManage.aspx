<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContentManage.aspx.cs" Inherits="admin_ContentManage" %>

<%@ Register Src="left.ascx" TagName="left" TagPrefix="uc1" %>
<%@ Register Src="top.ascx" TagName="top" TagPrefix="uc2" %>
<%@ Register Src="bottom.ascx" TagName="bottom" TagPrefix="uc3" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>无标题页</title>
    <link href="css/admin.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="css/jquery.datepick.css" />

    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>

    <script type="text/javascript" src="js/jquery.datepick.js"></script>

    <script type="text/javascript" src="js/jquery.datepick-zh-CN.js"></script>


    <script src="js/PublicJs.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:left ID="left1" runat="server" />
        <uc2:top ID="top1" runat="server" />
        <div class="main">
            <h5 class="maintit">
                内容管理</h5>
            <%--         <div class="search">
                <div class="controls controls_2">
                    <label>
                        工号：</label><asp:TextBox ID="TextBox5" class="ctxt1 ctxt1_1" runat="server"></asp:TextBox>
                </div>
            </div>--%>
            <div class="clr">
            </div>
            <div class="clr">
            </div>
            <div class="search">
                <div class="controls controls_2">
                    <label>
                        栏目：</label><asp:DropDownList ID="DropDownList1" runat="server" 
                        AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>　　-　　<asp:DropDownList ID="DropDownList2" runat="server" 
                        AutoPostBack="True" onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                        </asp:DropDownList>
                        　　标题查询：<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    <asp:Button ID="Button2"
                            runat="server" Text="查询" onclick="Button2_Click" />
                </div>
                <div class="clr">
            </div>
                <div class="datas">
                    <div class="corner tablew1">
                        <span class="corner_lt">&nbsp;</span> <span class="corner_rt">&nbsp;</span> <span
                            class="corner_lb">&nbsp;</span> <span class="corner_rb">&nbsp;</span>
                        <ul class="dopage">
                            <asp:TextBox ID="TextBox1" runat="server" Visible="false"></asp:TextBox><asp:TextBox
                                ID="TextBox2" Visible="false" runat="server"></asp:TextBox>
                        </ul>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>
                                        栏目分类
                                    </th>
                                    <th>
                                        标题
                                    </th>
                                    <th>
                                        添加时间
                                    </th>
                                    <th>
                                        归属地
                                    </th>
                                    <th>
                                        管理操作<asp:Button ID="Button1" runat="server" Text="添加" OnClick="Button1_Click" />
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand"
                                    OnItemDataBound="Repeater1_ItemDataBound">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("sColumn") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="Label13" runat="server" Text='<%# Eval("sTitle") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("sTime") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("sCity") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btnDelete" runat="server" Text="删除" Visible="false" CommandName='Delete' OnClientClick="return confirm('确定删除吗?')"
                                                    CommandArgument='<%# Eval("iId") %>'></asp:LinkButton>
                                                <asp:LinkButton ID="LinkButton1" runat="server" Text="编辑" CommandName='Edit' CommandArgument='<%# Eval("iId") %>'></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center">
                                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" AlwaysShow="True" PageSize="10"
                                        ShowNavigationToolTip="True" OnPageChanging="AspNetPager1_PageChanging" FirstPageText="第一页"
                                        LastPageText="最后一页" NextPageText="下一页" PrevPageText="上一页">
                                        //本页显示的条数
                                    </webdiyer:AspNetPager>
                                    <asp:Label ID="Label15" runat="server" Text="Label"></asp:Label>
                                    <asp:TextBox ID="TextBoxPower" Style="display: none;" runat="server"></asp:TextBox>
                                    <asp:TextBox ID="TextBoxCity" Style="display: none;" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <uc3:bottom ID="bottom1" runat="server" />
        </div>
    </form>
        <script src="layer/layer.min.js"></script>
</body>
</html>
