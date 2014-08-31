module ApplicationHelper
  def bootstrap_flash_class type
    case type
    when 'notice' then 'alert-info'
    when 'alert' then 'alert-warning'
    else "alert-#{type}"
    end
  end
end
