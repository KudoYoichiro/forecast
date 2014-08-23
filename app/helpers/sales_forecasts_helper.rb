module SalesForecastsHelper
  def pagination(current_page, num_of_pages, args={})
    str = "<li>"
    str += link_to "<<", args.merge({:page => current_page, :page_to => :desc})
    str += "</li>\n"
    (1..num_of_pages).each do |page|
      str += "<li"
      if page == current_page
        str += " class='active'"
      end
      str += ">"
      str += link_to page, args.merge({:page => page})
      str += "</li>\n"
    end
    str += "<li>"
    str += link_to ">>", args.merge({:page => current_page, :page_to => :asc})
    str += "</li>\n"
    return str
  end
end
