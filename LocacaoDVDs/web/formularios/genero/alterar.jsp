<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Alterar Gênero</title>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="${cp}/img/logo.png" type="image/png">
    <link rel="stylesheet"
          href="${cp}/css/estilos.css"/>
  </head>

  <body>
      
    <header>
        <h1>Alterar Gênero</h1>
        <nav>
        </nav>
    </header>
        
    <div class="conteudo">
        <div class="links-superiores">
            <a href="${cp}/index.jsp" class="btn-principal">
                Tela Principal
            </a>
        </div>

        <div class="tabela-container">
            <form method="post" action="${cp}/processaGeneros">
                <input name="acao" type="hidden" value="alterar"/>
                <input name="id" type="hidden" value="${requestScope.genero.id}"/>

                <table class="tabelaListagem">
                    <tr>
                        <td class="alinharDireita">Descrição:</td>
                        <td>
                            <input name="descricao"
                                   type="text"
                                   size="15"
                                   maxlength="45"
                                   required
                                   value="${requestScope.genero.descricao}"
                                   class="form-input-pequeno"/>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <a href="${cp}/formularios/genero/listagem.jsp" class="btn-principal">
                                Voltar
                            </a>
                        </td>
                        <td class="alinharDireita">
                            <input type="submit" value="Alterar" class="btn-principal"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

  </body>
</html>