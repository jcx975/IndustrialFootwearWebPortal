
<%@include file="../include/meta.jsp"%>
<title>Supervisor</title>
<%@include file="../include/head.jsp"%>
<%@include file="../include/header.jsp"%>
<div class="container mt-5">
	<div class="row">
		<div class="col-sm-12 welcome-banner">
			<h1 class="display-2">Supervisor</h1>
		</div>
	</div>
</div>
<div class="container">
	<div class="row mb-5">
		<div class="col-md-4 mb-2">
			<div class="d-flex flex-column fw-box border">
				<div class="fw-box-header">Company Profile</div>
				<ul class="list-group">
					<li class="list-group-item list-group-item-light">View company information.</li>
					<li class="list-group-item list-group-item-light">View list of programs.</li>
					<li class="list-group-item list-group-item-light">View program details.</li>
				</ul>
				<button onclick="window.location.href='company.jsp'" type="button" class="btn btn-lg btn-primary mt-auto">View</button>
			</div>
		</div>
		<div class="col-md-4 mb-2">
			<div class="d-flex flex-column fw-box border">
				<div class="fw-box-header">Inventory</div>
				<ul class="list-group">
					<li class="list-group-item list-group-item-light">View inventory.</li>
				</ul>
				<a href="" class="btn btn-lg btn-primary mt-auto">View</a>
			</div>
		</div>
		<div class="col-md-4 mb-2">
			<div class="d-flex flex-column fw-box border">
				<div class="fw-box-header">Invoices</div>
				<ul class="list-group">
					<li class="list-group-item list-group-item-light">View invoices.</li>
				</ul>
				<a href="" class="btn btn-lg btn-primary mt-auto">View</a>
			</div>
		</div>
	</div>
	<hr>
</div>
<%@include file="../include/footer.jsp"%>