<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
<head>
    <title>Alterar DVD</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="${cp}/img/logo.png" type="image/png">
    <link rel="stylesheet" href="${cp}/css/estilos.css"/>
</head>
<body>
      
    <header>
        <h1>Alterar DVD</h1>
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
            <form method="post" action="${cp}/processaDvds">
                <input type="hidden" name="acao" value="alterar"/>
                <input type="hidden" name="id" value="${requestScope.dvd.id}"/>

                <table class="tabelaListagem">
                    <tr>
                        <td class="alinharDireita">Título:</td>
                        <td>
                            <input type="text"
                                   name="titulo" 
                                   size="20" 
                                   maxlength="100"
                                   value="${requestScope.dvd.titulo}"
                                   required
                                   class="form-input-pequeno"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">URL do Cartaz:</td>
                            <td>
                                <input name="urlCartaz"
                                       type="text" 
                                       maxlength="255" 
                                       value="${requestScope.dvd.urlCartaz}"
                                       required
                                       class="form-input-pequeno"/>
                            </td>
                        </tr>
                    <tr>
                        <td class="alinharDireita">Ano de Lançamento:</td>
                        <td>
                            <input type="number" 
                                   name="anoLancamento" 
                                   min="1900" max="2025" 
                                   value="${requestScope.dvd.anoLancamento}"
                                   required
                                   class="form-input-pequeno"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Data de Lançamento:</td>
                        <td>
                            <input type="date" 
                                   name="dataLancamento"
                                   value="${requestScope.dvd.dataLancamento}"
                                   required
                                   class="form-input-pequeno"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Duração (minutos):</td>
                        <td>
                            <input type="number" 
                                   name="duracaoMinutos" 
                                   min="1"
                                   value="${requestScope.dvd.duracaoMinutos}"
                                   required
                                   class="form-input-pequeno"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Ator Principal:</td>
                        <td>
                            <select name="atorPrincipal_id" required class="form-select">
                                <c:forEach var="a" items="${requestScope.atores}">
                                    <option value="${a.id}" ${a.id == requestScope.dvd.atorPrincipal.id ? 'selected' : ''}>
                                        ${a.nome} ${a.sobrenome}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Ator Coadjuvante:</td>
                        <td>
                            <select name="atorCoadjuvante_id" required class="form-select">
                                <c:forEach var="a" items="${requestScope.atores}">
                                    <option value="${a.id}" ${a.id == requestScope.dvd.atorCoadjuvante.id ? 'selected' : ''}>
                                        ${a.nome} ${a.sobrenome}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Gênero:</td>
                        <td>
                            <select name="genero_id" required class="form-select">
                                <c:forEach var="g" items="${requestScope.generos}">
                                    <option value="${g.id}" ${g.id == requestScope.dvd.genero.id ? 'selected' : ''}>
                                        ${g.descricao}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Classificação:</td>
                        <td>
                            <select name="classificacao_id" required class="form-select">
                                <c:forEach var="c" items="${requestScope.classificacoes}">
                                    <option value="${c.id}" ${c.id == requestScope.dvd.classificacaoEtaria.id ? 'selected' : ''}>
                                        ${c.descricao}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <a href="${cp}/formularios/dvd/listagem.jsp" class="btn-principal">
                                Voltar
                            </a>
                        </td>
                        <td class="alinharDireita">
                            <input type="submit" value="Salvar" class="btn-principal"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

</body>
</html>