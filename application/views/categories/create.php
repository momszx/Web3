<h2><?= $title ;?></h2>

<?php echo  validation_errors(); ?>

<?php echo  form_open_multipart('categories/create'); ?>
	<div class="form-group">
		<label>Neve</label>
		<input type="text" class="form-control" name="name" placeholder="Írd be a kategoriát">
	</div>
	<button type="submit" class="btn btn-primary">Küld</button>
</form>
