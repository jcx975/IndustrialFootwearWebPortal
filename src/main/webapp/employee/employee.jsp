
<%@include file="../include/meta.jsp"%>
<title>Employee</title>
<%@include file="../include/head.jsp"%>
<%@include file="../include/header.jsp"%>
<div class="container mt-5">
	<div class="row">
		<div class="col-sm-12 welcome-banner">
			<h1 class="display-2">Employee</h1>
		</div>
	</div>
</div>
<div class="container">
	<div class="row mb-5">
		<div class="col-md-4">
			<div class="d-flex flex-column fw-box border">
				<div class="fw-box-header">Company Profiles</div>
				<ul class="list-group">
					<li class="list-group-item list-group-item-light">View list of company profiles.</li>
					<li class="list-group-item list-group-item-light">View company information.</li>
					<li class="list-group-item list-group-item-light">Edit company information.</li>
				</ul>
				<button onclick="window.location.href='profiles.jsp'" type="button" class="btn btn-lg btn-primary mt-auto">View</button>
			</div>
		</div>
		<div class="col-md-4">
			<div class="d-flex flex-column fw-box border">
				<div class="fw-box-header">Inventory</div>
				<ul class="list-group">
					<li class="list-group-item list-group-item-light">View inventory.</li>
				</ul>
				<button type="button" class="btn btn-lg btn-primary mt-auto">View</button>
			</div>
		</div>
		<div class="col-md-4">
			<div class="d-flex flex-column fw-box border">
				<div class="fw-box-header">Invoices</div>
				<ul class="list-group">
					<li class="list-group-item list-group-item-light">View invoices.</li>
				</ul>
				<button type="button" class="btn btn-lg btn-primary mt-auto">View</button>
			</div>
		</div>
	</div>
	<hr>
</div>
<%@include file="../include/footer.jsp"%>