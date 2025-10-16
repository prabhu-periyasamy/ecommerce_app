class RailsSanitizer
    extend ActionView::Helpers::SanitizeHelper::ClassMethods
end

class RailsFullSanitizer
	def self.sanitize(content)
		if content.is_a?(Hash)
			content.each { |k, v| content[ActionController::Base.helpers.sanitize(RailsSanitizer.full_sanitizer.sanitize(k))] = ActionController::Base.helpers.sanitize(RailsSanitizer.full_sanitizer.sanitize(v)) }
		elsif content.is_a?(Array)
			content.map { |c| ActionController::Base.helpers.sanitize(RailsSanitizer.full_sanitizer.sanitize(c)) }
		else
			ActionController::Base.helpers.sanitize(RailsSanitizer.full_sanitizer.sanitize(content))
		end
	end
end
