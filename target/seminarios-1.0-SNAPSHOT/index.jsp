<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.Estudiante"%>
<%
    if(session.getAttribute("seminarios")== null){
        ArrayList<Estudiante> inscritos= new ArrayList<Estudiante>();
        session.setAttribute("seminarios", inscritos);
    }
    ArrayList<Estudiante> inscritos =(ArrayList<Estudiante>) session.getAttribute("seminarios");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seminarios</title>
        <style>
        body {
            text-align: center; /* Alineación del texto al centro */
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: 10px auto;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
            display: inline-block; 
            text-align: left;
        }
        .titulo {
            width: 50%;
            margin: 10px auto;
            border: 1px solid #ccc;
            border-radius: 1px;
            background-color: #f9f9f9;
            display: inline-block; 
            text-align: center;
        }
        table {
            width: 90%;
            border-collapse: collapse;
            margin: 0 auto;
        }

        </style>
    </head>
    <body>
    <h2>Lista de Inscritos</h2>
<a href="MainServlet?op=nuevo">Nuevo</a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>FECHA</th>
            <th>NOMBRE</th>
            <th>APELLIDOS</th>
            <th>TURNO</th>
            <th>SEMINARIOS</th>
            <th></th>
            <th></th>
        </tr>
        <%
            if (inscritos != null){
                for(Estudiante item: inscritos){
                    
                
            %>
        <tr>
            <td><%= item.getId() %></td>
            <td><%= item.getFecha()%></td>
            <td><%= item.getNombre()%></td>
            <td><%= item.getApellido()%></td>
            <td><%= item.getTurno()%></td>
            <td><%= item.getSeminario()%></td>
            <td><a href="MainServlet?op=editar&id=<%= item.getId() %>">Editar</a></td>
            <td><a href="MainServlet?op=eliminar&id=<%= item.getId() %>"
                   onclick="return(confirm('¿Seguro desea eliminar?'))">Borrar</a></td>
        </tr>
        <%
            }
            }
            %>
    </table>
    </body> 
</html>
