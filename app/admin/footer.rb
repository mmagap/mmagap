class Footer < ActiveAdmin::Component
  def build
    super :id => "footer"
    div :id => "footer" do
      para "Copyright &copy; #{Date.today.year.to_s} #{link_to('MMAGAP', 'http://mmagap.com', target: "_blank",)}".html_safe
    end
  end
end