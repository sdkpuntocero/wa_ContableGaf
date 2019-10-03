<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="wa_ContableGaf.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            font-family: Arial;
        }

        .modal {
            position: fixed;
            z-index: 999;
            height: 100%;
            width: 100%;
            top: 0;
            background-color: Black;
            filter: alpha(opacity=60);
            opacity: 0.6;
            -moz-opacity: 0.8;
        }

        .center {
            z-index: 1000;
            margin: 300px auto;
            padding: 10px;
            width: 60px;
            border-radius: 10px;
            filter: alpha(opacity=100);
            opacity: 1;
            -moz-opacity: 1;
        }
    </style>

    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
        </asp:ScriptManager>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
            <ProgressTemplate>
                <div class="modal">
                    <div class="center">
                        <img alt="" src="Img/ajax-loader.gif" />
                    </div>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div align="center" />

                <asp:Button ID="Button1" Text="Submit" runat="server" OnClick="Button1_Click" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="menuContainer"></div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Panel ID="PnlRe" Style="display: none;" runat="server">
            <asp:UpdatePanel ID="UpdtPnlDetail" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Wizard ID="wzd" runat="server">
                        <WizardSteps ID="WizardStep3" runat="server" Title="Naam">
                         <asp:Gridview ID="Gridview1" runat="server" AutoGenerateColumns="False"
                                DataKeyNames="GastID,Versie" DataSourceID="odsGasten" EmptyDataText="...."
                                OnRowCommand="Gridview1_RowCommand" OnPageIndexChanging="Gridview1_PageIndexChanging"
                                OnPageSizeChanging="Gridview1_PageSizeChanging" OnSearching="Gridview1_Searching"
                                OnSorting="Gridview1_Sorting" OnRowDataBound="Gridview1_RowDataBound"
                                CausesValidation="False" meta:resourcekey="..." PagerType="Custom"
                                ShowFilter="True" ShowInsertRecord="True" ShowPageSizer="True" UseSubmitBehaviour="False">
                                <columns>
                                   <asp:TemplateField ShowHeader="False" meta:resourcekey="...">
                                       <ItemTemplate>
                                           <asp:ImageButton runat="server" CommandName="Select" CausesValidation="False" SkinID="uprowbutton"
                                               ToolTip="..." ID="ImgBtnSelect" meta:resourcekey="...">
                                           </asp:ImageButton>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                               </columns>
                            </asp:Gridview>
                        <
                        </WizardSteps>
                    </asp:Wizard>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    </form>
</body>
<script>
    $(document).ready(function () {
        $('.menuContainer').load('./sub/HtmlPage1.html');
    });
</script>
</html>
  