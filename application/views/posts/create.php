<h2><?= $title; ?></h2>

<?php echo validation_errors(); ?>

<?php echo  form_open_multipart('posts/create'); ?>
		<div class="form-group">
			<label>Cím</label>
			<input type="text" class="form-control"  name="title" placeholder="Cím">
			<small id="emailHelp" class="form-text text-muted">Ez lesz a post címe.</small>
		</div>
		<div class="form-group">
			<label for="exampleSelect2">Leírás</label>
			<textarea id="editor" class="form-control" name="body" rows="25"></textarea>
			<small id="emailHelp" class="form-text text-muted">Ide írd a postot</small>
		</div>
		<label>Kategóriák</label>
		<select name="category_id" class="form-control">
		<?php foreach ($categories as $category): ?>
			<option value="<?php echo $category['id']; ?>"><?php echo $category['name']; ?></option>
		<?php endforeach; ?>
		</select>
		<br>
		<div class="form-group">
			<label for="exampleInputFile">File feltöltés</label>
			<input type="file" class="form-control-file" name="userfile" size="20">
			<small id="fileHelp" class="form-text text-muted">Tölts fel képet a posthoz</small>
		</div>
		<button type="submit" class="btn btn-primary">Küld</button>
</form>
