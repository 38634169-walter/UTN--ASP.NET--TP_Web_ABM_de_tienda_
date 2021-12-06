<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="perfil.aspx.cs" Inherits="proyecto1.perfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
        <ContentTemplate>

            <div class="bajoMenu pt-4">
                <div class="d-flex justify-content-center align-items-start flex-column my-4 bg-dark border-5 rounded-3 p-4 shadow mx-2">
                    <h1 class="text-light"> Bienvenido <%: usuario.nombre %> <%: usuario.apellido %></h1>
                    <asp:Button CssClass="text-primary border-0 bg-transparent" ID="cerrarSesion" runat="server" Text="(Cerrar sesion)" OnClick="cerrarSesion_Click" />
                </div>
            </div>

            <div>
                <div class="d-flex justify-content-center align-items-start flex-column p-5 border-5 border-light shadow">
                    <p class=" fw-bold"> Flitrar por estado de tus compras: </p>
                    <asp:DropDownList CssClass="mx-2 form-select" ID="DropEstados" runat="server" OnSelectedIndexChanged="cambio_en_drop_down" AutoPostBack="true"></asp:DropDownList>
                </div>
            </div>
            
            <div class="w-100 d-flex justify-content-center align-items-center flex-column">
                <% foreach (var venta in ventasList) { %>
                    
                    <div class="border-5 border-dark p-5 d-flex justify-content-center align-items-center flex-sm-row flex-column shadow w-75">
                        <img class="mx-2" src="Content/img/OTRAS/compra.PNG" height="200px" width="300px"/>
                        <div class="d-flex justify-content-center align-items-start flex-column text-dark">
                            <h3>Tu compra tiene los siguientes datos</h3>
                            <p class="m-0">Fecha: <%: venta.fecha.ToString("dd/MM/yyyy") %> </p>
                            <p class="m-0">Monto: $<%: (Math.Truncate(venta.monto*100)/100).ToString("N0") %></p>
                            <p class="m-0">Estado: <%: venta.estado.nombre %></p>
                            <p class="m-0">Direccion de entrega: <%:  venta.calleEntrega%> <%: venta.numeroCalleEntrega %> (<%: venta.localidad %>)</p>
                            <a class="btn btn-success" href="detalles-de-venta.aspx?id=<%: venta.id %>" class>Ver</a>
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
    
            
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
