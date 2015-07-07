class AppsController < AuthenticatedController
  before_action :set_app, only: [:show, :edit, :update, :destroy]

  skip_before_action :authenticate, only: :show

  def index
    @apps = App.all
  end

  def new
    @app = App.new
    render_no_layout
  end

  def show
  end

  def edit
    render_no_layout
  end

  def create
    @app = App.new(app_params)
    if @app.save
      @apps = App.all
    end
    respond_to do |format|
      format.js { render 'update', layout: false }
    end
  end

  def update
    if @app.update(app_params)
      @apps = App.all
    end
    respond_to do |format|
      format.js { render 'update', layout: false }
    end
  end

  def destroy
    @app.destroy
    @apps = App.all
    render_no_layout
  end

  private

  def set_app
    @app = App.friendly.find(params[:id])
  end

  def app_params
    params.require(:app).permit(:name, :url, :name_suffix, :short_text, :text, :logo, :dashboard_image, :slug, screenshots_attributes: [:id, :name, :image, :_destroy])
  end
end
