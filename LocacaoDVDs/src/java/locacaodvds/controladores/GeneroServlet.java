package locacaodvds.controladores;

import locacaodvds.dao.GeneroDAO;
import locacaodvds.entidades.Genero;
import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name = "GeneroServlet", urlPatterns = { "/processaGeneros" })
public class GeneroServlet extends jakarta.servlet.http.HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");
        GeneroDAO dao = null;
        RequestDispatcher disp = null;

        try {
            dao = new GeneroDAO();

            if (acao.equals("inserir")) {
                String descricao = request.getParameter("descricao");

                Genero g = new Genero();
                g.setDescricao(descricao);

                dao.salvar(g);
                
                disp = request.getRequestDispatcher(
                 "/formularios/genero/listagem.jsp" );

            } else if (acao.equals("alterar")) {
                int id = Integer.parseInt(request.getParameter("id"));
                String descricao = request.getParameter("descricao");

                Genero g = new Genero();
                g.setId(id);
                g.setDescricao(descricao);

                dao.atualizar(g);

                disp = request.getRequestDispatcher("/formularios/genero/listagem.jsp");

            } else if (acao.equals("excluir")) {
                int id = Integer.parseInt(request.getParameter("id"));

                Genero g = new Genero();
                g.setId(id);

                dao.excluir(g);

                disp = request.getRequestDispatcher("/formularios/genero/listagem.jsp");

            } else {
                int id = Integer.parseInt(request.getParameter("id"));
                Genero g = dao.obterPorId(id);
                request.setAttribute("genero", g);

                if ("prepararAlteracao".equals(acao)) {
                    disp = request.getRequestDispatcher("/formularios/genero/alterar.jsp");
                } else if ("prepararExclusao".equals(acao)) {
                    disp = request.getRequestDispatcher("/formularios/genero/excluir.jsp");
                }
            }

        } catch (SQLException exc) {
            exc.printStackTrace();
        } finally {
            if (dao != null) {
                try {
                    dao.fecharConexao();
                } catch (SQLException exc) {
                    exc.printStackTrace();
                }
            }
        }

        if (disp != null) {
            disp.forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    public String getServletInfo() {
        return "GeneroServlet";
    }
}
