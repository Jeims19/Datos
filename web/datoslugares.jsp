<%@page import= "java.sql.*" %>
<%@page import= "bd.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DATOS</title>
        <%  
        String consulta;
        Connection cn;
        PreparedStatement pst;
        ResultSet rs;
        String s_accion;
        String s_idpersona;
        
        %>
    </head>
    <body>
        <table border="1" align="center">
            
            <thead>
            <th>ID</th>
            <th>NOMBRE</th>
            <th>ESTADO</th>
            <th>ELIMINAR</th>
            <th>EDITAR</th>
                
                
            </thead>

      <%
            try{
                ConectaBd bd = new ConectaBd();  //hace la coneccion
                cn = bd.getConnection();
                consulta="Select iddepartamento, nombre, estado " + " from departamento"; //hace la consulta
                out.print(consulta);
                pst = cn.prepareStatement(consulta);
                rs = pst.executeQuery();
                while(rs.next()){
                    %>
                    <tr>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%out.print(rs.getString(3));%></td> 
                        <td>ELIMINAR</td>
                        <td>EDITAR</td>
                    </tr>
                    
                    
                    <%
                   
                }
            }catch(Exception e){
                out.print("error SQL");
            }
      %>
       </table>
    </body>
</html>

<table border="1">
    <thead>
        <tr>
            <th></th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
        </tr>
    </tbody>
</table>
