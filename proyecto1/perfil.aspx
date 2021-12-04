<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="perfil.aspx.cs" Inherits="proyecto1.perfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="mt-5">
        <h1> Bienvenido <%: usuario.nombre %> <%: usuario.apellido %></h1>
        <asp:Button CssClass="text-primary border-0 bg-transparent" ID="cerrarSesion" runat="server" Text="(Cerrar sesion)" OnClick="cerrarSesion_Click" />
    </div>

    <div>
        <div class="d-flex justify-content-center align-items-center flex-row p-5 border-5 border-light">
            <asp:DropDownList CssClass="mx-2" ID="DropEstados" runat="server"></asp:DropDownList>
            <asp:TextBox CssClass="mx-2" ID="txbFecha" runat="server" TextMode="Date"></asp:TextBox>
        </div>
    </div>
    
    <div class="w-100 d-flex justify-content-center align-items-center flex-column">
        <% foreach (var venta in ventasList) { %>
            
            <div class="border-5 border-light p-5 d-flex justify-content-center align-items-center flex-row">
                <img src="" />
                <div class="d-flex justify-content-center align-items-center flex-column text-light">
                    <h1>Tu compra tiene los siguientes datos</h1>
                    <p>Fecha: <%: venta.fecha %> </p>
                    <p>Monto: <%: venta.monto %></p>
                    <p>Estado: <%: venta.estado.nombre %></p>
                    <p>Direccion de entrega: <%:  venta.calleEntrega%> <%: venta.numeroCalleEntrega %> (<%: venta.localidad %>)</p>
                    <a href="detalles-de-venta.aspx?id=<%: venta.id %>" class>Ver</a>
                </div>
            </div>
            
            <% %>

        <%} %>
        <% if (!ventasList.Any()) {%>
            <div class="text-center bg-dark text-secondary rounded-circle p-5">
                <h1><i class="fas fa-search pe-3"></i> No hay ventas hasta el momento </h1>
            </div>
        <%} %>
    </div>

</asp:Content>
