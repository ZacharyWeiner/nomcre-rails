class ProposalsController < ApplicationController
  before_action :set_proposal, only: [:show, :edit, :edit_details, :payment, :update, :destroy]
  layout 'adminlte'

  # GET /proposals
  # GET /proposals.json
  def index
    if current_user.user_type == 'creative'
      @proposals = Proposal.where(user: current_user).where(completed: nil).order(:created_at).page params[:page]
    else
      @proposals = Proposal.where(company: current_user.company).order(:created_at).page params[:page]
    end
  end

  # GET /proposals/1
  # GET /proposals/1.json
  def show
  end

  # GET /proposals/new
  def new
    @proposal = Proposal.new
  end

  # GET /proposals/1/edit
  def edit
  end

  def edit_details
  end

  # POST /proposals
  # POST /proposals.json
  def create
    @proposal = Proposal.new(proposal_params)
    set_price
    respond_to do |format|
      if @proposal.save
        format.html { redirect_to @proposal, notice: 'Proposal was successfully created.' }
        format.json { render :show, status: :created, location: @proposal }
      else
        format.html { render :new }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proposals/1
  # PATCH/PUT /proposals/1.json
  def update
    respond_to do |format|
      unless params[:proposal][:bts].nil? || params[:proposal][:bts].count == 0
        @proposal.bts.clear
        params[:proposal][:bts].each do |bt|
          @proposal.bts << bt
        end
      end
      unless params[:proposal][:focus_points].nil? || params[:proposal][:focus_points].count == 0
        @proposal.focus_points.clear
        params[:proposal][:focus_points].each do |fp|
          @proposal.focus_points << fp
        end
      end
      if @proposal.update(proposal_params)
        format.html { redirect_to @proposal, notice: 'Proposal was successfully updated.' }
        format.json { render :show, status: :ok, location: @proposal }
      else
        format.html { render :edit }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposals/1
  # DELETE /proposals/1.json
  def destroy
    @proposal.destroy
    respond_to do |format|
      format.html { redirect_to proposals_url, notice: 'Proposal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def payment
  end

  def requests
    if current_user.user_type == 'creative'
      @requests = ProposalRequest.where(requested: current_user.id)
    end
  end

  def create_request
    @proposal = Proposal.find(params[:proposal_id])
    @proposal_request = ProposalRequest.where(requested: User.find(params[:user_id]).id, proposal_id: @proposal.id ).first
    if @proposal_request.nil?
      @proposal_request = ProposalRequest.create(requested_by: current_user.id, requested: User.find(params[:user_id]).id, proposal_id: @proposal.id )
    end
    redirect_to @proposal
  end

  def accept_request
    @proposal = Proposal.find(params[:proposal_id])
    @proposal_request = ProposalRequest.where(requested: current_user.id, proposal_id: @proposal.id ).first
    @proposal_request.accepted = true
    @proposal_request.save
    redirect_to proposal_requests_path
  end

  def approve_request
    @proposal = Proposal.find(params[:proposal_id])
    @proposal_request = ProposalRequest.where(requested_by: current_user.id, proposal_id: @proposal.id, accepted: true).first
    @proposal_request.approved = true
    @proposal_request.save
    @proposal.accepted = true
    @proposal.user = User.find(@proposal_request.requested)
    @proposal.save
    @proposal.tasks.each do |task|
      task.user_id = @proposal_request.requested
      task.save
    end
    redirect_to @proposal
  end

  private
    def set_price
      if @proposal.proposal_type == 'Photo'
        @proposal.price = 4000
      elsif @proposal.proposal_type == 'Video'
        @proposal.price = 8000
      elsif @proposal.proposal_type == 'Drone'
        @proposal.price = 1000
      end

    end
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal
      unless params[:id].nil?
        @proposal = Proposal.find(params[:id])
      else
        @proposal = Proposal.find(params[:proposal_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposal_params
      params.require(:proposal).permit(:title, :content, :deadline, :price, :accepted, :company_id, :proposal_type, :completed, :completed_on, :paid, :charge_id, :bts, :focus_points, :time_of_day, :location_id, :background, :model_release)
    end
end
