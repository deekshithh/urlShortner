class UrlsController < ApplicationController

  def index
  	@short_url = ShortUrl.new
  end

  def create
    domain = request.base_url << "/"
  	@short_url = ShortUrl.new(url_params)
    respond_to do |format|
    	if @short_url.save
        @short_url_name = @short_url.generate_short_url(domain)
        format.js
    	else
        format.js 
    	end
    end
  end
  
  def original_redirect
  	short = params[:short]
  	id = ShortUrl.decrypt_url(short)
  	@short_url = ShortUrl.find_by(id: id)
    if @short_url
      redirect_to "http://#{@short_url.original_url}"
    else
      redirect_to root_path
    end
  end

  protected

  def url_params
    params.require(:short_url).permit(:original_url)
  end
end