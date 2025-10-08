<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Excluir DVD</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="${cp}/img/logo.png" type="image/png">
    <link rel="stylesheet" href="${cp}/css/estilos.css"/>
  </head>

  <body>
      
    <header>
        <h1>Excluir DVD</h1>
        <nav>
            <a href="${cp}/formularios/dvd/listagem.jsp">Lista de DVDs</a>
            <a href="${cp}/index.jsp">Tela Principal</a>
        </nav>
    </header>
        
    <div class="conteudo">
        <div class="links-superiores">
            <a href="${cp}/formularios/dvd/listagem.jsp" class="btn-principal">
                Lista de DVDs
            </a>
            <a href="${cp}/index.jsp" class="btn-principal">
                Tela Principal
            </a>
        </div>

        <div class="tabela-container">
            <form method="post" action="${cp}/processaDvds">
                <input name="acao" type="hidden" value="excluir"/>
                <input name="id" type="hidden" value="${requestScope.dvd.id}"/>

                <table class="tabelaListagem">
                    <tr>
                        <td class="alinharDireita">Título:</td>
                        <td class="dado-exclusao">${requestScope.dvd.titulo}</td>
                    </tr>

                    <tr>
                        <td class="alinharDireita">Ano de Lançamento:</td>
                        <td class="dado-exclusao">${requestScope.dvd.anoLancamento}</td>
                    </tr>

                    <tr>
                        <td class="alinharDireita">Data de Lançamento:</td>
                        <td class="dado-exclusao">${requestScope.dvd.dataLancamento}</td>
                    </tr>

                    <tr>
                        <td class="alinharDireita">Duração (minutos):</td>
                        <td class="dado-exclusao">${requestScope.dvd.duracaoMinutos}</td>
                    </tr>
                    
                    <tr>
                        <td class="alinharDireita">Ator Principal:</td>
                        <td class="dado-exclusao">
                            ${requestScope.dvd.atorPrincipal.nome} ${requestScope.dvd.atorPrincipal.sobrenome}
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="alinharDireita">Ator Coadjuvante:</td>
                        <td class="dado-exclusao">
                            ${requestScope.dvd.atorCoadjuvante.nome} ${requestScope.dvd.atorCoadjuvante.sobrenome}
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="alinharDireita">Gênero:</td>
                        <td class="dado-exclusao">${requestScope.dvd.genero.descricao}</td>
                    </tr>
                    
                    <tr>
                        <td class="alinharDireita">Classificação:</td>
                        <td class="dado-exclusao">${requestScope.dvd.classificacaoEtaria.descricao}</td>
                    </tr>

                    <tr>
                        <td>
                            <a href="${cp}/formularios/dvd/listagem.jsp" class="btn-principal">
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