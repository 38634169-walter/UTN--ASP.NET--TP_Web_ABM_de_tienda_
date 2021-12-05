<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="verArticulo.aspx.cs" Inherits="proyecto1.verArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


   <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>

            <h1 class="text-center shadow bg-dark p-3 text-light rounded-circle"><%: articulo.nombre %></h1>
            
            <div class="d-none position-fixed top-50 start-50 translate-middle my-5" id="modal">
                    <div class="modal-dialog">
                        <div class="modal-content bg-secondary">
                            <div class="modal-header">
                                <h5 class="modal-title">El producto ya se encuentra agregado</h5>
                                
                                <asp:LinkButton type="button" CssClass="btn-close" ID="LinkButton1" runat="server" OnClick="buttonCerrar_Click"></asp:LinkButton>
                            </div>
                            <div class="modal-body">
                                <div class="d-flex justify-content-center align-items-center flex-row">
                                    <i class="fas fa-exclamation-circle text-warning h2 pe-2"></i>
                                    <h2 class="">Ya se encuentra agregado.</h2>
                                </div>
                                <p class="text-light">Desea sumar la cantidad a lo que ya agrego?.</p>
                            </div>
                            <div class="modal-footer">
                                <asp:LinkButton CssClass="btn btn-secondary" ID="buttonCerrar" runat="server" OnClick="buttonCerrar_Click">Cancelar</asp:LinkButton>
                                <asp:LinkButton CssClass="btn btn-primary" ID="buttonConfrmarAgregar" runat="server" OnClick="buttonConfrmarAgregar_Click">Sumar cantidad</asp:LinkButton>
                            </div>
                        </div>
                </div>
            </div>
            <div class="d-flex justify-content-center align-items-center flex-sm-row flex-column my-5">
                <div class="w-20 me-3">
                    <img src="<%: !(string.IsNullOrEmpty(articulo.imagen1)) ? articulo.imagen1 : "https://plantillasdememes.com/img/plantillas/imagen-no-disponible01601774755.jpg" %>" width="300px" height="300px" />
                </div>
                <div>
                    <p><strong>Marca: </strong><%: articulo.marca.nombre %></p>


                    <p><strong>Sub Categoria: </strong><%: articulo.subCategoria.nombre%></p>
                    <p><strong>Categoria: </strong><%: articulo.subCategoria.categoria.nombre %></p>
                    <div class="d-flex justify-content-start align-items-center flex-row">
                        <strong class="fw-bold h1">$ <%: Convert.ToDecimal(articulo.precioEntero).ToString("N0") %> </strong>
                        <strong class="pb-3" style="font-size: 15px;"><%: articulo.precioDecimal %></strong>
                    </div>

                    <div>
                        <asp:LinkButton CssClass="btn bg-primary text-light px-2" ID="buttonMenos" runat="server" OnClick="buttonMenos_Click">
                                    <i class="fas fa-minus"></i>
                        </asp:LinkButton>
                        <asp:Label CssClass="mx-3" ID="LabelCantidad" runat="server" Text="1"></asp:Label>
                        <asp:LinkButton CssClass="btn bg-primary text-light px-2" ID="buttonMas" runat="server" OnClick="buttonMas_Click">
                                    <i class="fas fa-plus"></i>
                        </asp:LinkButton>
                    </div>


                    <asp:LinkButton CssClass="btn btn-primary p-2 d-flex justify-content-center align-items-center mt-2" ID="ButtonAgregar" runat="server" OnClick="ButtonAgregar_Click">
                                <i class="fas fa-cart-plus p-2" style="font-size:25px;"></i>
                                Agregar a carrito
                    </asp:LinkButton>
                </div>
            </div>
            <hr />
                <div class="ms-5">
                    <h1> Detalles especiales: </h1>
                    <p> <%: articulo.detalle %></p>
                </div>
            <hr />

        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
