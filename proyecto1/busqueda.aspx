<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="busqueda.aspx.cs" Inherits="proyecto1.busqueda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="text-center mt-5">
        <h1>Resultados para... <%: buscar %> </h1>
    </div>

    <div class="d-flex flex-wrap justify-content-center align-items-center mt-5">
        <% foreach(var articulo in articuloList) { %>                
            <div class="card m-3" style="width:18rem;">
                <img class="card-img-top" height="255px" src="<%: !(string.IsNullOrEmpty(articulo.imagen1)) ? articulo.imagen1 : "https://plantillasdememes.com/img/plantillas/imagen-no-disponible01601774755.jpg" %>"/>
                <div class="card-body d-flex justify-content-center align-items-center flex-column">
                    <h1 class="card-title"> <%: articulo.nombre %></h1>
                    <p class="card-text"> <%: articulo.detalle %></p>
                    <div class="d-flex justify-content-center align-items-center flex-row">
                        <h1 class="fw-bold">$ <%: Convert.ToDecimal(articulo.precioEntero).ToString("N0") %></h1>
                        <h1 class="fw-bold pb-3" style="font-size:20px;"><%: articulo.precioDecimal %></h1>
                    </div>
                    <a class="btn btn-primary px-5" href="verArticulo.aspx?id=<%: articulo.id %>" >Ver</a>
                </div>
            </div>
        <% } %>
        <% if (!articuloList.Any()) { %>
            <div class="text-center bg-dark text-secondary rounded-circle p-5">
                <h1><i class="fas fa-search pe-3"></i> No hay resultados para la busqueda </h1>
            </div>
        <%} %>
    </div>
</asp:Content>
