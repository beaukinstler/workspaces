<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Devices-2.aspx.vb" Inherits="Devices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataKeyNames="deviceID" DataSourceID="SqlDataSource1" 
            EmptyDataText="There are no data records to display." ForeColor="#333333" 
            GridLines="None">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:CommandField ShowEditButton="True" 
                    ShowSelectButton="True" />
                <asp:BoundField DataField="deviceID" HeaderText="deviceID" ReadOnly="True" 
                    SortExpression="deviceID" />
                <asp:TemplateField HeaderText="workstationID" SortExpression="workstationID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList10" runat="server" 
                            DataSourceID="workstationsDataSource" DataTextField="PrimaryAndCode" 
                            DataValueField="workstationID" Height="16px" 
                            SelectedValue='<%# Bind("workstationID") %>' Width="138px">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server"  Text='<%# Bind("workstationID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="patchPanelID" SortExpression="patchPanelID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("patchPanelID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("patchPanelID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CheckBoxField DataField="hasWireless" HeaderText="hasWireless" 
                    SortExpression="hasWireless" />
                <asp:CheckBoxField DataField="licensedForAll" HeaderText="licensedForAll" 
                    SortExpression="licensedForAll" />
                <asp:BoundField DataField="staticIPAddress" HeaderText="staticIPAddress" 
                    SortExpression="staticIPAddress" />
                <asp:TemplateField HeaderText="deviceTypeID" SortExpression="deviceTypeID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("deviceTypeID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("deviceTypeID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="deviceName" HeaderText="deviceName" 
                    SortExpression="deviceName" />
            </Columns>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>" 
            DeleteCommand="DELETE FROM [Devices] WHERE [deviceID] = @deviceID" 
            InsertCommand="INSERT INTO [Devices] ([workstationID], [patchPanelID], [hasWireless], [licensedForAll], [staticIPAddress], [deviceTypeID], [deviceName]) VALUES (@workstationID, @patchPanelID, @hasWireless, @licensedForAll, @staticIPAddress, @deviceTypeID, @deviceName)" 
            ProviderName="<%$ ConnectionStrings:WorkstationsConnectionString.ProviderName %>" 
            SelectCommand="SELECT [deviceID], [workstationID], [patchPanelID], [hasWireless], [licensedForAll], [staticIPAddress], [deviceTypeID], [deviceName] FROM [Devices]" 
            UpdateCommand="UPDATE [Devices] SET [workstationID] = @workstationID, [patchPanelID] = @patchPanelID, [hasWireless] = @hasWireless, [licensedForAll] = @licensedForAll, [staticIPAddress] = @staticIPAddress, [deviceTypeID] = @deviceTypeID, [deviceName] = @deviceName WHERE [deviceID] = @deviceID">
            <DeleteParameters>
                <asp:Parameter Name="deviceID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="workstationID" Type="Int32" />
                <asp:Parameter Name="patchPanelID" Type="Int32" />
                <asp:Parameter Name="hasWireless" Type="Boolean" />
                <asp:Parameter Name="licensedForAll" Type="Boolean" />
                <asp:Parameter Name="staticIPAddress" Type="String" />
                <asp:Parameter Name="deviceTypeID" Type="Int32" />
                <asp:Parameter Name="deviceName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="workstationID" Type="Int32" />
                <asp:Parameter Name="patchPanelID" Type="Int32" />
                <asp:Parameter Name="hasWireless" Type="Boolean" />
                <asp:Parameter Name="licensedForAll" Type="Boolean" />
                <asp:Parameter Name="staticIPAddress" Type="String" />
                <asp:Parameter Name="deviceTypeID" Type="Int32" />
                <asp:Parameter Name="deviceName" Type="String" />
                <asp:Parameter Name="deviceID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DeviceTypesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>"
            SelectCommand="SELECT [deviceTypeID], [Type], [Description] FROM [DeviceTypes]">
        </asp:SqlDataSource>
    
    </div>
        <asp:SqlDataSource ID="PatchPanelDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>"
            SelectCommand="SELECT DISTINCT [patchPanelID], [panelCode] FROM [PatchPanels]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="workstationsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>"
            SelectCommand="SELECT DISTINCT PrimaryUse, PrimaryUse + ' - ' + worstationCode AS PrimaryAndCode, workstationID FROM vWorkstationDetails">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DeviceFormDS" runat="server" ConflictDetection="CompareAllValues"
            
        ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>" DeleteCommand="DELETE FROM [Devices] WHERE [deviceID] = @original_deviceID "
            InsertCommand="INSERT INTO Devices(workstationID, patchPanelID, hasWireless, licensedForAll, staticIPAddress, deviceTypeID, deviceName) VALUES (@workstationID, @patchPanelID, @hasWireless, @licensedForAll, @staticIPAddress, @deviceTypeID,@deviceName)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Devices] WHERE deviceID = @deviceID"
            
        UpdateCommand="UPDATE Devices SET workstationID = @workstationID, patchPanelID = @patchPanelID, hasWireless = @hasWireless, licensedForAll = @licensedForAll, staticIPAddress = @staticIPAddress, deviceTypeID = @deviceTypeID, deviceName = @deviceName WHERE (deviceID = @original_deviceID) AND (workstationID = @original_workstationID OR workstationID IS NULL AND @original_workstationID IS NULL) AND (patchPanelID = @original_patchPanelID OR patchPanelID IS NULL AND @original_patchPanelID IS NULL) AND (hasWireless = @original_hasWireless OR hasWireless IS NULL AND @original_hasWireless IS NULL) AND (licensedForAll = @original_licensedForAll OR licensedForAll IS NULL AND @original_licensedForAll IS NULL) AND (staticIPAddress = @original_staticIPAddress OR staticIPAddress IS NULL AND @original_staticIPAddress IS NULL) AND (deviceTypeID = @original_deviceTypeID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" DefaultValue="2" Name="deviceID" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="original_deviceID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="workstationID" Type="Int32" />
                <asp:Parameter Name="patchPanelID" Type="Int32" />
                <asp:Parameter Name="hasWireless" Type="Boolean" />
                <asp:Parameter Name="licensedForAll" Type="Boolean" />
                <asp:Parameter Name="staticIPAddress" Type="String" />
                <asp:Parameter Name="deviceTypeID" Type="Int32" />
                <asp:Parameter Name="deviceName" Type="String" />
                <asp:Parameter Name="original_deviceID" Type="Int32" />
                <asp:Parameter Name="original_workstationID" Type="Int32" />
                <asp:Parameter Name="original_patchPanelID" Type="Int32" />
                <asp:Parameter Name="original_hasWireless" Type="Boolean" />
                <asp:Parameter Name="original_licensedForAll" Type="Boolean" />
                <asp:Parameter Name="original_staticIPAddress" Type="String" />
                <asp:Parameter Name="original_deviceTypeID" Type="Int32" />
                <asp:Parameter Name="original_deviceName" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="workstationID" Type="Int32" />
                <asp:Parameter Name="patchPanelID" Type="Int32" />
                <asp:Parameter Name="hasWireless" Type="Boolean" />
                <asp:Parameter Name="licensedForAll" Type="Boolean" />
                <asp:Parameter Name="staticIPAddress" Type="String" />
                <asp:Parameter Name="deviceTypeID" Type="Int32" />
                <asp:Parameter Name="deviceName" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="deviceID"
            DataSourceID="DeviceFormDS" ForeColor="#333333">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <EditItemTemplate>
                deviceID:
                <asp:Label ID="deviceIDLabel1" runat="server" Text='<%# Eval("deviceID") %>'></asp:Label><br />
                workstationID:
                <br />
                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="workstationsDataSource"
                    DataTextField="PrimaryAndCode" DataValueField="workstationID" SelectedValue='<%# Bind("workstationID") %>'
                    Width="200px" AppendDataBoundItems="True">
                    <asp:ListItem Text="none" />
                </asp:DropDownList><br />
                patchPanelID:
                <br />
                <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="PatchPanelDatasource"
                    DataTextField="panelCode" DataValueField="patchPanelID" SelectedValue='<%# Bind("patchPanelID") %>'
                    Width="200px" AppendDataBoundItems="true">
                <asp:ListItem Text="none" Value="" />
                </asp:DropDownList><br />
                hasWireless:
                <asp:CheckBox ID="hasWirelessCheckBox" runat="server" Checked='<%# Bind("hasWireless") %>' /><br />
                licensedForAll:
                <asp:CheckBox ID="licensedForAllCheckBox" runat="server" Checked='<%# Bind("licensedForAll") %>' /><br />
                staticIPAddress:
                <br />
                <asp:TextBox ID="staticIPAddressTextBox" runat="server" Text='<%# Bind("staticIPAddress") %>'></asp:TextBox><br />
                deviceTypeID:
                <br />
                <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="DeviceTypesDataSource"
                    DataTextField="Type" DataValueField="deviceTypeID" SelectedValue='<%# Bind("deviceTypeID") %>'
                    Width="200px" AppendDataBoundItems="true">
                </asp:DropDownList><br />
                <br />
                Device Name<br />
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("deviceName") %>'></asp:TextBox><br />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                    Text="Update"></asp:LinkButton>
                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel"></asp:LinkButton>
            </EditItemTemplate>
            <InsertItemTemplate>
                workstationID:
                <br />
                <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="workstationsDataSource"
                    DataTextField="PrimaryAndCode" DataValueField="workstationID" SelectedValue='<%# Bind("workstationID") %>'
                    Width="248px" AppendDataBoundItems="True">
                <asp:ListItem Text="none" />
                </asp:DropDownList><br />
                patchPanelID:<br />
                <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="PatchPanelDatasource"
                    DataTextField="panelCode" DataValueField="patchPanelID" SelectedValue='<%# Bind("patchPanelID") %>'
                    Width="248px" AppendDataBoundItems="true">
                <asp:ListItem Text="none" Value="" />
                </asp:DropDownList><br />
                hasWireless:
                <asp:CheckBox ID="hasWirelessCheckBox" runat="server" Checked='<%# Bind("hasWireless") %>' /><br />
                licensedForAll:
                <asp:CheckBox ID="licensedForAllCheckBox" runat="server" Checked='<%# Bind("licensedForAll") %>' /><br />
                staticIPAddress:
                <asp:TextBox ID="staticIPAddressTextBox" runat="server" Text='<%# Bind("staticIPAddress") %>'></asp:TextBox><br />
                deviceTypeID:&nbsp;<br />
                <asp:DropDownList ID="DropDownList9" runat="server" DataSourceID="DeviceTypesDataSource"
                    DataTextField="Type" DataValueField="deviceTypeID" SelectedValue='<%# Bind("deviceTypeID") %>'
                    Width="248px" AppendDataBoundItems="true">
                <asp:ListItem Text="none" Value="" />
                </asp:DropDownList><br />
                <br />
                Device Name<br />
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("deviceName") %>'></asp:TextBox><br />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                    Text="Insert"></asp:LinkButton>
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel"></asp:LinkButton>
            </InsertItemTemplate>
            <ItemTemplate>
                deviceID:
                <asp:Label ID="deviceIDLabel" runat="server" Text='<%# Eval("deviceID") %>'></asp:Label><br />
                workstationID:
                <asp:Label ID="workstationIDLabel" runat="server" Text='<%# Bind("workstationID") %>'></asp:Label><br />
                patchPanelID:
                <asp:Label ID="patchPanelIDLabel" runat="server" Text='<%# Bind("patchPanelID") %>'></asp:Label><br />
                hasWireless:
                <asp:CheckBox ID="hasWirelessCheckBox" runat="server" Checked='<%# Bind("hasWireless") %>'
                    Enabled="false" /><br />
                licensedForAll:
                <asp:CheckBox ID="licensedForAllCheckBox" runat="server" Checked='<%# Bind("licensedForAll") %>'
                    Enabled="false" /><br />
                staticIPAddress:
                <asp:Label ID="staticIPAddressLabel" runat="server" Text='<%# Bind("staticIPAddress") %>'></asp:Label><br />
                deviceTypeID:
                <asp:Label ID="deviceTypeIDLabel" runat="server" Text='<%# Bind("deviceTypeID") %>'></asp:Label><br />
                device name:
                <asp:Label ID="deviceNameLabel" runat="server" Style="left: 3px; top: 0px" Text='<%# Eval("deviceName") %>'></asp:Label><br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Edit"></asp:LinkButton>
                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" OnClientClick="return confirm('Are you certain you want to delete this product?');" CommandName="Delete"
                    Text="Delete"></asp:LinkButton>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                    Text="New"></asp:LinkButton>
            </ItemTemplate>
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
        </asp:FormView>

</asp:Content>