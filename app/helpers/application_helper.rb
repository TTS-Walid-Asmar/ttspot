module ApplicationHelper
  def active?(place)
    if current_page?(place)
      'active'
    end
  end
  def title(the_title)
  content_for :title, the_title
end
end
