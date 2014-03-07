require 'awesome_print'
ActiveAdmin::Dashboards.build do
 
 
  
  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end
  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.
  
  #hash = {:a=>1,:b=>2,:c => [1,2,3]}
  #ap hash; 
  
  
  
  section "Super admin menu", :priority => 1, if: -> { current_admin_user.id? } do
    div do
        "Administrator"
    end
    div do
      "Current Sign at :#{current_admin_user.current_sign_in_at}"
      
      #current_admin_user.inspect
      #current_admin_user.inspect
    end#                                                                                                            
    div do
      "Last Sign At :#{current_admin_user.last_sign_in_at}"
    end
  end
  section "Recent User",:priority => 2 do
    table_for User.order("created_at desc").limit(5) do
      column :name do |user|
         link_to user.name, [:admin, user]
      end
      column :username
      column :email
      column :created_at
    end
    strong { link_to "View All Users", admin_users_path }
  end
  
  section "Recent Video",:priority => 3 do
    table_for Video.order("created_at desc").limit(5) do
      column :title do |video|
         link_to video.title, [:admin, video]
      end
      column :title
      column :created_at
    end
    strong { link_to "View All Video", admin_videos_path }
  end
  
end