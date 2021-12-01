<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="registrarse.aspx.cs" Inherits="proyecto1.registrarse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mt-5">
        <div class="row">
            <div class="col-2">
            </div>
            <div class="col-8 bg-gradient bg-info d-flex justify-content-center align-items-center flex-row py-4 my-3 rounded-3">
                <div class="d-flex justify-content-center align-items-center flex-column mx-1">
                    <div class="my-1 d-flex justify-content-center align-items-start flex-column">
                        <asp:Label ID="LabelNombre" runat="server" Text="Nombre: "></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txbNombre" runat="server"></asp:TextBox>
                    </div>
                    <div class="my-1 d-flex justify-content-center align-items-start flex-column">
                        <asp:Label ID="LabelApellido" runat="server" Text="Apellido: "></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txbApellido" runat="server"></asp:TextBox>
                    </div>
                    <div class="my-1 d-flex justify-content-center align-items-start flex-column">
                        <asp:Label ID="Label1" runat="server" Text="DNI: "></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txbDni" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="d-flex justify-content-center align-items-center flex-column mx-1">
                    <div class="my-1 d-flex justify-content-center align-items-start flex-column">
                        <asp:Label ID="LabelFechaNacimiento" runat="server" Text="Fecha de nacimiento: "></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txbFechaNacimiento" runat="server"></asp:TextBox>
                    </div>
                    <div class="my-1 d-flex justify-content-center align-items-start flex-column">
                        <asp:Label ID="LabelSexo" runat="server" Text="Sexo: "></asp:Label>
                        <asp:DropDownList CssClass=" form-select" ID="dropSexo" runat="server"></asp:DropDownList>
                    </div>
                    <div class="my-1 d-flex justify-content-center align-items-start flex-column">
                        <asp:Label ID="LabelCodigoPostal" runat="server" Text="Codigo postal: "></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txbCodigoPostal" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="col-2">
            </div>
        </div>


        <div class="row">
            <div class="col-2">
            </div>
            <div class="col-8 bg-gradient bg-info d-flex justify-content-center align-items-center flex-row py-4 my-3 rounded-3">
                <div class="d-flex justify-content-center align-items-center flex-column mx-1">
                    <div class="my-1 d-flex justify-content-center align-items-start flex-column">
                        <asp:Label ID="LabelEmail" runat="server" Text="Email: "></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txbEmail" runat="server"></asp:TextBox>
                    </div>
                    <div class="my-1 d-flex justify-content-center align-items-start flex-column">
                        <asp:Label ID="LabelUsuario" runat="server" Text="Usuario: "></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txbUsuario" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="d-flex justify-content-center align-items-center flex-column mx-1">
                    <div class="my-1 d-flex justify-content-center align-items-start flex-column">
                        <asp:Label ID="LabelClave" runat="server" Text="Contraseña: "></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txbClave" runat="server"></asp:TextBox>
                    </div>
                    <div class="my-1 d-flex justify-content-center align-items-start flex-column">
                        <asp:Label ID="LabelClaveRepetir" runat="server" Text="Repetir contraseña: "></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txbClaveRepetir" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="col-2">
            </div>
        </div>
        <div class="d-flex justify-content-center align-items-center">            
            <asp:LinkButton CssClass="btn bg-success text-light" ID="buttonRegistrar" runat="server">Registrarme</asp:LinkButton>
        </div>


    </div>
</asp:Content>
