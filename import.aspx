<%@ Page Language="VB" AutoEventWireup="false" CodeFile="import.aspx.vb" Inherits="import" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            color: #66CCFF;
            font-style: italic;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblError" runat="server" Text="Label"></asp:Label>
<table>
   <tr>
      <td>
         <asp:Button ID="ButtonUploadExcel" runat="server" 
         Text="Upload Staff List" />
      </td>
      <td>
      <asp:Button ID="ButtonView" runat="server" Text="View Excel Data" />
          
      </td>
      <td>
         <asp:Button ID="ButtonImport" runat="server" 
         Text="Import Excel Data" />
          <asp:Button ID="ImportCommand" runat="server" Text="Import Sql Command" />
      </td>
   </tr>
</table> 

        <br />
        <br />
        This page is ready for use.&nbsp; Upload&nbsp; a csv, with no header to 
        <a href="file:///C:/Staff.csv">C:\InetPub\wwwroot\workspaces\uploadefiles</a><br />
        format = &lt;staffID&gt; (based on employee Window IDs,&lt;Full Name&gt;<br />
        There is a report in <a href="http://home.seward.coop/reports">
        home.seward.coop/reports</a> in the IT folder called <b>staff IDs</b> that will 
        generate the list.<br />
        <br />
        Then either click &quot;Import Sql Command&quot; button  button <br />
        <br />
        or<br />
        <br />
        From SQL server, run this query<br />
        <span class="style1">EXEC Workstations.dbo.sp_ImportNewStaff<br />
        <br />
        </span></div>
        
    <asp:Panel ID="PanelUpload" runat="server" Visible="false">
        Please select a CSV file for import:<br />
        <asp:FileUpload ID="FileUploadExcel" runat="server" />
        <br />
        <asp:Button ID="ButtonFileUpload" runat="server" Text="Upload File" />
        <br />
        <br /><br />
        <asp:Label ID="LabelUpload" runat="server" Text=""> </asp:Label>
        
    </asp:Panel>
    <asp:Panel ID="PanelView" runat="server" Visible="false">
    <asp:GridView ID="Gridview1" runat="server" AllowPaging="True" BackColor="White" 
            BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            GridLines="Vertical">
    
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="#DCDCDC" />
    
    </asp:GridView>
    
    </asp:Panel>
    <asp:Panel ID="PanelImport" runat="server" Visible="false">
        <asp:Label ID="LabelImport" runat="server" Text="Label"></asp:Label>
    </asp:Panel>
    </form>
</body>
</html>
