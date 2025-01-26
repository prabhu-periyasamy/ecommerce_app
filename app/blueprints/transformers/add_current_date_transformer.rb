# frozen_string_literal: true
# Adding a transformer to include current date
# Refer: https://github.com/procore-oss/blueprinter

module Transformers
  class AddCurrentDateTransformer < Blueprinter::Transformer
    def transform(result_hash,primary_obj, options={})
      Rails.logger.info "Transformer invoked for object: #{primary_obj.inspect}"
      result_hash[:current_date] = Date.today
      result_hash
    end
  end
end

