<h2><?= $title; ?></h2>

<?php echo validation_errors(); ?>

<?php echo  form_open('posts/update'); ?>
<input type="hidden" name="id" value="<?php echo $post['id'];?>">
<div class="form-group">
	<label>Cím</label>
	<input type="text" class="form-control"  name="title" value="<?php echo $post['title']; ?>">
	<small id="emailHelp" class="form-text text-muted">Ez lesz a post címe.</small>
</div>
<div class="form-group">
	<label for="exampleSelect2">Leírás</label>
	<textarea id="editor" class="form-control" name="body" rows="25"><?php echo $post['body']; ?></textarea>
	<small id="emailHelp" class="form-text text-muted">Ide írd a postot</small>
	<select name="category_id" class="form-control">
		<?php foreach ($categories as $category): ?>
			<option value="<?php echo $category['id']; ?>"><?php echo $category['name']; ?></option>
		<?php endforeach; ?>
	</select>
</div>
<button type="submit" class="btn btn-primary">Küld</button>
</form>
