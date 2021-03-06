<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/partials/head.jsp"></jsp:include>
</head>
<body style ="background-color: #26547C ;">

	<jsp:include page="/partials/nav.jsp"></jsp:include>

	<main class="container">

		<c:if test="${flash != null}">
			<div class="alert alert-danger">
				<p>
					<c:out value="${flash}" />
					<c:if test="${errors != null}">
						<ul>
							<c:forEach items="${errors}" var="entry">
								<li><c:out value="${entry.getValue()}"></c:out></li>
							</c:forEach>
						</ul>
					</c:if>
				</p>
			</div>
		</c:if>

		<div class="bg-light p-4 mb-3 rounded">
			<h2>Estas son nuestras sugerencias para usted</h2>
		</div>

		<br />

		<table class="table table-dark table-stripped table-hover table-bordered">
			<thead>
				<tr>
					<th>Nombre</th>
					<th>Tipo de Oferta</th>
					<th>Costo</th>
					<th>Tiempo</th>
					<th>Stock</th>
					<th>Atracciones</th>
					<th>Tipo de atracciones</th>
					<th>Accion</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${user.sugerencia(ofertas)}" var="sugerencia">
					<tr>
						<td><c:out value="${sugerencia.getNombre()}"></c:out></td>
						<td><c:out value="${sugerencia.esPromocion()? 'Promocion' : 'Atraccion'}"></c:out></td>
						<td><c:out value="${sugerencia.getCosto()}"></c:out></td>
						<td><c:out value="${sugerencia.getTiempo()}"></c:out></td>
						<td><c:out value="${sugerencia.enStock()}"></c:out></td>
						<td><c:out value="${sugerencia.atrIncluidas()}"></c:out></td>
						<td><c:out value="${sugerencia.getTipo()}"></c:out></td>

						<td> <c:choose>
								<c:when
									test="${user.puedeComprar(sugerencia)}">
									<a href="/TurismoTierraMediaWeb/oferta/buy.do?ofertaComprar=${sugerencia.getNombre()}"
										class="btn btn-success rounded" role="button">Comprar</a>
								</c:when>
								<c:otherwise>
									<a href="#" class="btn btn-secondary rounded disabled"
										role="button">No se puede comprar</a>
								</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</main>

</body>
</html>