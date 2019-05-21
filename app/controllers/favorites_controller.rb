class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end


  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]
    
  
    if favorite.save
      redirect_to topics_path, success: 'お気に入りに登録しました'
    else
      redirect_to topics_path, danger: 'お気に入りに登録に失敗しました'
    end
  end
  
  def delete
    favorite = Favorite.find_by(topic_id: params[:topic_id], user_id: current_user.id)
     if favorite.destroy
      redirect_to topics_path, success: 'お気に入りを削除しました'
    else
      redirect_to topics_path, danger: 'お気に入りの削除に失敗しました'
    end
  end
  
  private
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def session_params
    params.require(:session).permit(:email, :password)
  end
  
  def favorite_params
    params.require(:favorite).permit(:topic_id)
  end
  
  
end
