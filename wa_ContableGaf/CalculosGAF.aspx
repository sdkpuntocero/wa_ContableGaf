<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CalculosGAF.aspx.cs" Inherits="wa_ContableGaf.CalculosGAF" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="es-mx">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/fontawesome-free-5.9.0-web/css/all.min.css" rel="stylesheet" />
    <link href="Estilos/MenuVertical.css" rel="stylesheet" />

    <title>Cálculos GAF</title>
</head>
<body>

    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="container-fluid">

            <div class="wrapper">
                <!-- Sidebar Holder -->
                <nav id="sidebar">
                    <div class="sidebar-header">
                        <h3>GAF Operadora</h3>
                    </div>

                    <ul class="list-unstyled components">

                        <p>

                     <%--       <asp:LinkButton CssClass="buttonClass" ID="LinkButton2" runat="server" Font-Size="Smaller">
                                <asp:Label ID="Label2" runat="server" Text="" Font-Size="Smaller"></asp:Label>&nbsp;<i class="fa fa-male" id="i2" runat="server"></i>
                            </asp:LinkButton>
                            <br />
                            <asp:LinkButton CssClass="buttonClass" ID="LinkButton3" runat="server" Font-Size="Smaller">
                                <asp:Label ID="Label3" runat="server" Text=""></asp:Label>&nbsp;<i class="fa fa-male" id="i3" runat="server"></i>
                            </asp:LinkButton>
                            <br />--%>
                            <asp:LinkButton CssClass="buttonClass" ID="LinkButton1" runat="server" Font-Size="Smaller">
                                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>&nbsp;<i class="fa fa-male" id="i1" runat="server"></i>
                            </asp:LinkButton>
                            <br />
                        </p>

                        <li runat="server" id="li_PreOperativos"></li>
                        <li runat="server" id="li_Operativos"></li>
                        <li runat="server" id="li_PosOperativos"></li>
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
                                            <li class="nav-item text-center"></li>
                                        </ul>
                                    </div>
                                </div>
                            </nav>
                        </ContentTemplate>
                        <Triggers>
                        </Triggers>
                    </asp:UpdatePanel>

                    <asp:UpdatePanel ID="upPreOperativos" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>

                            <div class="row" runat="server" id="div_preoperativos" visible="true">
                                <div class="col-xl-2">
                                    <asp:DropDownList CssClass="form-control input-box" ID="ddlArea" runat="server" TabIndex="1" required="required" AutoPostBack="true" OnSelectedIndexChanged="ddlArea_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="col-xl-2">
                                    <asp:DropDownList CssClass="form-control input-box" ID="ddlOperadora" runat="server" TabIndex="2" required="required" AutoPostBack="true" OnSelectedIndexChanged="ddlOperadora_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="col-xl-2">
                                    <asp:DropDownList CssClass="form-control input-box" ID="ddlFondos" runat="server" TabIndex="3" required="required" AutoPostBack="true" OnSelectedIndexChanged="ddlFondos_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="col-xl-2">
                                    <asp:DropDownList CssClass="form-control input-box" ID="ddlSeries" runat="server" TabIndex="4" required="required" AutoPostBack="true"></asp:DropDownList>
                                </div>
                            </div>
                            <br />

                            <div class="row" runat="server" id="div1" visible="true">
                                <div class="col-xl-6">

                                    <li class="list-group-item">Valor a Mercado
                                                        <span class="badge badge-light">
                                                            <asp:Label CssClass="font-weight-normal" ID="lblValorMercado" runat="server" Text=""></asp:Label></span>
                                        <ul class="list-group inner">
                                            <li class="list-group-item">Resultado por Val. a Valor Razonable <span class="badge badge-light">
                                                <asp:Label CssClass="font-weight-normal" ID="lblValorRazonable" runat="server" Text=""></asp:Label></span></li>

                                            <li class="list-group-item">Ingresos por intereses <span class="badge badge-light">
                                                <asp:Label CssClass="font-weight-normal" ID="lblIntereses" runat="server" Text=""></asp:Label></span></li>
                                        </ul>
                                    </li>
                                    <table class="table table-bordered table-condensed">
                                        <thead>
                                        </thead>
                                        <tbody>

                                            <td></td>

                                            <tr>
                                                <td>Comisión sobre Saldo
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>

                                                <td>-Comisión S/Saldo AFORE
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>-Comisión S/Saldo Trabajadores
                                                </td>
                                                <td></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
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
    <script>
</script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
