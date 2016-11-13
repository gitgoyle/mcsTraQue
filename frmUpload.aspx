<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmUpload.aspx.vb" Inherits="traque2.frmUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        function getFileDlg() {
            document.getElementById('<%= fup1.ClientID %>').click();
            return false;
        }

        function fileChange() {
            var fu1 = document.getElementById('<%= fup1.ClientID %>');
            var fn = fu1.value;
            fn.replace("\\","\\\\");
            var arrn = [];
            arrn = fn.split('\\');
            top.showFileName(arrn[2]);
        }

        function callButtonClick() {
            var fubtn = document.getElementById('<%= btnSaveFile.ClientID %>');
            fubtn.click();
        }
    </script>

</head>
<body>
    <form id="form1" runat="server" style="height:20px; width:150px; background-color:transparent; border:none; outline:none">
    <div style="height: 23px">
        <div id="divOverlay" onclick="getFileDlg()" style="cursor:pointer; position:fixed; width:250px; height:20px; border:1px solid white; background-color:#ef9a29; text-align:center">
            <span style="margin-top:10px;">&nbsp;Attach a file to this event&nbsp;</span>
        </div>
        <asp:FileUpload runat="server" ID="fup1" onchange="fileChange()" />
        <div id="divHideCtrls" style="visibility:hidden; height:0px">
            <asp:Button runat="server" ID="btnSaveFile" />
        </div>
    </div>
    </form>
</body>
</html>
