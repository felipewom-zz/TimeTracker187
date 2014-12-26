module ApplicationHelper

  def title
    'Time Tracker'
  end

  def version
    'v 0.0.1'
  end

  def subtitle
    'Time Tracker Copyright'
  end

  def nav_items
    [
        {
          :displaytext    => 'Tasks',
          :controllername => 'tasks',
          :linkurl        => tasks_path,
          :permission     => 'user'
        },
        {
            :displaytext    => 'Users',
            :controllername => 'users',
            :linkurl        => users_path,
            :permission     => 'admin'
        },
        {
            :displaytext    => 'Roles',
            :controllername => 'roles',
            :linkurl        => roles_path,
            :permission     => 'admin'
        }
    ]
  end

  def display_nav_item(displaytext, controllername, linkurl)
    raw("<li#{controller_name == controllername ? ' class="active"' : ''}>#{link_to displaytext, linkurl}</li>")
  end
  
  def navbar_items
    navbar = ' '
    nav_items.each do |nav_item|
      if current_user.is? :admin
        navbar += display_nav_item(nav_item[:displaytext], nav_item[:controllername], nav_item[:linkurl])
      else
        if nav_item[:permission] == 'user'
          navbar += display_nav_item(nav_item[:displaytext], nav_item[:controllername], nav_item[:linkurl])
        end
      end
    end
    return raw(navbar)
  end

  def header_breadcrumbs
    header = "<li>#{link_to controller_name.to_s.capitalize, "/"+controller_name}</li>"
    unless action_name.nil?
      header +=  "<li>#{link_to action_name.to_s.capitalize, "/"+controller_name+"/"+action_name}</li>"
    end
    return raw(header)
  end

end
