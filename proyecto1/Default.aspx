<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="proyecto1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <div class="d-none position-fixed top-50 start-50 translate-middle" style="z-index: 999" id="modal">
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
                    <asp:LinkButton CssClass="btn btn-success text-decoration-none" ID="LinkButton2" runat="server">Continuar compra anterior</asp:LinkButton>
                    <asp:LinkButton CssClass="btn btn-danger" ID="buttonVaciarCarrito" runat="server" OnClick="buttonVaciarCarrito_Click">
                        Vaciar mi carrito
                    </asp:LinkButton>
                </div>
            </div>
        </div>
    </div>

    <div class="bg-warning">


        <div id="carouselExampleIndicators" class="carousel slide vw-100 p-0" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active" data-bs-interval="3000">
                    <img src="/Content/img/OTRAS/slider2.jpg" class="d-block vw-100" alt="..." height="300px">
                </div>
                <div class="carousel-item" data-bs-interval="3000">
                    <img src="/Content/img/OTRAS/slider3.jpeg" class="d-block vw-100" alt="..." height="300px">
                </div>
                <div class="carousel-item" data-bs-interval="3000">
                    <img src="/Content/img/OTRAS/slider1.jpg" class="d-block vw-100" alt="..." height="300px">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>



        <div class="d-flex flex-wrap justify-content-center align-items-center mt-5" style="z-index: 1;">
            <% foreach (var articulo in articuloList)
                { %>
            <div class="card m-2" style="width: 18rem;" height="200px">
                <img src="<%: !(String.IsNullOrEmpty(articulo.imagen1)) ? articulo.imagen1 : "https://plantillasdememes.com/img/plantillas/imagen-no-disponible01601774755.jpg" %>" alt="" height="255px">
                <div class="card-body d-flex justify-content-center align-items-center flex-column">
                    <h5 class="card-title"><%: articulo.nombre %></h5>
                    <div class="d-flex justify-content-center align-items-center flex-row">
                        <h1 class="fw-bold">$ <%: Convert.ToDecimal(articulo.precioEntero).ToString("N0") %></h1>
                        <h1 class="fw-bold pb-3" style="font-size: 20px;"><%: articulo.precioDecimal %></h1>
                    </div>
                    <a href=" verArticulo.aspx?id=<%: articulo.id %>" class="btn btn-primary px-5">Ver</a>
                </div>
            </div>
            <% } %>
        </div>

    </div>
     
</asp:Content>
