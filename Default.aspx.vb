Imports System.Data.SqlClient
Partial Class _Default


    Inherits System.Web.UI.Page

    Protected Sub clearLabelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clearLabelButton.Click
        Dim constr As New String(ConfigurationManager.ConnectionStrings("WorkstationsConnectionString").ConnectionString)
        Dim conn As New SqlConnection(constr.ToString())



        Try
            conn.Open()

            Dim cmd As New SqlCommand("Exec sp_ClearNeedsLabelFlag", conn)
            cmd.ExecuteNonQuery()
            'MsgBox("Success")
        Catch ex As Exception

        End Try

        conn.Close()
    End Sub

    Protected Sub setNeedsLabelAllButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles setNeedsLabelAllButton.Click
        Dim constr As New String(ConfigurationManager.ConnectionStrings("WorkstationsConnectionString").ConnectionString)
        Dim conn As New SqlConnection(constr.ToString())



        Try
            conn.Open()

            Dim cmd As New SqlCommand("Exec sp_setNeedsLabelFlag", conn)
            cmd.ExecuteNonQuery()
            'MsgBox("Success")
        Catch ex As Exception

        End Try

        conn.Close()
    End Sub
End Class
