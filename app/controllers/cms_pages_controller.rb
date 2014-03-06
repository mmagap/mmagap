class CmsPagesController < ApplicationController
  #layout "cms"
  def show
     @cpage = CmsPage.find(params[:id])
  end

end
