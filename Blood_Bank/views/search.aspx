<%@ Page Title="" Language="C#" MasterPageFile="~/views/Blood_Bank.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="Blood_Bank.views.search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        Hospitals:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="host_name" DataValueField="host_id">
        </asp:DropDownList>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Hospitals]">
        </asp:SqlDataSource>
       Blood Group <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="d_blood" DataValueField="d_blood">
        </asp:DropDownList>
        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT DISTINCT [d_blood] FROM [User_Donors]"></asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" Text="Apply" OnClick="Button1_Click"/>
        <asp:Label ID="Label7" runat="server" ForeColor="Red" Font-Bold="true" Font-Underline="true" Font-Size="XX-Large"></asp:Label>
     </div>
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
                        </tr>
                    </table>
                </div>
            </ItemTemplate>

        </asp:Repeater>

</asp:Content>
