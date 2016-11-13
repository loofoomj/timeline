class WallController < ApplicationController
  def write
  end

  def write_complete
  	
  end

  def posts
  	@writer = params[:writer]
  	@content = params[:content]
  end
end
