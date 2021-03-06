<?php echo  validation_errors();?>
<?php echo  form_open('users/register'); ?>
<div class="center">
	<h2 class="text-center"><?= $title; ?></h2>
	<div class="form-group">
		<label>Név</label>
		<input type="text" class="form-control" placeholder="Neved" name="name">
		<small  class="form-text text-muted">Kérlek add meg a neved.</small>
	</div>
	<div class="form-group">
		<label>Felhasználónév</label>
		<input type="text" class="form-control" placeholder="Felhasználó név" name="username">
		<small class="form-text text-muted">Ez lesz a felhasználóneved ahogy a postok megjelennek</small>
	</div>
	<div class="form-group">
		<label>Email</label>
		<input type="email" class="form-control" placeholder="Email" name="email">
		<small class="form-text text-muted">Add meg az email címed</small>
	</div>
	<div class="form-group">
		<label>Irányító szám</label>
		<input type="text" class="form-control" placeholder="Irányító szám" name="zipcode">
		<small class="form-text text-muted">Add meg a településed irányítószámát.</small>
	</div>
	<div class="form-group">
		<label>Jelszó</label>
		<input type="password" class="form-control" placeholder="Jelszó" name="password">
		<small class="form-text text-muted">Ez lesz a jelszavad amit SOHA nem add meg senkinek.</small>
	</div>
	<div class="form-group">
		<label>Jelszó mégegyszer</label>
		<input type="password" class="form-control" placeholder="Jelszó" name="password2">
		<small class="form-text text-muted">Add meg a jelszavad újra hogy le ellenőrizük nem e írtad el.</small>
	</div>
	<button type="submit" class="btn btn-success">Regisztráció</button>
</div>
<?php echo  form_close(); ?>
