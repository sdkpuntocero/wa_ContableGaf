<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PanelDeControl.aspx.cs" Inherits="wa_ContableGaf.PanelDeControl" %>

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

                                    <asp:LinkButton CssClass="buttonClass" ID="lkb_DerechosDecretados" runat="server">
                                        <asp:Label ID="Label5" runat="server" Text="Derechos Decretados"></asp:Label>
                                    </asp:LinkButton>
                                    <br />
                                    <asp:LinkButton CssClass="buttonClass" ID="lkb_DerechosDecretadosArchivos" runat="server" OnClick="lkb_DerechosDecretadosArchivos_Click">
                                        <i class="fas fa-file-upload" id="i7" runat="server" visible="true">&nbsp;-&nbsp;</i><asp:Label ID="lbl_DerechosDecretadosArchivos" runat="server" Text=""></asp:Label>
                                    </asp:LinkButton>
                                </div>

                            </div>
                            <div class="row" runat="server" id="div_operativos" visible="false">
                                <div class="col-xl-5">
                                    <asp:LinkButton CssClass="buttonClass" ID="lkb_transferencias" runat="server">
                                        <asp:Label ID="Label11" runat="server" Text="Transferencias"></asp:Label>
                                    </asp:LinkButton>
                                    <br />
                                    <div class="row">
                                        <table class="table table-bordered table-condensed">
                                            <thead>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton CssClass="buttonClass" ID="lkb_AP" runat="server" OnClick="lkb_AP_Click">
                                                            <i class="fas fa-file-upload" id="i_AP" runat="server" visible="true"></i>&nbsp;-&nbsp;<asp:Label ID="lbl_AP" runat="server" Text=""></asp:Label>
                                                        </asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton CssClass="buttonClass" ID="lkb_PV" runat="server" OnClick="lkb_PV_Click">
                                                            <i class="fas fa-file-upload" id="i_PV" runat="server" visible="true">&nbsp;-&nbsp;</i><asp:Label ID="lbl_PV" runat="server" Text=""></asp:Label>
                                                        </asp:LinkButton>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton CssClass="buttonClass" ID="lkb_MD" runat="server" OnClick="lkb_MD_Click">
                                                            <i class="fas fa-file-upload" id="i_MD" runat="server" visible="true">&nbsp;-&nbsp;</i><asp:Label ID="lbl_MD" runat="server" Text=""></asp:Label>
                                                        </asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton CssClass="buttonClass" ID="lkb_MV" runat="server" OnClick="lkb_MV_Click">
                                                            <i class="fas fa-file-upload" id="i_MV" runat="server" visible="true">&nbsp;-&nbsp;</i><asp:Label ID="lbl_MV" runat="server" Text=""></asp:Label>
                                                        </asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-xl-5">
                                    <asp:LinkButton CssClass="buttonClass" ID="lkb_Vectores" runat="server">
                                        <asp:Label ID="Label6" runat="server" Text="Vectores"></asp:Label>
                                    </asp:LinkButton>
                                    <br />
                                    <div class="row">
                                        <table class="table table-bordered table-condensed">
                                            <thead>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton CssClass="buttonClass" ID="lkb_VectoresArchivos" runat="server" OnClick="lkb_VectoresArchivos_Click">
                                                            <i class="fas fa-file-upload" id="i_VectoresArchivos" runat="server" visible="true"></i>&nbsp;-&nbsp;<asp:Label ID="lbl_VectoresArchivos" runat="server" Text=""></asp:Label>
                                                        </asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton CssClass="buttonClass" ID="lkb_AC" runat="server" OnClick="lkb_AC_Click">
                                                            <i class="fas fa-file-upload" id="i_AC" runat="server" visible="true"></i>&nbsp;-&nbsp;<asp:Label ID="lbl_AC" runat="server" Text=""></asp:Label>
                                                        </asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton CssClass="buttonClass" ID="lkb_TE" runat="server" OnClick="lkb_TE_Click">
                                                            <i class="fas fa-file-upload" id="i_TE" runat="server" visible="true"></i>&nbsp;-&nbsp;<asp:Label ID="lbl_TE" runat="server" Text=""></asp:Label>
                                                        </asp:LinkButton>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton CssClass="buttonClass" ID="lkb_076" runat="server" OnClick="lkb_76_Click">
                                                            <i class="fas fa-file-upload" id="i_076" runat="server" visible="true"></i>&nbsp;-&nbsp;<asp:Label ID="lbl_076" runat="server" Text=""></asp:Label>
                                                        </asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton CssClass="buttonClass" ID="lkb_077" runat="server" OnClick="lkb_77_Click">
                                                            <i class="fas fa-file-upload" id="i_077" runat="server" visible="true"></i>&nbsp;-&nbsp;<asp:Label ID="lbl_077" runat="server" Text=""></asp:Label>
                                                        </asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton CssClass="buttonClass" ID="lkb_078" runat="server" OnClick="lkb_78_Click">
                                                            <i class="fas fa-file-upload" id="i_078" runat="server" visible="true"></i>&nbsp;-&nbsp;<asp:Label ID="lbl_078" runat="server" Text=""></asp:Label>
                                                        </asp:LinkButton>
                                                    </td>
                                                </tr>
                                                <tr>

                                                    <td>
                                                        <asp:LinkButton CssClass="buttonClass" ID="lkb_079" runat="server" OnClick="lkb_79_Click">
                                                            <i class="fas fa-file-upload" id="i_079" runat="server" visible="true"></i>&nbsp;-&nbsp;<asp:Label ID="lbl_079" runat="server" Text=""></asp:Label>
                                                        </asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton CssClass="buttonClass" ID="lkb_VIA" runat="server" OnClick="lkb_VIA_Click">
                                                            <i class="fas fa-file-upload" id="i_VIA" runat="server" visible="true"></i>&nbsp;-&nbsp;<asp:Label ID="lbl_VIA" runat="server" Text=""></asp:Label>
                                                        </asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton CssClass="buttonClass" ID="lkb_VIASol" runat="server" OnClick="lkb_VIASol_Click">
                                                            <i class="fas fa-file-upload" id="i_VIASol" runat="server" visible="true"></i>&nbsp;-&nbsp;<asp:Label ID="lbl_VIASol" runat="server" Text=""></asp:Label>
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
                                        <div class="col-lg-12">
                                            <div class="table-responsive">
                                                <asp:GridView CssClass="table table-bordered table-condensed" ID="gv_mv" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="3" ForeColor="Black" GridLines="Vertical" TabIndex="5" PageSize="150" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                                                    <AlternatingRowStyle BackColor="#7f77a7" />
                                                    <Columns>
                                                        <asp:BoundField DataField="CveFondo" HeaderText="CveFondo" SortExpression="CveFondo" Visible="true" />
                                                        <asp:BoundField DataField="CveMdo" HeaderText="CveMdo" SortExpression="CveMdo" Visible="true" />
                                                        <asp:BoundField DataField="CveGpo" HeaderText="CveGpo" SortExpression="CveGpo" Visible="true" />
                                                        <asp:BoundField DataField="CveInst" HeaderText="CveInst" SortExpression="CveInst" Visible="true" />
                                                        <asp:BoundField DataField="Isin" HeaderText="Isin" SortExpression="Isin" Visible="true" />
                                                        <asp:BoundField DataField="CveBmv" HeaderText="CveBmv" SortExpression="CveBmv" Visible="true" />
                                                        <asp:BoundField DataField="Emisora" HeaderText="Emisora" SortExpression="Emisora" Visible="true" />
                                                        <asp:BoundField DataField="Serie" HeaderText="Serie" SortExpression="Serie" Visible="true" />
                                                        <asp:BoundField DataField="FecOper" HeaderText="FecOper" SortExpression="FecOper" Visible="true" />
                                                        <asp:BoundField DataField="FecLiq" HeaderText="FecLiq" SortExpression="FecLiq" Visible="true" />
                                                        <asp:BoundField DataField="CveMov" HeaderText="CveMov" SortExpression="CveMov" Visible="true" />
                                                        <asp:BoundField DataField="CveLiq" HeaderText="CveLiq" SortExpression="CveLiq" Visible="true" />
                                                        <asp:BoundField DataField="CveTen" HeaderText="CveTen" SortExpression="CveTen" Visible="true" />
                                                        <asp:BoundField DataField="CveCov" HeaderText="CveCov" SortExpression="CveCov" Visible="true" />
                                                        <asp:BoundField DataField="MovCnbv" HeaderText="MovCnbv" SortExpression="MovCnbv" Visible="true" />
                                                        <asp:BoundField DataField="CveProv" HeaderText="CveProv" SortExpression="CveProv" Visible="true" />
                                                        <asp:BoundField DataField="Plazo" HeaderText="Plazo" SortExpression="Plazo" Visible="true" />
                                                        <asp:BoundField DataField="Tasa" HeaderText="Tasa" SortExpression="Tasa" Visible="true" />
                                                        <asp:BoundField DataField="Titulos" HeaderText="Titulos" SortExpression="Titulos" Visible="true" />
                                                        <asp:BoundField DataField="Tcambio" HeaderText="Tcambio" SortExpression="Tcambio" Visible="true" />
                                                        <asp:BoundField DataField="Pactado" HeaderText="Pactado" SortExpression="Pactado" Visible="true" />
                                                        <asp:BoundField DataField="ImpBruto" HeaderText="ImpBruto" SortExpression="ImpBruto" Visible="true" />
                                                        <asp:BoundField DataField="ImpInt" HeaderText="ImpInt" SortExpression="ImpInt" Visible="true" />
                                                        <asp:BoundField DataField="ImpComs" HeaderText="ImpComs" SortExpression="ImpComs" Visible="true" />
                                                        <asp:BoundField DataField="ImpIva" HeaderText="ImpIva" SortExpression="ImpIva" Visible="true" />
                                                        <asp:BoundField DataField="ImpIsr" HeaderText="ImpIsr" SortExpression="ImpIsr" Visible="true" />
                                                        <asp:BoundField DataField="Pais" HeaderText="Pais" SortExpression="Pais" Visible="true" />
                                                        <asp:BoundField DataField="Moneda" HeaderText="Moneda" SortExpression="Moneda" Visible="true" />
                                                        <asp:BoundField DataField="Hora" HeaderText="Hora" SortExpression="Hora" Visible="true" />
                                                        <asp:BoundField DataField="TasaFv" HeaderText="TasaFv" SortExpression="TasaFv" Visible="true" />
                                                        <asp:BoundField DataField="TasaRef" HeaderText="TasaRef" SortExpression="TasaRef" Visible="true" />
                                                        <asp:BoundField DataField="Aforo" HeaderText="Aforo" SortExpression="Aforo" Visible="true" />
                                                        <asp:BoundField DataField="FolFront" HeaderText="FolFront" SortExpression="FolFront" Visible="true" />
                                                        <asp:BoundField DataField="CveBrok" HeaderText="CveBrok" SortExpression="CveBrok" Visible="true" />
                                                        <asp:BoundField DataField="ComBrok" HeaderText="ComBrok" SortExpression="ComBrok" Visible="true" />
                                                        <asp:BoundField DataField="IvaBrok" HeaderText="IvaBrok" SortExpression="IvaBrok" Visible="true" />
                                                        <asp:BoundField DataField="PrecFdos" HeaderText="PrecFdos" SortExpression="PrecFdos" Visible="true" />
                                                        <asp:BoundField DataField="MdoPrim" HeaderText="MdoPrim" SortExpression="MdoPrim" Visible="true" />
                                                        <asp:BoundField DataField="MedioConc" HeaderText="MedioConc" SortExpression="MedioConc" Visible="true" />
                                                        <asp:BoundField DataField="CtoUnit" HeaderText="CtoUnit" SortExpression="CtoUnit" Visible="true" />
                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCCCC" />
                                                    <HeaderStyle BackColor="#7d3954" ForeColor="White" Font-Bold="false" />
                                                    <PagerSettings FirstPageText="Inicio" LastPageText="Final" />
                                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                    <SelectedRowStyle BackColor="#7f77a7" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                    <SortedAscendingHeaderStyle BackColor="#808080" />
                                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                                </asp:GridView>
                                            </div>
                                            <div class="table-responsive">
                                                <asp:GridView CssClass="table table-bordered table-condensed" ID="gv_de" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="3" ForeColor="Black" GridLines="Vertical" TabIndex="5" PageSize="150" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                                                    <AlternatingRowStyle BackColor="#7f77a7" />
                                                    <Columns>
                                                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" Visible="true" />
                                                        <asp:BoundField DataField="CveFondo" HeaderText="CveFondo" SortExpression="CveFondo" Visible="true" />
                                                        <asp:BoundField DataField="CveBmv" HeaderText="CveBmv" SortExpression="CveBmv" Visible="true" />
                                                        <asp:BoundField DataField="Emisora" HeaderText="Emisora" SortExpression="Emisora" Visible="true" />
                                                        <asp:BoundField DataField="Serie" HeaderText="Serie" SortExpression="Serie" Visible="true" />
                                                        <asp:BoundField DataField="PaisTrans" HeaderText="PaisTrans" SortExpression="PaisTrans" Visible="true" />
                                                        <asp:BoundField DataField="MonedaTrans" HeaderText="MonedaTrans" SortExpression="MonedaTrans" Visible="true" />
                                                        <asp:BoundField DataField="ImpMonOrig" HeaderText="ImpMonOrig" SortExpression="ImpMonOrig" Visible="true" />
                                                        <asp:BoundField DataField="TipoCambio" HeaderText="TipoCambio" SortExpression="TipoCambio" Visible="true" />
                                                        <asp:BoundField DataField="Pactado" HeaderText="Pactado" SortExpression="Pactado" Visible="true" />
                                                        <asp:BoundField DataField="DivGrex" HeaderText="DivGrex" SortExpression="DivGrex" Visible="true" />
                                                        <asp:BoundField DataField="IsrFecId" HeaderText="IsrFecId" SortExpression="IsrFecId" Visible="true" />
                                                        <asp:BoundField DataField="IsrMonId" HeaderText="IsrMonId" SortExpression="IsrMonId" Visible="true" />
                                                        <asp:BoundField DataField="IsrTcId" HeaderText="IsrTcId" SortExpression="IsrTcId" Visible="true" />
                                                        <asp:BoundField DataField="IsrPactId" HeaderText="IsrPactId" SortExpression="IsrPactId" Visible="true" />
                                                        <asp:BoundField DataField="IsrImpId" HeaderText="IsrImpId" SortExpression="IsrImpId" Visible="true" />
                                                        <asp:BoundField DataField="IsrFecPro" HeaderText="IsrFecPro" SortExpression="IsrFecPro" Visible="true" />
                                                        <asp:BoundField DataField="IsrMonPro" HeaderText="IsrMonPro" SortExpression="IsrMonPro" Visible="true" />
                                                        <asp:BoundField DataField="IsrTcPro" HeaderText="IsrTcPro" SortExpression="IsrTcPro" Visible="true" />
                                                        <asp:BoundField DataField="IsrPactPr" HeaderText="IsrPactPr" SortExpression="IsrPactPr" Visible="true" />
                                                        <asp:BoundField DataField="IsrImpPro" HeaderText="IsrImpPro" SortExpression="IsrImpPro" Visible="true" />
                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCCCC" />
                                                    <HeaderStyle BackColor="#7d3954" ForeColor="White" Font-Bold="false" />
                                                    <PagerSettings FirstPageText="Inicio" LastPageText="Final" />
                                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                    <SelectedRowStyle BackColor="#7f77a7" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                    <SortedAscendingHeaderStyle BackColor="#808080" />
                                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                                </asp:GridView>
                                            </div>
                                            <div class="table-responsive">
                                                <asp:GridView CssClass="table table-bordered table-condensed" ID="gv_ErrDE" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="3" ForeColor="Black" GridLines="Vertical" TabIndex="5" PageSize="150" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" OnRowDataBound="gv_ErrDE_RowDataBound">
                                                    <AlternatingRowStyle BackColor="#7f77a7" />
                                                    <Columns>
                                                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" Visible="true" />
                                                        <asp:BoundField DataField="CveFondo" HeaderText="CveFondo" SortExpression="CveFondo" Visible="true" />
                                                        <asp:BoundField DataField="CveBmv" HeaderText="CveBmv" SortExpression="CveBmv" Visible="true" />
                                                        <asp:BoundField DataField="Emisora" HeaderText="Emisora" SortExpression="Emisora" Visible="true" />
                                                        <asp:BoundField DataField="Serie" HeaderText="Serie" SortExpression="Serie" Visible="true" />
                                                        <asp:BoundField DataField="PaisTrans" HeaderText="PaisTrans" SortExpression="PaisTrans" Visible="true" />
                                                        <asp:BoundField DataField="ValidaPaisTrans" HeaderText="ValidaPaisTrans" SortExpression="ValidaPaisTrans" Visible="true" ControlStyle-BackColor="Red" />
                                                        <asp:BoundField DataField="MonedaTrans" HeaderText="MonedaTrans" SortExpression="MonedaTrans" Visible="true" />
                                                        <asp:BoundField DataField="ValidaMonedaTrans" HeaderText="ValidaMonedaTrans" SortExpression="ValidaMonedaTrans" Visible="true" />
                                                        <asp:BoundField DataField="ImpMonOrig" HeaderText="ImpMonOrig" SortExpression="ImpMonOrig" Visible="true" />
                                                        <asp:BoundField DataField="TipoCambio" HeaderText="TipoCambio" SortExpression="TipoCambio" Visible="true" />
                                                        <asp:BoundField DataField="Pactado" HeaderText="Pactado" SortExpression="Pactado" Visible="true" />
                                                        <asp:BoundField DataField="ValidaPactado" HeaderText="ValidaPactado" SortExpression="ValidaPactado" Visible="true" />
                                                        <asp:BoundField DataField="DivGrex" HeaderText="DivGrex" SortExpression="DivGrex" Visible="true" />
                                                        <asp:BoundField DataField="ValidaTipoDividendo" HeaderText="ValidaTipoDividendo" SortExpression="ValidaTipoDividendo" Visible="true" />
                                                        <asp:BoundField DataField="IsrFecId" HeaderText="IsrFecId" SortExpression="IsrFecId" Visible="true" />
                                                        <asp:BoundField DataField="IsrMonId" HeaderText="IsrMonId" SortExpression="IsrMonId" Visible="true" />
                                                        <asp:BoundField DataField="ValidaIsrMonId" HeaderText="ValidaIsrMonId" SortExpression="ValidaIsrMonId" Visible="true" />
                                                        <asp:BoundField DataField="IsrTcId" HeaderText="IsrTcId" SortExpression="IsrTcId" Visible="true" />
                                                        <asp:BoundField DataField="IsrPactId" HeaderText="IsrPactId" SortExpression="IsrPactId" Visible="true" />
                                                        <asp:BoundField DataField="ValidaIsrPactId" HeaderText="ValidaIsrPactId" SortExpression="ValidaIsrPactId" Visible="true" />
                                                        <asp:BoundField DataField="IsrImpId" HeaderText="IsrImpId" SortExpression="IsrImpId" Visible="true" />
                                                        <asp:BoundField DataField="IsrFecPro" HeaderText="IsrFecPro" SortExpression="IsrFecPro" Visible="true" />
                                                        <asp:BoundField DataField="IsrMonPro" HeaderText="IsrMonPro" SortExpression="IsrMonPro" Visible="true" />
                                                        <asp:BoundField DataField="ValidaIsrMonPro" HeaderText="ValidaIsrMonPro" SortExpression="ValidaIsrMonPro" Visible="true" />
                                                        <asp:BoundField DataField="IsrTcPro" HeaderText="IsrTcPro" SortExpression="IsrTcPro" Visible="true" />
                                                        <asp:BoundField DataField="IsrPactPr" HeaderText="IsrPactPr" SortExpression="IsrPactPr" Visible="true" />
                                                        <asp:BoundField DataField="ValidaIsrPactPr" HeaderText="ValidaIsrPactPr" SortExpression="ValidaIsrPactPr" Visible="true" />
                                                        <asp:BoundField DataField="IsrImpPro" HeaderText="IsrImpPro" SortExpression="IsrImpPro" Visible="true" />
                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCCCC" />
                                                    <HeaderStyle BackColor="#7d3954" ForeColor="White" Font-Bold="false" />
                                                    <PagerSettings FirstPageText="Inicio" LastPageText="Final" />
                                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                    <SelectedRowStyle BackColor="#7f77a7" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                    <SortedAscendingHeaderStyle BackColor="#808080" />
                                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                                </asp:GridView>
                                            </div>
                                            <div class="table-responsive">
                                                <asp:GridView CssClass="table table-bordered table-condensed" ID="gv_pip" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="3" ForeColor="Black" GridLines="Vertical" TabIndex="5" PageSize="150" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                                                    <AlternatingRowStyle BackColor="#7f77a7" />
                                                    <Columns>
                                                        <asp:BoundField DataField="Pip_TipoReg" HeaderText="Pip_TipoReg" SortExpression="Pip_TipoReg" Visible="true" />
                                                        <asp:BoundField DataField="Pip_TipoMercado" HeaderText="Pip_TipoMercado" SortExpression="Pip_TipoMercado" Visible="true" />
                                                        <asp:BoundField DataField="Pip_FechaOper" HeaderText="Pip_FechaOper" SortExpression="Pip_FechaOper" Visible="true" />
                                                        <asp:BoundField DataField="Pip_TV" HeaderText="Pip_TV" SortExpression="Pip_TV" Visible="true" />
                                                        <asp:BoundField DataField="Pip_Emisora" HeaderText="Pip_Emisora" SortExpression="Pip_Emisora" Visible="true" />
                                                        <asp:BoundField DataField="Pip_Serie" HeaderText="Pip_Serie" SortExpression="Pip_Serie" Visible="true" />
                                                        <asp:BoundField DataField="Pip_PrecioSucio" HeaderText="Pip_PrecioSucio" SortExpression="Pip_PrecioSucio" Visible="true" />
                                                        <asp:BoundField DataField="Pip_PrecioLimpio" HeaderText="Pip_PrecioLimpio" SortExpression="Pip_PrecioLimpio" Visible="true" />
                                                        <asp:BoundField DataField="Pip_Interes" HeaderText="Pip_Interes" SortExpression="Pip_Interes" Visible="true" />
                                                        <asp:BoundField DataField="Pip_CveProveedor" HeaderText="Pip_CveProveedor" SortExpression="Pip_CveProveedor" Visible="true" />
                                                        <asp:BoundField DataField="Pip_TipoEnvio" HeaderText="Pip_TipoEnvio" SortExpression="Pip_TipoEnvio" Visible="true" />
                                                        <asp:BoundField DataField="Pip_DiasxVencer" HeaderText="Pip_DiasxVencer" SortExpression="Pip_DiasxVencer" Visible="true" />
                                                        <asp:BoundField DataField="Pip_TasaDescto" HeaderText="Pip_TasaDescto" SortExpression="Pip_TasaDescto" Visible="true" />
                                                        <asp:BoundField DataField="Pip_ISIN" HeaderText="Pip_ISIN" SortExpression="Pip_ISIN" Visible="true" />
                                                        <asp:BoundField DataField="Pip_Cusip" HeaderText="Pip_Cusip" SortExpression="Pip_Cusip" Visible="true" />
                                                        <asp:BoundField DataField="Pip_Sedol" HeaderText="Pip_Sedol" SortExpression="Pip_Sedol" Visible="true" />
                                                        <asp:BoundField DataField="Pip_Consecutivo" HeaderText="Pip_Consecutivo" SortExpression="Pip_Consecutivo" Visible="true" />
                                                        <asp:BoundField DataField="FechaIniCup" HeaderText="FechaIniCup" SortExpression="FechaIniCup" Visible="true" />
                                                        <asp:BoundField DataField="FechaFinCup" HeaderText="FechaFinCup" SortExpression="FechaFinCup" Visible="true" />
                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCCCC" />
                                                    <HeaderStyle BackColor="#7d3954" ForeColor="White" Font-Bold="false" />
                                                    <PagerSettings FirstPageText="Inicio" LastPageText="Final" />
                                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                    <SelectedRowStyle BackColor="#7f77a7" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                    <SortedAscendingHeaderStyle BackColor="#808080" />
                                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                                </asp:GridView>
                                            </div>
                                            <div class="table-responsive">
                                                <asp:GridView CssClass="table table-bordered table-condensed" ID="gv_val" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="3" ForeColor="Black" GridLines="Vertical" TabIndex="5" PageSize="150" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                                                    <AlternatingRowStyle BackColor="#7f77a7" />
                                                    <Columns>
                                                        <asp:BoundField DataField="Val_TipoReg" HeaderText="Val_TipoReg" SortExpression="Val_TipoReg" Visible="true" />
                                                        <asp:BoundField DataField="Val_TipoMercado" HeaderText="Val_TipoMercado" SortExpression="Val_TipoMercado" Visible="true" />
                                                        <asp:BoundField DataField="Val_FechaOper" HeaderText="Val_FechaOper" SortExpression="Val_FechaOper" Visible="true" />
                                                        <asp:BoundField DataField="Val_TV" HeaderText="Val_TV" SortExpression="Val_TV" Visible="true" />
                                                        <asp:BoundField DataField="Val_Emisora" HeaderText="Val_Emisora" SortExpression="Val_Emisora" Visible="true" />
                                                        <asp:BoundField DataField="Val_Serie" HeaderText="Val_Serie" SortExpression="Val_Serie" Visible="true" />
                                                        <asp:BoundField DataField="Val_PrecioSucio" HeaderText="Val_PrecioSucio" SortExpression="Val_PrecioSucio" Visible="true" />
                                                        <asp:BoundField DataField="Val_PrecioLimpio" HeaderText="Val_PrecioLimpio" SortExpression="Val_PrecioLimpio" Visible="true" />
                                                        <asp:BoundField DataField="Val_Interes" HeaderText="Val_Interes" SortExpression="Val_Interes" Visible="true" />
                                                        <asp:BoundField DataField="Val_CveProveedor" HeaderText="Val_CveProveedor" SortExpression="Val_CveProveedor" Visible="true" />
                                                        <asp:BoundField DataField="Val_TipoEnvio" HeaderText="Val_TipoEnvio" SortExpression="Val_TipoEnvio" Visible="true" />
                                                        <asp:BoundField DataField="Val_DiasxVencer" HeaderText="Val_DiasxVencer" SortExpression="Val_DiasxVencer" Visible="true" />
                                                        <asp:BoundField DataField="Val_TasaDescto" HeaderText="Val_TasaDescto" SortExpression="Val_TasaDescto" Visible="true" />
                                                        <asp:BoundField DataField="Val_ISIN" HeaderText="Val_ISIN" SortExpression="Val_ISIN" Visible="true" />
                                                        <asp:BoundField DataField="Val_Cusip" HeaderText="Val_Cusip" SortExpression="Val_Cusip" Visible="true" />
                                                        <asp:BoundField DataField="Val_Sedol" HeaderText="Val_Sedol" SortExpression="Val_Sedol" Visible="true" />
                                                        <asp:BoundField DataField="Val_Consecutivo" HeaderText="Val_Consecutivo" SortExpression="Val_Consecutivo" Visible="true" />
                                                        <asp:BoundField DataField="FechaIniCup" HeaderText="FechaIniCup" SortExpression="FechaIniCup" Visible="true" />
                                                        <asp:BoundField DataField="FechaFinCup" HeaderText="FechaFinCup" SortExpression="FechaFinCup" Visible="true" />
                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCCCC" />
                                                    <HeaderStyle BackColor="#7d3954" ForeColor="White" Font-Bold="false" />
                                                    <PagerSettings FirstPageText="Inicio" LastPageText="Final" />
                                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                    <SelectedRowStyle BackColor="#7f77a7" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                    <SortedAscendingHeaderStyle BackColor="#808080" />
                                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                                </asp:GridView>
                                            </div>
                                            <div class="table-responsive">
                                                <asp:GridView CssClass="table table-bordered table-condensed" ID="gv_AP" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="3" ForeColor="Black" GridLines="Vertical" TabIndex="5" PageSize="150" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                                                    <AlternatingRowStyle BackColor="#7f77a7" />
                                                    <Columns>
                                                        <asp:BoundField DataField="CveFondo" HeaderText="CveFondo" SortExpression="CveFondo" Visible="true" />
                                                        <asp:BoundField DataField="Serie" HeaderText="Serie" SortExpression="Serie" Visible="true" />
                                                        <asp:BoundField DataField="Distribuidor" HeaderText="Distribuidor" SortExpression="Distribuidor" Visible="true" />
                                                        <asp:BoundField DataField="FecOper" HeaderText="FecOper" SortExpression="FecOper" Visible="true" />
                                                        <asp:BoundField DataField="FecLiq" HeaderText="FecLiq" SortExpression="FecLiq" Visible="true" />
                                                        <asp:BoundField DataField="CveMov" HeaderText="CveMov" SortExpression="CveMov" Visible="true" />
                                                        <asp:BoundField DataField="Cve_Liq" HeaderText="Cve_Liq" SortExpression="Cve_Liq" Visible="true" />
                                                        <asp:BoundField DataField="Titulos" HeaderText="Titulos" SortExpression="Titulos" Visible="true" />
                                                        <asp:BoundField DataField="Importe" HeaderText="Importe" SortExpression="Importe" Visible="true" />
                                                        <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" Visible="true" />
                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCCCC" />
                                                    <HeaderStyle BackColor="#7d3954" ForeColor="White" Font-Bold="false" />
                                                    <PagerSettings FirstPageText="Inicio" LastPageText="Final" />
                                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                    <SelectedRowStyle BackColor="#7f77a7" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                    <SortedAscendingHeaderStyle BackColor="#808080" />
                                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                                </asp:GridView>
                                            </div>
                                            <div class="table-responsive">
                                                <asp:GridView CssClass="table table-bordered table-condensed" ID="gv_TE" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="3" ForeColor="Black" GridLines="Vertical" TabIndex="5" PageSize="150" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                                                    <AlternatingRowStyle BackColor="#7f77a7" />
                                                    <Columns>
                                                        <asp:BoundField DataField="TV" HeaderText="TV" SortExpression="TV" Visible="true" />
                                                        <asp:BoundField DataField="Emisora" HeaderText="Emisora" SortExpression="Emisora" Visible="true" />
                                                        <asp:BoundField DataField="Serie" HeaderText="Serie" SortExpression="Serie" Visible="true" />
                                                        <asp:BoundField DataField="VNI" HeaderText="VNI" SortExpression="VNI" Visible="true" />
                                                        <asp:BoundField DataField="VNA" HeaderText="VNA" SortExpression="VNA" Visible="true" />
                                                        <asp:BoundField DataField="TCI" HeaderText="TCI" SortExpression="TCI" Visible="true" />
                                                        <asp:BoundField DataField="TCA" HeaderText="TCA" SortExpression="TCA" Visible="true" />
                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCCCC" />
                                                    <HeaderStyle BackColor="#7d3954" ForeColor="White" Font-Bold="false" />
                                                    <PagerSettings FirstPageText="Inicio" LastPageText="Final" />
                                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                    <SelectedRowStyle BackColor="#7f77a7" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                    <SortedAscendingHeaderStyle BackColor="#808080" />
                                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                                </asp:GridView>
                                            </div>
                                            <div class="table-responsive">
                                                <asp:GridView CssClass="table table-bordered table-condensed" ID="gv_AC" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="3" ForeColor="Black" GridLines="Vertical" TabIndex="5" PageSize="150" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                                                    <AlternatingRowStyle BackColor="#7f77a7" />
                                                    <Columns>
                                                        <asp:BoundField DataField="Columna1" HeaderText="Columna1" SortExpression="Columna1" Visible="true" />
                                                        <asp:BoundField DataField="Columna2" HeaderText="Columna2" SortExpression="Columna1" Visible="true" />
                                                        <asp:BoundField DataField="Columna3" HeaderText="Columna3" SortExpression="Columna1" Visible="true" />
                                                        <asp:BoundField DataField="Columna4" HeaderText="Columna4" SortExpression="Columna1" Visible="true" />
                                                        <asp:BoundField DataField="Columna5" HeaderText="Columna5" SortExpression="Columna1" Visible="true" />
                                                        <asp:BoundField DataField="Columna6" HeaderText="Columna6" SortExpression="Columna1" Visible="true" />
                                                        <asp:BoundField DataField="Columna7" HeaderText="Columna7" SortExpression="Columna1" Visible="true" />
                                                        <asp:BoundField DataField="Columna8" HeaderText="Columna8" SortExpression="Columna1" Visible="true" />
                                                        <asp:BoundField DataField="Columna9" HeaderText="Columna9" SortExpression="Columna1" Visible="true" />
                                                        <asp:BoundField DataField="Columna10" HeaderText="Columna10" SortExpression="Columna1" Visible="true" />
                                                        <asp:BoundField DataField="Columna11" HeaderText="Columna11" SortExpression="Columna1" Visible="true" />
                                                        <asp:BoundField DataField="Columna12" HeaderText="Columna12" SortExpression="Columna1" Visible="true" />
                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCCCC" />
                                                    <HeaderStyle BackColor="#7d3954" ForeColor="White" Font-Bold="false" />
                                                    <PagerSettings FirstPageText="Inicio" LastPageText="Final" />
                                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                    <SelectedRowStyle BackColor="#7f77a7" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                    <SortedAscendingHeaderStyle BackColor="#808080" />
                                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                                </asp:GridView>
                                            </div>
                                            <div class="table-responsive">
                                                <asp:GridView CssClass="table table-bordered table-condensed" ID="gv_PV" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="3" ForeColor="Black" GridLines="Vertical" TabIndex="5" PageSize="150" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                                                    <AlternatingRowStyle BackColor="#7f77a7" />
                                                    <Columns>
                                                        <asp:BoundField DataField="Columna1" HeaderText="CveFondo" SortExpression="Columna1" Visible="true" />
                                                        <asp:BoundField DataField="Columna2" HeaderText="Serie" SortExpression="Columna2" Visible="true" />
                                                        <asp:BoundField DataField="Columna3" HeaderText="Titulos" SortExpression="Columna3" Visible="true" />
                                                        <asp:BoundField DataField="Columna4" HeaderText="CveProv" SortExpression="Columna4" Visible="true" />
                                                        <asp:BoundField DataField="Columna5" HeaderText="CveMdo" SortExpression="Columna5" Visible="true" />
                                                        <asp:BoundField DataField="Columna6" HeaderText="CveGpo" SortExpression="Columna6" Visible="true" />
                                                        <asp:BoundField DataField="Columna7" HeaderText="CveInst" SortExpression="Columna7" Visible="true" />
                                                        <asp:BoundField DataField="Columna8" HeaderText="CveBmv" SortExpression="Columna8" Visible="true" />
                                                        <asp:BoundField DataField="Columna9" HeaderText="Emisora" SortExpression="Columna9" Visible="true" />
                                                        <asp:BoundField DataField="Columna10" HeaderText="Finicio" SortExpression="Columna10" Visible="true" />
                                                        <asp:BoundField DataField="Columna11" HeaderText="Plazo" SortExpression="Columna11" Visible="true" />
                                                        <asp:BoundField DataField="Columna12" HeaderText="Fvence" SortExpression="Columna12" Visible="true" />
                                                        <asp:BoundField DataField="Columna13" HeaderText="ImpBruto" SortExpression="Columna13" Visible="true" />
                                                        <asp:BoundField DataField="Columna14" HeaderText="TasaPmo" SortExpression="Columna14" Visible="true" />
                                                        <asp:BoundField DataField="Columna15" HeaderText="Premio" SortExpression="Columna15" Visible="true" />
                                                        <asp:BoundField DataField="Columna16" HeaderText="SobreTasa" SortExpression="Columna16" Visible="true" />
                                                        <asp:BoundField DataField="Columna17" HeaderText="Aforo" SortExpression="Columna17" Visible="true" />
                                                        <asp:BoundField DataField="Columna18" HeaderText="BmvGar" SortExpression="Columna18" Visible="true" />
                                                        <asp:BoundField DataField="Columna19" HeaderText="CveGar" SortExpression="Columna19" Visible="true" />
                                                        <asp:BoundField DataField="Columna20" HeaderText="EmisoraAlt" SortExpression="Columna20" Visible="true" />
                                                        <asp:BoundField DataField="Columna21" HeaderText="SerieAlt" SortExpression="Columna21" Visible="true" />
                                                        <asp:BoundField DataField="Columna22" HeaderText="TitulosGar" SortExpression="Columna22" Visible="true" />
                                                        <asp:BoundField DataField="Columna23" HeaderText="PreGar" SortExpression="Columna23" Visible="true" />
                                                        <asp:BoundField DataField="Columna24" HeaderText="ImporteGar" SortExpression="Columna24" Visible="true" />
                                                        <asp:BoundField DataField="Columna25" HeaderText="PjeGar" SortExpression="Columna25" Visible="true" />
                                                        <asp:BoundField DataField="Columna26" HeaderText="CalifGar" SortExpression="Columna26" Visible="true" />
                                                        <asp:BoundField DataField="Columna27" HeaderText="IsinDeLaGarantia" SortExpression="Columna27" Visible="true" />
                                                        <asp:BoundField DataField="Columna28" HeaderText="IdPrestamo" SortExpression="Columna28" Visible="true" />
                                                        <asp:BoundField DataField="Columna29" HeaderText="IdGarantia" SortExpression="Columna29" Visible="true" />
                                                        <asp:BoundField DataField="Columna30" HeaderText="Hora" SortExpression="Columna30" Visible="true" />
                                                        <asp:BoundField DataField="Columna31" HeaderText="FolioFront" SortExpression="Columna31" Visible="true" />
                                                        <asp:BoundField DataField="Columna32" HeaderText="CveMov" SortExpression="Columna32" Visible="true" />
                                                        <asp:BoundField DataField="Columna33" HeaderText="MedioConcert" SortExpression="Columna33" Visible="true" />
                                                        <asp:BoundField DataField="Columna34" HeaderText="PrecioPactado" SortExpression="Columna34" Visible="true" />
                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCCCC" />
                                                    <HeaderStyle BackColor="#7d3954" ForeColor="White" Font-Bold="false" />
                                                    <PagerSettings FirstPageText="Inicio" LastPageText="Final" />
                                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                    <SelectedRowStyle BackColor="#7f77a7" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                    <SortedAscendingHeaderStyle BackColor="#808080" />
                                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                                </asp:GridView>
                                            </div>
                                            <div class="table-responsive">
                                                <asp:GridView CssClass="table table-bordered table-condensed" ID="gv_md" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="3" ForeColor="Black" GridLines="Vertical" TabIndex="5" PageSize="150" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                                                    <AlternatingRowStyle BackColor="#7f77a7" />
                                                    <Columns>
                                                        <asp:BoundField DataField="Mercado" HeaderText="Mercado" SortExpression="Mercado" Visible="true" />
                                                        <asp:BoundField DataField="Clavedeinstrumento" HeaderText="Clavedeinstrumento" SortExpression="Clavedeinstrumento" Visible="true" />
                                                        <asp:BoundField DataField="Emisora" HeaderText="Emisora" SortExpression="Emisora" Visible="true" />
                                                        <asp:BoundField DataField="Serie" HeaderText="Serie" SortExpression="Serie" Visible="true" />
                                                        <asp:BoundField DataField="Cupon" HeaderText="Cupon" SortExpression="Cupon" Visible="true" />
                                                        <asp:BoundField DataField="Fechadeoperacion" HeaderText="Fechadeoperacion" SortExpression="Fechadeoperacion" Visible="true" />
                                                        <asp:BoundField DataField="Fechadeliquidacion" HeaderText="Fechadeliquidacion" SortExpression="Fechadeliquidacion" Visible="true" />
                                                        <asp:BoundField DataField="Clavedemovimiento" HeaderText="Clavedemovimiento" SortExpression="Clavedemovimiento" Visible="true" />
                                                        <asp:BoundField DataField="Tipodemovimiento" HeaderText="Tipodemovimiento" SortExpression="Tipodemovimiento" Visible="true" />
                                                        <asp:BoundField DataField="Clavedelproveedor" HeaderText="Clavedelproveedor" SortExpression="Clavedelproveedor" Visible="true" />
                                                        <asp:BoundField DataField="Numerodecontratos" HeaderText="Numerodecontratos" SortExpression="Numerodecontratos" Visible="true" />
                                                        <asp:BoundField DataField="Tamañodelcontrato" HeaderText="Tamañodelcontrato" SortExpression="Tamañodelcontrato" Visible="true" />
                                                        <asp:BoundField DataField="Preciootasapactada" HeaderText="Preciootasapactada" SortExpression="Preciootasapactada" Visible="true" />
                                                        <asp:BoundField DataField="Preciootasaoriginal" HeaderText="Preciootasaoriginal" SortExpression="Preciootasaoriginal" Visible="true" />
                                                        <asp:BoundField DataField="Fechadeaperturaoriginal" HeaderText="Fechadeaperturaoriginal" SortExpression="Fechadeaperturaoriginal" Visible="true" />
                                                        <asp:BoundField DataField="Tipodecambiodelaoperacion" HeaderText="Tipodecambiodelaoperacion" SortExpression="Tipodecambiodelaoperacion" Visible="true" />
                                                        <asp:BoundField DataField="EstructuradedivisasprecTasa" HeaderText="EstructuradedivisasprecTasa" SortExpression="EstructuradedivisasprecTasa" Visible="true" />
                                                        <asp:BoundField DataField="Ctd" HeaderText="Ctd" SortExpression="Ctd" Visible="true" />
                                                        <asp:BoundField DataField="Precioctd" HeaderText="Precioctd" SortExpression="Precioctd" Visible="true" />
                                                        <asp:BoundField DataField="Tipodeentrega" HeaderText="Tipodeentrega" SortExpression="Tipodeentrega" Visible="true" />
                                                        <asp:BoundField DataField="Numerodeoperacion" HeaderText="Numerodeoperacion" SortExpression="Numerodeoperacion" Visible="true" />
                                                        <asp:BoundField DataField="Consecutivopv" HeaderText="Consecutivopv" SortExpression="Consecutivopv" Visible="true" />
                                                        <asp:BoundField DataField="Margensocioliq" HeaderText="Margensocioliq" SortExpression="Margensocioliq" Visible="true" />
                                                        <asp:BoundField DataField="Margensocioope" HeaderText="Margensocioope" SortExpression="Margensocioope" Visible="true" />
                                                        <asp:BoundField DataField="Importedelacomision" HeaderText="Importedelacomision" SortExpression="Importedelacomision" Visible="true" />
                                                        <asp:BoundField DataField="IvasComisiontotal" HeaderText="IvasComisiontotal" SortExpression="IvasComisiontotal" Visible="true" />
                                                        <asp:BoundField DataField="Observacionesespeciales" HeaderText="Observacionesespeciales" SortExpression="Observacionesespeciales" Visible="true" />
                                                        <asp:BoundField DataField="Clavedepizarrasiefore" HeaderText="Clavedepizarrasiefore" SortExpression="Clavedepizarrasiefore" Visible="true" />
                                                        <asp:BoundField DataField="TasavalorpresenteFijafutSwaps" HeaderText="TasavalorpresenteFijafutSwaps" SortExpression="TasavalorpresenteFijafutSwaps" Visible="true" />
                                                        <asp:BoundField DataField="UtilPerdvalorpresenteMontocupon" HeaderText="UtilPerdvalorpresenteMontocupon" SortExpression="UtilPerdvalorpresenteMontocupon" Visible="true" />
                                                        <asp:BoundField DataField="Importedelaprima" HeaderText="Importedelaprima" SortExpression="Importedelaprima" Visible="true" />
                                                        <asp:BoundField DataField="Claveliquidacion" HeaderText="Claveliquidacion" SortExpression="Claveliquidacion" Visible="true" />
                                                        <asp:BoundField DataField="Claveconsarcontraparte" HeaderText="Claveconsarcontraparte" SortExpression="Claveconsarcontraparte" Visible="true" />
                                                        <asp:BoundField DataField="NoContratocontrapartefront" HeaderText="NoContratocontrapartefront" SortExpression="NoContratocontrapartefront" Visible="true" />
                                                        <asp:BoundField DataField="Tipodeinstrumento" HeaderText="Tipodeinstrumento" SortExpression="Tipodeinstrumento" Visible="true" />
                                                        <asp:BoundField DataField="Tipodeconcertacion" HeaderText="Tipodeconcertacion" SortExpression="Tipodeconcertacion" Visible="true" />
                                                        <asp:BoundField DataField="CotizaenprecioTasa" HeaderText="CotizaenprecioTasa" SortExpression="CotizaenprecioTasa" Visible="true" />
                                                        <asp:BoundField DataField="Plazoreferenciatasa" HeaderText="Plazoreferenciatasa" SortExpression="Plazoreferenciatasa" Visible="true" />
                                                        <asp:BoundField DataField="Fechavencimientoemisora" HeaderText="Fechavencimientoemisora" SortExpression="Fechavencimientoemisora" Visible="true" />
                                                        <asp:BoundField DataField="Fechaliquidacionemisora" HeaderText="Fechaliquidacionemisora" SortExpression="Fechaliquidacionemisora" Visible="true" />
                                                        <asp:BoundField DataField="Divisasubyacente" HeaderText="Divisasubyacente" SortExpression="Divisasubyacente" Visible="true" />
                                                        <asp:BoundField DataField="Divisacontrato" HeaderText="Divisacontrato" SortExpression="Divisacontrato" Visible="true" />
                                                        <asp:BoundField DataField="Tipodeopcion" HeaderText="Tipodeopcion" SortExpression="Tipodeopcion" Visible="true" />
                                                        <asp:BoundField DataField="Subclasedeopcion" HeaderText="Subclasedeopcion" SortExpression="Subclasedeopcion" Visible="true" />
                                                        <asp:BoundField DataField="Folioderivadofront" HeaderText="Folioderivadofront" SortExpression="Folioderivadofront" Visible="true" />
                                                        <asp:BoundField DataField="Nocionaloriginal" HeaderText="Nocionaloriginal" SortExpression="Nocionaloriginal" Visible="true" />
                                                        <asp:BoundField DataField="Folioconfirmacioncontraparte" HeaderText="Folioconfirmacioncontraparte" SortExpression="Folioconfirmacioncontraparte" Visible="true" />
                                                        <asp:BoundField DataField="Israretener" HeaderText="Israretener" SortExpression="Israretener" Visible="true" />
                                                        <asp:BoundField DataField="Deltaparacobertura" HeaderText="Deltaparacobertura" SortExpression="Deltaparacobertura" Visible="true" />
                                                        <asp:BoundField DataField="Foliocoberturadivisas" HeaderText="Foliocoberturadivisas" SortExpression="Foliocoberturadivisas" Visible="true" />
                                                        <asp:BoundField DataField="Divisadeliquidacion" HeaderText="Divisadeliquidacion" SortExpression="Divisadeliquidacion" Visible="true" />
                                                        <asp:BoundField DataField="Clavesociooperador" HeaderText="Clavesociooperador" SortExpression="Clavesociooperador" Visible="true" />
                                                        <asp:BoundField DataField="Claveconsarsociooperador" HeaderText="Claveconsarsociooperador" SortExpression="Claveconsarsociooperador" Visible="true" />
                                                        <asp:BoundField DataField="NoContratosociooperador" HeaderText="NoContratosociooperador" SortExpression="NoContratosociooperador" Visible="true" />
                                                        <asp:BoundField DataField="Preciootasapactada" HeaderText="Preciootasapactada" SortExpression="Preciootasapactada" Visible="true" />
                                                        <asp:BoundField DataField="Preciootasaoriginal" HeaderText="Preciootasaoriginal" SortExpression="Preciootasaoriginal" Visible="true" />
                                                        <asp:BoundField DataField="Consecutivopv" HeaderText="Consecutivopv" SortExpression="Consecutivopv" Visible="true" />
                                                        <asp:BoundField DataField="Folioestrategiaderivados" HeaderText="Folioestrategiaderivados" SortExpression="Folioestrategiaderivados" Visible="true" />
                                                        <asp:BoundField DataField="Folioestrategiaderivadosanterior" HeaderText="Folioestrategiaderivadosanterior" SortExpression="Folioestrategiaderivadosanterior" Visible="true" />
                                                        <asp:BoundField DataField="Claveconsarcamaracompensacion" HeaderText="Claveconsarcamaracompensacion" SortExpression="Claveconsarcamaracompensacion" Visible="true" />
                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCCCC" />
                                                    <HeaderStyle BackColor="#7d3954" ForeColor="White" Font-Bold="false" />
                                                    <PagerSettings FirstPageText="Inicio" LastPageText="Final" />
                                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                    <SelectedRowStyle BackColor="#7f77a7" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                    <SortedAscendingHeaderStyle BackColor="#808080" />
                                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                                </asp:GridView>
                                            </div>
                                            <div class="table-responsive">
                                                <asp:GridView CssClass="table table-bordered table-condensed" ID="gv_076" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="3" ForeColor="Black" GridLines="Vertical" TabIndex="5" PageSize="150" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                                                    <AlternatingRowStyle BackColor="#7f77a7" />
                                                    <Columns>
                                                        <asp:BoundField DataField="Detalle" HeaderText="Detalle" SortExpression="Detalle" Visible="true" />
                                                        <asp:BoundField DataField="TipoMercado" HeaderText="TipoMercado" SortExpression="TipoMercado" Visible="true" />
                                                        <asp:BoundField DataField="FechaVector" HeaderText="FechaVector" SortExpression="FechaVector" Visible="true" />
                                                        <asp:BoundField DataField="Tv" HeaderText="Tv" SortExpression="Tv" Visible="true" />
                                                        <asp:BoundField DataField="Emisora" HeaderText="Emisora" SortExpression="Emisora" Visible="true" />
                                                        <asp:BoundField DataField="Serie" HeaderText="Serie" SortExpression="Serie" Visible="true" />
                                                        <asp:BoundField DataField="PrecioSucio" HeaderText="PrecioSucio" SortExpression="PrecioSucio" Visible="true" />
                                                        <asp:BoundField DataField="PrecioLimpio" HeaderText="PrecioLimpio" SortExpression="PrecioLimpio" Visible="true" />
                                                        <asp:BoundField DataField="Intereses" HeaderText="Intereses" SortExpression="Intereses" Visible="true" />
                                                        <asp:BoundField DataField="Proveedor" HeaderText="Proveedor" SortExpression="Proveedor" Visible="true" />
                                                        <asp:BoundField DataField="DiasPorVencer" HeaderText="DiasPorVencer" SortExpression="DiasPorVencer" Visible="true" />
                                                        <asp:BoundField DataField="TasaDescuento" HeaderText="TasaDescuento" SortExpression="TasaDescuento" Visible="true" />
                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCCCC" />
                                                    <HeaderStyle BackColor="#7d3954" ForeColor="White" Font-Bold="false" />
                                                    <PagerSettings FirstPageText="Inicio" LastPageText="Final" />
                                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                    <SelectedRowStyle BackColor="#7f77a7" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                    <SortedAscendingHeaderStyle BackColor="#808080" />
                                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                                </asp:GridView>
                                            </div>
                                            <div class="table-responsive">
                                                <asp:GridView CssClass="table table-bordered table-condensed" ID="gv_077" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="3" ForeColor="Black" GridLines="Vertical" TabIndex="5" PageSize="150" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                                                    <AlternatingRowStyle BackColor="#7f77a7" />
                                                    <Columns>
                                                        <asp:BoundField DataField="Detalle" HeaderText="Detalle" SortExpression="Detalle" Visible="true" />
                                                        <asp:BoundField DataField="TipoMercado" HeaderText="TipoMercado" SortExpression="TipoMercado" Visible="true" />
                                                        <asp:BoundField DataField="FechaVector" HeaderText="FechaVector" SortExpression="FechaVector" Visible="true" />
                                                        <asp:BoundField DataField="Tv" HeaderText="Tv" SortExpression="Tv" Visible="true" />
                                                        <asp:BoundField DataField="Emisora" HeaderText="Emisora" SortExpression="Emisora" Visible="true" />
                                                        <asp:BoundField DataField="Serie" HeaderText="Serie" SortExpression="Serie" Visible="true" />
                                                        <asp:BoundField DataField="PrecioSucio" HeaderText="PrecioSucio" SortExpression="PrecioSucio" Visible="true" />
                                                        <asp:BoundField DataField="PrecioLimpio" HeaderText="PrecioLimpio" SortExpression="PrecioLimpio" Visible="true" />
                                                        <asp:BoundField DataField="Intereses" HeaderText="Intereses" SortExpression="Intereses" Visible="true" />
                                                        <asp:BoundField DataField="Proveedor" HeaderText="Proveedor" SortExpression="Proveedor" Visible="true" />
                                                        <asp:BoundField DataField="TipoEnvio" HeaderText="TipoEnvio" SortExpression="TipoEnvio" Visible="true" />
                                                        <asp:BoundField DataField="DiasPorVencer" HeaderText="DiasPorVencer" SortExpression="DiasPorVencer" Visible="true" />
                                                        <asp:BoundField DataField="TasaDescuento" HeaderText="TasaDescuento" SortExpression="TasaDescuento" Visible="true" />
                                                        <asp:BoundField DataField="Isin" HeaderText="Isin" SortExpression="Isin" Visible="true" />
                                                        <asp:BoundField DataField="Consecutivo" HeaderText="Consecutivo" SortExpression="Consecutivo" Visible="true" />
                                                        <asp:BoundField DataField="PrecioSpot" HeaderText="PrecioSpot" SortExpression="PrecioSpot" Visible="true" />
                                                        <asp:BoundField DataField="TasaLibreRiesgo" HeaderText="TasaLibreRiesgo" SortExpression="TasaLibreRiesgo" Visible="true" />
                                                        <asp:BoundField DataField="Delta" HeaderText="Delta" SortExpression="Delta" Visible="true" />
                                                        <asp:BoundField DataField="TipoCambio" HeaderText="TipoCambio" SortExpression="TipoCambio" Visible="true" />
                                                        <asp:BoundField DataField="PrecioSwapLargo" HeaderText="PrecioSwapLargo" SortExpression="PrecioSwapLargo" Visible="true" />
                                                        <asp:BoundField DataField="PrecioSwapCorto" HeaderText="PrecioSwapCorto" SortExpression="PrecioSwapCorto" Visible="true" />
                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCCCC" />
                                                    <HeaderStyle BackColor="#7d3954" ForeColor="White" Font-Bold="false" />
                                                    <PagerSettings FirstPageText="Inicio" LastPageText="Final" />
                                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                    <SelectedRowStyle BackColor="#7f77a7" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                    <SortedAscendingHeaderStyle BackColor="#808080" />
                                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                                </asp:GridView>
                                            </div>
                                            <div class="table-responsive">
                                                <asp:GridView CssClass="table table-bordered table-condensed" ID="gv_078" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="3" ForeColor="Black" GridLines="Vertical" TabIndex="5" PageSize="150" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                                                    <AlternatingRowStyle BackColor="#7f77a7" />
                                                    <Columns>
                                                        <asp:BoundField DataField="Detalle" HeaderText="Detalle" SortExpression="Detalle" Visible="true" />
                                                        <asp:BoundField DataField="TipoMercado" HeaderText="TipoMercado" SortExpression="TipoMercado" Visible="true" />
                                                        <asp:BoundField DataField="FechaVector" HeaderText="FechaVector" SortExpression="FechaVector" Visible="true" />
                                                        <asp:BoundField DataField="Tv" HeaderText="Tv" SortExpression="Tv" Visible="true" />
                                                        <asp:BoundField DataField="Emisora" HeaderText="Emisora" SortExpression="Emisora" Visible="true" />
                                                        <asp:BoundField DataField="Serie" HeaderText="Serie" SortExpression="Serie" Visible="true" />
                                                        <asp:BoundField DataField="PrecioSucio" HeaderText="PrecioSucio" SortExpression="PrecioSucio" Visible="true" />
                                                        <asp:BoundField DataField="PrecioLimpio" HeaderText="PrecioLimpio" SortExpression="PrecioLimpio" Visible="true" />
                                                        <asp:BoundField DataField="Divisa" HeaderText="Divisa" SortExpression="Divisa" Visible="true" />
                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCCCC" />
                                                    <HeaderStyle BackColor="#7d3954" ForeColor="White" Font-Bold="false" />
                                                    <PagerSettings FirstPageText="Inicio" LastPageText="Final" />
                                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                    <SelectedRowStyle BackColor="#7f77a7" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                    <SortedAscendingHeaderStyle BackColor="#808080" />
                                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                                </asp:GridView>
                                            </div>
                                            <div class="table-responsive">
                                                <asp:GridView CssClass="table table-bordered table-condensed" ID="gv_079" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="3" ForeColor="Black" GridLines="Vertical" TabIndex="5" PageSize="150" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                                                    <AlternatingRowStyle BackColor="#7f77a7" />
                                                    <Columns>
                                                        <asp:BoundField DataField="Columna1" HeaderText="Columna1" SortExpression="Columna1" Visible="true" />
                                                        <asp:BoundField DataField="Columna2" HeaderText="Columna2" SortExpression="Columna2" Visible="true" />
                                                        <asp:BoundField DataField="Columna3" HeaderText="Columna3" SortExpression="Columna3" Visible="true" />
                                                        <asp:BoundField DataField="Columna4" HeaderText="Columna4" SortExpression="Columna4" Visible="true" />
                                                        <asp:BoundField DataField="Columna5" HeaderText="Columna5" SortExpression="Columna5" Visible="true" />
                                                        <asp:BoundField DataField="Columna6" HeaderText="Columna6" SortExpression="Columna6" Visible="true" />
                                                        <asp:BoundField DataField="Columna7" HeaderText="Columna7" SortExpression="Columna7" Visible="true" />
                                                        <asp:BoundField DataField="Columna8" HeaderText="Columna8" SortExpression="Columna8" Visible="true" />
                                                        <asp:BoundField DataField="Columna9" HeaderText="Columna9" SortExpression="Columna9" Visible="true" />
                                                        <asp:BoundField DataField="Columna10" HeaderText="Columna10" SortExpression="Columna10" Visible="true" />
                                                        <asp:BoundField DataField="Columna11" HeaderText="Columna11" SortExpression="Columna11" Visible="true" />
                                                        <asp:BoundField DataField="Columna12" HeaderText="Columna12" SortExpression="Columna12" Visible="true" />
                                                        <asp:BoundField DataField="Columna13" HeaderText="Columna13" SortExpression="Columna13" Visible="true" />
                                                        <asp:BoundField DataField="Columna14" HeaderText="Columna14" SortExpression="Columna14" Visible="true" />
                                                        <asp:BoundField DataField="Columna15" HeaderText="Columna15" SortExpression="Columna15" Visible="true" />
                                                        <asp:BoundField DataField="Columna16" HeaderText="Columna16" SortExpression="Columna16" Visible="true" />
                                                        <asp:BoundField DataField="Columna17" HeaderText="Columna17" SortExpression="Columna17" Visible="true" />
                                                        <asp:BoundField DataField="Columna18" HeaderText="Columna18" SortExpression="Columna18" Visible="true" />
                                                        <asp:BoundField DataField="Columna19" HeaderText="Columna19" SortExpression="Columna19" Visible="true" />
                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCCCC" />
                                                    <HeaderStyle BackColor="#7d3954" ForeColor="White" Font-Bold="false" />
                                                    <PagerSettings FirstPageText="Inicio" LastPageText="Final" />
                                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                    <SelectedRowStyle BackColor="#7f77a7" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                    <SortedAscendingHeaderStyle BackColor="#808080" />
                                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                                </asp:GridView>
                                            </div>
                                            <div class="table-responsive">
                                                <asp:GridView CssClass="table table-bordered table-condensed" ID="gv_via" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="3" ForeColor="Black" GridLines="Vertical" TabIndex="5" PageSize="150" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                                                    <AlternatingRowStyle BackColor="#7f77a7" />
                                                    <Columns>
                                                        <asp:BoundField DataField="descVIA" HeaderText="Columna1" SortExpression="descVIA" Visible="true" />
                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCCCC" />
                                                    <HeaderStyle BackColor="#7d3954" ForeColor="White" Font-Bold="false" />
                                                    <PagerSettings FirstPageText="Inicio" LastPageText="Final" />
                                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                    <SelectedRowStyle BackColor="#7f77a7" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                    <SortedAscendingHeaderStyle BackColor="#808080" />
                                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                                </asp:GridView>
                                            </div>
                                            <div class="table-responsive">
                                                <asp:GridView CssClass="table table-bordered table-condensed" ID="gv_viasol" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="3" ForeColor="Black" GridLines="Vertical" TabIndex="5" PageSize="150" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                                                    <AlternatingRowStyle BackColor="#7f77a7" />
                                                    <Columns>
                                                        <asp:BoundField DataField="descVIA_SOL" HeaderText="Columna1" SortExpression="descVIA_SOL" Visible="true" />
                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCCCC" />
                                                    <HeaderStyle BackColor="#7d3954" ForeColor="White" Font-Bold="false" />
                                                    <PagerSettings FirstPageText="Inicio" LastPageText="Final" />
                                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                    <SelectedRowStyle BackColor="#7f77a7" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                    <SortedAscendingHeaderStyle BackColor="#808080" />
                                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                                </asp:GridView>
                                            </div>
                                        </div>
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
