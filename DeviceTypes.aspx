<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DeviceTypes.aspx.vb" Inherits="DeviceTypes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>" DeleteCommand="DELETE FROM [DeviceTypes] WHERE [deviceTypeID] = @original_deviceTypeID AND [Type] = @original_Type AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))"
            InsertCommand="INSERT INTO [DeviceTypes] ([Type], [Description]) VALUES (@Type, @Description)"
            OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:WorkstationsConnectionString.ProviderName %>"
            SelectCommand="SELECT [deviceTypeID], [Type], [Description] FROM [DeviceTypes]"
            UpdateCommand="UPDATE [DeviceTypes] SET [Type] = @Type, [Description] = @Description WHERE [deviceTypeID] = @original_deviceTypeID AND [Type] = @original_Type AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_deviceTypeID" Type="Int32" />
                <asp:Parameter Name="original_Type" Type="String" />
                <asp:Parameter Name="original_Description" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Type" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="original_deviceTypeID" Type="Int32" />
                <asp:Parameter Name="original_Type" Type="String" />
                <asp:Parameter Name="original_Description" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="Type" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="deviceTypeID" DataSourceID="SqlDataSource2"
            EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None"
            Style="z-index: 100; left: 0px; position: absolute; top: 0px">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="deviceTypeID" HeaderText="deviceTypeID" ReadOnly="True"
                    SortExpression="deviceTypeID" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            </Columns>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>"
            DeleteCommand="DELETE FROM [DeviceTypes] WHERE [deviceTypeID] = @deviceTypeID"
            InsertCommand="INSERT INTO [DeviceTypes] ([Type], [Description]) VALUES (@Type, @Description)"
            ProviderName="<%$ ConnectionStrings:WorkstationsConnectionString.ProviderName %>"
            SelectCommand="SELECT [deviceTypeID], [Type], [Description] FROM [DeviceTypes]"
            UpdateCommand="UPDATE [DeviceTypes] SET [Type] = @Type, [Description] = @Description WHERE [deviceTypeID] = @deviceTypeID">
            <DeleteParameters>
                <asp:Parameter Name="deviceTypeID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Type" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Type" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="deviceTypeID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
