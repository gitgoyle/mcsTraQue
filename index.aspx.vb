Imports System.IO
Imports System.Net
Imports System.Web
Imports System.Data
Imports System.Net.Mail
Imports System.Net.Security
Imports System.Web.Services
Imports System.Data.SqlClient
Imports System.Drawing.Imaging
Imports System.ComponentModel
Imports System.Web.Services.Protocols
Imports System.Web.Script.Serialization
Imports System.Security.Cryptography.X509Certificates
Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.Math
Imports System.Media

Public Class index
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    <WebMethod()> _
    Public Shared Function checkLogin(ByVal vParms As String) As Array
        Dim arrReturn(0 + 12) As String
        '0 = OK or BAD
        '1 = traqid
        '2 = firstname 
        '3 = lastname
        '4 = traqstatus
        '5 = uid
        '6 = uac
        '7 = membershiptype
        '8 = contactemailaddress
        '9 = NA
        'retval, traqid, firstname, lastname, traqstatus, uid, uac, membershiptype, contactemailaddress

        Dim arrParms As Array = vParms.Split("|")

        Dim sUID As String = arrParms(0).ToString
        Dim sPWD As String = arrParms(1).ToString

        Dim sql As String = "select traqID, firstname, lastname, traqstatus, uid, uac, membershiptype, contactemailaddress from traqmembers where uid = '" & arrParms(0).ToString & "'  and uac = '" & arrParms(1).ToString & "'"

        Dim dtLogin As New Data.DataTable
        dtLogin = dtFill(sql)
        Dim arrCounts As Array

        If dtLogin.Rows.Count > 0 Then
            With dtLogin
                arrReturn(0) = "OK"
                arrReturn(1) = .Rows(0)("traqid").ToString
                arrReturn(2) = .Rows(0)("firstname").ToString
                arrReturn(3) = .Rows(0)("lastname").ToString
                arrReturn(4) = .Rows(0)("traqstatus").ToString
                arrReturn(5) = .Rows(0)("uid").ToString
                arrReturn(6) = .Rows(0)("uac").ToString
                arrReturn(7) = .Rows(0)("membershiptype").ToString
                arrReturn(8) = .Rows(0)("contactemailaddress").ToString
                arrReturn(9) = "0"
                arrReturn(10) = "0"
                arrReturn(11) = "0"
                arrReturn(12) = "STOP"
                HttpContext.Current.Session("s_curuserid") = arrReturn(5).ToString
            End With
            arrCounts = getCTECounts(arrReturn(1).ToString)
            arrReturn(9) = arrCounts(0).ToString
            arrReturn(10) = arrCounts(1).ToString
            arrReturn(11) = arrCounts(2).ToString
        Else
            arrReturn(0) = "BAD"
        End If

        Return arrReturn

    End Function

    Public Shared Function dtFill(ByVal vParms As String) As Data.DataTable
        Dim dtReturn As New Data.DataTable

        Dim conn As New SqlClient.SqlConnection
        Dim cmd As New SqlClient.SqlCommand
        Dim sqlConnection As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("traqConnection").ConnectionString)

        Try
            sqlConnection.Open()
        Catch ex As System.Exception
            Return Nothing
        End Try

        Dim sqlCommand As SqlCommand = New SqlCommand(vParms, sqlConnection)
        Dim sqlDataset As DataSet = New DataSet()
        Dim sqlDataAdapter As SqlDataAdapter = New SqlDataAdapter(sqlCommand)

        sqlDataAdapter.Fill(sqlDataset)

        sqlConnection.Close()

        If sqlDataset.Tables.Count = 0 Then
            Return Nothing

            sqlDataAdapter.Dispose()
            sqlDataset.Dispose()
            sqlConnection.Dispose()
        End If

        dtReturn = sqlDataset.Tables(0)

        sqlDataAdapter.Dispose()
        sqlDataset.Dispose()
        sqlConnection.Dispose()

        Return dtReturn
    End Function

    Public Function connExNQ(ByVal vParms As String) As String
        Dim sReturn As String = "OK"

        Dim conn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("traqConnection").ToString)

        Dim cmd As New SqlCommand
        Try
            conn.Open()
            cmd.CommandText = vParms
            cmd.Connection = conn
            Dim iExe As Integer = cmd.ExecuteNonQuery
            sReturn = "non query worked"
        Catch ex As Exception
            sReturn = "CANNOT OPEN"
        End Try

        Return sReturn
    End Function

    <WebMethod()>
    Public Shared Function setSessionVar(ByVal vParms As String) As String
        Dim arrParms As Array = vParms.Split(":")
        Dim sVarName As String = vParms(0).ToString
        Dim sVarValue As String = vParms(1).ToString
        HttpContext.Current.Session(sVarName) = sVarValue
        Return "OK"
    End Function
    <WebMethod()>
    Public Shared Function getCTECounts(ByVal vParms As String) As Array
        Dim ssReturn(0 + 2) As String
        Dim dteCounts As Data.DataTable
        Dim arrParms As Array = vParms.Split("|")

        dteCounts = dtFill("select count(*) from traqCerts where traqID = " & arrParms(0).ToString)
        If dteCounts.Rows.Count > 0 Then
            ssReturn(0) = dteCounts.Rows(0)(0).ToString
        Else
            ssReturn(0) = "0"
        End If

        dteCounts = dtFill("select count(*) cnt, sum(isnull(trnHours,0)) totalTrained from traqTraining where traqID = " & arrParms(0).ToString)
        If dteCounts.Rows.Count > 0 Then
            ssReturn(1) = dteCounts.Rows(0)(1).ToString
        Else
            ssReturn(1) = "0"
        End If

        dteCounts = dtFill("select count(*) cnt, sum(isnull(eqAmount,0)) totalSpent from traqEquipment where traqID = " & arrParms(0).ToString)
        If dteCounts.Rows(0)(0) > 0 Then
            ssReturn(2) = dteCounts.Rows(0)(1).ToString
        Else
            ssReturn(2) = "0.00"
        End If

        dteCounts.Dispose()

        Return ssReturn
    End Function

    <WebMethod()>
    Public Shared Function getCTETotals(ByVal vParms As String) As Array
        Dim ssReturn(0 + 19) As String
        Dim dteCounts As Data.DataTable
        Dim arrParms As Array = vParms.Split("|")

        Dim sSQL As String = "select 1 [type], 'Total Users', count(*) from traqmembers where membershiptype <> 'TA' " & _
                                        " union select 2 [type], 'Free Users', count(*) from traqmembers where membershiptype = 'IF' " & _
                                        " union select 3 [type], 'Indivual Paying', count(*) from traqmembers where membershiptype = 'IP' " & _
                                        " union select 4 [type], 'Agency Users', count(*) from traqmembers where membershiptype = 'AG' " & _
                                        " union select 5 [type], 'Total Certificates', count(*) from traqcerts " & _
                                        " union select 6 [type], 'Total Training Hours', sum(trnHours) from traqtraining " & _
                                        " union select 7 [type], 'Total Equipment Spend', sum(eqAmount) TotalSpend from traqequipment " & _
                                        " order by 1 "

        dteCounts = dtFill(sSQL)

        ssReturn(0) = dteCounts.Rows(0)(2).ToString
        ssReturn(1) = dteCounts.Rows(1)(2).ToString
        ssReturn(2) = dteCounts.Rows(2)(2).ToString
        ssReturn(3) = dteCounts.Rows(3)(2).ToString
        ssReturn(4) = dteCounts.Rows(4)(2).ToString
        ssReturn(5) = dteCounts.Rows(5)(2).ToString
        ssReturn(6) = dteCounts.Rows(6)(2).ToString
        ssReturn(7) = "STOP"

        dteCounts.Dispose()

        Return ssReturn
    End Function

End Class