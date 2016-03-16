<%@ Page Language="VB"  MasterPageFile="~/MasterPage.master"%>


<script runat="server">

    Protected Sub SqlDataSource1_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs)

        
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub GridView1_Load(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs)
        GridView1.DataBind()

End Sub

Protected Sub DetailsView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs)
        GridView1.DataBind()
End Sub
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="phoneNumberID"
            DataSourceID="DirectDialSqlDataSource" EmptyDataText="There are no data records to display."
            Style="z-index: 100; left: 0px; position: absolute; top: 55px" AllowPaging="True" AllowSorting="True" CellPadding="4" Font-Names="Arial" Font-Size="10px" ForeColor="#333333" GridLines="None" OnLoad="GridView1_Load">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="phoneNumberID" HeaderText="phoneNumberID" ReadOnly="True"
                    SortExpression="phoneNumberID" Visible="False" />
                <asp:BoundField DataField="phoneNumber" HeaderText="phoneNumber" SortExpression="phoneNumber" />
                <asp:BoundField DataField="extensionNumber" HeaderText="extensionNumber" SortExpression="extensionNumber" />
                <asp:BoundField DataField="extensionID" HeaderText="extensionID" SortExpression="extensionID" Visible="False" />
            </Columns>
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        &nbsp;
        <asp:SqlDataSource ID="DirectDialSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>"
            DeleteCommand="DELETE FROM [DirectDialNumbers] WHERE [phoneNumberID] = @phoneNumberID"
            InsertCommand="INSERT INTO [DirectDialNumbers] ([phoneNumber], [extensionID]) VALUES (@phoneNumber, @extensionID)"
            OnSelecting="SqlDataSource1_Selecting" ProviderName="<%$ ConnectionStrings:WorkstationsConnectionString.ProviderName %>"
            SelectCommand="SELECT DirectDialNumbers.phoneNumberID, DirectDialNumbers.phoneNumber, Extensions.extensionNumber, DirectDialNumbers.extensionID FROM DirectDialNumbers LEFT OUTER JOIN Extensions ON DirectDialNumbers.extensionID = Extensions.extensionID"
            UpdateCommand="UPDATE [DirectDialNumbers] SET [phoneNumber] = @phoneNumber, [extensionID] = @extensionID WHERE [phoneNumberID] = @phoneNumberID">
            <DeleteParameters>
                <asp:Parameter Name="phoneNumberID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="phoneNumber" Type="String" />
                <asp:Parameter Name="extensionID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="phoneNumber" Type="String" />
                <asp:Parameter Name="extensionID" Type="Int32" />
                <asp:Parameter Name="phoneNumberID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False"
            CellPadding="4" DataKeyNames="phoneNumberID" DataSourceID="DirectDialDetailSqlDataSource"
            Font-Names="Arial" Font-Size="10px" ForeColor="#333333" GridLines="None" Height="50px"
            Style="z-index: 102; left: 17px; position: absolute; top: 352px" Width="283px" OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <Fields>
                <asp:BoundField DataField="phoneNumberID" HeaderText="phoneNumberID" InsertVisible="False"
                    ReadOnly="True" SortExpression="phoneNumberID" />
                <asp:BoundField DataField="phoneNumber" HeaderText="phoneNumber" SortExpression="phoneNumber" />
                <asp:TemplateField HeaderText="extensionID" SortExpression="extensionID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" AppendDataBoundItems="true" runat="server" DataSourceID="extensionDataSource"
                            DataTextField="extensionNumber" DataValueField="extensionID" Width="230px" SelectedValue='<%# Bind("extensionID") %>'>
                            <asp:ListItem Text="none" Value="" />
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList2" AppendDataBoundItems="true" runat="server" DataSourceID="extensionDataSource"
                            DataTextField="extensionNumber" DataValueField="extensionID" Width="218px" SelectedValue='<%# Bind("extensionID") %>'>
                            <asp:ListItem Text="none" Value="" />
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("extensionNumber") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="notes" HeaderText="notes" SortExpression="notes" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="DirectDialDetailSqlDataSource" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>" DeleteCommand="DELETE FROM [DirectDialNumbers] WHERE [phoneNumberID] = @original_phoneNumberID AND (([phoneNumber] = @original_phoneNumber) OR ([phoneNumber] IS NULL AND @original_phoneNumber IS NULL)) AND (([extensionID] = @original_extensionID) OR ([extensionID] IS NULL AND @original_extensionID IS NULL))"
            InsertCommand="INSERT INTO [DirectDialNumbers] ([phoneNumber], [extensionID],[notes]) VALUES (@phoneNumber, @extensionID,@notes)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT DirectDialNumbers.phoneNumberID, DirectDialNumbers.phoneNumber, DirectDialNumbers.extensionID, Extensions.extensionNumber, DirectDialNumbers.notes FROM DirectDialNumbers LEFT OUTER JOIN Extensions ON DirectDialNumbers.extensionID = Extensions.extensionID WHERE (DirectDialNumbers.phoneNumberID = @phoneNumberID)"
            
            UpdateCommand="UPDATE [DirectDialNumbers] SET [phoneNumber] = @phoneNumber, [extensionID] = @extensionID, [notes] = @notes WHERE [phoneNumberID] = @original_phoneNumberID AND (([phoneNumber] = @original_phoneNumber) OR ([phoneNumber] IS NULL AND @original_phoneNumber IS NULL)) AND (([extensionID] = @original_extensionID) OR ([extensionID] IS NULL AND @original_extensionID IS NULL))">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="phoneNumberID" PropertyName="SelectedValue" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="original_phoneNumberID" Type="Int32" />
                <asp:Parameter Name="original_phoneNumber" Type="String" />
                <asp:Parameter Name="original_extensionID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="phoneNumber" Type="String" />
                <asp:Parameter Name="extensionID" Type="Int32" />
                <asp:Parameter Name="notes" />
                <asp:Parameter Name="original_phoneNumberID" Type="Int32" />
                <asp:Parameter Name="original_phoneNumber" Type="String" />
                <asp:Parameter Name="original_extensionID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="phoneNumber" Type="String" />
                <asp:Parameter Name="extensionID" Type="Int32" />
                <asp:Parameter Name="notes" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="extensionDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>"
            SelectCommand="SELECT DISTINCT [extensionID], [extensionNumber] FROM [Extensions]">
        </asp:SqlDataSource>
    
    </div>

</asp:Content>