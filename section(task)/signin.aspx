<%@ Page Language="C#" %>
<%@ import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|dbbo.mdf;Integrated Security=True ";


        string strSelect = "SELECT * FROM NewStudent "
             + " WHERE Name = '" + txtname.Text + "'"
             + " AND Password = '" + txtPassword.Text + "'";


        SqlCommand cmdSELECT = new SqlCommand(strSelect,conn);

        SqlDataReader reader;

        conn.Open();
        reader = cmdSELECT.ExecuteReader();


        if (reader.Read())
        {
            HttpCookie cok = new HttpCookie("userInfo");
            cok.Values.Add("Username", txtname.Text);
            cok.Values.Add("Password", txtPassword.Text);
            cok.Expires = DateTime.Now.AddDays(20);
            Response.Cookies.Add(cok);


            if (txtname.Text == "Admin")
                Response.Redirect("~/adminhome.aspx");
            else
                Response.Redirect("~/userhome.aspx");
        }
        else
            lblMsg.Text = "Incoorect Username and/or Password!!";

        conn.Close(); 
        
        
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 228px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Monotype Koufi" Font-Size="Larger" Text="Sign In"></asp:Label>
    
    </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Font-Names="Arial Nova" ForeColor="#003399" Text="Name : "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtname" runat="server" Font-Names="Arial Nova" Font-Size="Medium" ForeColor="#003366" Width="305px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Font-Names="Arial Nova" ForeColor="#003399" Text="Password : "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" Font-Names="Arial Nova" Font-Size="Medium" ForeColor="#003366" TextMode="Password" Width="303px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnSubmit" runat="server" Font-Names="Arial Black" Font-Size="Medium" ForeColor="#003366" Text="Submit" OnClick="btnSubmit_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066">Forgot Password ?!</asp:LinkButton>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
