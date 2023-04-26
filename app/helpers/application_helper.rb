module ApplicationHelper
  def tab_item(name, url)
    tab_class = 'bg-primary' if current_page?(url) || (current_page?('/') && url == '/v1/transaction/deposit')
    content_tag :li do
      link_to name, url, class: tab_class
    end
  end
end
