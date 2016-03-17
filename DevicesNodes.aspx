<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="DevicesNodes.aspx.vb" Inherits="Devices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="deviceID" DataSourceID="SqlDataSource1"
            EmptyDataText="There are no data records to display." ForeColor="#333333" 
            GridLines="None" PageSize="50" style="margin-right: 281px" Width="892px">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="deviceID" HeaderText="Device ID" InsertVisible="False"
                    ReadOnly="True" SortExpression="deviceID" />
                <asp:BoundField DataField="deviceName" HeaderText="deviceName" SortExpression="deviceName" />
                <asp:TemplateField HeaderText="Workstation Description" SortExpression="PrimaryUse">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="workstationsDataSource"
                            DataTextField="PrimaryUse" DataValueField="workstationID" SelectedValue='<%# Bind("workstationID") %>'
                            Width="204px">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("PrimaryUse") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Patch Panel Code" SortExpression="patchPanelID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="PatchPanelDatasource"
                            DataTextField="panelCode" DataValueField="patchPanelID" SelectedValue='<%# Bind("patchPanelID") %>'
                            Width="182px">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("panelCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CheckBoxField DataField="hasWireless" HeaderText="Has Wireless" SortExpression="hasWireless" />
                <asp:CheckBoxField DataField="licensedForAll" HeaderText="Licensed for All" SortExpression="licensedForAll" />
                <asp:BoundField DataField="staticIPAddress" HeaderText="Static IP" SortExpression="staticIPAddress" />
                <asp:TemplateField HeaderText="Type of Device" SortExpression="deviceTypeID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="DeviceTypesDataSource"
                            DataTextField="Type" DataValueField="deviceTypeID" SelectedValue='<%# Bind("deviceTypeID") %>'
                            Width="206px">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:CheckBoxField DataField="needsLabel" HeaderText="Needs Label" 
                    SortExpression="needsLabel" />
            </Columns>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
    
    </div>
        <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="deviceID"
            DataSourceID="DeviceFormDS" ForeColor="#333333">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <EditItemTemplate>
                workstation location:<br />
                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="workstationsDataSource"
                    DataTextField="PrimaryAndCode" DataValueField="workstationID" SelectedValue='<%# Bind("workstationID") %>'
                    Width="200px" AppendDataBoundItems="True">
                    <asp:ListItem Text="none" />
                </asp:DropDownList><br />
                patchPanel:<br />
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
                deviceType:<br />
                <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="DeviceTypesDataSource"
                    DataTextField="Type" DataValueField="deviceTypeID" SelectedValue='<%# Bind("deviceTypeID") %>'
                    Width="200px" AppendDataBoundItems="true">
                </asp:DropDownList><br />
                <br />
                Device Name<br />
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("deviceName") %>'></asp:TextBox>
                <br />
                <br />
                Needs Label<br />
                <asp:CheckBox ID="needsLabelCheckbox" runat="server" 
                    Checked='<%# Bind("needsLabel") %>' />
                <br />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                    Text="Update"></asp:LinkButton>
                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel"></asp:LinkButton>
            </EditItemTemplate>
            <InsertItemTemplate>
                workstation location:<br />
                <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="workstationsDataSource"
                    DataTextField="PrimaryAndCode" DataValueField="workstationID" SelectedValue='<%# Bind("workstationID") %>'
                    Width="248px" AppendDataBoundItems="True">
                <asp:ListItem Text="none" />
                </asp:DropDownList><br />
                patchPane:<br />
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
                deviceTypeI:<br />
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
                hasWireless:
                <asp:CheckBox ID="hasWirelessCheckBox" runat="server" Checked='<%# Bind("hasWireless") %>'
                    Enabled="false" /><br />
                licensedForAll:
                <asp:CheckBox ID="licensedForAllCheckBox" runat="server" Checked='<%# Bind("licensedForAll") %>'
                    Enabled="false" /><br />
                staticIPAddress:
                <asp:Label ID="staticIPAddressLabel" runat="server" Text='<%# Bind("staticIPAddress") %>'></asp:Label><br />
                device name:
                <asp:Label ID="deviceNameLabel" runat="server" Style="left: 3px; top: 0px" Text='<%# Eval("deviceName") %>'></asp:Label>
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Edit"></asp:LinkButton>
                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure?');"
                    Text="Delete" onclick="DeleteButton_Click"></asp:LinkButton>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                    Text="New"></asp:LinkButton>
            </ItemTemplate>
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
        </asp:FormView>
        <asp:SqlDataSource ID="workstationsDataSource0" runat="server" ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>"
            SelectCommand="SELECT DISTINCT PrimaryUse, PrimaryUse + ' - ' + worstationCode AS PrimaryAndCode, workstationID FROM vWorkstationDetails
WHERE workstationID = @ws">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="ws" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DeviceFormDS" runat="server" ConflictDetection="CompareAllValues"
            
        ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>" DeleteCommand="DELETE FROM [Devices] WHERE [deviceID] = @original_deviceID "
            InsertCommand="INSERT INTO Devices(workstationID, patchPanelID, hasWireless, licensedForAll, staticIPAddress, deviceTypeID, deviceName, needsLabel) VALUES (@workstationID, @patchPanelID, @hasWireless, @licensedForAll, @staticIPAddress, @deviceTypeID, @deviceName, @needsLabel)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Devices] WHERE deviceID = @deviceID"
            
        
        UpdateCommand="UPDATE Devices SET workstationID = @workstationID, patchPanelID = @patchPanelID, hasWireless = @hasWireless, licensedForAll = @licensedForAll, staticIPAddress = @staticIPAddress, deviceTypeID = @deviceTypeID, deviceName = @deviceName, needsLabel = @needsLabel WHERE (deviceID = @original_deviceID) AND (workstationID = @original_workstationID OR workstationID IS NULL AND @original_workstationID IS NULL) AND (patchPanelID = @original_patchPanelID OR patchPanelID IS NULL AND @original_patchPanelID IS NULL) AND (hasWireless = @original_hasWireless OR hasWireless IS NULL AND @original_hasWireless IS NULL) AND (licensedForAll = @original_licensedForAll OR licensedForAll IS NULL AND @original_licensedForAll IS NULL) AND (staticIPAddress = @original_staticIPAddress OR staticIPAddress IS NULL AND @original_staticIPAddress IS NULL) AND (deviceTypeID = @original_deviceTypeID) AND (needsLabel = @original_needsLabel)">
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
                <asp:Parameter Name="needsLabel" />
                <asp:Parameter Name="original_deviceID" Type="Int32" />
                <asp:Parameter Name="original_workstationID" Type="Int32" />
                <asp:Parameter Name="original_patchPanelID" Type="Int32" />
                <asp:Parameter Name="original_hasWireless" Type="Boolean" />
                <asp:Parameter Name="original_licensedForAll" Type="Boolean" />
                <asp:Parameter Name="original_staticIPAddress" Type="String" />
                <asp:Parameter Name="original_deviceTypeID" Type="Int32" />
                <asp:Parameter Name="original_needsLabel" Type="Boolean"/>
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="workstationID" Type="Int32" />
                <asp:Parameter Name="patchPanelID" Type="Int32" />
                <asp:Parameter Name="hasWireless" Type="Boolean" />
                <asp:Parameter Name="licensedForAll" Type="Boolean" />
                <asp:Parameter Name="staticIPAddress" Type="String" />
                <asp:Parameter Name="deviceTypeID" Type="Int32" />
                <asp:Parameter Name="deviceName" Type="String" />
                <asp:Parameter Name="needsLabel" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="workstationsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>"
            SelectCommand="SELECT DISTINCT PrimaryUse, PrimaryUse + ' - ' + worstationCode AS PrimaryAndCode, workstationID FROM vWorkstationDetails">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="PatchPanelDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>"
            SelectCommand="SELECT DISTINCT [patchPanelID], [panelCode] FROM [PatchPanels]
UNION
SELECT NULL as patPanelID, NULL as panelCode"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DeviceTypesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>"
            SelectCommand="SELECT [deviceTypeID], [Type], [Description] FROM [DeviceTypes]">
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
            
        ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>" DeleteCommand="DELETE FROM [Devices] WHERE [deviceID] = @original_deviceID AND (([workstationID] = @original_workstationID) OR ([workstationID] IS NULL AND @original_workstationID IS NULL)) AND (([patchPanelID] = @original_patchPanelID) OR ([patchPanelID] IS NULL AND @original_patchPanelID IS NULL)) AND (([hasWireless] = @original_hasWireless) OR ([hasWireless] IS NULL AND @original_hasWireless IS NULL)) AND (([licensedForAll] = @original_licensedForAll) OR ([licensedForAll] IS NULL AND @original_licensedForAll IS NULL)) AND (([staticIPAddress] = @original_staticIPAddress) OR ([staticIPAddress] IS NULL AND @original_staticIPAddress IS NULL)) AND [deviceTypeID] = @original_deviceTypeID"
            InsertCommand="INSERT INTO [Devices] ([workstationID], [patchPanelID], [hasWireless], [licensedForAll], [staticIPAddress], [deviceTypeID]) VALUES (@workstationID, @patchPanelID, @hasWireless, @licensedForAll, @staticIPAddress, @deviceTypeID)"
            OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:WorkstationsConnectionString.ProviderName %>"
            SelectCommand="SELECT DISTINCT Devices.deviceID, Devices.workstationID, Devices.patchPanelID, Devices.hasWireless, Devices.licensedForAll, Devices.staticIPAddress, Devices.deviceTypeID, DeviceTypes.Type, PatchPanels.panelCode, DeviceTypes.Description, vWorkstationDetails.PrimaryUse, Devices.deviceName, Devices.needsLabel, vWorkstationDetails.worstationCode FROM Devices INNER JOIN DeviceTypes ON Devices.deviceTypeID = DeviceTypes.deviceTypeID INNER JOIN vWorkstationDetails ON Devices.workstationID = vWorkstationDetails.workstationID LEFT OUTER JOIN PatchPanels ON Devices.patchPanelID = PatchPanels.patchPanelID WHERE (Devices.deviceTypeID = 1) OR (Devices.deviceTypeID = 2)"
            
            
            
        UpdateCommand="UPDATE [Devices] SET [workstationID] = @workstationID, [patchPanelID] = @patchPanelID, [hasWireless] = @hasWireless, [licensedForAll] = @licensedForAll, [staticIPAddress] = @staticIPAddress, [deviceTypeID] = @deviceTypeID WHERE [deviceID] = @original_deviceID AND (([workstationID] = @original_workstationID) OR ([workstationID] IS NULL AND @original_workstationID IS NULL)) AND (([patchPanelID] = @original_patchPanelID) OR ([patchPanelID] IS NULL AND @original_patchPanelID IS NULL)) AND (([hasWireless] = @original_hasWireless) OR ([hasWireless] IS NULL AND @original_hasWireless IS NULL)) AND (([licensedForAll] = @original_licensedForAll) OR ([licensedForAll] IS NULL AND @original_licensedForAll IS NULL)) AND (([staticIPAddress] = @original_staticIPAddress) OR ([staticIPAddress] IS NULL AND @original_staticIPAddress IS NULL)) AND [deviceTypeID] = @original_deviceTypeID">
            <DeleteParameters>
                <asp:Parameter Name="original_deviceID" Type="Int32" />
                <asp:Parameter Name="original_workstationID" Type="Int32" />
                <asp:Parameter Name="original_patchPanelID" Type="Int32" />
                <asp:Parameter Name="original_hasWireless" Type="Boolean" />
                <asp:Parameter Name="original_licensedForAll" Type="Boolean" />
                <asp:Parameter Name="original_staticIPAddress" Type="String" />
                <asp:Parameter Name="original_deviceTypeID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="workstationID" Type="Int32" />
                <asp:Parameter Name="patchPanelID" Type="Int32" />
                <asp:Parameter Name="hasWireless" Type="Boolean" />
                <asp:Parameter Name="licensedForAll" Type="Boolean" />
                <asp:Parameter Name="staticIPAddress" Type="String" />
                <asp:Parameter Name="deviceTypeID" Type="Int32" />
                <asp:Parameter Name="original_deviceID" Type="Int32" />
                <asp:Parameter Name="original_workstationID" Type="Int32" />
                <asp:Parameter Name="original_patchPanelID" Type="Int32" />
                <asp:Parameter Name="original_hasWireless" Type="Boolean" />
                <asp:Parameter Name="original_licensedForAll" Type="Boolean" />
                <asp:Parameter Name="original_staticIPAddress" Type="String" />
                <asp:Parameter Name="original_deviceTypeID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="workstationID" Type="Int32" />
                <asp:Parameter Name="patchPanelID" Type="Int32" />
                <asp:Parameter Name="hasWireless" Type="Boolean" />
                <asp:Parameter Name="licensedForAll" Type="Boolean" />
                <asp:Parameter Name="staticIPAddress" Type="String" />
                <asp:Parameter Name="deviceTypeID" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
        </asp:Content>