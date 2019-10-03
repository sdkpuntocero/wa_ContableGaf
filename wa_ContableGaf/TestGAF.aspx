<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestGAF.aspx.cs" Inherits="wa_ContableGaf.TestGAF" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="es-mx">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/fontawesome-free-5.9.0-web/css/all.min.css" rel="stylesheet" />
    <link href="Estilos/MenuVertical.css" rel="stylesheet" />

    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <title>Dashboard Estatus GAF</title>
</head>
<body>

    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick">
        </asp:Timer>
        <div class="container-fluid">

            <div class="wrapper">
                <!-- Sidebar Holder -->
                <nav id="sidebar">
                    <div class="sidebar-header">
                        <h3>GAF Operadora</h3>
                    </div>

                    <ul class="list-unstyled components">

                        <p>

                            <asp:LinkButton CssClass="buttonClass" ID="LinkButton2" runat="server" Font-Size="Smaller">
                                <asp:Label ID="Label2" runat="server" Text="" Font-Size="Smaller"></asp:Label>&nbsp;<i class="fa fa-male" id="i2" runat="server"></i>
                            </asp:LinkButton>
                            <br />
                            <asp:LinkButton CssClass="buttonClass" ID="LinkButton3" runat="server" Font-Size="Smaller">
                                <asp:Label ID="Label3" runat="server" Text=""></asp:Label>&nbsp;<i class="fa fa-male" id="i3" runat="server"></i>
                            </asp:LinkButton>
                            <br />
                            <asp:LinkButton CssClass="buttonClass" ID="LinkButton1" runat="server" Font-Size="Smaller">
                                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>&nbsp;<i class="fa fa-male" id="i1" runat="server"></i>
                            </asp:LinkButton>
                            <br />
                        </p>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <li class="text-center">
                                    <asp:Label ID="lbl_reloj" runat="server" Text=""></asp:Label>
                                </li>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <li runat="server" id="li_PreOperativos">
                            <asp:LinkButton CssClass="buttonClass" ID="lkb_PreOperativos" runat="server" OnClick="lkb_PreOperativos_Click">
                                <asp:Label ID="Label8" runat="server" Text="Pre Operativos"></asp:Label>
                            </asp:LinkButton>
                        </li>
                        <li runat="server" id="li_Operativos">
                            <asp:LinkButton CssClass="buttonClass" ID="lkb_Operativos" runat="server" OnClick="lkb_Operativos_Click">
                                <asp:Label ID="Label9" runat="server" Text="Operativos"></asp:Label>
                            </asp:LinkButton>
                        </li>
                        <li runat="server" id="li_PosOperativos">
                            <asp:LinkButton CssClass="buttonClass" ID="lkb_PosOperativos" runat="server" OnClick="lkb_PosOperativos_Click">
                                <asp:Label ID="Label10" runat="server" Text="Pos Operativos"></asp:Label>
                            </asp:LinkButton>
                        </li>
                    </ul>

                    <ul class="list-unstyled CTAs">
                        <li>
                            <asp:LinkButton CssClass="btn btn-secondary btn-block btn-lg" ID="LinkButton4" runat="server">
                                <asp:Label ID="Label4" runat="server" Text="Biblioteca de Conocimiento"></asp:Label>
                            </asp:LinkButton>
                        </li>
                        <br />
                        <li>
                            <asp:LinkButton CssClass="btn btn-primary btn-block btn-lg" ID="lkb_salir" runat="server" OnClick="lkb_salir_Click">
                                <asp:Label ID="Label7" runat="server" Text="Salir"></asp:Label>
                            </asp:LinkButton>
                        </li>
                    </ul>
                </nav>

                <!-- Page Content Holder -->

                <div id="content">
                    <asp:UpdatePanel ID="up_nav" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                                <div class="container-fluid">

                                    <%--  <button type="button" id="sidebarCollapse" class="navbar-btn">
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                    </button>
                                    <br />--%>

                                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                        <i class="fas fa-align-justify"></i>
                                    </button>

                                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                        <ul class="nav navbar-nav ml-auto">
                                            <li class="nav-item text-center"></li>
                                            <li class="nav-item text-center">
                                                <a class="nav-link" href="#">Estatus Pre Operativos</a>
                                                <i class="fas fa-file-upload fa-2x" id="i4" runat="server" visible="true"></i>
                                            </li>
                                            <li class="nav-item text-center">
                                                <a class="nav-link" href="#">Estatus Operativos</a>
                                                <i class="fas fa-2x fa-cogs" id="i5" runat="server" visible="true"></i>
                                            </li>
                                            <li class="nav-item text-center">
                                                <a class="nav-link" href="#">Estatus Pos Operativos</a>
                                                <i class="fas fa-2x fa-chart-bar" id="i6" runat="server" visible="true"></i>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </nav>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                        </Triggers>
                    </asp:UpdatePanel>

                    <asp:UpdatePanel ID="upPreOperativos" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>

                            <div class="row" runat="server" id="div_preoperativos" visible="false">
                                <div class="col-xl-2">

                                    <asp:LinkButton CssClass="buttonClass" ID="lkb_CarteraT1" runat="server">

                                        <i class="fas fa-file-upload" id="i8" runat="server" visible="true"></i>&nbsp;-&nbsp;<asp:Label ID="Label12" runat="server" Text="Cartera Inicial"></asp:Label>
                                    </asp:LinkButton>

                                </div>

                            </div>
                            <div class="row" runat="server" id="div_operativos" visible="false">
                                <div class="col-xl-5">

                                    <div class="row">
                                        <table class="table table-bordered table-condensed">
                                            <thead>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton CssClass="buttonClass" ID="lkb_VectoresArchivos" runat="server">
                                                            <i class="fas fa-file-upload" id="i_VectoresArchivos" runat="server" visible="true"></i>&nbsp;-&nbsp;<asp:Label ID="lbl_VectoresArchivos" runat="server" Text="Vector MD"></asp:Label>
                                                        </asp:LinkButton>
                                                    </td>
                                                      <td>
                                                        <asp:LinkButton CssClass="buttonClass" ID="LinkButton6" runat="server">
                                                            <i class="fas fa-file-upload" id="i9" runat="server" visible="true"></i>&nbsp;-&nbsp;<asp:Label ID="Label5" runat="server" Text="Cartera MD"></asp:Label>
                                                        </asp:LinkButton>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton CssClass="buttonClass" ID="LinkButton5" runat="server">
                                                            <i class="fas fa-file-upload" id="i7" runat="server" visible="true"></i>&nbsp;-&nbsp;<asp:Label ID="Label6" runat="server" Text="Movimientos MD"></asp:Label>
                                                        </asp:LinkButton>
                                                    </td>
                                                      <td>
                                                        <asp:LinkButton CssClass="buttonClass" ID="LinkButton7" runat="server">
                                                            <i class="fas fa-file-upload" id="i10" runat="server" visible="true"></i>&nbsp;-&nbsp;<asp:Label ID="Label11" runat="server" Text="NAV MD"></asp:Label>
                                                        </asp:LinkButton>
                                                    </td>
                                                </tr>
                                               
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>
                            <div class="row" runat="server" id="div_postoperativos" visible="false">
                            </div>
                        </ContentTemplate>

                    </asp:UpdatePanel>

                    <div class="line">
                    </div>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="true">
                        <ProgressTemplate>
                            <div id="overlay">
                                <div class="center">
                                    <img alt="" src="Img/ajax-loader.gif" />
                                </div>
                            </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                    <asp:UpdatePanel ID="up_usr" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="card" runat="server" id="card_usr" visible="false">
                                <div class="card-header">
                                    <h2>
                                        <asp:Label ID="lbl_EstatusInsumos" runat="server" Text=""></asp:Label></h2>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
