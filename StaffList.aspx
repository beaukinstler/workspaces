<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"  Title="Staff List" CodeFile="StaffList.aspx.vb" Inherits="StaffList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height: 304px; width: 478px">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="StaffID" DataSourceID="SqlDataSource1"
            EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="StaffID" HeaderText="StaffID" ReadOnly="True" SortExpression="StaffID" />
                <asp:BoundField DataField="FullName" HeaderText="FullName" SortExpression="FullName" />
            </Columns>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>"
            DeleteCommand="DELETE FROM [Staff] WHERE [StaffID] = @StaffID" InsertCommand="INSERT INTO [Staff] ([StaffID], [FullName]) VALUES (@StaffID, @FullName)"
            ProviderName="<%$ ConnectionStrings:WorkstationsConnectionString.ProviderName %>"
            SelectCommand="SELECT [StaffID], [FullName] FROM [Staff]" UpdateCommand="UPDATE [Staff] SET [FullName] = @FullName WHERE [StaffID] = @StaffID">
            <DeleteParameters>
                <asp:Parameter Name="StaffID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="StaffID" Type="Int32" />
                <asp:Parameter Name="FullName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="FullName" Type="String" />
                <asp:Parameter Name="StaffID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </asp:Content>