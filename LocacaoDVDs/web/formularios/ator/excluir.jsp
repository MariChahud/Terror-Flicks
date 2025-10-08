<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Excluir Atores</title>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="${cp}/img/logo.png" type="image/png">
    <link rel="stylesheet"
          href="${cp}/css/estilos.css"/>
  </head>

  <body>
      
    <header>
        <h1>Excluir Ator</h1>
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
            <form method="post" action="${cp}/processaAtores">
                <input name="acao" type="hidden" value="excluir"/>
                <input name="id" type="hidden" value="${requestScope.ator.id}"/>

                <table class="tabelaListagem">
                    <tr>
                        <td class="alinharDireita">Nome:</td>
                        <td class="dado-exclusao">${requestScope.ator.nome}</td>
                    </tr>
                    
                    <tr>
                        <td class="alinharDireita">Sobrenome:</td>
                        <td class="dado-exclusao">${requestScope.ator.sobrenome}</td>
                    </tr>
                    
                    <tr>
                        <td class="alinharDireita">Data de Estreia:</td>
                        <td class="dado-exclusao">${requestScope.ator.dataEstreia}</td>
                    </tr>

                    <tr>
                        <td>
                            <a href="${cp}/formularios/ator/listagem.jsp" class="btn-principal">
                                Voltar
                            </a>
                        </td>
                        <td class="alinharDireita">
                            <input type="submit" value="Excluir" class="btn-excluir-form"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

  </body>
</html>