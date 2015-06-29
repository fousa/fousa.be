class AppsController < AuthenticatedController
  before_action :set_app, only: [:edit, :update, :destroy]

  def index
    @apps = App.all
  end

  def new
    @app = App.new
    render_no_layout
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
    @app = App.find(params[:id])
  end

  def app_params
    params.require(:app).permit(:name, :name_suffix, :short_text)
  end
end
