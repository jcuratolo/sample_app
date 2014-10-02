module ApplicationHelper
  def full_title(title)
    base_title = "RoR Tutorial Sample App"
    # if @title.nil?
    #   base_title
    # else
    #   "#{base_title} | #{@title}"
    # end
    title == nil ? base_title : "#{base_title} | #{title}"
  end
end
