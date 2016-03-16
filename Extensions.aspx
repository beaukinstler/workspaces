<%@ Page Language="VB"  MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Extensions.aspx.vb" Inherits="Extensions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="extensionID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display."
            Font-Names="Arial" Font-Size="10px" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="extensionID" HeaderText="extensionID" InsertVisible="False"
                    ReadOnly="True" SortExpression="extensionID" Visible="False" />
                <asp:BoundField DataField="extensionNumber" HeaderText="extensionNumber" SortExpression="extensionNumber" />
                <asp:TemplateField HeaderText="phoneNumber" SortExpression="phoneNumber">
                    <EditItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("phoneNumber") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("phoneNumber") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Extensions Workstation" SortExpression="workstationID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList9" AppendDataBoundItems="true" runat="server" DataSourceID="worstation" DataTextField="StationMapCode"
                            DataValueField="workstationID" SelectedValue='<%# Bind("workstationID") %>'>
                            <asp:ListItem Text="none" Value="" />
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Extension owner" SortExpression="staffID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList8" AppendDataBoundItems="true" runat="server" DataSourceID="Staff" DataTextField="FullName"
                            DataValueField="StaffID" SelectedValue='<%# Bind("staffID") %>'>
                            <asp:ListItem Text="none" Value="" />
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("FullName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="phoneTreeDay" HeaderText="phoneTreeDay" SortExpression="phoneTreeDay" />
                <asp:BoundField DataField="phoneTreeNight" HeaderText="phoneTreeNight" SortExpression="phoneTreeNight" />
                <asp:CheckBoxField DataField="hasVoiceMail" HeaderText="hasVoiceMail" SortExpression="hasVoiceMail" />
                <asp:CheckBoxField DataField="hotDeskOnly" HeaderText="hotDeskOnly" SortExpression="hotDeskOnly" />
                <asp:TemplateField HeaderText="patchPanelID" SortExpression="patchPanelID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList7" AppendDataBoundItems="true" runat="server" DataSourceID="patchPanel" DataTextField="panelCode"
                            DataValueField="patchPanelID" SelectedValue='<%# Bind("patchPanelID") %>'>
                            <asp:ListItem Text="none" Value="" />
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("panelCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="panelCode" HeaderText="panelCode" SortExpression="panelCode" Visible="False" />
                <asp:BoundField DataField="notes" HeaderText="notes" SortExpression="notes" Visible="False" />
                <asp:BoundField DataField="FullName" HeaderText="FullName" SortExpression="FullName" Visible="False" />
                <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" Visible="False" />
            </Columns>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>"
            DeleteCommand="DELETE FROM [Extensions] WHERE [extensionID] = @extensionID" InsertCommand="INSERT INTO [Extensions] ([extensionNumber], [workstationID], [staffID], [phoneTreeDay], [phoneTreeNight], [hasVoiceMail], [hotDeskOnly], [patchPanelID]) VALUES (@extensionNumber, @workstationID, @staffID, @phoneTreeDay, @phoneTreeNight, @hasVoiceMail, @hotDeskOnly, @patchPanelID)"
            ProviderName="<%$ ConnectionStrings:WorkstationsConnectionString.ProviderName %>"
            SelectCommand="SELECT Extensions.extensionID, Extensions.extensionNumber, Extensions.workstationID, Extensions.staffID, Extensions.phoneTreeDay, Extensions.phoneTreeNight, Extensions.hasVoiceMail, Extensions.hotDeskOnly, Extensions.patchPanelID, PatchPanels.panelCode, PatchPanels.notes, Staff.FullName, Workstations.description, DirectDialNumbers.phoneNumber FROM Extensions LEFT OUTER JOIN DirectDialNumbers ON Extensions.extensionID = DirectDialNumbers.extensionID LEFT OUTER JOIN Workstations ON Extensions.workstationID = Workstations.workstationID LEFT OUTER JOIN Staff ON Extensions.staffID = Staff.StaffID LEFT OUTER JOIN PatchPanels ON Extensions.patchPanelID = PatchPanels.patchPanelID"
            UpdateCommand="UPDATE [Extensions] SET [extensionNumber] = @extensionNumber, [workstationID] = @workstationID, [staffID] = @staffID, [phoneTreeDay] = @phoneTreeDay, [phoneTreeNight] = @phoneTreeNight, [hasVoiceMail] = @hasVoiceMail, [hotDeskOnly] = @hotDeskOnly, [patchPanelID] = @patchPanelID WHERE [extensionID] = @extensionID">
            <DeleteParameters>
                <asp:Parameter Name="extensionID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="extensionNumber" Type="Int32" />
                <asp:Parameter Name="workstationID" Type="Int32" />
                <asp:Parameter Name="staffID" Type="Int32" />
                <asp:Parameter Name="phoneTreeDay" Type="Int16" />
                <asp:Parameter Name="phoneTreeNight" Type="Int16" />
                <asp:Parameter Name="hasVoiceMail" Type="Boolean" />
                <asp:Parameter Name="hotDeskOnly" Type="Boolean" />
                <asp:Parameter Name="patchPanelID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="extensionNumber" Type="Int32" />
                <asp:Parameter Name="workstationID" Type="Int32" />
                <asp:Parameter Name="staffID" Type="Int32" />
                <asp:Parameter Name="phoneTreeDay" Type="Int16" />
                <asp:Parameter Name="phoneTreeNight" Type="Int16" />
                <asp:Parameter Name="hasVoiceMail" Type="Boolean" />
                <asp:Parameter Name="hotDeskOnly" Type="Boolean" />
                <asp:Parameter Name="patchPanelID" Type="Int32" />
                <asp:Parameter Name="extensionID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
        <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="extensionID"
            DataSourceID="ExtentionsDetailsDatasource" Font-Names="Arial" Font-Size="10px"
            ForeColor="#333333" AllowPaging="True">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <EditItemTemplate>
                Extension Number:
                <br />
                <asp:TextBox ID="extensionNumberTextBox" runat="server" Height="22px" Text='<%# Bind("extensionNumber") %>'
                    Width="155px"></asp:TextBox><br />
                workstationID:<br />
                <asp:DropDownList ID="DropDownList2" AppendDataBoundItems="true" runat="server" DataSourceID="worstation" DataTextField="StationMapCode"
                    DataValueField="workstationID" Height="22px" SelectedValue='<%# Bind("workstationID") %>'
                    Width="250px">
                    <asp:ListItem Text="none" Value=""/>
                </asp:DropDownList>
                <br />
                staffID:<br />
                <asp:DropDownList ID="DropDownList1" AppendDataBoundItems="True" runat="server" DataSourceID="Staff" DataTextField="FullName"
                    DataValueField="StaffID" Height="22px" SelectedValue='<%# Bind("staffID") %>'
                    Style="z-index: 100; left: 0px; position: relative; top: 0px" Width="253px">
                    <asp:ListItem Text="none" Value=""/>
                </asp:DropDownList>
                <br />
                Level this phone rings in the day phone tree:
                <br />
                <asp:TextBox ID="phoneTreeDayTextBox" runat="server" Height="22px" Text='<%# Bind("phoneTreeDay") %>'
                    Width="155px"></asp:TextBox><br />
                Level this phone rings in the night phone tree:&nbsp;
                <br />
                <asp:TextBox ID="phoneTreeNightTextBox" runat="server" Text='<%# Bind("phoneTreeNight") %>'
                    Width="155px"></asp:TextBox><br />
                Has Voice Mail:
                <asp:CheckBox ID="hasVoiceMailCheckBox" runat="server" Checked='<%# Bind("hasVoiceMail") %>' /><br />
                Hot Desk Only:
                <asp:CheckBox ID="hotDeskOnlyCheckBox" runat="server" Checked='<%# Bind("hotDeskOnly") %>' /><br />
                Patch Panel Code:<br />
                <asp:DropDownList ID="DropDownList3" AppendDataBoundItems="true" runat="server" DataSourceID="patchPanel" DataTextField="panelCode"
                    DataValueField="patchPanelID" SelectedValue='<%# Bind("patchPanelID") %>' Width="151px">
                    <asp:ListItem Text="none" Value=""/>
                </asp:DropDownList>
                <br />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                    Text="Update"></asp:LinkButton>
                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel"></asp:LinkButton>
            </EditItemTemplate>
            <InsertItemTemplate>
                E xtension Number:
                <br />
                <asp:TextBox ID="extensionNumberTextBox" runat="server" Text='<%# Bind("extensionNumber") %>'></asp:TextBox><br />
                <br />
                workstationID:<br />
                <asp:DropDownList ID="DropDownList4" AppendDataBoundItems="true" runat="server" DataSourceID="worstation" DataTextField="StationMapCode"
                    DataValueField="workstationID" SelectedValue='<%# Bind("workstationID") %>' Width="277px">
                    <asp:ListItem Text="none" Value="" />
                </asp:DropDownList><br />
                staffID:
                <br />
                <asp:DropDownList ID="DropDownList5" AppendDataBoundItems="true" runat="server" DataSourceID="Staff" DataTextField="FullName"
                    DataValueField="StaffID" SelectedValue='<%# Bind("staffID") %>' Width="277px">
                <asp:ListItem Text="none" Value="" />
                </asp:DropDownList>
                <br />
                Phone Tree Level - Day:
                <asp:TextBox ID="phoneTreeDayTextBox" runat="server" Text='<%# Bind("phoneTreeDay") %>'
                    Width="64px"></asp:TextBox><br />
                Phone Tree Level - Night:
                <asp:TextBox ID="phoneTreeNightTextBox" runat="server" Text='<%# Bind("phoneTreeNight") %>'
                    Width="61px"></asp:TextBox><br />
                Has Voice Mail:
                <asp:CheckBox ID="hasVoiceMailCheckBox" runat="server" Checked='<%# Bind("hasVoiceMail") %>' /><br />
                Hot Desk Only:
                <asp:CheckBox ID="hotDeskOnlyCheckBox" runat="server" Checked='<%# Bind("hotDeskOnly") %>' /><br />
                Patch Panel Code:
                <asp:DropDownList ID="DropDownList6" AppendDataBoundItems="true" runat="server" DataSourceID="patchPanel" DataTextField="panelCode"
                    DataValueField="patchPanelID" SelectedValue='<%# Bind("patchPanelID") %>'>
                <asp:ListItem Text="none" Value="" />
                </asp:DropDownList><br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                    Text="Insert"></asp:LinkButton>
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel"></asp:LinkButton>
            </InsertItemTemplate>
            <ItemTemplate>
                extensionID:
                <asp:Label ID="extensionIDLabel" runat="server" Text='<%# Eval("extensionID") %>'></asp:Label><br />
                extensionNumber:
                <asp:Label ID="extensionNumberLabel" runat="server" Text='<%# Bind("extensionNumber") %>'></asp:Label><br />
                workstationID:
                <asp:Label ID="workstationIDLabel" runat="server" Text='<%# Bind("workstationID") %>'></asp:Label><br />
                staffID:
                <asp:Label ID="staffIDLabel" runat="server" Text='<%# Bind("staffID") %>'></asp:Label><br />
                phoneTreeDay:
                <asp:Label ID="phoneTreeDayLabel" runat="server" Text='<%# Bind("phoneTreeDay") %>'></asp:Label><br />
                phoneTreeNight:
                <asp:Label ID="phoneTreeNightLabel" runat="server" Text='<%# Bind("phoneTreeNight") %>'></asp:Label><br />
                hasVoiceMail:
                <asp:CheckBox ID="hasVoiceMailCheckBox" runat="server" Checked='<%# Bind("hasVoiceMail") %>'
                    Enabled="false" /><br />
                hotDeskOnly:
                <asp:CheckBox ID="hotDeskOnlyCheckBox" runat="server" Checked='<%# Bind("hotDeskOnly") %>'
                    Enabled="false" /><br />
                patchPanelID:
                <asp:Label ID="patchPanelIDLabel" runat="server" Text='<%# Bind("patchPanelID") %>'></asp:Label><br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Edit"></asp:LinkButton>
                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                    Text="Delete"></asp:LinkButton>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                    Text="New"></asp:LinkButton>
            </ItemTemplate>
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
        </asp:FormView>
        <asp:SqlDataSource ID="ExtentionsDetailsDatasource" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>" DeleteCommand="DELETE FROM [Extensions] WHERE [extensionID] = @original_extensionID AND [extensionNumber] = @original_extensionNumber AND (([workstationID] = @original_workstationID) OR ([workstationID] IS NULL AND @original_workstationID IS NULL)) AND (([staffID] = @original_staffID) OR ([staffID] IS NULL AND @original_staffID IS NULL)) AND (([phoneTreeDay] = @original_phoneTreeDay) OR ([phoneTreeDay] IS NULL AND @original_phoneTreeDay IS NULL)) AND (([phoneTreeNight] = @original_phoneTreeNight) OR ([phoneTreeNight] IS NULL AND @original_phoneTreeNight IS NULL)) AND (([hasVoiceMail] = @original_hasVoiceMail) OR ([hasVoiceMail] IS NULL AND @original_hasVoiceMail IS NULL)) AND (([hotDeskOnly] = @original_hotDeskOnly) OR ([hotDeskOnly] IS NULL AND @original_hotDeskOnly IS NULL)) AND (([patchPanelID] = @original_patchPanelID) OR ([patchPanelID] IS NULL AND @original_patchPanelID IS NULL))"
            InsertCommand="INSERT INTO [Extensions] ([extensionNumber], [workstationID], [staffID], [phoneTreeDay], [phoneTreeNight], [hasVoiceMail], [hotDeskOnly], [patchPanelID]) VALUES (@extensionNumber, @workstationID, @staffID, @phoneTreeDay, @phoneTreeNight, @hasVoiceMail, @hotDeskOnly, @patchPanelID)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="&#13;&#10;SELECT * FROM [Extensions] WHERE extensionID = @extensionID"
            UpdateCommand="UPDATE [Extensions] SET [extensionNumber] = @extensionNumber, [workstationID] = @workstationID, [staffID] = @staffID, [phoneTreeDay] = @phoneTreeDay, [phoneTreeNight] = @phoneTreeNight, [hasVoiceMail] = @hasVoiceMail, [hotDeskOnly] = @hotDeskOnly, [patchPanelID] = @patchPanelID WHERE [extensionID] = @original_extensionID AND [extensionNumber] = @original_extensionNumber AND (([workstationID] = @original_workstationID) OR ([workstationID] IS NULL AND @original_workstationID IS NULL)) AND (([staffID] = @original_staffID) OR ([staffID] IS NULL AND @original_staffID IS NULL)) AND (([phoneTreeDay] = @original_phoneTreeDay) OR ([phoneTreeDay] IS NULL AND @original_phoneTreeDay IS NULL)) AND (([phoneTreeNight] = @original_phoneTreeNight) OR ([phoneTreeNight] IS NULL AND @original_phoneTreeNight IS NULL)) AND (([hasVoiceMail] = @original_hasVoiceMail) OR ([hasVoiceMail] IS NULL AND @original_hasVoiceMail IS NULL)) AND (([hotDeskOnly] = @original_hotDeskOnly) OR ([hotDeskOnly] IS NULL AND @original_hotDeskOnly IS NULL)) AND (([patchPanelID] = @original_patchPanelID) OR ([patchPanelID] IS NULL AND @original_patchPanelID IS NULL))">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="extensionID" PropertyName="SelectedValue" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="original_extensionID" Type="Int32" />
                <asp:Parameter Name="original_extensionNumber" Type="Int32" />
                <asp:Parameter Name="original_workstationID" Type="Int32" />
                <asp:Parameter Name="original_staffID" Type="Int32" />
                <asp:Parameter Name="original_phoneTreeDay" Type="Int16" />
                <asp:Parameter Name="original_phoneTreeNight" Type="Int16" />
                <asp:Parameter Name="original_hasVoiceMail" Type="Boolean" />
                <asp:Parameter Name="original_hotDeskOnly" Type="Boolean" />
                <asp:Parameter Name="original_patchPanelID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="extensionNumber" Type="Int32" />
                <asp:Parameter Name="workstationID" Type="Int32" />
                <asp:Parameter Name="staffID" Type="Int32" />
                <asp:Parameter Name="phoneTreeDay" Type="Int16" />
                <asp:Parameter Name="phoneTreeNight" Type="Int16" />
                <asp:Parameter Name="hasVoiceMail" Type="Boolean" />
                <asp:Parameter Name="hotDeskOnly" Type="Boolean" />
                <asp:Parameter Name="patchPanelID" Type="Int32" />
                <asp:Parameter Name="original_extensionID" Type="Int32" />
                <asp:Parameter Name="original_extensionNumber" Type="Int32" />
                <asp:Parameter Name="original_workstationID" Type="Int32" />
                <asp:Parameter Name="original_staffID" Type="Int32" />
                <asp:Parameter Name="original_phoneTreeDay" Type="Int16" />
                <asp:Parameter Name="original_phoneTreeNight" Type="Int16" />
                <asp:Parameter Name="original_hasVoiceMail" Type="Boolean" />
                <asp:Parameter Name="original_hotDeskOnly" Type="Boolean" />
                <asp:Parameter Name="original_patchPanelID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="extensionNumber" Type="Int32" />
                <asp:Parameter Name="workstationID" Type="Int32" />
                <asp:Parameter Name="staffID" Type="Int32" />
                <asp:Parameter Name="phoneTreeDay" Type="Int16" />
                <asp:Parameter Name="phoneTreeNight" Type="Int16" />
                <asp:Parameter Name="hasVoiceMail" Type="Boolean" />
                <asp:Parameter Name="hotDeskOnly" Type="Boolean" />
                <asp:Parameter Name="patchPanelID" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="Staff" runat="server" ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>"
            SelectCommand="&#13;&#10;SELECT DISTINCT [StaffID], [FullName] FROM [Staff]&#13;&#10;ORDER BY FullName"></asp:SqlDataSource>
        <asp:SqlDataSource ID="patchPanel" runat="server" ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>"
            SelectCommand="&#13;&#10;SELECT DISTINCT patchPanelID, panelCode FROM PatchPanels"></asp:SqlDataSource>
        <asp:SqlDataSource ID="worstation" runat="server" ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>"
            SelectCommand="&#13;&#10;SELECT DISTINCT workstationID, description + ' - ' + worstationCode AS StationMapCode FROM Workstations&#13;&#10;ORDER BY workstationID">
        </asp:SqlDataSource>

</asp:Content>