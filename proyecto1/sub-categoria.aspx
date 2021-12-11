<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="sub-categoria.aspx.cs" Inherits="proyecto1.sub_categoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="bajoMenu pt-4 fondo4">
        <div class=" d-flex justify-content-center align-items-center flex-column text-center titulo2 fondo2 rounded-circle shadow py-3 mx-2 mt-1 mb-2">
            <asp:Label CssClass="h1" ID="labelTitulo" runat="server" Text=""></asp:Label>
            <h3>Encontra lo que buscas..</h3>
        </div>
        <div class="d-flex flex-wrap justify-content-center align-items-center py-4" style="z-index: 1;">
                <% foreach (var articulo in articulosList)
                    { %>
                <div class="card m-2" style="width: 18rem;">
                    <img src="<%: !(String.IsNullOrEmpty(articulo.imagen1)) ? articulo.imagen1 : "https://plantillasdememes.com/img/plantillas/imagen-no-disponible01601774755.jpg" %>" alt="" height="255px">
                    <div class="card-body d-flex justify-content-center align-items-center flex-column">
                        <h5 class="card-title"><%: articulo.nombre %></h5>
                        <div class="d-flex justify-content-center align-items-center flex-row">
                            <h1 class="fw-bold">$ <%: Convert.ToDecimal(articulo.precioEntero).ToString("N0") %></h1>
                            <h1 class="fw-bold pb-3" style="font-size: 20px;"><%: articulo.precioDecimal %></h1>
                        </div>
                        <a href=" verArticulo.aspx?id=<%: articulo.id %>" class="btn btn-warning fw-bold text-light px-5">Ver</a>
                    </div>
                </div>
                <% } %>
        </div>
    </div>

</asp:Content>
