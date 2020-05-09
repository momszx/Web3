<html>
	<head>
		<title>Blog</title>
		<link rel="stylesheet" href="https://bootswatch.com/4/darkly/bootstrap.min.css">
		<link rel="stylesheet" href="https://bootswatch.com/flatly/bootstrap.min.css">
		<link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/style.css">

		<script src="//cdn.ckeditor.com/4.14.0/full/ckeditor.js"></script>
	</head>
	<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="<?php echo base_url(); ?>">Navbar</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor03">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="<?php echo base_url(); ?>">Kezdő oldal<span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item active">
					<a class="nav-link" href="<?php echo base_url(); ?>posts">Posztok</a>
				</li>
				<li class="nav-item active">
					<a class="nav-link" href="<?php echo base_url(); ?>about">Oldalról</a>
				</li>
			</ul>
			<ul class="navbar-nav mr-sm-2">
				<li class="nav-item active">
					<a class="nav-link" href="<?php echo base_url(); ?>posts/create">Post írás</a>
				</li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text" placeholder="Keresés">
				<button class="btn btn-secondary my-2 my-sm-0" type="submit">Keresés</button>
			</form>
		</div>
	</nav>
	<div class="container">


