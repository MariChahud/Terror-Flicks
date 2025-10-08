<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
    <head>
        <title>Cadastrar DVD</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="${cp}/img/logo.png" type="image/png">
        <link rel="stylesheet" href="${cp}/css/estilos.css"/>
    </head>
    <body>

        <header>
            <h1>Novo DVD</h1>
            <nav>
            </nav>
        </header>

        <div class="conteudo">
            <!-- Links organizados horizontalmente acima do formulário -->
            <div class="links-superiores">
                <a href="${cp}/index.jsp" class="btn-principal">
                    Tela Principal
                </a>
            </div>

            <div class="tabela-container">
                <form method="post" action="${cp}/processaDvds">
                    <input name="acao" type="hidden" value="inserir"/>

                    <table class="tabelaListagem">
                        <tr>
                            <td class="alinharDireita">Título:</td>
                            <td>
                                <input name="titulo" 
                                       type="text" 
                                       size="20" 
                                       maxlength="100" 
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
                                       required
                                       class="form-input-pequeno"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinharDireita">Ano de Lançamento:</td>
                            <td>
                                <input name="anoLancamento" 
                                       type="number" 
                                       min="1900" 
                                       max="2025" 
                                       required
                                       class="form-input-pequeno"/>
                            </td>
                        </tr>

                        <tr>
                            <td class="alinharDireita">Data de Lançamento:</td>
                            <td>
                                <input name="dataLancamento" 
                                       type="date" 
                                       required
                                       class="form-input-pequeno"/>
                            </td>
                        </tr>

                        <tr>
                            <td class="alinharDireita">Duração (minutos):</td>
                            <td>
                                <input name="duracaoMinutos" 
                                       type="number" 
                                       min="1" 
                                       required
                                       class="form-input-pequeno"/>
                            </td>
                        </tr>

                        <tr>
                            <td class="alinharDireita">Gênero:</td>
                            <td>
                                <select name="genero_id" required class="form-select">
                                    <option value="" disabled selected>Selecione um gênero</option>
                                    <c:forEach items="${requestScope.generos}" var="genero">
                                        <option value="${genero.id}">${genero.descricao}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td class="alinharDireita">Classificação Etária:</td>
                            <td>
                                <select name="classificacao_id" required class="form-select">
                                    <option value="" disabled selected>Selecione uma classificação</option>
                                    <c:forEach items="${requestScope.classificacoes}" var="classificacao">
                                        <option value="${classificacao.id}">${classificacao.descricao}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td class="alinharDireita">Ator Principal:</td>
                            <td>
                                <select name="atorPrincipal_id" required class="form-select">
                                    <option value="" disabled selected>Selecione um ator</option>
                                    <c:forEach items="${requestScope.atores}" var="ator">
                                        <option value="${ator.id}">${ator.nome} ${ator.sobrenome}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td class="alinharDireita">Ator Coadjuvante:</td>
                            <td>
                                <select name="atorCoadjuvante_id" required class="form-select">
                                    <option value="" disabled selected>Selecione um ator</option>
                                    <c:forEach items="${requestScope.atores}" var="ator">
                                        <option value="${ator.id}">${ator.nome} ${ator.sobrenome}</option>
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