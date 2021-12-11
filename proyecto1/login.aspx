<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="proyecto1.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>

    
            <div class="bajoMenu pt-4 fondo4">
                <div class="row">
                    <div class="col-sm-2 col-0">
                    </div>
                    <div class="col-sm-8 col-12">
                        <div class="text-center titulo2">
                            <h1>Bienvenido! </h1>
                            <h3>Si no estas registrado podes hacerlo facil y rapido</h3>
                        </div>
                        <div class="d-flex justify-content-center align-items-center flex-column my-3 py-3 border-5 rounded-circle fondo1 shadow">
                            
                            <div id="usuario">
                                <asp:Label ID="labelUsuario" runat="server" Text="Usuario:"></asp:Label>
                                <asp:TextBox CssClass="form-control my-2" ID="txbUsuario" runat="server" ClientIDMode="Static"></asp:TextBox>
                                <div></div>
                            </div>
                            <div id="clave">    
                                <asp:Label ID="labelClave" runat="server" Text="Contraseña: "></asp:Label>
                                <asp:TextBox CssClass="form-control my-2" ID="txbClave" runat="server" ClientIDMode="Static" TextMode="Password"></asp:TextBox>
                                <div></div>    
                            </div>
                            <asp:Label ID="labelError" runat="server" Text="" ForeColor="#CC0000"></asp:Label>
                            <asp:LinkButton CssClass="btn bg-success text-light my-2" ID="buttonIngresar" runat="server" OnClientClick="return validar_login()" OnClick="buttonIngresar_Click">Ingresar</asp:LinkButton>
                        </div>
                        <div class="d-flex justify-content-center align-items-center">            
                            <p>Podes registrarte presionando.. <a href="/registrarse.aspx" class="text-primary"> acá </a></p>
                        </div>
                    </div>
                    <div class="col-sm-2 col-0">
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script src="Content/js/validarLogin.js"></script>
</asp:Content>
