<h2><?= $title ?></h2>
<?php foreach ($posts as $post) : ?>
	<h3><?php echo  $post['title']; ?></h3>
	<div class="row">
		<div class="col-md-3">
			<img class="post-thumb" src="<?php echo site_url(); ?>assets/images/posts/<?php echo $post['post_image']; ?>";>
		</div>
		<div class="col-md-9">
			<small class="post-date">Írva: <?php echo $post['created_at']; ?> <strong><?php echo $post['name']; ?> kategiriában</strong></small>
			<br>
			<?php echo word_limiter($post['body'],50); ?>
			<br>
			<p><a class="btn btn-success" href="<?php echo site_url
				('/posts/'.$post['slug']); ?>">Olvass többet</a> </p>
			<br>
			<br>
		</div>
	</div>
	
<?php endforeach; ?>
