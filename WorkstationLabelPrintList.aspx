<%@ Page Language="VB" AutoEventWireup="false" CodeFile="WorkstationLabelPrintList.aspx.vb" Inherits="WorkstationLabelPrintList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="workstationID,worstationCode,extensionNumber,DirectDial,PrimaryUse,phoneTreeDay,phoneTreeNight,licensedForAll,isShared,Type"
            DataSourceID="workStations" ForeColor="#333333" GridLines="None" PageSize="20"
            Style="z-index: 100; left: 0px; position: absolute; top: 0px">
            <RowStyle BackColor="#E3EAEB" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="worstationCode" HeaderText="worstationCode" SortExpression="worstationCode" />
                <asp:BoundField DataField="extensionNumber" HeaderText="extensionNumber" SortExpression="extensionNumber" />
                <asp:BoundField DataField="DirectDial" HeaderText="DirectDial" SortExpression="DirectDial" />
                <asp:BoundField DataField="PrimaryUse" HeaderText="PrimaryUse" ReadOnly="True" SortExpression="PrimaryUse" />
                <asp:BoundField DataField="phoneTreeDay" HeaderText="phoneTreeDay" SortExpression="phoneTreeDay" />
                <asp:BoundField DataField="phoneTreeNight" HeaderText="phoneTreeNight" SortExpression="phoneTreeNight" />
                <asp:CheckBoxField DataField="licensedForAll" HeaderText="licensedForAll" SortExpression="licensedForAll" />
                <asp:BoundField DataField="workstationID" HeaderText="workstationID" ReadOnly="True"
                    SortExpression="workstationID" />
                <asp:CheckBoxField DataField="isShared" HeaderText="isShared" ReadOnly="True" SortExpression="isShared" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            </Columns>
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="workStations" runat="server" ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>"
            SelectCommand="SELECT DISTINCT * FROM [vWorkstationDetails]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
