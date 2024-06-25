<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/TestGridViewSite81/Default.aspx)
* [Default.aspx.cs](./CS/TestGridViewSite81/Default.aspx.cs)
<!-- default file list end -->
# OBSOLETE - How to update an ASPxGridView DataSource if the initial values are set programmatically in the HtmlRowCreated event


<p><strong>UPDATED:<br></strong>This example is now obsolete. Use the approach shown in the <a href="https://documentation.devexpress.com/AspNet/DevExpress.Web.GridViewTemplates.EditForm.property">GridViewTemplates.EditForm</a> topic to pass the values from the template:</p>


```cs
protected void ASPxGridView1_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e) {
    e.NewValues["CategoryName"] = ((ASPxTextBox)ASPxGridView1.FindEditFormTemplateControl("txtCategoryName")).Text;
    e.NewValues["Description"] = ((ASPxTextBox)ASPxGridView1.FindEditFormTemplateControl("txtDescription")).Text;
}
```


<p><br><strong>Old description:</strong><br>It is an often situation when the ASPxGridView's EditForm layout is defined using the EditFormTemplate. In this case, there are two solutions to initialize editor values</p>
<p>- first one is to use binding <br>- and the second one is to do it programmatically.</p>
<p>This example is devoted to the case where values need to be initialized programmatically.<br>(Using binding does not require any additional code)</p>
<p>If you are setting initial editor values programmatically, you should fetch modified editor values within the RowUpdating (RowInserting) event handlers and pass them to the Update (Insert) command of your DataSourceControl. <br>The problem comes because the ASPxGridView is rendered before the RowUpdating event is fired and thus newly input values are overriden with default ones. <br>This event is triggered because the ASPxGridView, as any other ASP.NET control, recreates its hierarchy (at a minimum) twice during a single request to the server:</p>
<p>- first time when the control's to be restored to a it's previous state...<br>- second time when all the required modifications are applied...</p>
<p>To work around this problem, it is possible to preserve editor values in a page's local variable. This should be done before setting default editor values. A sample project attached shows this approach in action.</p>
<p><strong>See also:</strong><br> <a href="https://www.devexpress.com/Support/Center/p/K18282">The general technique of using the Init/Load event handler</a></p>

<br/>


