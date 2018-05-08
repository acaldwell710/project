class WikisController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  #before_action :authorize_user, except: [:show, :new, :create]
  before_action :set_wiki, only: [:show, :edit, :update, :destroy]

  after_action :verify_authorized, except: :index
  #after_action :verify_policy_scoped, only: :index

  def index
    #@wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = current_user.wikis.new
    authorize @wiki
  end

  def create
    @wiki = current_user.wikis.create(wiki_params)
    #@wiki.user = current_user
    authorize @wiki

    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)

    if @wiki.update(wiki_params)
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      render :show
    end
  end

  private
  def set_wiki
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def wiki_params
    params.require(:wiki).permit(:title, :body)
  end

  #def authorize_user
  #  wiki = Wiki.find(params[:id])
  #  unless current_user == @wiki.user || current_user.admin?
  #    flash[:alert] = "You must be an admin or a standard member to do that."
  #    redirect_to wiki
  #  end
#  end

## app/wikis/index.html.erb
#<%= @wikis.each do |wiki| %>
#  <%= link_to "#{wiki.title}", wiki %><br>
#  <% end %>

end
