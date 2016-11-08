Public Class frmUpload
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Debug.Print(fup1.FileName)
    End Sub

    Protected Sub btnSaveFile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSaveFile.Click

        Dim vID As String = HttpContext.Current.Session("s_curuserid")
        Dim vSaveAs As String = ""
        Dim b As Boolean

        If fup1.HasFile Then
            Debug.Print(fup1.FileName)
            Debug.Print(fup1.PostedFile.FileName)
            Try
                'vSaveAs = Server.MapPath("images/") & filUp11.PostedFile.FileName
                HttpContext.Current.Session("file1") = fup1.PostedFile.FileName
                vSaveAs = Server.MapPath("userUploads/") & fup1.PostedFile.FileName
                fup1.SaveAs(vSaveAs)

            Catch ex As System.Exception
                b = updateNQ("insert into webErrorLog (theError) values('" & ex.Message & "'")

                vSaveAs = ""
            End Try
        Else
            b = updateNQ("insert into webErrorLog (theError) values('there was nothing to upload, which does not seem possible'")
        End If


        'If filUp11.HasFile Then
        '    '../svc/images/
        '    Try
        '        'vSaveAs = Server.MapPath("images/") & filUp11.PostedFile.FileName
        '        HttpContext.Current.Session("file1") = filUp11.PostedFile.FileName
        '        vSaveAs = Server.MapPath("images/") & vServerName
        '        filUp11.SaveAs(vSaveAs)
        '        'vSaveAs = filUp11.PostedFile.FileName
        '        aspimg1.ImageUrl = "../images/" & vServerName
        '    Catch ex As System.Exception
        '        vSaveAs = ""
        '    End Try
        'Else
        '    'aspIMG1.ImageUrl = filLoc & "2019_PICmcs.jpg"
        '    vSaveAs = ""
        'End If


    End Sub

    Public Shared Function updateNQ(ByVal vParms As String) As Boolean
        Dim bReturn As Boolean
        Dim cmd As New SqlClient.SqlCommand
        Dim con As New SqlClient.SqlConnection
        Dim sCon As String = System.Configuration.ConfigurationManager.ConnectionStrings("traqConnection").ToString
        Dim arrParms As Array = vParms.Split("|")
        '0=sql statement
        Dim sCmd As String = vParms
        Dim iReturn As Integer

        Try
            con.ConnectionString = sCon
            con.Open()
            cmd.CommandText = sCmd
            cmd.Connection = con
            iReturn = cmd.ExecuteNonQuery
        Catch ex As System.Exception
            iReturn = 86
        End Try

        If iReturn = 86 Or iReturn = -1 Then
            bReturn = False
        Else
            bReturn = True
        End If

        Return bReturn

    End Function


End Class