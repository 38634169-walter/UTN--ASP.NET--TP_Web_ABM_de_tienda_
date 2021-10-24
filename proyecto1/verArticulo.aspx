<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="verArticulo.aspx.cs" Inherits="proyecto1.verArticulo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <h1 class="text-center shadow bg-dark p-3 text-light rounded-circle"><%: articulo.nombre %></h1>
    <div class="d-flex justify-content-center align-items-center flex-sm-row flex-column">
        <div class="w-20">
            <img src="<%: !(string.IsNullOrEmpty(articulo.imagenUrl)) ? articulo.imagenUrl : "https://plantillasdememes.com/img/plantillas/imagen-no-disponible01601774755.jpg" %>" width= "300px" height="300px" />
        </div>
        <div>
            <p>Descripcion: <%: articulo.descripcion %></p>
            <p>Marca: <%: articulo.marca.descripcion %></p>
            <p>Categoria: <%: articulo.categoria.descripcion %></p>
            <strong class="text-success fw-bold h1">$ <%: articulo.precio %></strong>
            <div class="btn btn-primary p-2 d-flex justify-content-center align-items-center mt-2">
                <i class="fas fa-cart-plus" style="font-size:25px;"></i>
                <asp:Button class=" bg-transparent border-0 text-light" ID="Button1" runat="server" Text="Agregar a carrito" />
            </div>
        </div>
    </div>
    
</asp:Content>
