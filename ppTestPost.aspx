<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ppTestPost.aspx.vb" Inherits="TraQue.ppTestPost" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" target="_blank" method="post" action="ppConfirm.aspx">
    <div>
        <input id="inpFirstName" name="first_name" value="mike" />
        <input id="inpLastName" name="last_name" value="salvidio" />

        <button id="btnSubmit" type="submit">post to ppConfirm</button>
    </div>
    </form>
</body>
</html>
