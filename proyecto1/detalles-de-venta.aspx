<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="detalles-de-venta.aspx.cs" Inherits="proyecto1.detalles_de_venta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class=" bajoMenu pt-2">
        <div class="d-flex justify-content-center align-items-start flex-column my-4 bg-dark border-5 rounded-3 p-4 mt-5 mx-2 shadow">
            <h1 class="text-light">Productos de la compra</h1>
            <asp:Button CssClass="text-primary border-0 bg-transparent" ID="cerrarSesion" runat="server" Text="(Cerrar sesion)" OnClick="cerrarSesion_Click" />
        </div>
    </div>

    <div class="d-flex justify-content-center align-items-start flex-column p-5 border-5 border-light shadow">
        <h1 class="text-decoration-underline fw-bold">Datos de la compra</h1>
        <p class="m-0"><strong> Fecha de compra: </strong><%: venta.fecha.ToString("dd/MM/yyyy") %> </p>
        <p class="m-0"><strong> Estado de compra: </strong><%: venta.estado.nombre %> </p>
        <p class="m-0"><strong> Monto total: $ </strong><%: (Math.Truncate(venta.monto*100)/100).ToString("N0") %> </p>
    </div>


    <div class="w-100 d-flex justify-content-center align-items-center flex-column my-4">
        <% foreach (var detalleVenta in detalleVentasList)
            { %>

        <div class="border-5 border-dark p-5 d-flex justify-content-center align-items-center flex-sm-row flex-column shadow w-75">
            <img class="mx-2" src="<%: !(string.IsNullOrEmpty(detalleVenta.articulo.imagen1)) ? detalleVenta.articulo.imagen1 : "https://plantillasdememes.com/img/plantillas/imagen-no-disponible01601774755.jpg" %>" height="200px" width="300px" />
            <div class="d-flex justify-content-center align-items-start flex-column text-dark">
                <h3><%: detalleVenta.articulo.nombre %> </h3>
                <p class="m-0">Precio a la fecha:$ <%: (Math.Truncate(detalleVenta.precioALaFecha * 100)/100).ToString("N0") %> </p>
                <p class="m-0">Cantidad: <%: detalleVenta.cantidad %> </p>
                <p class="m-0">Precio total:$ <%: (Math.Truncate(detalleVenta.cantidad * detalleVenta.precioALaFecha *100)/100).ToString("N0") %> </p>
                <p class="m-0">Marca: <%: detalleVenta.articulo.marca.nombre %> </p>


                <div class="d-flex justify-content-start align-items-center flex-row">
                    <p class="m-0">Monto: </p>
                    <strong class="fw-bold h1">$ <%: Convert.ToDecimal(detalleVenta.articulo.precioEntero).ToString("N0") %> </strong>
                    <strong class="pb-3" style="font-size: 15px;"><%: detalleVenta.articulo.precioDecimal %></strong>
                </div>
            </div>
        </div>

        <% %>

        <%} %>
        <% if (!detalleVentasList.Any())
            {%>
        <div class="text-center bg-dark text-secondary rounded-circle p-5">
            <h1><i class="fas fa-search pe-3"></i>No hay ventas hasta el momento </h1>
        </div>
        <%} %>
    </div>





</asp:Content>
