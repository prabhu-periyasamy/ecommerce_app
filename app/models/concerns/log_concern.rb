# frozen_string_literal: true

module LogConcern extend ActiveSupport::Concern
  included do
    after_commit :log_save
  end
  def log_save
    Rails.logger.info "Model #{self.class}: #{self.id}  is saved/updated"
  end
end
