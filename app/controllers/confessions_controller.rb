class ConfessionsController < ApplicationController
  def show
    @confession = Confession.find(params[:id])
  end

  def index
    @confessions = Confession.all
  end

  def new
    @confession = Confession.new
  end

  def create
    @confession = Confession.new(confession_params)
    @confession.user = current_user
    if @confession.valid?
      @confession.save
      redirect_to @confession
    else
      render :new
    end
  end

  def update
    @confession = Confession.find(params[:id])
    @confession.update(confession_params)
    redirect_to @confession
  end

  private

  def confession_params
    params.require(:confession).permit(:title, :text, topic_ids:[], topics_attributes: [:name], comments_attributes: [:text, :user_id])
  end
end
