<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.16.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.16.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.16.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;<dxwgv:ASPxGridView ID="ASPxGridView1" runat="server"
            DataSourceID="AccessDataSource1" KeyFieldName="CategoryID" Width="580px" AutoGenerateColumns="False" OnHtmlRowCreated="ASPxGridView1_HtmlRowCreated" OnRowUpdating="ASPxGridView1_RowUpdating">
            <Columns>
                <dxwgv:GridViewCommandColumn VisibleIndex="0">
                    <EditButton Visible="True">
                    </EditButton>
                </dxwgv:GridViewCommandColumn>
                <dxwgv:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="2">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="Description" VisibleIndex="3">
                </dxwgv:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True"/>
            <Templates>
                <EditForm>
                    <table>
                        <tr>
                            <td>CategoryName :</td>
                            <td>
                                <dxe:ASPxTextBox ID="txtCategoryName" runat="server"></dxe:ASPxTextBox>
                            </td>
                            <td>CategoryName :</td>
                            <td>
                                <dxe:ASPxTextBox ID="txtDescription" runat="server"></dxe:ASPxTextBox>
                            </td>                            
                        </tr>
                        <tr>
                            <td colspan="2">
                                <dxwgv:ASPxGridViewTemplateReplacement ID="upButton" runat="server" ReplacementType="EditFormUpdateButton"></dxwgv:ASPxGridViewTemplateReplacement>
                            </td>
                            <td colspan="2">
                                <dxwgv:ASPxGridViewTemplateReplacement ID="cButton" runat="server" ReplacementType="EditFormCancelButton"></dxwgv:ASPxGridViewTemplateReplacement>
                            </td>                            
                        </tr>
                    </table>
                </EditForm>
            </Templates>
        </dxwgv:ASPxGridView>
        &nbsp;
    </div>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT * FROM [Categories]" 
            UpdateCommand="UPDATE [Categories] SET [CategoryName] = ?, [Description] = ? WHERE [CategoryID] = ?">
            <UpdateParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>
    </form>
</body>
</html>

