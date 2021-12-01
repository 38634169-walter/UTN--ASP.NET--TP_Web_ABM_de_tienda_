<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="proyecto1.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mt-5">
        <div class="row">
            <div class="col-2">
            </div>
            <div class="col-8">
                <h1>Bienvenido! Si no estas registrado podes hacerlo facil y rapido</h1>
                <div class="d-flex justify-content-center align-items-center flex-column my-3">
                    <asp:TextBox CssClass="form-control my-2" ID="txbUsuario" runat="server"></asp:TextBox>
                    <asp:TextBox CssClass="form-control my-2" ID="txbClave" runat="server"></asp:TextBox>
                    <asp:LinkButton CssClass="btn bg-success text-light" ID="LinkButton1" runat="server">Ingresar</asp:LinkButton>
                </div>
                <div class="d-flex justify-content-center align-items-center">            
                    <p>Podes registrarte presionando.. <a href="/registrarse.aspx" class="text-primary"> acá </a></p>
                </div>
            </div>
            <div class="col-2">
            </div>
        </div>

    </div>
</asp:Content>
