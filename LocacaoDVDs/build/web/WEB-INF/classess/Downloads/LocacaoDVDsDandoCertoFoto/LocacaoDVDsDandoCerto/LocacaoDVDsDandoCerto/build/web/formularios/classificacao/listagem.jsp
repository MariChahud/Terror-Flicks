<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<c:set var="prefixo" value="processaClassificacoes?acao=preparar"/>
<!DOCTYPE html>

<html>
    <head>
        <title>Classificações Cadastradas</title>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="${cp}/img/logo.png" type="image/png">
        <link rel="stylesheet"
              href="${cp}/css/estilos.css"/>
    </head>

    <body>

        <header>
            <h1>Classificações Cadastradas</h1>
            <nav>
            </nav>
        </header>

        <div class="conteudo">
            <div class="links-superiores">
                <a href="${cp}/formularios/classificacao/novo.jsp" class="btn-principal">
                    Cadastrar Classificação
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
                            <th>Descrição</th>
                            <th>Alterar</th>
                            <th>Excluir</th>
                        </tr>
                    </thead>
                    <tbody>
                        <jsp:useBean 
                            id="servicos"
                            scope="page"
                            class="locacaodvds.servicos.ClassificacaoServices"/>

                        <c:forEach items="${servicos.getTodos()}" var="classificacao">
                            <tr>
                                <td>${classificacao.id}</td>
                                <td>${classificacao.descricao}</td>
                                <td>
                                    <a href="${cp}/${prefixo}Alteracao&id=${classificacao.id}" class="btn-acao btn-principal">
                                        Alterar
                                    </a>
                                </td>
                                <td>
                                    <a href="${cp}/${prefixo}Exclusao&id=${classificacao.id}" class="btn-acao btn-principal">
                                        Excluir
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

    </body>
</html>