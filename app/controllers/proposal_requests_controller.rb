class ProposalRequestsController < ApplicationController
  layout 'adminlte'
  def requests
     if current_user.user_type == 'creative'
      @requests = ProposalRequest.where(requested: current_user.id)
    end
  end
end
