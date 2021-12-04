<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="proyecto1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <div class="d-none position-fixed top-50 start-50 translate-middle shadow" style="z-index:999" id="modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Tenes una venta guardada</h5>
                    <asp:LinkButton CssClass="btn btn-close" ID="LinkButton1" runat="server"></asp:LinkButton>
                </div>
                <div class="modal-body">
                    <h1>Guardamos tu compra anterior.</h1>
                    <p>Para que no pierdas tu compra anterior dejamos tus productos en el carrito.</p>
                </div>
                <div class="modal-footer">
                    <a href="" CssClass="btn btn-warning" >Gracias</a>
                    <asp:LinkButton CssClass="btn btn-success" ID="LinkButton2" runat="server">
                        Vaciar mi carrito
                    </asp:LinkButton>
                </div>
            </div>
        </div>
    </div>


    <div class="d-flex flex-wrap justify-content-center align-items-center mt-5" style="z-index:1;">
        <% foreach (var articulo in articuloList) { %>
            <div class="card m-2" style="width: 18rem;">
                <img src="<%: !(String.IsNullOrEmpty(articulo.imagen1)) ? articulo.imagen1 : "https://plantillasdememes.com/img/plantillas/imagen-no-disponible01601774755.jpg" %>" alt="" height="255px">
                <div class="card-body d-flex justify-content-center align-items-center flex-column">
                    <h5 class="card-title"><%: articulo.nombre %></h5>
                    <p class="card-text"><%: articulo.detalle %></p>
                    <div class="d-flex justify-content-center align-items-center flex-row">
                        <h1 class="fw-bold">$ <%: Convert.ToDecimal(articulo.precioEntero).ToString("N0") %></h1>
                        <h1 class="fw-bold pb-3" style="font-size:20px;"><%: articulo.precioDecimal %></h1>
                    </div>
                    <a href=" verArticulo.aspx?id=<%: articulo.id %>" class="btn btn-primary px-5">Ver</a>
                </div>
            </div>
        <% } %>
    </div>               
</asp:Content>
