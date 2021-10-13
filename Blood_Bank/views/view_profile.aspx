<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view_profile.aspx.cs" Inherits="Blood_Bank.views.view_profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/StyleSheet1.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 90%;
        }

        .auto-style2 {
            width: 79px;
        }


        td {
            padding: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main">
            <div class="div-left" style="background-color: mediumpurple; width: 40%; height: 1000px; float: left;">
                <asp:Image ID="Image1" runat="server" Height="277px" Width="307px" Style="margin-left: 20px; margin-top: 20px; border: inset" />
                <br />
                <br />
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2">Name</td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        </td>

                    </tr>
                    <tr>
                        <td class="auto-style2">Cnic</td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="lblcnic"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Email</td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="lblemail"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Contact</td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="lblcontact"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Age</td>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="lblage"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Blood Group</td>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="lblbg"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Available to Hospital</td>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="lblbg"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>

                </table>

                <h2 style="text-align: center">Type your comment</h2>

                <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Columns="40" Rows="5" placeholder="your message*"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter your message*" SetFocusOnError="True" ControlToValidate="TextBox1" ForeColor="White" Display="Dynamic"></asp:RequiredFieldValidator>
                <br />
                <asp:Button ID="Button1" runat="server" Text="Send" OnClick="Button1_Click" />

                <asp:HiddenField ID="HiddenField1" runat="server" />

            </div>

            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
                    <div class="div-right" style="background-color: hotpink; width: 50%; height: 1000px; float: left;">
                        <div style="overflow:scroll;height:1000px;">

                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <div style="padding: 2px 0px 0px 10px;">
                                        <asp:Image ID="Image2" runat="server" ImageUrl='<%#Eval("img_path") %>' Style="width: 50px; height: 50px; border-radius: 4px" />
                                    </div>
                                    <div style="padding: 0px 250px 0px 0px; float: right">
                                        <h3><small>by:</small>

                                            <asp:Label ID="name" runat="server" Text='<%#Eval("d_name") %> '></asp:Label>
                                        </h3>
                                    </div>
                                    <div style="padding: 0px 0px 0px 10px;">
                                        "<asp:Label ID="comment" runat="server" Text='<%#Eval("com_txt") %> ' Font-Underline="true" Font-Bold="true"></asp:Label>"
                                    </div>
                                    <div>
                                        <kbd>
                                            <asp:Label ID="date" runat="server" Text='<%#Eval("com_date") %> ' Font-Italic="True" Font-Bold="True"></asp:Label></kbd>

                                    </div>
                                    <hr />

                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
