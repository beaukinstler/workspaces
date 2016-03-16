<%@ Page Language="VB"  MasterPageFile="~/MasterPage.master"%>

<script runat="server">

    Protected Sub DropDownList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub InsertButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub worstationCodeTextBox_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.Focus()
        
    End Sub
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:FormView ID="FormView1" runat="server" AllowPaging="True" CellPadding="4" DataKeyNames="workstationID"
            DataSourceID="Workstations" ForeColor="#333333" Style="z-index: 100; left: 21px;
            position: absolute; top: 71px" Width="389px" Height="183px" Font-Names="Arial" Font-Size="10px">
            <PagerSettings Mode="NextPreviousFirstLast" Position="TopAndBottom" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <EditItemTemplate>
                workstationID: <asp:Label ID="workstationIDLabel1" runat="server" 
                    Text='<%# Eval("workstationID") %>' />
                <br />
                worstationCode:
                <asp:TextBox ID="worstationCodeTextBox" runat="server" 
                    Text='<%# Bind("worstationCode") %>'></asp:TextBox><br />
                description:
                <asp:TextBox ID="descriptionTextBox" runat="server" 
                    Text='<%# Bind("description") %>'></asp:TextBox><br />
                Primary User:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="Staff" 
                    DataTextField="FullName" DataValueField="StaffID" Height="16px" 
                    SelectedValue='<%# Bind("primaryUserID") %>' Width="124px">
                </asp:DropDownList>
                <br />
                needsLable:
                <asp:CheckBox ID="needsLableCheckBox" runat="server" 
                    Checked='<%# Bind("needsLable") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update"></asp:LinkButton>
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
            </EditItemTemplate>
            <InsertItemTemplate>
                worstationCode:
                <asp:TextBox ID="worstationCodeTextBox" runat="server" 
                    Text='<%# Bind("worstationCode") %>'></asp:TextBox>
                <br />
                description:
                <asp:TextBox ID="descriptionTextBox" runat="server" 
                    Text='<%# Bind("description") %>'></asp:TextBox>
                <br />
                primaryUserID:
                <asp:TextBox ID="primaryUserIDTextBox" runat="server" 
                    Text='<%# Bind("primaryUserID") %>'></asp:TextBox><br />
                needsLable:
                <asp:CheckBox ID="needsLableCheckBox" runat="server" 
                    Checked='<%# Bind("needsLable") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                    Text="Insert"></asp:LinkButton>
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel"
                    Text="Cancel"></asp:LinkButton>
            </InsertItemTemplate>
            <ItemTemplate>
                workstationID:
                <asp:Label ID="workstationIDLabel" runat="server" 
                    Text='<%# Eval("workstationID") %>'></asp:Label><br />
                worstationCode:
                <asp:Label ID="worstationCodeLabel" runat="server" 
                    Text='<%# Bind("worstationCode") %>'></asp:Label><br />
                description:
                <asp:Label ID="descriptionLabel" runat="server" 
                    Text='<%# Bind("description") %>'></asp:Label><br />
                primary User:
                <asp:Label ID="primaryUserIDLabel" runat="server" 
                    Text='<%# Bind("FullName") %>' />
                <br />
                needsLable:
                <asp:CheckBox ID="needsLableCheckBox" runat="server" 
                    Checked='<%# Bind("needsLable") %>' Enabled="false" />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Edit"></asp:LinkButton>
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" OnClientClick="return confirm('Are you certain you want to delete this product?');" CommandName="Delete"
                    Text="Delete"></asp:LinkButton>
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                    Text="New"></asp:LinkButton>
            </ItemTemplate>
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
        </asp:FormView>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/WorkstationList.aspx"
            Style="z-index: 102; left: 24px; position: absolute; top: 261px" Width="258px" TabIndex="6">View Worstation List</asp:HyperLink>
        <asp:SqlDataSource ID="Workstations" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>" DeleteCommand="DELETE FROM [Workstations] WHERE [workstationID] = @original_workstationID AND [worstationCode] = @original_worstationCode AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([primaryUserID] = @original_primaryUserID) OR ([primaryUserID] IS NULL AND @original_primaryUserID IS NULL)) AND (([needsLable] = @original_needsLable) OR ([needsLable] IS NULL AND @original_needsLable IS NULL))"
            InsertCommand="INSERT INTO [Workstations] ([worstationCode], [description], [primaryUserID], [needsLable]) VALUES (@worstationCode, @description, @primaryUserID, @needsLable)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT Workstations.workstationID, Workstations.worstationCode, Workstations.description, Workstations.primaryUserID, Workstations.needsLable, Staff.FullName FROM Workstations LEFT OUTER JOIN Staff ON Workstations.primaryUserID = Staff.StaffID WHERE (Workstations.worstationCode = @worstationCode)"
            
            
            UpdateCommand="UPDATE [Workstations] SET [worstationCode] = @worstationCode, [description] = @description, [primaryUserID] = @primaryUserID, [needsLable] = @needsLable WHERE [workstationID] = @original_workstationID AND [worstationCode] = @original_worstationCode AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([primaryUserID] = @original_primaryUserID) OR ([primaryUserID] IS NULL AND @original_primaryUserID IS NULL)) AND (([needsLable] = @original_needsLable) OR ([needsLable] IS NULL AND @original_needsLable IS NULL))">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="1" Name="worstationCode" 
                    QueryStringField="ws" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="original_workstationID" Type="Int32" />
                <asp:Parameter Name="original_worstationCode" Type="String" />
                <asp:Parameter Name="original_description" Type="String" />
                <asp:Parameter Name="original_primaryUserID" Type="Int32" />
                <asp:Parameter Name="original_needsLable" Type="Boolean" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="worstationCode" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="primaryUserID" Type="Int32" />
                <asp:Parameter Name="needsLable" Type="Boolean" />
                <asp:Parameter Name="original_workstationID" Type="Int32" />
                <asp:Parameter Name="original_worstationCode" Type="String" />
                <asp:Parameter Name="original_description" Type="String" />
                <asp:Parameter Name="original_primaryUserID" Type="Int32" />
                <asp:Parameter Name="original_needsLable" Type="Boolean" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="worstationCode" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="primaryUserID" Type="Int32" />
                <asp:Parameter Name="needsLable" Type="Boolean" />
            </InsertParameters>
            <FilterParameters>
                <asp:QueryStringParameter DefaultValue="1" Name="newparameter" QueryStringField="wk" />
            </FilterParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="Staff" runat="server" ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>"
            SelectCommand="SELECT Null as StaffID, 'None' as FullName&#13;&#10;&#13;&#10;UNION ALL&#13;&#10;SELECT DISTINCT * FROM [Staff]&#13;&#10;&#13;&#10;"></asp:SqlDataSource>
    
    </div>

</asp:Content>