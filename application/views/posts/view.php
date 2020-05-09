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

