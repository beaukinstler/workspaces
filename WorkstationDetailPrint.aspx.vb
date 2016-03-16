
Partial Class WorkstationDetailPrint
    Inherits System.Web.UI.Page
    Public Function IsNotNull(ByVal value As Object) As String
        Try
            If value.ToString().Length > 0 Then
                Return "True"
            End If
        Catch ex As Exception
            Return "False"

        End Try
        Return "False"
    End Function

End Class
