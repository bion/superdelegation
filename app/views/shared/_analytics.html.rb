class Views::Shared::Analytics < Views::Base
  def content
    google_analytics
    heap_analytics
  end

  private

  def google_analytics
    return unless Rails.env.production?

    javascript <<-JS
      (function(i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r;
        i[r] = i[r] || function() {
          (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date();
        a = s.createElement(o),
        m = s.getElementsByTagName(o)[0];
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m)
      })(window,
         document,
         'script',
         'https://www.google-analytics.com/analytics.js',
         'ga'
      );

      ga('create', 'UA-76184742-1', 'auto');
      ga('send', 'pageview');
    JS
  end

  def heap_analytics
    javascript <<-JS
      window.heap=window.heap||[],heap.load=function(e,t){window.heap.appid=e,window.heap.config=t=t||{};var r=t.forceSSL||"https:"===document.location.protocol,a=document.createElement("script");a.type="text/javascript",a.async=!0,a.src=(r?"https:":"http:")+"//cdn.heapanalytics.com/js/heap-"+e+".js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(a,n);for(var o=function(e){return function(){heap.push([e].concat(Array.prototype.slice.call(arguments,0)))}},p=["addEventProperties","addUserProperties","clearEventProperties","identify","removeEventProperty","setEventProperties","track","unsetEventProperty"],c=0;c<p.length;c++)heap[p[c]]=o(p[c])};
    JS

    if Rails.env.production?
      javascript 'heap.load("3220453361");'
    elsif Rails.env.development?
      javascript 'heap.load("3648510825");'
    end
  end
end
