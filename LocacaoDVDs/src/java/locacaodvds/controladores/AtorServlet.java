package locacaodvds.controladores;

import locacaodvds.dao.AtorDAO;
import locacaodvds.entidades.Ator;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "AtorServlet", urlPatterns = { "/processaAtores" })
public class AtorServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");
        AtorDAO dao = null;
        RequestDispatcher disp = null;

        try {
            dao = new AtorDAO();

            if ("inserir".equals(acao)) {
                String nome = request.getParameter("nome");
                String sobrenome = request.getParameter("sobrenome");
                String dataStr = request.getParameter("data_estreia");
                java.sql.Date dataEstreia = java.sql.Date.valueOf(dataStr);


                Ator ator = new Ator();
                ator.setNome(nome);
                ator.setSobrenome(sobrenome);
                ator.setDataEstreia(dataEstreia);

                dao.salvar(ator);
                
                disp = request.getRequestDispatcher(
                 "/formularios/ator/listagem.jsp" );

            } else if (acao.equals("alterar")) {
                int id = Integer.parseInt(request.getParameter("id"));
                String nome = request.getParameter("nome");
                String sobrenome = request.getParameter("sobrenome");
                String dataStr = request.getParameter("data_estreia");
                java.sql.Date dataEstreia = java.sql.Date.valueOf(dataStr);


                Ator ator = new Ator();
                ator.setId(id);
                ator.setNome(nome);
                ator.setSobrenome(sobrenome);
                ator.setDataEstreia(dataEstreia);

                dao.atualizar(ator);

                disp = request.getRequestDispatcher("/formularios/ator/listagem.jsp");

            } else if (acao.equals("excluir")) {
                int id = Integer.parseInt(request.getParameter("id"));

                Ator ator = new Ator();
                ator.setId(id);

                dao.excluir(ator);

                disp = request.getRequestDispatcher("/formularios/ator/listagem.jsp");

            } else {
                int id = Integer.parseInt(request.getParameter("id"));
                Ator ator = dao.obterPorId(id);
                request.setAttribute("ator", ator);

                if ("prepararAlteracao".equals(acao)) {
                    disp = request.getRequestDispatcher("/formularios/ator/alterar.jsp");
                } else if ("prepararExclusao".equals(acao)) {
                    disp = request.getRequestDispatcher("/formularios/ator/excluir.jsp");
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "AtorServlet";
    }
}
