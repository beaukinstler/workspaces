Imports System.Data.OleDb
Imports System.Web.Configuration
Imports System.Data.SqlClient

Partial Class import

    Inherits System.Web.UI.Page
    Private connectionString As String = WebConfigurationManager.ConnectionStrings("WorkstationsConnectionString").ConnectionString

    Protected FileLocation As String = ""


    Protected Sub ButtonUpload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUploadExcel.Click
        PanelUpload.Visible = True
        PanelView.Visible = False
        PanelImport.Visible = False

    End Sub

    Protected Sub ButtonFileUpload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonFileUpload.Click
        Dim st As String
        If FileUploadExcel.HasFile Then
            If FileUploadExcel.FileName.EndsWith(".xls") Then
                st = Server.MapPath("~/uploadfiles/StaffImport.xls")
            Else
                st = Server.MapPath("~/uploadfiles/StaffImport.csv")
            End If
            Try
                'alter the path for the project
                FileUploadExcel.SaveAs(st)

                LabelUpload.Text = "Upload File Name: " & _
                    FileUploadExcel.PostedFile.FileName.ToString() & "<br>" & _
                    "Type: " & _
                    FileUploadExcel.PostedFile.ContentType.ToString() & _
                    "Size: " & FileUploadExcel.PostedFile.ContentLength.ToString() & " kb<br>"
                FileLocation = st.ToString()
            Catch ex As Exception
                LabelUpload.Text = ex.Message.ToString()
            End Try
        Else
            LabelUpload.Text = "Please select an excel/csv file to upload"

        End If
    End Sub

    Protected Function ExcelConnection() As OleDbCommand
        Dim st As String
        st = Server.MapPath("~/uploadfiles/StaffImport.xls").ToString


        ' Connect to the Excel Spreadsheet
        Dim xConnStr As String = "Provider=Microsoft.Jet.OLEDB.4.0;" & _
              "Data Source=" & st & ";" & _
              "Extended Properties=Excel 8.0;"

        ' create your excel connection object using the connection string
        Dim objXConn As New OleDbConnection(xConnStr)
        Try
            objXConn.Open()
        Catch ex As Exception
            LabelUpload.Text = ex.Message.ToString()
        End Try

        ' use a SQL Select command to retrieve the data from the Excel Spreadsheet
        ' the "table name" is the name of the worksheet within the spreadsheet
        ' in this case, the worksheet name is "Members" and is expressed as: [Members$]
        Dim objCommand As New OleDbCommand("SELECT * FROM [Staff IDs$]", objXConn)
        Return objCommand



    End Function

    Protected Sub ButtonView_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonView.Click
        PanelUpload.Visible = False
        PanelView.Visible = True
        PanelImport.Visible = False

        Dim objDataAdapter As New OleDbDataAdapter

        objDataAdapter.SelectCommand = ExcelConnection()


        Dim objDataSet As New Data.DataSet
        objDataAdapter.Fill(objDataSet)

        'Bind the data to the gridview
        Gridview1.DataSource = objDataSet.Tables(0).DefaultView
        Gridview1.DataBind()
    End Sub

    Protected Sub ButtonImport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonImport.Click
        PanelUpload.Visible = False
        PanelView.Visible = False
        PanelImport.Visible = True
        LabelImport.Text = ""
        ' retrieve the Select Command for the worksheet data
        Dim objCommand As New OleDbCommand()
        objCommand = ExcelConnection()

        ' create a DataReader
        Dim reader As OleDbDataReader
        reader = objCommand.ExecuteReader()

        While reader.Read()       ' set default values for loop
            Dim StaffID As Integer = reader("StaffID")
            Dim FullName As String = Convert.ToString(reader("FullName"))





            'TODO: Insert any required validations here...
            If FullName.Length = 0 Then
                LabelImport.Text &= "You must provide a last name!"
            Else
                ImportIntoStaffTemp(StaffID, FullName)




                'TODO: Get (or create) the corresponding category_ID

                'TODO: Insert a record into the Members table (if it's not a duplicate)
            End If

            'Display information in LabelImport
            LabelImport.Text &= StaffID & FullName & "<br>"
        End While
        reader.Close()
    End Sub
    Protected Sub ImportIntoStaffTemp(ByVal staffid As Integer, ByVal fullname As String)
        Try
            Dim StaffAdapter As New DataSet1TableAdapters.StaffTableAdapter

            Dim StaffDataTable As DataSet1.StaffDataTable = Nothing

            StaffDataTable = StaffAdapter.GetData()

            ' see if the category already exists in the table, if not insert it
            If Not StaffDataTable Is Nothing Then
                If StaffDataTable.Rows.Count > 0 Then
                    If Not StaffDataTable(0).StaffID = Nothing Then
                        LabelImport.Text = LabelImport.Text & _
                           "<font color=blue>Member Found, Not Imported: " & _
                           " ID: " & staffid & " " & fullname & ".</font><br>"
                    End If
                End If
            End If



            StaffAdapter.InsertQuery(staffid, fullname)

            LabelImport.Text = LabelImport.Text & _
                  "<font color=green>Member Imported: " & _
                  " ID: " & staffid & " " & fullname & ".</font><br />"

        Catch ex As Exception
            LabelImport.Text &= "<font color=red>" & ex.ToString & "</font><br />"

        End Try


    End Sub


    Protected Sub ImbortCommandButtonClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImportCommand.Click
        Dim importSql As New String("EXEC Workstations.dbo.sp_ImportNewStaff")
        Dim conn As New SqlConnection(connectionString)

        Dim added As Integer

        Try
            conn.Open()
            Dim cmd As New SqlCommand(importSql, conn)
            added = cmd.ExecuteNonQuery()
            lblError.Text() = added.ToString() & " records affected"
        Catch ex As Exception
            lblError.Text = ex.Message.ToString()

        Finally
            conn.Close()
        End Try




    End Sub


End Class
