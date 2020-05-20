<h2><?= $title; ?></h2>
<table class="table table-hover">
	<thead>
	<tr>
		<th scope="col">Id</th>
		<th scope="col">Neve</th>
		<th scope="col">Felhasználónév</th>
		<th scope="col">Email</th>
		<th scope="col">Település</th>
		<th scope="col">Regisztráció ideje</th>
		<th scope="col">Töröl</th>
	</tr>
	</thead>
<?php foreach ($users as $user) : ?>
	<tr class="table-warning">
		<th scope="row"><?php echo $user['id']; ?></th>
		<td><?php echo $user['name']; ?></td>
		<td><?php echo $user['username']; ?></td>
		<td><?php echo $user['email']; ?></td>
		<td>
			<?php
				$city=$this->zipcode_model->get_zipcode($user['zipcode']);
				if(empty($city)){
					echo 'Rossz irányítószmá';
				}else{
					echo $user['zipcode'];
				}
			?>
		</td>
		<td><?php echo $user['register_data']; ?></td>
		<td>
			<?php if($this->session->userdata('user_id')!=$user['id']):?>
				<form class="delete" action="delete/<?php echo $user['id']; ?>" method="post">
					<input type="submit" class="btn btn-danger" value="[X]">
				</form>
			<?php endif; ?>
		</td>
	</tr>
<?php endforeach; ?>
