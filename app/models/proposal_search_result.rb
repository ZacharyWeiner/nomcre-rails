class ProposalSearchResult
    include ActiveModel::Model
    attr_accessor :user_id, :rank, :schedule_item_id

    def user
      User.find(self.user_id)
    end

    def schedule_item
      ScheduleItem.find(self.schedule_item_id)
    end
end
