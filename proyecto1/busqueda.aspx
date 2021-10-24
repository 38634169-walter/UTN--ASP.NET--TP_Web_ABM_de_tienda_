<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="busqueda.aspx.cs" Inherits="proyecto1.busqueda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    

    <div class="d-flex flex-wrap justify-content-center align-items-center">
        <%: foreach (var articulo in articuloList) { %>                
            <div class="card m-3" style="width:18rem;">
                <img class="card-img-top" src="<%: !(string.IsNullOrEmpty(articulo.imagenUrl)) ? articulo.imagenUrl : "https://plantillasdememes.com/img/plantillas/imagen-no-disponible01601774755.jpg" %>"/>
                <div class="card-body d-flex justify-content-center align-items-center flex-column">
                    <h1 class="card-title"> <%: articulo.nombre %></h1>
                    <p class="card-text"> <%: articulo.descripcion %></p>
                    <h1 class="fw-bold"> $<%: articulo.precio %></h1>
                    <a class="btn btn-primary px-5" href="verArticulo.aspx?id=<%: articulo.id %>" >Ver</a>
                </div>
            </div>
        <%:} %>
    </div>
</asp:Content>
