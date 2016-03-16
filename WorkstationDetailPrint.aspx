<%@ Page Language="VB" AutoEventWireup="false" CodeFile="WorkstationDetailPrint.aspx.vb" Inherits="WorkstationDetailPrint" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="PrintLabel.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;<asp:SqlDataSource ID="workstationPrintDS" runat="server" ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>"
            SelectCommand="SELECT worstationCode AS 'Workstation Code', PrimaryUse AS 'Primary Use', extensionNumber AS Extension, DirectDial AS 'Direct Line', isShared, Type, licensedForAll AS 'Open Citrix Access', CASE WHEN [AllStaff] = 1 THEN 'Sharedf' WHEN [isShared] = 1 THEN 'Dedicated' ELSE 'Restricted' END AS 'Workstation Type' FROM vWorkstationDetails WHERE (Type IN ('PC', 'Laptop', 'Terminal', 'Web-only terminal'))">
        </asp:SqlDataSource>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="vRefinedPrintDetails" RepeatColumns="2"
            RepeatDirection="Horizontal" Width="8.4in">
            <ItemTemplate>
                <asp:Label ID="Workstation_TypeLabel" runat="server" CssClass="workstation_type" Text='<%# Eval("[Workstation Type]") %>' Font-Size="28px"></asp:Label>
                <br />
                <br />
                Workstation Code:
                <asp:Label ID="Workstation_CodeLabel" runat="server" CssClass="details" Text='<%# Eval("[Workstation Code]") %>'></asp:Label><br />
                Primary Use:
                <asp:Label ID="Primary_UseLabel" runat="server" CssClass="details" Text='<%# Eval("[Primary Use]") %>'></asp:Label><br />
                <asp:Label ID="Label2" runat="server" Style="z-index: 100" Text="Extension: " Visible='<%# IsNotNull(Eval("Extension")) %>'
                    Width="105px"></asp:Label><asp:Label ID="ExtensionLabel" runat="server" CssClass="details" Text='<%# Eval("Extension") %>'></asp:Label><br />
                <asp:Label ID="Label3" runat="server" Text="Direct Line: " Visible='<%# IsNotNull(Eval("[Direct Line]")) %>'
                    Width="103px"></asp:Label><asp:Label ID="Direct_LineLabel" runat="server" CssClass="details" Text='<%# Eval("[Direct Line]") %>'></asp:Label><br />
                <asp:Label ID="Label1" runat="server" Text="Citrix available to all" Visible='<%# Eval("[Open Citrix Access]") %>'
                    Width="191px"></asp:Label><br />
                &nbsp;<br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="vRefinedPrintDetails" runat="server" ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>"
            SelectCommand="SELECT * FROM [vRefinedPrintDetails]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
