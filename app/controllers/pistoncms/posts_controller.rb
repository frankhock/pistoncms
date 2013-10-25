class Pistoncms::PostsController < Pistoncms::PistoncmsController
  include Pistoncms::Concerns::EntryLike

  before_action :_set_post

  def index
    @entries = Pistoncms::Post.all
  end

  def new
    @post = Pistoncms::Post.new
  end

  def create
    @post = Pistoncms::Post.new(post_params)

    if @post.save
      flash[:success] = "Post published."
      redirect_to edit_pistoncms_post_url(@post)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @entry.update_attributes(post_params)
      flash[:notice] = "Post updated."
      redirect_to edit_pistoncms_post_path(@entry)
    else
      render :edit
    end
  end

  private

  def _set_post
    @entry = Pistoncms::Post.friendly.find(params[:id]) if params[:id]
  end

  def post_params
    params.require(:pistoncms_post).permit(:title, :content)
  end

end