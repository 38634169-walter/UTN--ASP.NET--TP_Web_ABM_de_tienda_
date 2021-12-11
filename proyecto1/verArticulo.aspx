<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="verArticulo.aspx.cs" Inherits="proyecto1.verArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
                
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

            <div class="bajoMenu fondo4">
                <div class="mx-2 titulo2 text-light">
                    <h1 class="text-center shadow p-3 rounded-circle bajoMenu shadow" ><%: articulo.nombre %></h1>
                </div>
                
                
                <div class="row">
                    <div class="col-lg-2 col-1">

                    </div>                
                    <div class="col-lg-8 col-10 border-5 rounded-3 fondo1 shadow p-3 pe-5 d-flex justify-content-center align-items-center flex-md-row flex-column mb-3">
                        <div class="w-20">
                            <img src="<%: !(string.IsNullOrEmpty(articulo.imagen1)) ? articulo.imagen1 : "https://plantillasdememes.com/img/plantillas/imagen-no-disponible01601774755.jpg" %>" class="imagenVer" />
                        </div>
                        <div class="ps-md-3 ps-0 pt-md-0 pt-3 ">
                            <div class="mb-4">
                                <p class="my-0 p-0"><strong>Marca: </strong><%: articulo.marca.nombre %></p>
                                <p class="my-0 p-0"><strong>Categoria: </strong><%: articulo.subCategoria.categoria.nombre %></p>
                                <p class="my-0 p-0"><strong>Sub Categoria: </strong><%: articulo.subCategoria.nombre%></p>
                            </div>
                            <div class="d-flex justify-content-end align-items-start flex-column">
                                <div class="d-flex justify-content-start align-items-center flex-row">
                                    <strong class="fw-bold h1">$ <%: Convert.ToDecimal(articulo.precioEntero).ToString("N0") %> </strong>
                                    <strong class="pb-3" style="font-size: 15px;"><%: articulo.precioDecimal %></strong>
                                </div>

                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>
                                        <div>
                                            <asp:LinkButton CssClass="btn bg-success fw-bold text-light px-2" ID="buttonMenos" runat="server" OnClick="buttonMenos_Click">
                                                <i class="fas fa-minus"></i>
                                            </asp:LinkButton>
                                            <asp:Label CssClass="mx-3" ID="LabelCantidad" runat="server" Text="1"></asp:Label>
                                            <asp:LinkButton CssClass="btn bg-success fw-bold text-light px-2" ID="buttonMas" runat="server" OnClick="buttonMas_Click">
                                                <i class="fas fa-plus"></i>
                                            </asp:LinkButton>

                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>


                                <asp:LinkButton CssClass="btn bg-success fw-bold text-light p-2 d-flex justify-content-center align-items-center mt-2" ID="ButtonAgregar" runat="server" OnClick="ButtonAgregar_Click">
                                            <i class="fas fa-cart-plus p-2" style="font-size:25px;"></i>
                                            Agregar a carrito
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-1">

                    </div>                
                </div>                
                <hr />
                    <div class="ms-5">
                        <h1> Detalles especiales: </h1>
                        <p> <%: articulo.detalle %></p>
                    </div>
                <hr />
            </div>


</asp:Content>
