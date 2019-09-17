module ApplicationHelper
 def is_namespace_admin
  begin
   return false if !(request.base_url && request.url)
   request.url.split(request.base_url)[1].split("/")[1] == "admin"
  rescue => error
   return false
  end
 end
  def is_not_namespace_admin
    !is_namespace_admin
  end
  def set_layout
   is_namespace_admin ? "admin" : "application"
  end
  def define_admin_routes(data)
    begin
      resourceName = data[:resourceName]
      objectId = data[:objectId]
      object = resourceName.classify.constantize.first
      object_id = objectId ? objectId : object ? object.id : nil
      route_name = resourceName.tableize
      object ? "/admin/#{route_name}/#{object_id}" : "/admin/#{route_name}/new" 
    rescue 
      "#"
    end
  end
  
def flash_class(level)
    case level
    when 'notice' then "alert alert-info"
    when 'success' then "alert alert-success"
    when 'error' then "alert alert-danger"
    when 'alert' then "alert alert-success"
    end
  end
end
