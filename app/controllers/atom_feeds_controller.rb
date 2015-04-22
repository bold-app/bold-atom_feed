class AtomFeedsController < FrontendController

  decorate_assigned :posts, with: 'Bold::AtomFeeds::PostDecorator'

  def show
    @posts = current_site.posts.published.ordered.recent(post_count)

    render content_type: 'application/atom+xml'
  end

  private

  def post_count
    current_site.plugin_config(:atom_feed).config['post_count'].to_i
  end

end

