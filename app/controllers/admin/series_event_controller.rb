class SeriesEventController < Admin::AdminController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @series_event_pages, @series_events = paginate :series_events, :per_page => 10
  end

  def show
    @series_event = SeriesEvent.find(params[:id])
  end

  def new
    @series_event = SeriesEvent.new
    @series_id = params[:series_id]
  end
  


  def create
    data = params[:series_event]
    @series_event = SeriesEvent.new do |s|
      s.series_id = data[:series_id]
      s.week_number = data[:week_number]
      s.coordinator = data[:coordinator]
      s.cost = data[:cost]
      s.staging_area_url = data[:staging_area_url]
      s.registration_start = build_datetime_from_params(:registration_start, data)
      s.registration_end = build_datetime_from_params(:registration_end, data)
      s.event_start = build_datetime_from_params(:event_start, data)
      s.scheduled_date = build_date_from_params(:scheduled_date, data)
      s.climb_id = data[:climb_id]
      s.blurb = data[:blurb]
    end
    if @series_event.save
      flash[:notice] = 'SeriesEvent was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @series_event = SeriesEvent.find(params[:id])
    @series_id = @series_event.series_id
  end

  def update
    @series_event = SeriesEvent.find(params[:id])
    if @series_event.update_attributes(params[:series_event])
      flash[:notice] = 'SeriesEvent was successfully updated.'
      redirect_to :action => 'show', :id => @series_event
    else
      render :action => 'edit'
    end
  end

  def destroy
    SeriesEvent.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
