# Prevent Rails from adding a default error class to form fields
# This is necessary to allow our custom form builder to style the error messages
# https://github.com/brandnewbox/app-form-builder
Rails.application.config.action_view.field_error_proc = Proc.new { |tag, instance| tag }
