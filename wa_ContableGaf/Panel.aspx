<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Panel.aspx.cs" Inherits="wa_ContableGaf.Panel" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="es-mx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="GAF" />
    <title>GAF</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
        crossorigin="anonymous" />
    <link href="Content/fontawesome-free-5.9.0-web/css/all.min.css" rel="stylesheet" />
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
    <link href="Estilos/Panel.css" rel="stylesheet" />

    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


</head>

<body>
    <script>
        jQuery(function ($) {

            $(".sidebar-dropdown > a").click(function () {
                $(".sidebar-submenu").slideUp(200);
                if (
                    $(this)
                        .parent()
                        .hasClass("active")
                ) {
                    $(".sidebar-dropdown").removeClass("active");
                    $(this)
                        .parent()
                        .removeClass("active");
                } else {
                    $(".sidebar-dropdown").removeClass("active");
                    $(this)
                        .next(".sidebar-submenu")
                        .slideDown(200);
                    $(this)
                        .parent()
                        .addClass("active");
                }
            });

            $("#close-sidebar").click(function () {
                $(".page-wrapper").removeClass("toggled");
            });
            $("#show-sidebar").click(function () {
                $(".page-wrapper").addClass("toggled");
            });

        });

    </script>
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="page-wrapper chiller-theme toggled">
            <a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
                <i class="fas fa-bars"></i>
            </a>
            <nav id="sidebar" class="sidebar-wrapper">
                <div class="sidebar-content">
                    <div class="sidebar-brand">
                        <a href="#">GAF operadora</a>
                        <div id="close-sidebar">
                            <i class="fas fa-times"></i>
                        </div>
                    </div>
                    <div class="sidebar-header">
                        <div class="user-pic">
                            <img class="img-responsive img-circle" src="https://raw.githubusercontent.com/azouaoui-med/pro-sidebar-template/gh-pages/src/img/user.jpg" alt="User picture" />
                        </div>
                        <div class="user-info">
                            <span class="user-name">
                                <strong>
                                    <asp:Label ID="lblNombreUsuario" runat="server" Text=""></asp:Label>
                                </strong>
                            </span>
                            <span class="user-role">
                                <asp:Label ID="lblUnidadNegocio" runat="server" Text="" Font-Size="Smaller"></asp:Label></span>
                            <span class="user-role">
                                <asp:Label ID="lblOperadora" runat="server" Text="" Font-Size="Smaller"></asp:Label>
                            </span>
                            <span class="user-status">

                                <i class="fa fa-circle" runat="server" id="i_EstatusUsuario" style="color: #bf474e"></i>
                                <span>
                                    <asp:Label ID="lbl_EstatusUsuario" runat="server" Text="" Font-Size="Smaller"></asp:Label>
                                </span>
                            </span>
                        </div>
                    </div>

                    <div class="sidebar-search">
                        <div>
                            <div class="input-group">
                                <input type="text" class="form-control search-menu" placeholder="Buscar..." />
                                <div class="input-group-append">
                                    <span class="input-group-text">
                                        <i class="fa fa-search" aria-hidden="true"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="sidebar-menu">
                        <ul>
                            <li class="header-menu">
                                <span>General</span>
                            </li>
                            <li class="sidebar-dropdown">
                                <a href="#">
                                    <i class="fa fa fa-tachometer-alt"></i>
                                    <span>Resumen</span>
                                </a>
                                <div class="sidebar-submenu">
                                    <ul>
                                        <li>
                                            <a href="#">Resumen 1
                                            <i class="fa fa-circle bordeicono" runat="server" id="i1" style="color: #bf474e"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="sidebar-dropdown">

                                <a href="#">
                                    <asp:UpdatePanel ID="upPreOper" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>

                                            <i class="far fa-file-code"></i>

                                            <span>Preoperativos</span>

                                            <i class="fa fa-circle bordeicono" runat="server" id="iPreOper"></i>

                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </a>

                                <div class="sidebar-submenu">
                                    <ul>
                                        <li>
                                            <asp:UpdatePanel ID="upDerEfeAct" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <a href="#">Derechos en Efectivo <i class="fa fa-circle bordeicono" runat="server" id="iDerEfeAct"></i></a>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </li>
                                        <li>
                                            <asp:UpdatePanel ID="upDerEspAct" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <a href="#">Derechos en Especie <i class="fa fa-circle bordeicono" runat="server" id="iDerEspAct"></i></a>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </li>
                                        <li>
                                            <asp:UpdatePanel ID="upSplit" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <a href="#">Split <i class="fa fa-circle bordeicono" runat="server" id="iSplit"></i></a>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </li>
                                        <li>
                                            <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <a href="#">Split Inverso <i class="fa fa-circle bordeicono" runat="server" id="i3"></i></a>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </li>
                                        <li>
                                            <asp:UpdatePanel ID="upCarteraAnt" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <a href="#">Cartera <i class="fa fa-circle bordeicono" runat="server" id="iCarteraAnt"></i>
                                                    </a>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </li>
                                    </ul>
                                </div>
                            </li>

                            <li class="sidebar-dropdown">
                                <a href="#">
                                    <asp:UpdatePanel ID="upOper" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <i class="fas fa-file-signature"></i>
                                            <span>Operativos</span>
                                            <i class="fa fa-circle bordeicono" runat="server" id="iOper"></i>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </a>
                                <div class="sidebar-submenu">
                                    <ul>
                                        <li>
                                            <asp:UpdatePanel ID="upMovAct" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <a href="#">Movimientos <i class="fa fa-circle bordeicono" runat="server" id="iMovAct"></i></a>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </li>
                                        <li>
                                            <asp:UpdatePanel ID="upCarteraAct" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <a href="#">Cartera <i class="fa fa-circle bordeicono" runat="server" id="iCarteraAct"></i></a>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </li>
                                        <li>
                                            <asp:UpdatePanel ID="upVecAct" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <a href="#">Vector <i class="fa fa-circle bordeicono" runat="server" id="iVecAct"></i></a>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </li>

                                        <li>
                                            <asp:UpdatePanel ID="upNavAct" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:LinkButton CssClass="buttonClass" ID="lkb_NAV" runat="server" OnClick="lkb_NAV_Click">
                                                        NAV <i class="fa fa-circle bordeicono" runat="server" id="iNavAct"></i>
                                                    </asp:LinkButton>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="sidebar-dropdown">
                                <a href="#">
                                    <i class="fas fa-file-invoice-dollar"></i>
                                    <span>Posoperativos</span>
                                    <i class="fa fa-circle bordeicono" runat="server" id="i5" style="color: #bf474e"></i>
                                </a>
                                <div class="sidebar-submenu">
                                    <ul>
                                        <li>
                                            <a href="#">Balanza <i class="fa fa-circle bordeicono" runat="server" id="i7" style="color: #bf474e"></i></a>
                                        </li>
                                        <li>
                                            <a href="#">Estado de Resultados<i class="fa fa-circle bordeicono" runat="server" id="i8" style="color: #bf474e"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="sidebar-dropdown">
                                <a href="#">
                                    <i class="fa fa-cog"></i>
                                    <span>Configuración</span>
                                </a>
                                <div class="sidebar-submenu">
                                    <ul>
                                        <li>
                                            <asp:LinkButton CssClass="buttonClass" ID="lkbCatalogos" runat="server" OnClick="lkbCatalogos_Click">
                                                Catálogos <i class="far fa-check-circle bordeicono" runat="server" id="i14" style="color: forestgreen"></i>
                                            </asp:LinkButton>

                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="header-menu">
                                <span>Extra</span>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-book"></i>
                                    <span>Biblioteca</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-calendar"></i>
                                    <span>Calendario</span>
                                    <i class="fa fa-circle bordeicono" runat="server" id="i6" style="color: #bf474e"></i>
                                </a>
                            </li>
                        </ul>
                    </div>

                </div>

                <div class="sidebar-footer">
                    <a href="#">
                        <i class="fa fa-bell"></i>
                        <span class="badge badge-pill badge-danger notification">0</span>
                    </a>
                    <a href="#">
                        <i class="fa fa-envelope"></i>
                        <span class="badge badge-pill badge-danger notification">0</span>
                    </a>
                    <a href="#">
                        <i class="fa fa-cog"></i>
                    </a>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <h6 class="text-right">
                                <asp:Timer ID="Timer1" runat="server" Interval="1000"></asp:Timer>
                                <asp:Label ID="lbl_reloj" runat="server" Text="" Font-Size="X-Small" Style="color: lightgray"></asp:Label>
                            </h6>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <a href="#">
                        <asp:LinkButton ID="lkb_salir" runat="server" OnClick="lkb_salir_Click">
                                <i class="fa fa-power-off"></i>
                        </asp:LinkButton>
                    </a>
                </div>
            </nav>

            <main class="page-content">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>

                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-12 col-lg-12">
                                <div class="card " runat="server" id="divNAV" visible="false">
                                    <div class="card-header">
                                        <h3>
                                            <asp:Label ID="lblEncabezado" runat="server" Text=""></asp:Label>
                                            <asp:LinkButton CssClass="buttonClass" ID="lkbNAV" runat="server" OnClick="lkbNAV_Click">
                                                <i class="fas fa-1x fa-sync-alt bordeicono demo" runat="server" id="i13" style="color: dimgray" onmouseover="this.style.color='lightslategray'"></i>
                                            </asp:LinkButton></h3>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-6 col-md-12 col-lg-12">
                                                <div class="card rounded-0 p-0 shadow-sm">
                                                    <div class="table-responsive">
                                                        <asp:GridView
                                                            CssClass="table table-bordered table-condensed"
                                                            ID="gvFondos"
                                                            runat="server"
                                                            AutoGenerateColumns="False"
                                                            AllowPaging="True"
                                                            CellPadding="3"
                                                            ForeColor="Black"
                                                            GridLines="Vertical"
                                                            TabIndex="5"
                                                            BackColor="White"
                                                            BorderColor="#999999"
                                                            BorderStyle="Solid"
                                                            BorderWidth="1px"
                                                            OnRowCommand="gvFondos_RowCommand"
                                                            Font-Size="Smaller"
                                                            AllowSorting="True" OnSorting="gvFondos_Sorting">

                                                            <AlternatingRowStyle BackColor="#bcbdc1" />
                                                            <Columns>
                                                                <asp:BoundField DataField="ClaveFondoID" HeaderText="ID" SortExpression="ClaveFondoID" Visible="true" HeaderStyle-CssClass="hideGridColumn" ItemStyle-CssClass="hideGridColumn">
                                                                    <HeaderStyle CssClass="hideGridColumn"></HeaderStyle>

                                                                    <ItemStyle CssClass="hideGridColumn"></ItemStyle>
                                                                </asp:BoundField>

                                                                <asp:BoundField DataField="FondoDescripcion" HeaderText="Fondo" SortExpression="FondoDescripcion" Visible="true" />

                                                                <asp:BoundField DataField="Instrumentos" HeaderText="Instrumentos" SortExpression="Instrumentos" ItemStyle-HorizontalAlign="Justify">

                                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />

                                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                </asp:BoundField>
                                                                <asp:TemplateField HeaderText="">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="btnFondoFiltra" runat="server" CommandName="btnFondoFiltra">
                                <i class="fas fa-list" style="color: dimgray"></i>
                                                                        </asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="50px" />
                                                                </asp:TemplateField>

                                                                <asp:BoundField DataField="ValorNAV" HeaderText="net asset value (NAV)" SortExpression="ValorNAV" Visible="true" DataFormatString="{0:$ 0,0.000000}">
                                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                                </asp:BoundField>

                                                            </Columns>
                                                            <FooterStyle BackColor="#bcbdc1" />
                                                            <HeaderStyle BackColor="#797a7c" ForeColor="White" Font-Bold="false" />
                                                            <PagerSettings FirstPageText="Inicio" LastPageText="Final" />
                                                            <PagerStyle BackColor="#bcbdc1" ForeColor="Black" HorizontalAlign="Center" />
                                                            <SelectedRowStyle BackColor="#bcbdc1" ForeColor="White" />
                                                            <SortedAscendingCellStyle BackColor="#bcbdc1" />
                                                            <SortedAscendingHeaderStyle BackColor="#bcbdc1" />
                                                            <SortedDescendingCellStyle BackColor="#bcbdc1" />
                                                            <SortedDescendingHeaderStyle BackColor="#bcbdc1" />
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-xs-12 col-sm-6 col-md-12 col-lg-12">
                                                <div class="card rounded-0 p-0 shadow-sm">
                                                    <div class="table-responsive">
                                                        <asp:GridView CssClass="table table-bordered table-condensed" ID="gvInstrumentos" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="3" ForeColor="Black" GridLines="Vertical" TabIndex="5" PageSize="10" BackColor="White" BorderColor="#999999" BorderWidth="1px" Font-Size="Smaller">
                                                            <AlternatingRowStyle BackColor="#bcbdc1" />
                                                            <Columns>
                                                                <asp:BoundField DataField="TV" HeaderText="TV" SortExpression="TV" Visible="true" />
                                                                <asp:BoundField DataField="Emisora" HeaderText="Emisora" SortExpression="Emisora" Visible="true" />
                                                                <asp:BoundField DataField="Serie" HeaderText="Serie" SortExpression="Serie" Visible="true" />
                                                                <asp:BoundField DataField="Precios" HeaderText="Precios" SortExpression="Precios" Visible="false" DataFormatString="{0:C}">
                                                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Titulos" HeaderText="Titulos" SortExpression="Titulos" Visible="true" DataFormatString="{0:n0}">
                                                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Costo" HeaderText="Costo PP" SortExpression="Costo" Visible="true" DataFormatString="{0:$ 0,0.000000}">
                                                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="PlusMin" HeaderText="PlusMinusvalia" SortExpression="PlusMin" Visible="true" DataFormatString="{0:C}">
                                                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="PrecioLimpio" HeaderText="Precio Limpio" SortExpression="PrecioLimpio" Visible="true" DataFormatString="{0:$ 0,0.000000}">
                                                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Intereses" HeaderText="Intereses" SortExpression="Intereses" Visible="true" DataFormatString="{0:$ 0,0.000000}">
                                                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="PrecioSucio" HeaderText="Precio Sucio" SortExpression="PrecioSucio" Visible="true" DataFormatString="{0:$ 0,0.000000}">
                                                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="NAV" HeaderText="NAV" SortExpression="NAV" Visible="true" DataFormatString="{0:$ 0,0.000000}">
                                                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                                </asp:BoundField>
                                                            </Columns>
                                                            <FooterStyle BackColor="#bcbdc1" />
                                                            <HeaderStyle BackColor="#797a7c" ForeColor="White" Font-Bold="false" />
                                                            <PagerSettings FirstPageText="Inicio" LastPageText="Final" />
                                                            <PagerStyle BackColor="#bcbdc1" ForeColor="Black" HorizontalAlign="Center" />
                                                            <SelectedRowStyle BackColor="#bcbdc1" ForeColor="White" />
                                                            <SortedAscendingCellStyle BackColor="#bcbdc1" />
                                                            <SortedAscendingHeaderStyle BackColor="#bcbdc1" />
                                                            <SortedDescendingCellStyle BackColor="#bcbdc1" />
                                                            <SortedDescendingHeaderStyle BackColor="#bcbdc1" />
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-12 col-lg-12">
                                <div class="card text-center" runat="server" id="divCatOperativos" visible="false">
                                    <div class="card-header">
                                        <ul class="nav nav-tabs card-header-tabs">

                                            <li class="nav-item">
                                                <a class="nav-link" href="#">Unidades de Negocio</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">Operadoras</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">Fondos</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">Instrumentos</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title">Special title treatment</h5>
                                        <p class="card-text">It's a broader card with text below as a natural lead-in to extra content. This content is a little longer.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </main>
        </div>

    </form>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>
