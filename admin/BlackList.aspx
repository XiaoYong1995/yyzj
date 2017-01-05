<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BlackList.aspx.cs" Inherits="admin_BlackList" %>

<%@ Register Src="left.ascx" TagName="left" TagPrefix="uc1" %>
<%@ Register Src="top.ascx" TagName="top" TagPrefix="uc2" %>
<%@ Register Src="bottom.ascx" TagName="bottom" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <link href="css/admin.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:left ID="left1" runat="server" />
        <uc2:top ID="top1" runat="server" />
        <div class="main">
            <h5 class="maintit">
                网站黑名单</h5>
            <div class="corner tablew1">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <thead>
                        <tr>
                            <th>
                                攻击者Ip
                            </th>
                            <th>
                                攻击类型
                            </th>
                            <th>
                                发起者地区
                            </th>
                            <th>
                                最后攻击时间
                            </th>
                            <th>
                                攻击次数
                            </th>
                            <th>
                                管理操作
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <asp:Repeater ID="Repeater1" runat="server" 
                                onitemcommand="Repeater1_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <%# Eval("Ip") %>
                                        </td>
                                        <td>
                                            <%# Eval("AsType")%>
                                        </td>
                                        <td>
                                            <%# Eval("Area")%>
                                        </td>
                                        <td>
                                            <%# Eval("Date")%>
                                        </td>
                                        <td>
                                            <%# Eval("Num")%>
                                        </td>
                                        <td>
                                            <asp:LinkButton OnClientClick="return confirm('是否确定删除该条攻击记录\r\n删除后该Ip可能会继续攻击')" ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Ip") %>' CommandName="Del">删除</asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <uc3:bottom ID="bottom1" runat="server" />
    </form>
    <script src="layer/layer.min.js"></script>
</body>
</html>
