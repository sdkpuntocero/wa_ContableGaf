<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="wa_ContableGaf.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="es-mx">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <link rel="stylesheet" href="https://cdn.metroui.org.ua/v4/css/metro-all.min.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <br />

            <div >
                <table class="table striped table-border mt-4"
                    data-role="table"
                    data-rows="5"
                    data-rows-steps="5, 10"
                    data-show-activity="false"
                   
                    data-rownum="true"
                    data-check="true"
                    data-check-style="2">
                    <thead>
                        <tr>
                            <th data-sortable="true" data-sort-dir="asc">Name</th>
                            <th data-sortable="true">Office</th>
                            <th data-sortable="true" data-format="number">Age</th>
                            <th data-sortable="true" data-format="date">Start date</th>
                            <th data-sortable="true" data-show="false" data-format="money">Salary</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>a</td>
                            <td>uno</td>
                            <td>61</td>
                            <td>2011/04/25</td>
                            <td>$320,800</td>
                        </tr>
                        <tr>
                            <td>b</td>
                            <td>dos</td>
                            <td>61</td>
                            <td>2011/04/25</td>
                            <td>$320,800</td>
                        </tr>
                        <tr>
                            <td>c</td>
                            <td>tres</td>
                            <td>61</td>
                            <td>2011/04/25</td>
                            <td>$320,800</td>
                        </tr>
                        <tr>
                            <td>d</td>
                            <td>4</td>
                            <td>61</td>
                            <td>2011/04/25</td>
                            <td>$320,800</td>
                        </tr>
                        <tr>
                            <td>e</td>
                            <td>cinco</td>
                            <td>61</td>
                            <td>2011/04/25</td>
                            <td>$320,800</td>
                        </tr>
                        <tr>
                            <td>f</td>
                            <td>seis</td>
                            <td>61</td>
                            <td>2011/04/25</td>
                            <td>$320,800</td>
                        </tr>
                        
                    </tbody>
                </table>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.metroui.org.ua/v4/js/metro.min.js"></script>
</body>
</html>
