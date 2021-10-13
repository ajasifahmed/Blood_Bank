<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="Blood_Bank.Views.signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        table {
            color: white;
        }

        td {
            padding: 20px;
        }

        .auto-style1 {
            width: 212px;
        }


        .auto-style2 {
            height: 64px;
        }

        .auto-style3 {
            width: 212px;
            height: 64px;
        }
    </style>

</head>
<body style="background-image: url('~/img/download (1).jpg'); width: 100%; height: 100%">
    <form id="form1" runat="server">

        <div style="background-image: url('../img/download (1).jpg'); width: 100%; height: 100%; background-size: 100% 100%">
            <div style="background-color: #851212; width: 500px; height: 950px; margin: 0 auto; border-radius: 25px 25px 25px 25px">

                <h1 style="background-color: white; color: #851212; text-align: center">Registration From</h1>
                <table>
                    <tr>
                        <td>Email</td>
                        <td>
                            <asp:TextBox ID="txtemail" runat="server" TextMode="Email"></asp:TextBox></td>

                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email is required*" Display="Dynamic" ForeColor="White" SetFocusOnError="True" ControlToValidate="txtemail"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email" ControlToValidate="txtemail" Display="Dynamic" ForeColor="White" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>Passowrd</td>
                        <td>
                            <asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox></td>

                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="password is required*" Display="Dynamic" ForeColor="White" SetFocusOnError="True" ControlToValidate="txtpassword"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>Confirm Passowrd</td>
                        <td>
                            <asp:TextBox ID="txtcpassword" runat="server" TextMode="Password"></asp:TextBox></td>

                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="confirmation is required*" Display="Dynamic" ForeColor="White" SetFocusOnError="True" ControlToValidate="txtcpassword"></asp:RequiredFieldValidator>

                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpassword" ControlToValidate="txtcpassword" Display="Dynamic" ErrorMessage="Password Mismatch" ForeColor="White"></asp:CompareValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>Cnic #</td>
                        <td>
                            <asp:TextBox ID="txtcnic" runat="server"></asp:TextBox></td>

                        <td class="auto-style1">
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="cnic is required*" Display="Dynamic" ForeColor="White" SetFocusOnError="True" ControlToValidate="txtcnic"></asp:RequiredFieldValidator>

                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid Cnic" ControlToValidate="txtcnic" Display="Dynamic" ForeColor="White" ValidationExpression="^[0-9+]{5}-[0-9+]{7}-[0-9]{1}$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>


                    <tr>
                        <td class="auto-style2">Name</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>

                        <td class="auto-style3">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="txtname is required*" Display="Dynamic" ForeColor="White" SetFocusOnError="True" ControlToValidate="txtname"></asp:RequiredFieldValidator>

                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style2">Age</td>
                        <td class="auto-style2">

                            <asp:DropDownList ID="DropDownList3" runat="server"></asp:DropDownList>

                        </td>

                        <td class="auto-style3">
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="DropDownList3 is required*" Display="Dynamic" ForeColor="White" SetFocusOnError="True" ControlToValidate="DropDownList3" InitialValue="select age"></asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td>Blood Group</td>
                        <td>

                            <asp:DropDownList ID="DropDownList1" runat="server" Height="16px" Width="116px">
                                <asp:ListItem>select group</asp:ListItem>
                                <asp:ListItem Value="1">A+</asp:ListItem>
                                <asp:ListItem Value="2">A-</asp:ListItem>
                                <asp:ListItem Value="3">AB+</asp:ListItem>
                                <asp:ListItem Value="4">AB-</asp:ListItem>
                                <asp:ListItem Value="5">O+</asp:ListItem>
                                <asp:ListItem Value="6">O-</asp:ListItem>
                            </asp:DropDownList>

                        </td>

                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="DropDownList1 is required*" Display="Dynamic" ForeColor="White" SetFocusOnError="True" ControlToValidate="DropDownList1" InitialValue="select group"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Near Hospital</td>
                        <td>
                            <asp:DropDownList ID="DropDownList2" runat="server" Height="17px" Width="115px" DataSourceID="SqlDataSource1" DataTextField="host_name" DataValueField="host_id">
                                <asp:ListItem>select hospital</asp:ListItem>
                            </asp:DropDownList>


                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Hospitals]"></asp:SqlDataSource>


                        </td>

                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="DropDownList2 is required*" Display="Dynamic" ForeColor="White" SetFocusOnError="True" ControlToValidate="DropDownList2" InitialValue="select hospial"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>Contact #</td>
                        <td>
                            <asp:TextBox ID="TXTCONTCT" runat="server"></asp:TextBox></td>

                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="TXTCONTCT is required*" Display="Dynamic" ForeColor="White" SetFocusOnError="True" ControlToValidate="TXTCONTCT"></asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td>

                            <asp:Button ID="Button1" runat="server" Text="Register!" OnClick="Button1_Click" BackColor="#CC0000" ForeColor="White" Height="34px" Width="158px" />
                        </td>

                        <td class="auto-style1">
                            <asp:HyperLink ID="HyperLink1" NavigateUrl="~/views/login.aspx" runat="server" ForeColor="White">Login</asp:HyperLink>
                        </td>
                    </tr>

                </table>


            </div>
        </div>
    </form>
</body>
</html>
