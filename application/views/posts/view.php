<h2><?php echo  $post['title']; ?></h2>
<small class="post-date">Írva: <?php echo $post['created_at']; ?></small>
<div class="post-body">
	<?php echo  $post['body']; ?>
</div>

<hr>
<?php echo form_open('/posts/delete/'.$post['id']); ?>
	<input type="submit" value="Post törlése" class="btn btn-outline-danger">
</form>

