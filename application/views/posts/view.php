<h2><?php echo  $post['title']; ?></h2>
<small class="post-date">Írva: <?php echo $post['created_at']; ?></small>
<img src="<?php echo site_url(); ?>assets/images/posts/<?php echo $post['post_image']; ?>";>
<div class="post-body">
	<?php echo  $post['body']; ?>
</div>
<hr>
<a class="btn btn-warning pull-left" href=<?php echo base_url(); ?>posts/edit/<?php echo $post['slug']; ?>>Szerkesztés</a>
<?php echo form_open('/posts/delete/'.$post['id']); ?>
	<input type="submit" value="Post törlése" class="btn btn-outline-danger">
</form>
<hr>
<?php if($comments): ?>
	<?php foreach ($comments as $comment) : ?>
		<div class="jumbotron">
			<h4><?php echo $comment['name']; ?></h4>
			<h5><?php echo $comment['body']; ?></h5>
		</div>
	<?php endforeach; ?>
<?php else: ?>
	<p>Légy te az első aki hozzászól</p>
<?php endif; ?>
<hr>
<h3>Szólj hozzá</h3>
<?php echo validation_errors(); ?>
<?php echo form_open('comments/create/'.$post['id']); ?>
<div class="form-group">
	<label>Name</label>
	<input type="text" name="name" class="form-control">
</div>
<div class="form-group">
	<label>Email</label>
	<input type="text" name="email" class="form-control">
</div>
<div class="form-group">
	<label>Body</label>
	<textarea name="body" class="form-control"></textarea>
</div>
<input type="hidden" name="slug" value="<?php echo $post['slug']; ?>">
<button class="btn btn-primary" type="submit">Submit</button>
</form>

