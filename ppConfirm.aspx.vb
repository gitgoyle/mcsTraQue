Imports System.Net
Imports System.IO
Imports System.Web

Public Class ppConfirm
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Post back to either sandbox or live
        Dim strSandbox As String = "https://www.sandbox.paypal.com/cgi-bin/webscr"
        Dim strLive As String = "https://www.paypal.com/cgi-bin/webscr"
        Dim req As HttpWebRequest = CType(WebRequest.Create(strLive), HttpWebRequest)
        Dim xi As New traque2.index

        'Set values for the request back
        req.Method = "POST"
        req.ContentType = "application/x-www-form-urlencoded"
        Dim Param() As Byte = Request.BinaryRead(HttpContext.Current.Request.ContentLength)
        Dim strRequest As String = Encoding.ASCII.GetString(Param)
        strRequest = strRequest & "&cmd=_notify-validate"
        req.ContentLength = strRequest.Length

        Dim thisReq As String = strRequest.ToString
        thisReq = thisReq.Replace("'", "''")

        Dim sql2 As String
        Dim sReturn2 As String

        sql2 = "insert into ipnTest(req) values('" & thisReq & "')"
        sReturn2 = xi.connExNQ(sql2)


        'for proxy
        'Dim proxy As New WebProxy(New System.Uri("http://url:port#"))
        'req.Proxy = proxy

        'Send the request to PayPal and get the response
        Dim streamOut As StreamWriter = New StreamWriter(req.GetRequestStream(), Encoding.ASCII)
        streamOut.Write(strRequest)
        streamOut.Close()
        Dim streamIn As StreamReader = New StreamReader(req.GetResponse().GetResponseStream())
        Dim strResponse As String = streamIn.ReadToEnd()
        streamIn.Close()

        sql2 = "insert into ipnTest(req) values('RESPONSE: " & strResponse & "')"
        sReturn2 = xi.connExNQ(sql2)


        If strResponse = "VERIFIED" Then
            Response.Write("verified")

            Dim txnId As String = Request("txn_id").ToString
            Response.Write(txnId)
            Dim paymentDate As String = Request("payment_date").ToString
            Dim payerEmail As String = Request("payer_email").ToString
            Dim paymentStatus As String = Request("payment_status").ToString
            Dim firstName As String = Request("first_name").ToString
            Dim lastName As String = Request("last_name").ToString
            Dim receiverEmail As String = Request("receiver_email").ToString

 
            Dim sql As String = "insert into traqpayments(traqid, paycode, paystatus) " & _
                "values(1,'" & txnId & "', '" & Mid(paymentStatus, 1, 1) & "')"

            Dim sReturn As String = xi.connExNQ(sql)

            'check the payment_status is Completed
            'check that txn_id has not been previously processed
            'check that receiver_email is your Primary PayPal email
            'check that payment_amount/payment_currency are correct
            'process payment
        ElseIf strResponse = "INVALID" Then
            Response.Write("invalid")
            'log for manual investigation
        Else
            'Response wasn't VERIFIED or INVALID, log for manual investigation
        End If
    End Sub
End Class