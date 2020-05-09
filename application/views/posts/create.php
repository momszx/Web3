<h2><?= $title; ?></h2>

<?php echo validation_errors(); ?>

<?php echo  form_open('posts/create'); ?>
		<div class="form-group">
			<label>Cím</label>
			<input type="text" class="form-control"  name="title" placeholder="Cím">
			<small id="emailHelp" class="form-text text-muted">Ez lesz a post címe.</small>
		</div>
		<div class="form-group">
			<label for="exampleSelect2">Leírás</label>
			<textarea  class="form-control" name="body"></textarea>
			<small id="emailHelp" class="form-text text-muted">Ide írd a postot</small>
		</div>
		<button type="submit" class="btn btn-primary">Küld</button>
</form>
