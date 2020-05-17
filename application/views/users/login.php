<?php echo  form_open('users/login'); ?>
		<div class="center">
			<h2 class="text-center"><?php echo $title; ?></h2>
			<div class="form-group">
				<label>Felhasználónév</label>
				<input type="text" class="form-control" placeholder="Felhasználónév" name="username">
				<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
			</div>
			<div class="form-group">
				<label>Jelszó</label>
				<input type="password" class="form-control" placeholder="Jelszó" name="password">
				<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
			</div>
			<button type="submit" class="btn btn-primary">Bejelentkezés</button>
		</div>
<?php echo form_close(); ?>
