<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="carrito.aspx.cs" Inherits="proyecto1.carrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="mt-5 ">
        <h1> <%: usuario.nombre %>, estas a un paso de completar tu compra</h1>
        <p>Nos agrada que confies en nosotros para llevar tus objetivos adelante</p>
    </div>

    <div class="">
        <h1>Tus productos agregados hasta el momento</h1>
    </div>

    <div class="d-flex justify-content-center align-items-center flex-column">
        
        <% foreach(var det in detalleVentaList) { %>
        <div class="d-flex justify-content-center align-items-center flex-row p-2 border-5 border-light my-1">
            <img src='<%: !(string.IsNullOrEmpty(det.articulo.imagen1)) ? det.articulo.imagen1 : "https://th.bing.com/th/id/R.c96cf6fd2ac9b842708019403775f729?rik=8ddoVt%2fsrIff8w&riu=http%3a%2f%2fwww.musicapopular.cult.cu%2fwp-content%2fuploads%2f2017%2f12%2fimagen-no-disponible.png&ehk=TLf62wLb2XLWLVeFUZ%2fOdUQYNT9%2be1gnLkK5binwQOA%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1"%>' height="200px" width="200px"/>
            <div class="d-flex justify-content-center align-items-start flex-column mx-2">
                <h1><%: det.articulo.nombre %></h1>
                <p><strong>Marca: </strong><%:  det.articulo.marca.nombre %></p>
                <p><strong>Cantidad: </strong><%:  det.cantidad %></p>
                <p><strong>Precio unitario: </strong>$<%: det.articulo.precio.ToString("N0") %></p>

                <div class="d-flex justify-content-center align-items-center flex-row">
                    <p><strong>Total: </strong>$<%: (Math.Truncate(det.cantidad * det.articulo.precio *100)/100).ToString("N0")   %></p>
                </div>
            </div>
        </div>
        <div class="d-none"><%: total += det.cantidad * det.articulo.precio %></div>
        <%} %>
    </div>

        <div class="">
            <h1> Precio de compra: $<%: Math.Truncate(total).ToString("N0") %></h1>
        </div>

    <hr />
        <div class="row my-3">


            <div class="text-center">
                <h1> Datos de entrega </h1>
            </div>
            <div class="col-2">

            </div>
            <div class="col-8 d-flex justify-content-center align-items-sm-start align-items-center flex-sm-row flex-column">
                <div class="d-flex justify-content-center align-items-center flex-column mx-2">
                    <div class="d-flex justify-content-center align-items-start flex-column m-2>
                        <asp:Label ID="labelLocalidad" runat="server" Text="(*)Localidad: "></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txbLocalidad" runat="server"></asp:TextBox>
                    </div>
                    <div class="d-flex justify-content-center align-items-start flex-column m-2>
                        <asp:Label ID="labelCalle" runat="server" Text="(*)Calle: "></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txbCalle" runat="server"></asp:TextBox>
                    </div>
                    <div class="d-flex justify-content-center align-items-start flex-column m-2>
                        <asp:Label ID="labelNumero" runat="server" Text="(*)Numero: "></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txbNumero" runat="server" TextMode="Number"></asp:TextBox>
                    </div>
                </div>
                <div class="d-flex justify-content-center align-items-start flex-column mx-2">
                    <div class="d-flex justify-content-center align-items-start flex-column m-2>
                        <asp:Label CssClass="text-start" ID="labelTelefono" runat="server" Text="(*)Telefono: "></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txbTelefono" runat="server" TextMode="Number"></asp:TextBox>
                    </div>
                    <div class="d-flex justify-content-center align-items-start flex-column m-2>
                        <asp:Label ID="labelComentario" runat="server" Text="Comentario extra: "></asp:Label>
                        <asp:TextBox CssClass="form-control w-100" ID="txbComentario" runat="server" TextMode="MultiLine" Height="102px" Width="1530px"></asp:TextBox>
                    </div>
                </div>

            </div>
            <div class="col-2">

            </div>
        </div>
        <div class="row">
            <div class="col-2">

            </div>
            <div class="col-8 d-flex justify-content-center align-items-center flex-sm-row flex-column my-3">
                <asp:RadioButton CssClass="m-2" ID="radioDebito" runat="server" Text="Debito" GroupName="pago" />
                <asp:RadioButton CssClass="m-2" ID="radioCredito" runat="server" Text="Credito" GroupName="pago" />
                <asp:RadioButton CssClass="m-2" ID="radioCheque" runat="server" Text="Cheque" GroupName="pago"/>
                <asp:RadioButton CssClass="m-2" ID="radioEfectivo" runat="server" Text="Efectivo" GroupName="pago"/>
            </div>
            <div class="col-2">

            </div>
        </div>

    <hr />

    <div class="d-flex justify-content-center align-items-center flex-column my-4">
        <asp:LinkButton CssClass="btn btn-success" ID="buttonPagar" runat="server" OnClick="buttonPagar_Click">Pagar</asp:LinkButton>
    </div>

</asp:Content>
