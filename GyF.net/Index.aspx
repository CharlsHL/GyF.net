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
                <div class="container"><a class="navbar-brand" href="#" style="font-size:28px;font-family:'Alfa Slab One', cursive;">GyF.Net</a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                    <div
                        class="collapse navbar-collapse" id="navcol-1">
                        <ul class="nav navbar-nav">
                            <li class="nav-item" role="presentation"><a class="nav-link active" href="#">Link</a></li>
                            <li class="dropdown"><a class="dropdown-toggle nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="#">Dropdown </a>
                                <div class="dropdown-menu" role="menu"><a class="dropdown-item" role="presentation" href="#">First Item</a><a class="dropdown-item" role="presentation" href="#">Second Item</a><a class="dropdown-item" role="presentation" href="#">Third Item</a></div>
                            </li>
                        </ul>
                        <form class="form-inline mr-auto" target="_self">
                            <div class="form-group"><label for="search-field"><i class="fa fa-search"></i></label><input class="form-control search-field" type="search" name="search" id="search-field"/></div>
                        </form><span class="navbar-text"> <a href="#" class="login">Log In</a></span><a class="btn btn-light action-button" role="button" href="#">Sign Up</a></div>
        </div>
        </nav>
    </div>
    </div>


       <form id="form2" runat="server">&nbsp;<div align="center">
                <asp:TextBox ID="cajaBusqueda" runat="server" type="number" min="0" max="1000000" CausesValidation="true" Width="452px" BorderStyle="Groove" OnTextChanged="cajaBusqueda_TextChanged" >Ingrese su presupuesto ...</asp:TextBox>
                <asp:Button ID="btbuscar" runat="server" Height="30px" Text="Buscar" Width="62px" OnClick="btbuscar_Click" />
                <br />
                <br />
                <br />
                <asp:Label ID="MsjError" runat="server" Font-Names="Century Gothic" ForeColor="#FFFFCC" Text="No se encontraron productos dentro del presupeusto ... " Visible="False"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="gridCatalogo" runat="server" AutoGenerateColumns="False" DataKeyNames="IdProducto" DataSourceID="SqlDataSource1" Width="80%" BackColor="#0066FF" Font-Italic="False" Font-Names="Century Gothic" ForeColor="#CCFFFF">
                    <Columns>
                        <asp:BoundField DataField="IdProducto" HeaderText="IdProducto" InsertVisible="False" ReadOnly="True" SortExpression="IdProducto" />
                        <asp:BoundField DataField="PrecioProd" HeaderText="PrecioProd" SortExpression="PrecioProd" />
                        <asp:BoundField DataField="FechaCarga" HeaderText="FechaCarga" SortExpression="FechaCarga" />
                        <asp:BoundField DataField="Categoría" HeaderText="Categoría" SortExpression="Categoría" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GyFConnectionString %>" SelectCommand="SELECT * FROM [Productos] ORDER BY [PrecioProd] DESC" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
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
