<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="locacaodvds.dao.DvdDAO, locacaodvds.entidades.Dvd, java.util.List, java.util.ArrayList" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<%
    List<Dvd> listaDvds = new ArrayList<>();
    String errorMessage = null;
    DvdDAO dao = null;
    try {
        dao = new DvdDAO();
        listaDvds = dao.listarTodos();
    } catch (Exception e) {
        errorMessage = "ERRO AO BUSCAR DADOS: " + e.toString();
        e.printStackTrace();
    } finally {
        if (dao != null) {
            try { dao.fecharConexao(); } catch (Exception e) { e.printStackTrace(); }
        }
    }
    request.setAttribute("listaDvds", listaDvds);
    request.setAttribute("errorMessage", errorMessage);
%>

<!DOCTYPE html>
<html>
<head>
    <title>DVDs Cadastrados</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="${cp}/img/logo.png" type="image/png">
    <link rel="stylesheet" href="${cp}/css/estilos.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@700&family=Roboto:wght@300;400&display=swap" rel="stylesheet">
</head>
<body>
    <div class="grain-overlay"></div>
    <header><h1>Acervo Amaldiçoado</h1></header>

    <div class="conteudo">
        <div class="links-superiores">
            <a href="${cp}/processaDvds?acao=prepararInsercao" class="btn-principal">Cadastrar DVD</a>
            <a href="${cp}/" class="btn-principal">Tela Principal</a>
        </div>
        
        <div class="tabela-container">
            <c:if test="${not empty errorMessage}">
                <p class="aviso-erro">${errorMessage}</p>
            </c:if>
            <c:if test="${empty listaDvds && empty errorMessage}">
                <p class="aviso-vazio">Nenhum DVD encontrado no catálogo.</p>
            </c:if>

            <div class="catalog-grid">
                <c:forEach items="${listaDvds}" var="dvd">
                    <div class="movie-card">
                        <img src="${dvd.urlCartaz}" alt="Cartaz do filme ${dvd.titulo}" onerror="this.onerror=null;this.src='${cp}/img/poster-placeholder.png';">
                        <div class="movie-info">
                            <h3>${dvd.titulo}</h3>
                            <p>
                                ${not empty dvd.genero ? dvd.genero.descricao : 'Sem Gênero'} • ${dvd.anoLancamento}
                            </p>
                            
                            <div class="movie-actions">
                                <a href="${cp}/processaDvds?acao=prepararAlteracao&id=${dvd.id}" class="btn-acao btn-alterar">Alterar</a>
                                <a href="${cp}/processaDvds?acao=prepararExclusao&id=${dvd.id}" class="btn-acao btn-excluir">Excluir</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    
    <footer><p>&copy; 2025 - Terror Flicks Web Catalog</p></footer>
</body>
</html>