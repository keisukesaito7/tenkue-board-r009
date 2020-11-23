module ApplicationHelper
  def display_count(object)
    object.count if object.count > 0
  end
end
