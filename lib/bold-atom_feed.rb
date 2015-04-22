module Bold
  module AtomFeed

    class Engine < ::Rails::Engine

      config.to_prepare do

        Bold::Plugin.register(:atom_feed) do
          name 'Atom Feeds'
          author 'Jens Krämer'
          author_url 'https://jkraemer.net/'

          settings partial: 'settings', defaults: {
            post_count: 10,
            teaser_words: 0,
            favicon_url: nil,
            author: nil,
            body_postfix: 'The post {{ post }} appeared first on {{ site }}.'
          }

          render_on :view_layout_html_head, 'html_head'

          routes do
            get '/atom.xml' => 'atom_feeds#show', as: 'atom_feed', defaults: { format: :atom }
          end
        end

      end

    end

  end
end
