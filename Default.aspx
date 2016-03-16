<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Workstations App - Home</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
            height: 220px;
        }
        .style2
        {
            width: 195px;
        }
        .style3
        {
            width: 195px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp; &nbsp;
            
        <table class="style1">
            <tr>
                <td class="style3">
                    Data Tables</td>
                <td>
                    <b>Label Printing</b></td>
            </tr>
            <tr>
                <td class="style2" valign="top">
        <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/StaffList.aspx" Style="z-index: 109;
            left: 77px;  top: 80px" height="16px">Staff List</asp:HyperLink>
    
                    <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/WorkstationList.aspx"
            Style="z-index: 100; left: 77px;  top: 49px" 
            height="16px" width="137px">Location List</asp:HyperLink>
                    <br />
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Extensions.aspx" Style="z-index: 101;
            left: 77px;  top: 113px" height="16px" width="135px">Extensions List</asp:HyperLink>
                    <br />
        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/DirectDials.aspx" Style="z-index: 102;
            left: 77px;  top: 150px" height="16px" width="161px">Direct Dials</asp:HyperLink>
                    <br />
        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Devices.aspx" Style="z-index: 103;
            left: 77px;  top: 188px; bottom: 307px;" height="16px" width="128px">Devices</asp:HyperLink>
                    <br />
        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/DeviceTypes.aspx" Style="z-index: 104;
            left: 77px;  top: 222px; margin-right: 0px;" height="16px" width="47px">Device Types</asp:HyperLink>
                    <br />

                </td>
                <td valign="top">
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/RestrictedStationLabels.aspx"
            Style="z-index: 105; left: 77px;  top: 296px" 
            height="22px">Restricted Labels</asp:HyperLink>
                    <br />
        <asp:HyperLink ID="HyperLink8" runat="server" Height="22px" NavigateUrl="~/DedicatedStationLabels.aspx"
            Style="z-index: 107; left: 77px;  top: 326px" width="97px">Dedicated Labels</asp:HyperLink>
    
                    <br />
        <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/SharedStationLabels.aspx"
            Style="z-index: 106; left: 77px;  top: 359px" 
            height="22px" width="97px">Shared Labels</asp:HyperLink>
                    <br />
                    <br />
        <asp:Button ID="clearLabelButton" runat="server" Text="Clear 'Needs Label' flags" />
                    <br />
                    <br />
        <asp:Button ID="setNeedsLabelAllButton" runat="server" Text="Set 'Needs Label' flags" />
                </td>
            </tr>
        </table>
    
    </div>

    </form>
</body>
</html>
