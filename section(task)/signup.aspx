<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_click(object sender, EventArgs e)
    {
        SqlConnection connect = new SqlConnection();
       
        connect.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|dbbo.mdf;Integrated Security=True";
        string StrInsert = "INSERT INTO NewStudent "
            + " VALUES('" + TextBox1.Text + "','"
            + TextBox2.Text + "','"
            + TextBox3.Text + "','"
            + TextBox4.Text + "','"
            + TextBox5.Text + "','"
            + RadioButtonList1.SelectedValue + "','"
            + DropDownList1.SelectedValue + "','"
            + DropDownList2.SelectedValue + "','"
            + TextBox6.Text + "','"
            + DropDownList3.SelectedValue + "','"
            + RadioButtonList2.SelectedValue + "')";

        
      
        SqlCommand Insert = new SqlCommand(StrInsert, connect);
        try
        {
            connect.Open();

            Insert.ExecuteNonQuery();
            connect.Close();

            lblMsg.Text = "Welcome " + TextBox1.Text + " Your Account Has Been Successfully Created!!";
        }


        catch (SqlException err)
        {
            if (err.Number == 2627)
                lblMsg.Text = "Username already exists, Please Choose Another!!";
            else
                lblMsg.Text = "Sorry, Database Error, You may Try later!!";
        }

        catch
        {
            lblMsg.Text = "Sorry, System Error, You may Try later!!";
        }
    
    }

    protected void TextBox6_TextChanged(object sender, EventArgs e)
    {

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
            height: 23px;
        }
        .auto-style3 {
            width: 181px;
        }
        .auto-style4 {
            height: 23px;
            width: 181px;
        }
        .auto-style5 {
            width: 240px;
        }
        .auto-style6 {
            height: 23px;
            width: 240px;
        }
        .auto-style7 {
            width: 222px;
        }
        .auto-style8 {
            height: 23px;
            width: 222px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td colspan="5">
                    <asp:Label ID="Label1" runat="server" Text="( New Student )"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label2" runat="server" Text="Name : "></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox1" runat="server" Width="173px"></asp:TextBox><br />
                    <font Face="Arial" Color="pink" Size="-4"> For example:Ahmed or Abd Elrahman</font>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Name is missing!!"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="Invalid Name format!!" ValidationExpression="([A-Z][a-z]*\s[A-Z][a-z]*)|([A-Z][a-z]*)"></asp:RegularExpressionValidator>
             
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label4" runat="server" Text="ID : "></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox2" runat="server" Width="174px"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="ID is missing!!"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label3" runat="server" Text="E.mail : "></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox3" runat="server" Width="174px"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="E.mail is missing!!"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="Invalid E.mail!!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label7" runat="server" Text="Password : "></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox4" runat="server" Width="173px" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Password is missing!!"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="7 characters at least and 14 at most" ValidationExpression="\w{7,14}"></asp:RegularExpressionValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label5" runat="server" Text="Confirm password : "></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox5" runat="server" Width="173px" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox4" ControlToValidate="TextBox5" ErrorMessage="Not matching ,Retype password!!"></asp:CompareValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label6" runat="server" Text="Gender : "></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>female</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label8" runat="server" Text="Nationality : "></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>Egyption</asp:ListItem>
                        <asp:ListItem>French</asp:ListItem>
                        <asp:ListItem>Indonesian</asp:ListItem>
                        <asp:ListItem>Canadian</asp:ListItem>
                        <asp:ListItem>Chinese</asp:ListItem>
                        <asp:ListItem>Australian</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style8"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label9" runat="server" Text="Address : "></asp:Label>
                </td>
                <td class="auto-style5">
                    <textarea id="TextArea1" cols="20" name="S1" rows="2"></textarea></td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label10" runat="server" Text="City : "></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem>Cairo</asp:ListItem>
                        <asp:ListItem>Luxor</asp:ListItem>
                        <asp:ListItem>Aswan</asp:ListItem>
                        <asp:ListItem>Giza</asp:ListItem>
                        <asp:ListItem>Alexandria</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label11" runat="server" Text="Phone number : "></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox6" runat="server" OnTextChanged="TextBox6_TextChanged"></asp:TextBox><br />
                    <font Face="Arial" color="pink" size="-4"> For example:0106 5638990</font>
                </td>
                <td class="auto-style7">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox6" ErrorMessage="Invalid Number!!" ValidationExpression="[0][1][0-2 4-6 9][0-9]\s\d{7}"></asp:RegularExpressionValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label12" runat="server" Text="Faculty : "></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:DropDownList ID="DropDownList3" runat="server">
                        <asp:ListItem>Pharmacy</asp:ListItem>
                        <asp:ListItem>Computer science</asp:ListItem>
                        <asp:ListItem>Dentist</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label13" runat="server" Text="Bus : "></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Button ID="Button1" runat="server" OnClick="btnSubmit_click" Text="Submit " />
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="lblMsg" runat="server" Text="[lblMsg]"></asp:Label>
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
