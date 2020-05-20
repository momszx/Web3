<html>
	<head>
		<title>Blog</title>
		<link rel="stylesheet" href="https://bootswatch.com/4/darkly/bootstrap.min.css">
		<link rel="stylesheet" href="https://bootswatch.com/flatly/bootstrap.min.css">
		<link rel="stylesheet" href="<?php echo base_url(); ?>/assets/css/style.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="//cdn.ckeditor.com/4.14.0/full/ckeditor.js"></script>
	</head>
	<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<span id="navbar-toggle">
            <i class="fas fa-bars"></i>
        </span>
		<a class="navbar-brand" href="<?php echo base_url(); ?>">Navbar</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor03">
			<ul class="navbar-nav mr-auto" id="main-nav">
				<li class="nav-item active">
					<a class="nav-link" href="<?php echo base_url(); ?>">Kezdő oldal<span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item active">
					<a class="nav-link" href="<?php echo base_url(); ?>posts">Posztok</a>
				</li>
				<li class="nav-item active">
					<a class="nav-link" href="<?php echo base_url(); ?>categories">Kategoriák</a>
				</li>
				<li class="nav-item active">
					<a class="nav-link" href="<?php echo base_url(); ?>about">Oldalról</a>
				</li>
			</ul>
			<ul class="navbar-nav mr-sm-2" id="main-nav">
				<?php if(!$this->session->userdata('logged_in')):?>
				<li class="nav-item active">
					<a class="nav-link" href="<?php echo base_url(); ?>users/login">Bejelentkezés</a>
				</li>
				<li class="nav-item active">
					<a class="nav-link" href="<?php echo base_url(); ?>users/register">Regisztráció</a>
				</li>
				<?php endif; ?>
				<?php if($this->session->userdata('isAdmin')):?>
				<li class="nav-item active">
					<a class="nav-link" href="<?php echo base_url(); ?>admin/index">Admin nézet</a>
				</li>
				<?php endif; ?>
				<?php if($this->session->userdata('logged_in')):?>
				<li class="nav-item active">
					<a class="nav-link" href="<?php echo base_url(); ?>posts/create">Post írás</a>
				</li>
				<li class="nav-item active">
					<a class="nav-link" href="<?php echo base_url(); ?>categories/create">Kategória készítés</a>
				</li>
				<li class="nav-item active">
					<a class="nav-link" href="<?php echo base_url(); ?>users/logout">Kijelentkezés</a>
				</li>
				<?php endif; ?>
			</ul>
		</div>
	</nav>
	<div class="container">
		<?php if($this->session->flashdata('user_registered')): ?>
			<?php echo '<p class="alert alert-dismissible alert-success">'.$this->session->flashdata('user_registered').'</p>'; ?>
		<?php endif; ?>

		<?php if($this->session->flashdata('post_created')): ?>
			<?php echo '<p class="alert alert-dismissible alert-success">'.$this->session->flashdata('post_created').'</p>'; ?>
		<?php endif; ?>

		<?php if($this->session->flashdata('category_created')): ?>
			<?php echo '<p class="alert alert-dismissible alert-success">'.$this->session->flashdata('category_created').'</p>'; ?>
		<?php endif; ?>

		<?php if($this->session->flashdata('user_loggedin')): ?>
			<?php echo '<p class="alert alert-dismissible alert-success">'.$this->session->flashdata('user_loggedin').'</p>'; ?>
		<?php endif; ?>

		<?php if($this->session->flashdata('user_loggedout')): ?>
			<?php echo '<p class="alert alert-dismissible alert-success">'.$this->session->flashdata('user_loggedout').'</p>'; ?>
		<?php endif; ?>

		<?php if($this->session->flashdata('post_updated')): ?>
			<?php echo '<p class="alert alert-dismissible alert-warning">'.$this->session->flashdata('post_updated').'</p>'; ?>
		<?php endif; ?>

		<?php if($this->session->flashdata('category_delete')): ?>
			<?php echo '<p class="alert alert-dismissible alert-danger">'.$this->session->flashdata('category_delete').'</p>'; ?>
		<?php endif; ?>

		<?php if($this->session->flashdata('post_delete')): ?>
			<?php echo '<p class="alert alert-dismissible alert-danger">'.$this->session->flashdata('post_delete').'</p>'; ?>
		<?php endif; ?>

		<?php if($this->session->flashdata('user_delete')): ?>
			<?php echo '<p class="alert alert-dismissible alert-danger">'.$this->session->flashdata('user_delete').'</p>'; ?>
		<?php endif; ?>

		<?php if($this->session->flashdata('login_failed')): ?>
			<?php echo '<p class="alert alert-dismissible alert-danger">'.$this->session->flashdata('login_failed').'</p>'; ?>
		<?php endif; ?>

		<?php if($this->session->flashdata('access_denied')): ?>
			<?php echo '<p class="alert alert-dismissible alert-danger">'.$this->session->flashdata('access_denied').'</p>'; ?>
		<?php endif; ?>



