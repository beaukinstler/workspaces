<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="DeviceDetails.aspx.vb" Inherits="DeviceDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="deviceGridView" runat="server">
    </asp:GridView>
    <asp:SqlDataSource ID="DeviceDetailsSQL" runat="server" 
        ConnectionString="<%$ ConnectionStrings:WorkstationsConnectionString %>" 
        SelectCommand="SELECT * FROM [vDevicesMasterView]"></asp:SqlDataSource>
</asp:Content>

