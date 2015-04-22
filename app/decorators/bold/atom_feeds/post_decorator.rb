require 'liquid'

module Bold
  module AtomFeeds
    class PostDecorator < Draper::Decorator

      decorates Post
      delegate_all

      class BodyPostfix < Liquid::Drop
        attr_reader :root_url
        def initialize(post, root_url)
          @post = post
          @root_url = root_url
        end
        def self.render(template, post_link, root_link)
        end
      end

      def body_html
        if word_count > 0 or object.has_teaser?
          object.teaser_html(word_count)
        else
          object.body_html
        end + body_postfix
      end

      private

      def body_postfix
        postfix = h.site.plugin_value(:atom_feed, :body_postfix)
        if postfix.blank?
          ''
        else
          text = Liquid::Template.
            parse(postfix).
            render('post' => h.link_to(object.title, object.public_url),
                   'site' => h.link_to(h.site.name, h.root_url))
          object.md_render_content object, text
        end
      end

      def word_count
        @word_count ||= h.site.plugin_value(:atom_feed, :teaser_words).to_i
      end

    end
  end
end
