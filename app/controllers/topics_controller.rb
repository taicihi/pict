class TopicsController < ApplicationController
  
  def index
    @topics = Topic.all.includes(:favorite_users, :comment_users)
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  # 追加
  def show
    @topic = Topic.includes(:user).find(params[:id])
    @comments = @topic.comments.includes(:user).all
    @comment  = @topic.comments.build(user_id: current_user.id) if current_user
  end
  #ここまで

  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end
