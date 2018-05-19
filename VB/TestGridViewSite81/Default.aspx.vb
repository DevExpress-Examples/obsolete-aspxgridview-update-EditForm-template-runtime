Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Collections.Generic
Imports System.Collections
Imports DevExpress.Web
Imports System.Drawing
Imports System.IO
Imports System.Drawing.Imaging

Partial Public Class _Default
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub

	Private values As New Dictionary(Of String, Object)()

	Protected Sub ASPxGridView1_HtmlRowCreated(ByVal sender As Object, ByVal e As ASPxGridViewTableRowEventArgs)
		If e.RowType = GridViewRowType.EditForm Then
			values.Clear()
			Dim gridView As ASPxGridView = CType(sender, ASPxGridView)
			Dim txtBox As ASPxTextBox = CType(gridView.FindEditFormTemplateControl("txtCategoryName"), ASPxTextBox)
			values.Add("CategoryName", txtBox.Text)
			txtBox.Text = e.GetValue("CategoryName").ToString()
			txtBox = CType(gridView.FindEditFormTemplateControl("txtDescription"), ASPxTextBox)
			values.Add("Description", txtBox.Text)
			txtBox.Text = e.GetValue("Description").ToString()
		End If
	End Sub

	Protected Sub ASPxGridView1_RowUpdating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs)
		e.NewValues("CategoryName") = values("CategoryName")
		e.NewValues("Description") = values("Description")
	End Sub
End Class
