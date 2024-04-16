
<%@page import="java.util.Arrays"%>
<%@page import="com.emergentes.Estudiante"%>
<%
    Estudiante est= (Estudiante) request.getAttribute("miestudent");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seminarios</title>
        <style>
        body {
            text-align: center;
            margin: 0;
            padding: 0;
        }
        label{
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
            width: 50%;
            border-collapse: collapse;
            text-align: left;
            margin: 0 auto;
        }

        </style>
    </head>
    <body>
    <h2>Registro de Seminarios</h2>

 
        <form action="MainServlet" method="post">
        <table border="1" cellspacing="2">
            <tr>
                <th>
                    Datos
                </th>
                <th>
                    Seminarios Disponibles
                </th>     
            </tr>
            <td>
                <label for="id">Id:</label><input type="text" id="id" name="id" value="<%=est.getId()%>" readonly> <br> 
                <label for="fecha">Fecha:</label><input type="date" id="fecha" name="fecha" value="<%= est.getFecha() %>">
                <label for="nombre">Nombre:</label><input type="text" id="nombre" name="nombre" value="<%=est.getNombre()%>"  placeholder>   <br>                    
                <label for="apellido">Apellidos:</label><input type="text" id="apellido" name="apellido" value="<%=est.getApellido()%>"  max="30" placeholder=""> <br>         
                <label for="turno">Turno:</label>              
                <input type="radio" id="op1" name="turno" value="Mañana" <%=est.getTurno().equals("Mañana") ? "checked" : ""%>><label for="op1">Mañana</label>
                <input type="radio" id="op2" name="turno" value="Tarde" <%=est.getTurno().equals("Tarde") ? "checked" : ""%>><label for="op2">Tarde</label>
                <input type="radio" id="op3" name="turno" value="noche" <%=est.getTurno().equals("Noche") ? "checked" : ""%>><label for="op3">Noche</label>         
                
            </td>
            <td>
                <input type="checkbox" id="op1" name="seminario" value="Inteligencia Artificial" <%= Arrays.asList(est.getSeminario()).contains("Inteligencia Artificial") ? "checked" : "" %>><label for="op1">Inteligencia Artificial</label><br>   
                <input type="checkbox" id="op2" name="seminario" value="Machine Learning" <%= Arrays.asList(est.getSeminario()).contains("Machine Learning") ? "checked" : "" %>><label for="op2">Machine Learning</label><br>   
                <input type="checkbox" id="op3" name="seminario" value="Simulacion con Arena" <%= Arrays.asList(est.getSeminario()).contains("Simulacion con Arena") ? "checked" : "" %>><label for="op3">Simulacion con Arena</label><br>   
                <input type="checkbox" id="op4" name="seminario" value="Robotica Educativa" <%= Arrays.asList(est.getSeminario()).contains("Robotica Educativa") ? "checked" : "" %>><label for="op4">Robotica Educativa</label><br>   

            </td>
                
          
        </table>
            <div><input type="submit" value="Enviar"></div>
        
    </form>
    </body>
</html>
