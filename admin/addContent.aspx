<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addContent.aspx.cs" Inherits="admin_addContent"
    ValidateRequest="false" %>

<%@ Register Src="left.ascx" TagName="left" TagPrefix="uc1" %>
<%@ Register Src="top.ascx" TagName="top" TagPrefix="uc2" %>
<%@ Register Src="bottom.ascx" TagName="bottom" TagPrefix="uc3" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="css/admin.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="css/jquery.datepick.css" />

    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>

    <script type="text/javascript" src="js/jquery.datepick.js"></script>

    <script type="text/javascript" src="js/jquery.datepick-zh-CN.js"></script>



    <script src="js/PublicJs.js"></script>

</head>
<body>
    =
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div>
            <uc1:left ID="left1" runat="server" />
            <uc2:top ID="top1" runat="server" />
            <div class="main">
                <h5 class="maintit maintit2">
                    编辑内容</h5>
                <div class="datas datas3">
                    <div class="corner2">
                        <span class="corner_lt">&nbsp;</span> <span class="corner_rt">&nbsp;</span> <span
                            class="corner_lb">&nbsp;</span> <span class="corner_rb">&nbsp;</span>
                        <div class="yuesao">
                            <div class="yslt">
                                <label>
                                    栏目：</label>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" class="ctxt1 ctxt1_1 ctxt1_3"
                                            OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                                        </asp:DropDownList>
                                        <label>
                                            子栏目：</label>
                                        <asp:DropDownList ID="DropDownList2" runat="server" class="ctxt1 ctxt1_1 ctxt1_3">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <div class="clr">
                                </div>
                            </div>
                            <div class="clr">
                            </div>
                            <label>
                                标题：</label><asp:TextBox ID="TextBox3" class="ctxt1 ctxt1_1 ctxt1_4" runat="server"></asp:TextBox>
                            <div class="clr">
                            </div>
                            <label>
                                关键字：</label><asp:TextBox ID="TextBox4" class="ctxt1 ctxt1_1 ctxt1_4" runat="server"></asp:TextBox>
                            <div class="clr">
                            </div>
                            <label>
                                归属地：</label><asp:DropDownList ID="DropDownList3" runat="server" class="ctxt1 ctxt1_1 ctxt1_3">
                                </asp:DropDownList>
                            <div class="clr">
                            </div>
                            <label>
                                描述：</label><asp:TextBox ID="TextBox6" class="ctxt1 ctxt1_1 ctxt1_4" runat="server"></asp:TextBox>
                            <div class="clr">
                            </div>
                            <label>
                                内容：</label>
                            <FTB:FreeTextBox ID="CKEditor1" Focus="true" SupportFolder="~/aspnet_client/FreeTextBox/"
                                JavaScriptLocation="ExternalFile" ButtonImagesLocation="ExternalFile" ToolbarImagesLocation="ExternalFile"
                                ToolbarStyleConfiguration="OfficeXP" ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,
FontBackColorPicker|Bold,Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,
JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage|Cut,Copy,Paste,Delete;Undo,Redo,Print,Save|
SymbolsMenu,StylesMenu,InsertHtmlMenu|InsertRule,InsertDate,InsertTime|InsertTable,EditTable;InsertTableRowAfter,
InsertTableRowBefore,DeleteTableRow;InsertTableColumnAfter,InsertTableColumnBefore,DeleteTableColumn|InsertForm,InsertTextBox,
InsertTextArea,InsertRadioButton,InsertCheckBox,InsertDropDownList,InsertButton|InsertDiv,EditStyle,InsertImageFromGallery,
Preview,SelectAll,WordClean,NetSpell" runat="Server" GutterBackColor="red" DesignModeCss="designmode.css" ButtonSet="OfficeMac"
                                ImageGalleryPath="~/uploadimages/" />
                        </div>
                        <font color="red" style="display: block; margin-left: 100px;">官网文章保存前请检查以下事项，否则为无效新闻：<br />
                            1. 每篇文章，必须拥有5个或以上的关键词（详见附件）。<br />
                            2. 每个关键字，必须链接到站内其它对应文章。如无对应的，则链接至首页。<br />
                            3. 确保3个及以上的关键字链能到达站内其它文章。<br />
                            4. 严厉禁止同一个关键词链接到不同的地点。<br />
                            5. 文章结尾写明：“本文来自优月之家母婴护理服务中心(www.5258.cn)，如有转载请注明！”<br />
                            6. 最后加上：本文链接：http://www.5258.cn/???????????。这个链接地址要第二次保存时才能加上。<br />
                            <br />
                            附件：候选关键词<br />
                            月嫂、月嫂公司、广州月嫂、深圳月嫂、南昌月嫂、武汉月嫂、优月之家月嫂……<br />
                            月嫂价格、月嫂工资、专业月嫂、金牌月嫂、南山月嫂、天河区月嫂、珠江新城月嫂……<br />
                            月嫂培训、月子餐、营养配餐、催乳、乳房护理、催乳师……<br />
                            月子服务、月子护理、母婴护理、产妇护理、新生儿护理……<br />
                        </font>
                    </div>
                    <div class="yssbtdiv">
                        <asp:Button ID="Button1" runat="server" Text="保 存" OnClick="Button1_Click" OnClientClick="ALoading();" />&nbsp;&nbsp;&nbsp;</div>
                    <asp:TextBox ID="TextBoxPower" Style="display: none;" runat="server"></asp:TextBox>
                    <asp:TextBox ID="TextBoxCity" Style="display: none;" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>
        <uc3:bottom ID="bottom1" runat="server" />
    </form>
        <script src="layer/layer.min.js"></script>
</body>
</html>
