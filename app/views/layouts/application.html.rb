class Views::Layouts::Application < Views::Base
  def content
    doctype!

    html(lang: 'en') do
      head do
        meta(content: "text/html; charset=UTF-8", "http-equiv" => "Content-Type")
        meta(charset: 'utf-8')
        meta(name: 'viewport', content: 'width=device-width, initial-scale=1.0')
        meta \
          name: "description",
          content: "Tool for the Bernie Sanders campaign supporters to message local democratic superdelegates"

        title(content_for?(:title) ? yield(:title) : "Bernie Superdelegation")

        text stylesheet_link_tag 'application'
        text javascript_include_tag 'application'
        text csrf_meta_tags

        meta(property: "og:url", content: "http://www.superdelegation.com")
        meta(property: "og:image", content: 'http://i.imgur.com/vM4Kr5M.jpg')

        render 'shared/analytics'
      end

      body { yield }
    end
  end
end
