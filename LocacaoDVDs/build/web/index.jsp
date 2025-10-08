<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
    <head>
        <title>Terror Flicks - Web Catalog</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="icon" href="${cp}/img/logo.png" type="image/png">
        <link rel="stylesheet" href="${cp}/css/telaPrincipal.css"/>
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@700&family=Roboto:wght@300;400&display=swap" rel="stylesheet">
    </head>

    <body>
        
        <div class="grain-overlay"></div>

        <header>
            <div class="logo-container">
                <img src="${cp}/img/logo.png" alt="Terror Flicks Logo">
                <h1>TERROR FLICKS</h1>
            </div>
            <nav>
                <a href="${cp}/formularios/ator/listagem.jsp">Atores</a>
                <a href="${cp}/formularios/genero/listagem.jsp">Gêneros</a>
                <a href="${cp}/formularios/classificacao/listagem.jsp">Classificação Etária</a>
                <a href="${cp}/formularios/dvd/listagem.jsp">DVDs</a>
            </nav>
        </header>

        <div class="conteudo">
        </div>

        <footer>
            <p>&copy; 2025 - Terror Flicks Web Catalog</p>
        </footer>
        
    </body>
</html>