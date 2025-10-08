<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<c:set var="prefixo" value="processaAtores?acao=preparar"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Atores Cadastrados</title>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="${cp}/img/logo.png" type="image/png">
    <link rel="stylesheet"
          href="${cp}/css/estilos.css"/>
  </head>

  <body>
      
      <header>
        <h1>Atores Cadastrados</h1>
        <nav>
        </nav>
    </header>
        
        <div class="conteudo">
        <!-- Links organizados horizontalmente acima da tabela -->
        <div class="links-superiores">
            <a href="${cp}/formularios/ator/novo.jsp" class="btn-principal">
                Cadastrar Ator
            </a>
            <a href="${cp}/index.jsp" class="btn-principal">
                Tela Principal
            </a>
        </div>


    <div class="tabela-container">
            <table class="tabelaListagem">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nome</th>
                        <th>Sobrenome</th>
                        <th>Data de Estreia</th>
                        <th>Alterar</th>
                        <th>Excluir</th>
                    </tr>
                </thead>
                <tbody>

        <jsp:useBean
            id="servicos"
            scope="page"
            class="locacaodvds.servicos.AtorServices"/>

        <c:forEach items="${servicos.todos}" var="ator">
          <tr>
            <td>${ator.id}</td>
            <td>${ator.nome}</td>
            <td>${ator.sobrenome}</td>
            <td>${ator.dataEstreia}</td>
            <td>
              <a href="${cp}/${prefixo}Alteracao&id=${ator.id}" class="btn-principal">
                Alterar
              </a>
            </td>
            <td>
              <a href="${cp}/${prefixo}Exclusao&id=${ator.id}" class="btn-principal">
                Excluir
              </a>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>


  </body>

</html>
