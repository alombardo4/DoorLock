class LockRequestsController < ApplicationController
  before_action :set_lock_request, only: [:show, :edit, :update, :destroy]
  # GET /lock_requests
  # GET /lock_requests.json
  def index
    @lock_requests = LockRequest.all.reverse
  end

  # GET /lock_requests/1
  # GET /lock_requests/1.json
  def show
  end

  # GET /lock_requests/new
  def new
    @lock_request = LockRequest.new
  end

  # GET /lock_requests/1/edit
  def edit
  end

  # POST /lock_requests
  # POST /lock_requests.json
  def create
    @lock_request = LockRequest.new(lock_request_params)
    #keep history
    @lock_request.user = session[:user_id]
    #check if lock is currently locked
    @lock_request.isLocked = is_locked

    #turn lock
    if is_closed && @lock_request.isLocked != @lock_request.willLock
      turn_lock(@lock_request.willLock)
    end
    respond_to do |format|
      if @lock_request.save
        format.html { redirect_to @lock_request, notice: 'Lock request was successfully created.' }
        format.json { render :show, status: :created, location: @lock_request }
      else
        format.html { render :new }
        format.json { render json: @lock_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lock_requests/1
  # PATCH/PUT /lock_requests/1.json
  def update
    respond_to do |format|
      if @lock_request.update(lock_request_params)
        format.html { redirect_to @lock_request, notice: 'Lock request was successfully updated.' }
        format.json { render :show, status: :ok, location: @lock_request }
      else
        format.html { render :edit }
        format.json { render json: @lock_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lock_requests/1
  # DELETE /lock_requests/1.json
  def destroy
    @lock_request.destroy
    respond_to do |format|
      format.html { redirect_to lock_requests_url, notice: 'Lock request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lock_request
      @lock_request = LockRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lock_request_params
      params.require(:lock_request).permit(:user, :isLocked, :willLock)
    end
end
