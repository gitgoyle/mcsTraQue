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
Imports System.Xml

Public Class member
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    <WebMethod()>
    Public Shared Function deleteItem(ByVal vParms As String) As Array
        Dim arrParms As Array = vParms.Split("|")
        Dim ssReturn(0 + 5) As String
        Dim stbl As String = ""

        Select Case arrParms(1).ToString.ToUpper
            Case "CERT"
                stbl = " delete traqCerts where certID = "
            Case "TRAIN"
                stbl = " delete traqTraining where trnID = "
            Case "EQUIP"
                stbl = " delete traqEquipment where eqID = "
        End Select

        If stbl <> "" Then
            stbl = stbl & arrParms(0).ToString
        End If

        Dim i As Integer = runSQLNoQ(stbl)

        Dim arrReturn As Array

        arrReturn = loadItems(arrParms(2).ToString & "|" & arrParms(1).ToString.ToUpper)
        ssReturn(0) = arrReturn(0).ToString
        ssReturn(1) = arrReturn(1).ToString
        ssReturn(2) = arrParms(1).ToString

        Return ssReturn
    End Function


    <WebMethod()> _
    Public Shared Function saveSubmission(ByVal vParms As String) As String
        Dim sReturn As String = "OK"
        Dim arrParms As Array = vParms.Split("|")

        If arrParms(0).ToString.ToUpper = "EQUIP" Then
            arrParms(0) = "traqEquipment"
        ElseIf arrParms(0).ToString.ToUpper = "TRAIN" Then
            arrParms(0) = "traqTraining"
        Else
            arrParms(0) = "traqCerts"
        End If

        Return sReturn
    End Function

    Public Shared Function updateNQ(ByVal vParms As String) As Boolean
        Dim bReturn As Boolean
        Dim cmd As New SqlClient.SqlCommand
        Dim con As New SqlClient.SqlConnection
        Dim sCon As String = System.Configuration.ConfigurationManager.ConnectionStrings("traqConnection").ToString
        Dim arrParms As Array = vParms.Split("|")
        '0=tablename
        '1=fields:values
        '2=criteria:values
        Dim sCmd As String = "update " & arrParms(0).ToString & " set " & arrParms(1).ToString & " where " & arrParms(2).ToString
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

    Public Shared Function runSQLNoQ(ByVal vParms As String) As Integer
        Dim iReturn As Integer = 1

        Dim cmd As New SqlClient.SqlCommand
        Dim con As New SqlClient.SqlConnection
        Dim sCon As String = System.Configuration.ConfigurationManager.ConnectionStrings("traqConnection").ToString
        Dim arrParms As Array = vParms.Split("|")
        '0=tablename
        '1=fields:values
        '2=criteria:values
        Dim sCmd As String = vParms

        Try
            con.ConnectionString = sCon
            con.Open()
            cmd.CommandText = sCmd
            cmd.Connection = con
            iReturn = cmd.ExecuteNonQuery
        Catch ex As System.Exception
            iReturn = 86
        End Try

        Return iReturn
    End Function

    <WebMethod()>
    Public Shared Function updateItem(ByVal vParms As String) As String
        Dim sReturn As String = "OK"
        Dim arrParms As Array = vParms.Split("|")
        '0 = item id
        '1 = title
        '2 = date
        '3 = amount/hours or type
        '4 = notes
        '5 = table
        '6 = traqid

        Dim updSQL As String = "update " & arrParms(5).ToString & " set "

        Return sReturn
    End Function

    <WebMethod()>
    Public Shared Function exportData(ByVal vParms As String) As Array
        Dim ssReturn(0 + 4) As String


        Dim vSaveAs As String = ""
        Dim vServerName As String = ""

        Dim dtExport As New Data.DataTable
        dtExport = dtFill("select * from traqCerts where traqID = 1 for xml")

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

        Dim writer As New XmlTextWriter("product.xml", System.Text.Encoding.UTF8)
        writer.WriteStartDocument(True)
        writer.Formatting = Formatting.Indented
        writer.Indentation = 2
        writer.WriteStartElement("Table")
        createNode(1, "Product 1", "1000", writer)
        createNode(2, "Product 2", "2000", writer)
        createNode(3, "Product 3", "3000", writer)
        createNode(4, "Product 4", "4000", writer)
        writer.WriteEndElement()
        writer.WriteEndDocument()
        writer.Close()

        Return ssReturn

    End Function

    Public Shared Sub createNode(ByVal pID As String, ByVal pName As String, ByVal pPrice As String, ByVal writer As XmlTextWriter)
        writer.WriteStartElement("Product")
        writer.WriteStartElement("Product_id")
        writer.WriteString(pID)
        writer.WriteEndElement()
        writer.WriteStartElement("Product_name")
        writer.WriteString(pName)
        writer.WriteEndElement()
        writer.WriteStartElement("Product_price")
        writer.WriteString(pPrice)
        writer.WriteEndElement()
        writer.WriteEndElement()
    End Sub

    <WebMethod()>
    Public Shared Function addNewItem(ByVal vParms As String) As Array
        Dim theIndex As New traque2.index
        Dim ssReturn(0 + 5) As String
        Dim arrParms As Array = vParms.Split("|")
        Dim sType As String = arrParms(2).ToString.ToUpper
        Dim sTraqID As String = arrParms(1).ToString
        Dim sSQL As String = ""

        'parmFinal = localStorage.getItem("traqid") + "|" + localStorage.getItem("traquser") + "|" + varIn(type) + "|nodata|"; 0 1 2 3
        'parmFinal += $("#inpNotes").val() + "|" + $("#inpDate").val() (renewal, training, purchase dates) + "|" + $("#inpTitle").val() + "|"; 4 5 6
        'parmFinal += $("#inpCategory option:selected").text() + "|" + $("#inpNotificationType option:selected").text(); 7 8 
        'parmFinal += $("purchaseAmount").val(); 9

        Select Case sType
            Case "CERT"
                sSQL = "insert into traqCerts (traqid, certType, certTypeID, Title, addedon, modifiedon, modifiedBy, notes, notificationType, notificationTypeID, certRenewal, files) "
                sSQL = sSQL & "values(" & arrParms(0).ToString & ", '" & arrParms(7).ToString & "',1,'" & arrParms(6).ToString & "',getdate(), getdate(),'" & arrParms(1).ToString & "','" & arrParms(4).ToString & "','" & arrParms(8).ToString & "',1,'" & arrParms(5).ToString & "','" & arrParms(10).ToString & "')"
            Case "TRAIN"
                sSQL = "insert into traqTraining(traqid, title, traindate, addedon, modifiedon, certid, trnHours, files) "
                sSQL = sSQL & "values('" & arrParms(0).ToString & "','" & arrParms(6).ToString & "', '" & arrParms(5).ToString & "',getdate(), getdate(), 1, " & arrParms(9).ToString & ",'" & arrParms(10).ToString & "')"
            Case "EQUIP"
                sSQL = " insert into traqEquipment (traqid, eqTitle, eqpurchasedate, eqnotes, addedon, addedby, modifiedon, modifiedby,certid, eqamount, eqFiles) "
                sSQL = sSQL & " values('" & arrParms(0).ToString & "','" & arrParms(6).ToString & "','" & arrParms(5).ToString & "','" & arrParms(4).ToString & "',getdate(),'" & arrParms(1).ToString & "',getdate(),'" & arrParms(1).ToString & "',2," & arrParms(9).ToString & ",'" & arrParms(10).ToString & "')"
        End Select

        '        insert into traqEquipment (eqTitle, eqpurchasedate, eqnotes, addedon, addedby, modifiedon, modifiedby, traqid, certid, eqamount)
        '           values('New gun',getdate(),'purchase a new gun to test fire',getdate(), 'mcs',getdate(),'mcs',1,2,357.99)

        '        insert into traqCerts (traqid, certType, certTypeID, Title, addedon, modifiedon, notes, notificationType, notificationTypeID)
        '           values(1, 'Information Technology',1,'Angular 2 Certification',getdate(),getdate(),'Need to keep this cert','Standard Notification',1)

        '        insert into traqTraining(title, traindate, traqid, addedon, modifiedon, certid)
        '           values('Continuing Education',getdate(),1,getdate(), getdate(), 1)

        If sSQL.Trim = "" Then
            ssReturn(0) = "BAD"
            Return ssReturn
        End If
        'Debug.Print(sSQL)
        Dim i As Integer = runSQLNoQ(sSQL)
        If i <> 86 Then
            ssReturn(0) = "OK"
        Else
            ssReturn(0) = "BAD"
        End If

        Return ssReturn
    End Function

    <WebMethod()>
    Public Shared Function loadItems(ByVal vParms As String) As Array
        Dim ssReturn(0 + 9) As String
        Dim arrParms As Array = vParms.Split("|")

        Dim sTbl As String
        Dim sFlds As String
        Dim sColHeader As String = "<th style='visibility:hidden'>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>"
        Dim sType As String = arrParms(1).ToString.ToUpper

        If sType = "CERT" Then
            sTbl = "traqCerts"
            sFlds = "certID, title, convert(varchar, certrenewal, 107) certRenewal, notes, certtype, notificationtype, convert(varchar, addedon, 107) addedOn, files "
            sColHeader = sColHeader & "<th>TITLE</th><th>RENEWAL</th><th class='editRow'>NOTES</th><th class='editRow'>CERT TYPE</th><th class='editRow'>Alert Type</th><th class='editRow'>Added On</th><th class='editRow'>Attached</th>"
        ElseIf stype = "TRAIN" Then
            sTbl = "traqTraining"
            sFlds = "trnID, title, convert(varchar, traindate, 107) trainDate, notes, trnHours, convert(varchar, addedon, 107) addedOn, files, 'train' "
            sColHeader = sColHeader & "<th>TITLE</th><th>TRAINED</th><th>NOTES</th><th>HOURS</th><th>Added On</th><th>Attached</th>"
        Else
            sTbl = "traqEquipment"
            sFlds = "eqID, eqtitle, convert(varchar, eqpurchasedate, 107) eqPurchaseDate, eqnotes, eqAmount, convert(varchar, addedon, 107) addedOn, eqFiles,'equip' "
            sColHeader = sColHeader & "<th>TITLE</th><th>PURCHASED</th><th>NOTES</th><th>AMOUNT</th><th>Added On</th><th>Attached</th>"
        End If

        '0=traqid, 1=tabletype
        Dim sSql As String = "select " & sFlds & " from " & sTbl & " where traqid = " & arrParms(0).ToString
        Dim dtItems As New Data.DataTable
        dtItems = dtFill(sSql)
        '<a id="aLoginLink" class="btn btn-default btn-custom" data-toggle="modal" data-target="#myLogin">
        Dim tblReturn As String = ""
        For cnt As Integer = 0 To dtItems.Rows.Count - 1
            tblReturn = tblReturn & "<tr>"
            tblReturn = tblReturn & "<td id='id_" & dtItems.Rows(cnt).Item(0).ToString & "' style='visibility:hidden'>" & dtItems.Rows(cnt).Item(0).ToString & "</td>" &
                                    "<td class='tblEditItem' title='modify'><i class='fa fa-edit fa-2x'></i></td><td class='tblDeleteItem' title='delete'><i class='fa fa-trash fa-2x'></i></td>" &
                                    "<td>" & dtItems.Rows(cnt).Item(1).ToString & "</td><td>" & dtItems.Rows(cnt).Item(2).ToString & "</td>" &
                                    "<td class='editRow'>" & dtItems.Rows(cnt).Item(3).ToString & "</td><td class='editRow'>" & dtItems.Rows(cnt).Item(4).ToString & "</td>" &
                                    "<td class='editRow'>" & dtItems.Rows(cnt).Item(5).ToString & "</td><td class='editRow'>" & dtItems.Rows(cnt).Item(6).ToString & "</td>" &
                                    "<td class='editRow'>" & dtItems.Rows(cnt).Item(7).ToString & "</td><td></tr>" & _
                                    "<tr class='detailRow'><th></th><th></th><th>Notes</th></tr> " & _
                                    "<tr class='detailRow'><td></td><td></td><td class='editRow'>" & dtItems.Rows(cnt).Item(3).ToString & "</td><td class='detailRow'>" & dtItems.Rows(cnt).Item(4).ToString & "</td>" &
                                    "<td class='detailRow'>" & dtItems.Rows(cnt).Item(5).ToString & "</td><td class='detailRow'>" & dtItems.Rows(cnt).Item(6).ToString & "</td>" &
                                    "<td class='detailRow'>" & dtItems.Rows(cnt).Item(7).ToString & "</td><td></tr>"

            'tblReturn = tblReturn & "</tr>"
        Next
        sColHeader = "<tr>" & sColHeader & "</tr>"

        tblReturn = sColHeader & tblReturn
        ssReturn(0) = "OK"
        ssReturn(1) = tblReturn

        Return ssReturn

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

    Protected Sub btnSaveFile_Click(sender As Object, e As EventArgs) Handles btnSaveFile.Click
        Debug.Print("clicked the btnSaveFile asp button")
    End Sub
End Class