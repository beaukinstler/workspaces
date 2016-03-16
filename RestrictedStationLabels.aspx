<%@ Page Language="VB" AutoEventWireup="false" CodeFile="~/RestrictedStationLabels.aspx.vb" Inherits="RestrictedStationLabels" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Restricted Labels</title>
    <link href="PrintLabel.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;<asp:DataList ID="DataList1" runat="server" DataSourceID="vRefinedPrintDetails" RepeatColumns="2"
            RepeatDirection="Horizontal" Width="8.4in" CellSpacing="10">
            <ItemTemplate>
            <div  class="restricted">
                <asp:Label ID="Workstation_TypeLabel" runat="server" CssClass="workstation_type" Text='<%# Eval("[Workstation Type]") %>' Font-Size="28px"></asp:Label>
                <br />
                <br />
                Workstation Code:
                <asp:Label ID="Workstation_CodeLabel" runat="server" CssClass="details" Text='<%# Eval("[Workstation Code]") %>'></asp:Label><br />
                Primary Use:
                <br />
                <asp:Label ID="Primary_UseLabel" runat="server" CssClass="details" Text='<%# Eval("[Primary Use]") %>' Font-Underline="True"></asp:Label><br />
                <br />
                <asp:Label ID="Label2" runat="server" Style="z-index: 100" Text="Extension: " Visible='<%# IsNotNull(Eval("Extension")) %>'
                    Width="105px"></asp:Label><asp:Label ID="ExtensionLabel" runat="server" CssClass="details" Text='<%# Eval("Extension") %>'></asp:Label><br />
                <asp:Label ID="Label3" runat="server" Text="Direct Line: " Visible='<%# IsNotNull(Eval("[Direct Line]")) %>'
                    Width="103px"></asp:Label><asp:Label ID="Direct_LineLabel" runat="server" CssClass="details" Text='<%# Eval("[Direct Line]") %>'></asp:Label><br />
                <asp:Label ID="Label1" runat="server" Text="Citrix available to all" Visible='<%# Eval("[Open Citrix Access]") %>'
                    Width="191px"></asp:Label><br />
                <div class="other_info" style="width: 294px; height: 100%"><b>Important Info:</b><br />
                    Tech Support:
                    <br />
                     <strong style="color: black;">techsupport@seward.coop</strong> <br /> 
                     <strong style="color: red;">Ph:(612)547-6972</strong><br />
                    Mn Digerati: 1(800)477-3494<br />
                    MOD extension: 1021</div>
            </div>
            </ItemTemplate>
            <ItemStyle Width="4.2in" Wrap="False" />
        </asp:DataList>
        <asp:SqlDataSource ID="workstationPrintDS" runat="server" ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>"
            SelectCommand="SELECT worstationCode AS 'Workstation Code', PrimaryUse AS 'Primary Use', extensionNumber AS Extension, DirectDial AS 'Direct Line', isShared, Type, licensedForAll AS 'Open Citrix Access', CASE WHEN [AllStaff] = 1 THEN 'Sharedf' WHEN [isShared] = 1 THEN 'Dedicated' ELSE 'Restricted' END AS 'Workstation Type' FROM vWorkstationDetails WHERE (Type IN ('PC', 'Laptop', 'Terminal', 'Web-only terminal'))">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="vRefinedPrintDetails" runat="server" ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>"
            SelectCommand="SELECT * FROM [vRefinedPrintDetails] WHERE ([Workstation Type] = @Workstation_Type)">
            <SelectParameters>
                <asp:Parameter DefaultValue="Restricted" Name="Workstation_Type" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
