<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="DeviceTypesForm.aspx.vb" Inherits="DeviceTypesForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>"
        DeleteCommand="DELETE FROM [DeviceTypes] WHERE [deviceTypeID] = @original_deviceTypeID AND [Type] = @original_Type AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))"
        InsertCommand="INSERT INTO [DeviceTypes] ([Type], [Description]) VALUES (@Type, @Description)"
        ProviderName="<%$ ConnectionStrings:WorkstationsConnectionString.ProviderName %>"
        SelectCommand="SELECT [deviceTypeID], [Type], [Description] FROM [DeviceTypes]
WHERE [deviceTypeID] = @devID"
        
    UpdateCommand="UPDATE [DeviceTypes] SET [Type] = @Type, [Description] = @Description WHERE [deviceTypeID] = @original_deviceTypeID AND [Type] = @original_Type AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))" 
    ConflictDetection="CompareAllValues" 
    OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="devID" 
                PropertyName="SelectedValue" />
        </SelectParameters>
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
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
    DataKeyNames="deviceTypeID" DataSourceID="SqlDataSource2" 
    EmptyDataText="There are no data records to display." ForeColor="#333333" 
    GridLines="None">
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <Columns>
        <asp:CommandField ShowEditButton="True" 
            ShowSelectButton="True" />
        <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false"  OnClientClick="return confirm('Are you sure you want to delete?');"
                    CommandName="Delete" Text="Delete"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="deviceTypeID" HeaderText="deviceTypeID" 
            ReadOnly="True" SortExpression="deviceTypeID" />
        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
        <asp:BoundField DataField="Description" HeaderText="Description" 
            SortExpression="Description" />
    </Columns>
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#999999" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>" 
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
<br />
<asp:FormView ID="FormView1" runat="server" DataKeyNames="deviceTypeID" 
    DataSourceID="SqlDataSource1" DefaultMode="Insert">
    <EditItemTemplate>
        deviceTypeID:
        <asp:Label ID="deviceTypeIDLabel1" runat="server" 
            Text='<%# Eval("deviceTypeID") %>' />
        <br />
        Type:
        <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
        <br />
        Description:
        <asp:TextBox ID="DescriptionTextBox" runat="server" 
            Text='<%# Bind("Description") %>' />
        <br />
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
            CommandName="Update" Text="Update" />
        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </EditItemTemplate>
    <InsertItemTemplate>
        Type:
        <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
        <br />
        Description:
        <asp:TextBox ID="DescriptionTextBox" runat="server" 
            Text='<%# Bind("Description") %>' />
        <br />
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
            CommandName="Insert" Text="Insert" />
        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </InsertItemTemplate>
    <ItemTemplate>
        deviceTypeID:
        <asp:Label ID="deviceTypeIDLabel" runat="server" 
            Text='<%# Eval("deviceTypeID") %>' />
        <br />
        Type:
        <asp:Label ID="TypeLabel" runat="server" Text='<%# Bind("Type") %>' />
        <br />
        Description:
        <asp:Label ID="DescriptionLabel" runat="server" 
            Text='<%# Bind("Description") %>' />
        <br />
        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
            CommandName="Edit" Text="Edit" />
        &nbsp;<asp:LinkButton ID="DeleteButton" OnClientClick="return confirm('Are you certain you want to delete?');" runat="server" CausesValidation="False" 
            CommandName="Delete" Text="Delete"  />
        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
            CommandName="New" Text="New" />
    </ItemTemplate>
</asp:FormView>
</asp:Content>

