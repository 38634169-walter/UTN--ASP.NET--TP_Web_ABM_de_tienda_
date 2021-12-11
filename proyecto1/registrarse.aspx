<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="registrarse.aspx.cs" Inherits="proyecto1.registrarse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>

            <div class="d-none position-fixed top-50 start-50 translate-middle" id="modal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">No estas registrado</h5>
                            <asp:LinkButton CssClass="btn btn-close" ID="LinkButton1" runat="server" OnClick="buttonCerrarModal_Click"></asp:LinkButton>
                        </div>
                        <div class="modal-body">
                            <h1>Guardamos tu compra.</h1>
                            <p>Cuidamos tu compra por eso te pedimos tu registro.</p>
                            <p>Te registramos facil y rapido.</p>
                        </div>
                        <div class="modal-footer">
                            <a href="login.aspx" CssClass="btn btn-warning" >Ya tengo cuenta</a>
                            <asp:LinkButton CssClass="btn btn-success" ID="LinkButton2" runat="server" OnClick="buttonCerrarModal_Click">
                                Registrarme
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>

            <div class=" bajoMenu pb-4 pt-3 fondo4" >
                <div class="py-5 text-center titulo2 rounded-circle fondo1 shadow">
                    <h1>Gracias por confiar!</h1>
                    <h3>Ahora podes registrarte facil y rapido</h3>
                </div>
                <div class="row">
                    <div class="col-2">
                    </div>
                    <div class="col-8 bg-gradient d-flex justify-content-center align-items-center flex-sm-row flex-column py-4 my-3 rounded-3 shadow fondo1">
                        <div class="d-flex justify-content-center align-items-center flex-column mx-1">
                            <div id="nombre" class="my-1 d-flex justify-content-center align-items-start flex-column">
                                <asp:Label ID="LabelNombre" runat="server" Text="Nombre: "></asp:Label>
                                <asp:TextBox CssClass="form-control" ID="txbNombre" runat="server"></asp:TextBox>
                                <div></div>
                            </div>
                            <div id="apellido" class="my-1 d-flex justify-content-center align-items-start flex-column">
                                <asp:Label ID="LabelApellido" runat="server" Text="Apellido: "></asp:Label>
                                <asp:TextBox CssClass="form-control" ID="txbApellido" runat="server"></asp:TextBox>
                                <div></div>
                            </div>
                            <div id="dni" class="my-1 d-flex justify-content-center align-items-start flex-column">
                                <asp:Label ID="Label1" runat="server" Text="DNI: "></asp:Label>
                                <asp:TextBox CssClass="form-control" ID="txbDni" runat="server" ClientIDMode="Static" TextMode="Number"></asp:TextBox>
                                <div></div>
                            </div>
                        </div>

                        <div class="d-flex justify-content-center align-items-center flex-column mx-1">
                            <div id="fechaNacimiento" class="my-1 d-flex justify-content-center align-items-start flex-column">
                                <asp:Label ID="LabelFechaNacimiento" runat="server" Text="Fecha de nacimiento: "></asp:Label>
                                <asp:TextBox CssClass="form-control" ID="txbFechaNacimiento" runat="server" ClientIDMode="Static" TextMode="Date"></asp:TextBox>
                                <div></div>
                            </div>
                            <div id="sexo" class="my-1 d-flex justify-content-center align-items-start flex-column">
                                <asp:Label ID="LabelSexo" runat="server" Text="Sexo: "></asp:Label>
                                <asp:DropDownList CssClass="form-select" ID="dropSexo" runat="server" ClientIDMode="Static"></asp:DropDownList>
                                <div></div>
                            </div>
                            <div id="codigoPostal" class="my-1 d-flex justify-content-center align-items-start flex-column">
                                <asp:Label ID="LabelCodigoPostal" runat="server" Text="Codigo postal: "></asp:Label>
                                <asp:TextBox CssClass="form-control" ID="txbCodigoPostal" runat="server" ClientIDMode="Static"></asp:TextBox>
                                <div></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-2">
                    </div>
                </div>



                <div class="row">
                    <div class="col-2">
                    </div>

                    <div class="col-8 bg-gradient d-flex justify-content-center align-items-center flex-column py-4 my-3 rounded-3 shadow fondo1">
                        <div class="d-flex justify-content-center align-items-center flex-sm-row flex-column">

                            <div class="d-flex justify-content-center align-items-center flex-column mx-1 ">
                                <div id="email" class="my-1 d-flex justify-content-center align-items-start flex-column">
                                    <asp:Label ID="LabelEmail" runat="server" Text="Email: "></asp:Label>
                                    <asp:TextBox CssClass="form-control" ID="txbEmail" runat="server" ClientIDMode="Static"></asp:TextBox>
                                    <asp:Label ID="emailError" runat="server" Text="" ClientIDMode="Static" ForeColor="#CC0000"></asp:Label>
                                </div>
                                <div id="usuario" class="my-1 d-flex justify-content-center align-items-start flex-column">
                                    <asp:Label ID="LabelUsuario" runat="server" Text="Usuario: "></asp:Label>
                                    <asp:TextBox CssClass="form-control" ID="txbUsuario" runat="server" ClientIDMode="Static"></asp:TextBox>
                                    <asp:Label ID="usuarioError" runat="server" Text="" ClientIDMode="Static" ForeColor="#CC0000"></asp:Label>
                                </div>
                            </div>

                            <div class="d-flex justify-content-center align-items-center flex-column mx-1">
                                <div class="d-flex justify-content-center align-items-center flex-column">
                                    <div id="clave" class="my-1 d-flex justify-content-center align-items-start flex-column">
                                        <asp:Label ID="LabelClave" runat="server" Text="Contraseña: "></asp:Label>
                                        <asp:TextBox CssClass="form-control" ID="txbClave" runat="server" ClientIDMode="Static"></asp:TextBox>
                                        <div></div>
                                    </div>

                                    <div id="claveRepetir" class="my-1 d-flex justify-content-center align-items-start flex-column">
                                        <asp:Label ID="LabelClaveRepetir" runat="server" Text="Repetir contraseña: "></asp:Label>
                                        <asp:TextBox CssClass="form-control" ID="txbClaveRepetir" runat="server" ClientIDMode="Static"></asp:TextBox>
                                        <div></div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div id="erroresClave" class="text-center w-100 d-flex justify-content-center align-items-center flex-column mt-2">
                            <p1 class="text-danger"></p1>
                            <p2 class="text-danger"></p2>
                        </div>
                    </div>

                    <div class="col-2">
                    </div>

                </div>

                <div class="d-flex justify-content-center align-items-center my-3">
                    <asp:LinkButton CssClass="btn bg-success text-light" ID="buttonRegistrar" runat="server" OnClientClick="return validar_registro()" OnClick="buttonRegistrar_Click" CausesValidation="False" ValidateRequestMode="Disabled">Registrarme</asp:LinkButton>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script src="Content/js/validarRegistro.js"></script>
</asp:Content>
