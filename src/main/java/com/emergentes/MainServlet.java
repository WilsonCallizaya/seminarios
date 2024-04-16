
import com.emergentes.Estudiante;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;

@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

       @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");
           Estudiante miestu= new Estudiante();
           int id, pos;
           HttpSession ses= request.getSession();
           ArrayList<Estudiante> inscritos= (ArrayList<Estudiante>)ses.getAttribute("seminarios");
        switch(op){
            case "nuevo": 
                request.setAttribute("miestudent", miestu);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "editar":
                id=Integer.parseInt(request.getParameter("id"));
                pos=buscarIndice(request,id);
                miestu=inscritos.get(pos);
                request.setAttribute("miestudent", miestu);
                request.getRequestDispatcher("editar.jsp").forward(request,response);
                break;
            case "eliminar":
                id=Integer.parseInt(request.getParameter("id"));
                pos=buscarIndice(request,id);
                if( pos>=0){
                    inscritos.remove(pos);
                }
                request.setAttribute("miestudent", inscritos);
                response.sendRedirect("index.jsp");
            break;
        default:
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        HttpSession ses= request.getSession();
         ArrayList<Estudiante> inscritos =(ArrayList<Estudiante>) ses.getAttribute("seminarios");
         Estudiante miestu= new Estudiante();
         miestu.setId(id);
         miestu.setFecha(request.getParameter("fecha"));
         miestu.setNombre(request.getParameter("nombre"));
         miestu.setApellido(request.getParameter("apellido"));
         miestu.setTurno(request.getParameter("turno"));
         
         String[] seminariosSeleccionados = request.getParameterValues("seminario");
         if (seminariosSeleccionados != null) {
            StringBuilder seminarios = new StringBuilder();
            for (String seminario : seminariosSeleccionados) {
                seminarios.append(seminario);
                seminarios.append(", ");
            }
            seminarios.setLength(seminarios.length() - 2);
            miestu.setSeminario(seminarios.toString());
        }
         if(id == 0){
             int idNuevo=crearId(request);
             miestu.setId(idNuevo);
             inscritos.add(miestu);
         }
         else{
             int pos=buscarIndice(request,id);
             inscritos.set(pos,miestu);
         }
         request.setAttribute("seminarios", inscritos);
         response.sendRedirect("index.jsp");
    }
    
    public int buscarIndice(HttpServletRequest request, int id){
        HttpSession ses= request.getSession();
        ArrayList<Estudiante> inscritos = (ArrayList<Estudiante>) ses.getAttribute("seminarios");
        int pos=-1;
         if(inscritos != null){
             for(Estudiante ele: inscritos){
                 ++pos;
                 if( ele.getId()==id){
                     break;
                 }
             }
         }
         return pos;
    }
    public int crearId(HttpServletRequest request){
        HttpSession ses= request.getSession();
        ArrayList<Estudiante> calificaciones=(ArrayList<Estudiante>) ses.getAttribute("seminarios");
        int idn=0;
        for (Estudiante ele: calificaciones){
            idn=ele.getId();
        }
        return idn+1;
    }
}

