using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Collections;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxEditors;
using System.Drawing;
using System.IO;
using System.Drawing.Imaging;
using DevExpress.Web.ASPxPopupControl;
using DevExpress.Web.ASPxPanel;

public partial class _Default : System.Web.UI.Page {

    protected void Page_Load(object sender, EventArgs e) {
        
    }

    Dictionary<string, object> values = new Dictionary<string, object>();

    protected void ASPxGridView1_HtmlRowCreated(object sender, ASPxGridViewTableRowEventArgs e) {
        if (e.RowType == GridViewRowType.EditForm) {
            values.Clear();
            ASPxGridView gridView = (ASPxGridView)sender;
            ASPxTextBox txtBox = (ASPxTextBox)gridView.FindEditFormTemplateControl("txtCategoryName");
            values.Add("CategoryName", txtBox.Text);
            txtBox.Text = e.GetValue("CategoryName").ToString();
            txtBox = (ASPxTextBox)gridView.FindEditFormTemplateControl("txtDescription");
            values.Add("Description", txtBox.Text);
            txtBox.Text = e.GetValue("Description").ToString();
        }        
    }

    protected void ASPxGridView1_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e) {
        e.NewValues["CategoryName"] = values["CategoryName"];
        e.NewValues["Description"] = values["Description"];
    }
}
