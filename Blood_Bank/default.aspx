<%@ Page Title="" Language="C#" MasterPageFile="~/views/Blood_Bank.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Blood_Bank._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="repeater-main">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
                <asp:HiddenField ID="HiddenField1" runat="server" />
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div class="repeater-tbl">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Eval("d_id","~/views/view_profile.aspx?view={0}") %>'>
                        <asp:Image ID="Image1" ImageUrl='<%#Eval("img_path") %>' Style="width: 328px; height: 183px; padding-top: 3px" runat="server" /></asp:HyperLink>
                    <table>
                        <hr />
                        <tr>
                            <td>NAME</td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("d_name") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td>EMAIL</td>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text='<%#Eval("d_email") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td>CONTACT</td>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text='<%#Eval("d_contact") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td>BLOOD GROUP</td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text='<%#Eval("d_blood") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td>AVAILABLE TO HOSPITAL</td>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text='<%#Eval("host_name") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Age</td>
                            <td><asp:Label ID="Label5" runat="server" Text='<%#Eval("d_age") %>'></asp:Label></td>
                            <td style="background-color:red;color:white"><u><b>Comments:</b></u><asp:Label ID="Label7" runat="server" Text='<%#get(Eval("d_id")) %>'></asp:Label></td>
<%--                          <asp:HiddenField ID="HiddenField2" Value='<%#Eval("") %>' runat="server" />--%>
                        </tr>
                    </table>
                </div>
            </ItemTemplate>

        </asp:Repeater>

            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
</asp:Content>
