<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        
        Response.Redirect("~/WorkStations.aspx?ws=" & GridView1.SelectedDataKey.Value.ToString())
        
    End Sub
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="vWorkStationList" CellPadding="4" ForeColor="#333333" GridLines="None" Font-Names="Arial" Font-Size="10px" AllowPaging="True" AllowSorting="True" DataMember="DefaultView" PageSize="20" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="worstationCode">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="worstationCode" HeaderText="worstationCode" SortExpression="worstationCode" />
                <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                <asp:BoundField DataField="PrimaryUser" HeaderText="PrimaryUser" SortExpression="PrimaryUser" />
                <asp:BoundField DataField="extensionNumber" HeaderText="extensionNumber" SortExpression="extensionNumber" />
                <asp:BoundField DataField="DirectDial" HeaderText="DirectDial" SortExpression="DirectDial" />
                <asp:BoundField DataField="phoneTreeDay" HeaderText="phoneTreeDay" SortExpression="phoneTreeDay" />
                <asp:BoundField DataField="phoneTreeNight" HeaderText="phoneTreeNight" SortExpression="phoneTreeNight" />
                <asp:CheckBoxField DataField="hotDeskOnly" HeaderText="hotDeskOnly" SortExpression="hotDeskOnly" />
                <asp:CheckBoxField DataField="licensedForAll" HeaderText="licensedForAll" SortExpression="licensedForAll" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                <asp:BoundField DataField="DeviceDescription" HeaderText="DeviceDescription" SortExpression="DeviceDescription" />
                <asp:BoundField DataField="deviceName" HeaderText="Device Name" 
                    SortExpression="deviceName" />
            </Columns>
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            
        </asp:GridView>
        &nbsp; &nbsp;</div>
        <asp:SqlDataSource ID="vWorkStationList" runat="server" ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>"
            SelectCommand="SELECT * FROM [vWorkStationList]"></asp:SqlDataSource>
</asp:Content>
