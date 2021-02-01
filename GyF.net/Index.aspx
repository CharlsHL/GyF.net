<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="GyF.net.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>gyf.net</title>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/fonts/font-awesome.min.css"/>
    <link rel="stylesheet" href="/fonts/ionicons.min.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Alfa+Slab+One"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700"/>
    <link rel="stylesheet" href="/css/Footer-Basic.css"/>
    <link rel="stylesheet" href="/css/Header-Blue.css"/>
    <link rel="stylesheet" href="/css/styles.css"/>
</head>
<body style="background-color:rgb(35,179,179);">
    <div>
        <div class="header-blue">
            <nav class="navbar navbar-dark navbar-expand-md navigation-clean-search">
                <div class="container"><a class="navbar-brand" href="#" style="font-size:28px;font-family:'Alfa Slab One', cursive;">GyF.Net</a><div
                        class="collapse navbar-collapse" id="navcol-1">
                        <form class="form-inline mr-auto" target="_self">
                            <div class="form-group"><label for="search-field"><i class="fa fa-search"></i></label><input class="form-control search-field" type="search" name="search" id="search-field"/></div>
                        </form></div>
             </div>
        </nav>
    </div>
</div>
       <form id="form2" runat="server">&nbsp;<div align ="center">
           <asp:Label ID="Slogan" runat="server" Text="Busque aqui su producto deseado siempre dentro de su presupuesto" BorderStyle="None" Font-Names="Century Gothic" Font-Size="XX-Large" ForeColor="White"></asp:Label>
                <br />
                 <br />
                <asp:TextBox ID="cajaBusqueda" runat="server" type="number" min="0" max="1000000" CausesValidation="true" Width="452px" BorderStyle="Groove">Ingrese su presupuesto ...</asp:TextBox>
                <asp:Button ID="btbuscar" runat="server" Height="30px" Text="Buscar" Width="62px" OnClick="btbuscar_Click" Font-Names="Century Gothic" />
                <br />
                <br />
                <br />
                <br />
                <asp:Label ID="MsjError" runat="server" Font-Names="Century Gothic" ForeColor="#FFFFCC" Text="No se encontraron productos dentro del presupeusto ... " Visible="False"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="Productos" runat="server" BackColor="#0066FF" Font-Names="Century Gothic" ForeColor="White" Height="163px"  Width="1247px" >
                    <FooterStyle ForeColor="#CCFFFF" />
                </asp:GridView>
                <br />
                <asp:Label ID="MsjError0" runat="server" Font-Names="Century Gothic" ForeColor="#FFFFCC" Text="Busqueda sin uso de Base de datos..."></asp:Label>
           <br />
                <br />
           <br />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Buscar" Width="55px" Height="24px" />
                <asp:TextBox ID="nodbCaja" runat="server" type="number" min="0" max="1000000" Width="188px"></asp:TextBox>
           <br />
           <br />
                <asp:Label ID="MsjError2" runat="server" Font-Names="Century Gothic" ForeColor="#FFFFCC" Text="El número ingresado no es valido..." Visible="False"></asp:Label>
                <br />
                <br />
        <asp:GridView ID="GridView1" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
                runat="server" AutoGenerateColumns="false" Width="1245px" ForeColor="White">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ItemStyle-Width="30" >
<ItemStyle Width="30px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Precio" HeaderText="Precio" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Categoria" HeaderText="Categoria" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="Blue" BorderColor="#0066FF" />

<HeaderStyle BackColor="#3AC0F2" ForeColor="White"></HeaderStyle>
            </asp:GridView>
                <br />
                <br />
                <div align ="center">
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
        </form>
    <div class="footer-basic">
        <footer>
            <div class="social"><a href="#"><i class="icon ion-social-instagram"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-facebook"></i></a></div>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="#">Home</a></li>
                <li class="list-inline-item"><a href="#">Services</a></li>
                <li class="list-inline-item"><a href="#">About</a></li>
                <li class="list-inline-item"><a href="#">Terms</a></li>
                <li class="list-inline-item"><a href="#">Privacy Policy</a></li>
            </ul>
            <p class="copyright">Company Name © 2021</p>
            <p class="copyright">&nbsp;</p>
        </footer>
    </div>
    <script src="/js/jquery.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
