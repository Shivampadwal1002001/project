<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>

<head>
    <meta charset="ISO-8859-1">
    <title>Data Graph</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>

    <style>
        a {
            color: white;
        }

        a:hover {
            color: white;
            text-decoration: none;
        }
    </style>

</head>

<body>

    <div class="container">
        <div id="container">
            <h1 class="p-3" align="center"> Data Graph </h1>
        </div>

        <button type="button" class="btn btn-success btn-block">
            <a href=""> back </a>
        </button>
    </div>

     <%
       try{
       		Connection con= ConnectionProvider.getCon();
       		Statement st= con.createStatement();
       		ResultSet rs= st.executeQuery("select *from product");
       			
       		while(rs.next())
       		{

  	   %>
    <script th:inline="javascript">
        window.onload = function () {
            var strname = "<%=rs.getString(2) %>";
            strName = strName.substring(1, strname.length - 1);
            var strprice = "<%=rs.getString(4) %>";
            strSales = strSales.substring(1, strprice.length - 1);


            var pricevalue = [];
           
            pricevalue.push(parseInt(price[i]));
            


            Highcharts.chart('container', {
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'Products'
                },
                subtitle: {
                    text: 'Sales Figures'
                },
                xAxis: {
                    categories: names,
                    crosshair: true
                },
                yAxis: {
                    min: 0,
                    max: 50,
                    title: {
                        text: 'price'
                    }
                },
                tooltip: {
                    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                },
                series: [{
                    name: 'price',
                    data: pricevalue
                }]
            });
        }

    </script>

<%
   }
   }
catch(Exception e){
       System.out.println(e);
    }
%>
</body>
