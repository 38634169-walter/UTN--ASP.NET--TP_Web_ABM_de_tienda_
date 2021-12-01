<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="registrarse.aspx.cs" Inherits="proyecto1.registrarse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
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
                                <asp:LinkButton CssClass="btn btn-success" ID="buttonCerrarModal" runat="server" OnClick="buttonCerrarModal_Click">
                                    Registrarme
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>




            <div class="mt-5">
                <div class="row">
                    <div class="col-2">
                    </div>
                    <div class="col-8 bg-gradient bg-info d-flex justify-content-center align-items-center flex-row py-4 my-3 rounded-3">
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
                                <asp:DropDownList CssClass=" form-select" ID="dropSexo" runat="server" ClientIDMode="Static"></asp:DropDownList>
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

                    <div class="col-8 bg-gradient bg-info d-flex justify-content-center align-items-center flex-column py-4 my-3 rounded-3">
                        <div class="d-flex justify-content-center align-items-center flex-row">

                            <div class="d-flex justify-content-center align-items-center flex-column mx-1">
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
        </ContentTemplate>
    </asp:UpdatePanel>






    <script>
        function validar_registro() {
            var validar = true;
            if ($('#txbNombre').val() == "") {
                $('#txbNombre').removeClass('is-valid');
                $('#txbNombre').addClass('is-invalid');
                $('#nombre div').addClass('invalid-feedback');
                $('#nombre div').html('*Campo requerido');
                validar = false;
            }
            else {
                $('#txbNombre').removeClass('is-invalid');
                $('#txbNombre').addClass('is-valid');
            }

            if ($('#txbApellido').val() == "") {
                $('#txbApellido').removeClass('is-valid');
                $('#txbApellido').addClass('is-invalid');
                $('#apellido div').addClass('invalid-feedback');
                $('#apellido div').html('*Campo requerido');
                validar = false;
            }
            else {
                $('#txbApellido').removeClass('is-invalid');
                $('#txbApellido').addClass('is-valid');
            }



            if ($('#txbDni').val().trim() === "") {
                $('#txbDni').removeClass('is-valid');
                $('#txbDni').addClass('is-invalid');
                $('#dni div').addClass('invalid-feedback');
                $('#dni div').html('*Campo requerido');
                validar = false;
            }
            else {
                $('#txbDni').removeClass('is-invalid');
                $('#txbDni').addClass('is-valid');
            }


            if ($('#txbFechaNacimiento').val() == "") {
                $('#txbFechaNacimiento').removeClass('is-valid');
                $('#txbFechaNacimiento').addClass('is-invalid');
                $('#fechaNacimiento div').addClass('invalid-feedback');
                $('#fechaNacimiento div').html('*Campo requerido');
                validar = false;
            }
            else {
                $('txbFechaNacimiento').removeClass('is-invalid');
                $('txbFechaNacimiento').addClass('is-valid');
            }


            if ($('#dropSexo').val().trim() === "") {
                $('#dropSexo').removeClass('is-valid');
                $('#dropSexo').addClass('is-invalid');
                $('#sexo div').addClass('invalid-feedback');
                $('#sexo div').html('*Campo requerido');
                validar = false;
            }
            else {
                $('#dropSexo').removeClass('is-invalid');
                $('#dropSexo').addClass('is-valid');
            }


            if ($('#txbCodigoPostal').val().trim() === "") {
                $('#txbCodigoPostal').removeClass('is-valid');
                $('#txbCodigoPostal').addClass('is-invalid');
                $('#codigoPostal div').addClass('invalid-feedback');
                $('#codigoPostal div').html('*Campo requerido');
                validar = false;
            }
            else {
                $('#txbCodigoPostal').removeClass('is-invalid');
                $('#txbCodigoPostal').addClass('is-valid');
            }


            if ($('#txbEmail').val().trim() === "") {
                $('#txbEmail').removeClass('is-valid');
                $('#txbEmail').addClass('is-invalid');
                $('#emailError').addClass('invalid-feedback');
                $('#emailError').html('*Campo requerido');
                validar = false;
            }
            else {
                $('#txbEmail').removeClass('is-invalid');
                $('#txbEmail').addClass('is-valid');
            }

            if ($('#txbUsuario').val().trim() === "") {
                $('#txbUsuario').removeClass('is-valid');
                $('#txbUsuario').addClass('is-invalid');
                $('#usuarioError').addClass('invalid-feedback');
                $('#usuarioError').html('*Campo requerido');
                validar = false;
            }
            else {
                $('#txbUsuario').removeClass('is-invalid');
                $('#txbUsuario').addClass('is-valid');
            }





            var cla = $('#txbClave').val();
            var claRep = $('#txbClaveRepetir').val();

            if (cla != claRep) {
                $('#erroresClave p1').html('*Las contraseñas no coinciden');
            }
            else {
                $('#erroresClave p1').html('');
            }
            var validarClave = true;
            for (var i = 0; i < cla.length; i++) {
                if (cla[i] == "=" || cla[i] == "?") {
                    validarClave = false;
                }
            }
            for (var i = 0; i < claRep.length; i++) {
                if (claRep[i] == "=" || claRep[i] == "?") {
                    validarClave = false;
                }
            }

            if (validarClave == false) $('#erroresClave p2').html('*Caracteres no permitidos   \' = ? \' ');
            if (validarClave == true) $('#erroresClave p2').html('');

            if ($('#txbClave').val() === "") $('#clave div').html('*Campo requerido');
            if ($('#txbClave').val() !== "") $('#clave div').html('');

            if ($('#txbClaveRepetir').val() === "") $('#claveRepetir div').html('*Campo requerido');
            if ($('#txbClaveRepetir').val() !== "") $('#claveRepetir div').html('');








            if ($('#txbClave').val() === "" || validarClave == false || cla != claRep) {
                $('#txbClave').removeClass('is-valid');
                $('#txbClave').addClass('is-invalid');
                $('#clave div').addClass('invalid-feedback');
                validar = false;
            }
            else {
                $('#txbClave').removeClass('is-invalid');
                $('#txbClave').addClass('is-valid');
            }


            if ($('#txbClaveRepetir').val() === "" || validarClave == false || cla != claRep) {
                $('#txbClaveRepetir').removeClass('is-valid');
                $('#txbClaveRepetir').addClass('is-invalid');
                $('#claveRepetir div').addClass('invalid-feedback');
                validar = false;
            }
            else {
                $('#txbClaveRepetir').removeClass('is-invalid');
                $('#txbClaveRepetir').addClass('is-valid');
            }

            return validar;
        }

    </script>
</asp:Content>
