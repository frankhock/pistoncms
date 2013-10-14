module Pistoncms
  module ApplicationHelper

    def controller_name(params)
      params[:controller].split("/").last.titleize
    end

    def class_name(instance)
      instance.class.name.split("::").last
    end

    # displays error messages for failed form
    def error_messages_for(resource)
      render partial: "pistoncms/shared/error_messages", locals: { resource: resource }
    end

    # add bootstrap styling to flash messages
    def flash_class(level)
      case level
      when :notice  then "alert alert-info"
      when :success then "alert alert-success"
      when :error   then "alert alert-error"
      when :alert   then "alert alert-error"
      end
    end

  end
end
