class Views::Layouts::Application < Views::Base
  def content
    doctype!

    html(lang: 'en') do
      head do
        meta(content: "text/html; charset=UTF-8", "http-equiv" => "Content-Type")
        meta(charset: 'utf-8')
        meta(name: 'viewport', content: 'width=device-width, initial-scale=1.0')
        meta(name: "description", content: meta_description)

        title(content_for?(:title) ? yield(:title) : "Superdelegation")

        text stylesheet_link_tag 'application'
        text csrf_meta_tags

        meta(property: "og:url", content: "http://superdelegation.com")
        meta(property: "og:title", content: "Superdelegation")
        meta(property: "og:description", content: meta_description)
        meta(property: "og:type", content: "website")

        render 'shared/analytics'
        render 'shared/social_media'
      end

      body do
        div(class: 'row') do
          div(class: 'columns large-12 large-centered') do
            yield
          end
        end

        text javascript_include_tag 'application'
      end
    end
  end

  private

  def meta_description
    "A tool for U.S. residents to contact their elected officals."
  end
end
