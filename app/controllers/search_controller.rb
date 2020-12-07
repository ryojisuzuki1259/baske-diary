class SearchController < ApplicationController
  def search
    # binding.pry
    @user = current_user
    @column = params[:column]
    @content = params[:content]
    @method = params[:method] #_searchから送られてきた:column、:content、:methodの中身を変数にそれぞれ代入。
    @users = User.search_for(@content, @method, @column) #Userモデルで定義したsearch_forメソッドの引数に上３つの変数を入れる。
    render 'users/index'
  end
end
