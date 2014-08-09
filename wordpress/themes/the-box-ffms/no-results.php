<?php
/**
 * The template part for displaying a message that posts cannot be found.
 *
 * Learn more: http://codex.wordpress.org/Template_Hierarchy
 *
 * @package thebox
 * @since thebox 1.0
 */
?>

<article id="post-0" class="post hentry no-results not-found">
	<header class="entry-header">
		<h1 class="entry-title"><?php _e( 'Nichts gefunden.', 'thebox' ); ?></h1>
	</header><!-- .entry-header -->

	<div class="entry-content">
		<?php if ( is_home() && current_user_can( 'publish_posts' ) ) : ?>

			<p><?php printf( __( 'Bereit den ersten Beitrag zu veröffentlichen? <a href="%1$s">Hier gehts los.</a>.', 'thebox' ), esc_url( admin_url( 'post-new.php' ) ) ); ?></p>

		<?php elseif ( is_search() ) : ?>

			<p><?php _e( 'Leider hat die Suche keine Treffer ergeben. Bitte versuch es mit einem anderen Suchbegriff erneut.', 'thebox' ); ?></p>
			<?php get_search_form(); ?>

		<?php else : ?>

			<p><?php _e( 'Es scheint, dass wir das wonach du suchst nicht finden können. Vielleicht hilft eine Suche?', 'thebox' ); ?></p>
			<?php get_search_form(); ?>

		<?php endif; ?>
	</div><!-- .entry-content -->
	<footer class="entry-meta"></footer>
</article><!-- #post-0 .post .no-results .not-found -->
