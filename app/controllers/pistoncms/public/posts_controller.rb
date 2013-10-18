class Pistoncms::Public::PostsController < Pistoncms::Public::ApplicationController

  before_action :_set_post

  def show
    
  end

  private

  def _set_post
    @post = Pistoncms::Post.find_by!(slug: params[:slug])
  end

end