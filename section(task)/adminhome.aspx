<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        String Username = "";
        if (Request.Cookies["userInfo"] != null)
            Username = Request.Cookies["userInfo"].Values["Username"];

        lblMsg.Text = "Welcome " + Username + " to Home Page!!";

    }


</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lblMsg" runat="server" Font-Names="Arial Black" Font-Size="XX-Large"></asp:Label>
    
    </div>
    </form>
</body>
</html>
