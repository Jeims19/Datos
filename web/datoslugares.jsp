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
        String s_iddepartamento;
        
        %>
    </head>
    <body>
        <table border="1" align="center">
            
            <thead>
            <th> # </th>
            <th>NOMBRE</th>
            <th>ESTADO</th>
            <th>ELIMINAR</th>
            <th>EDITAR</th>
                
                
            </thead>

      <%
            try{
                ConectaBd bd = new ConectaBd();  //hace la coneccion
                cn = bd.getConnection();
                
                s_accion= request.getParameter("f_accion");
                s_iddepartamento= request.getParameter("f_iddepartamento");
                
                 if(s_accion != null){
                     if(s_accion.equals("E")){
                     consulta= "delete from departamento "
                             + " where"
                             + " iddepartamento =  " +   s_iddepartamento + "; ";
                             out.print(consulta);
                           pst = cn.prepareStatement(consulta);  
                           pst.executeUpdate();
                     }
                 
                 }
                consulta="Select iddepartamento, nombre, estado " + " from departamento"; //hace la consulta
                
                pst = cn.prepareStatement(consulta);
                rs = pst.executeQuery();
                int num = 0;
                while(rs.next()){
                    String ide = rs.getString(1);
                    num++;
                    %>
                    <tr>
                        <td><%out.print(num);%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%out.print(rs.getString(3));%></td> 
                        <td><a href="datoslugares.jsp?f_accion=E&f_iddepartamento=<%out.print(ide);%>">eliminar</a></td>
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


