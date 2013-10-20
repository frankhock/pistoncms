require 'active_support/core_ext/class/attribute_accessors'

module Pistoncms
  module Config

    # Pistoncms is setup to try and authenticate with warden
    # If warden is found, then it will try to authenticate
    #
    # This is valid for custom warden setups, and also devise
    # If you're using the admin setup for devise, you should set Pistoncms to use the admin
    #
    # @see Pistoncms::Config.authenticate_with
    # @see Pistoncms::Config.authorize_with
    DEFAULT_AUTHENTICATION = Proc.new do
      request.env['warden'].try(:authenticate!)
    end

    DEFAULT_AUTHORIZE = Proc.new {}

    DEFAULT_AUDIT = Proc.new {}

    DEFAULT_CURRENT_USER = Proc.new do
      request.env["warden"].try(:user) || respond_to?(:current_user) && current_user
    end

    mattr_accessor :public_layout

    def self.public_layout=(value)
      @@public_layout = value if value.present?
      @@public_layout || 'pistoncms/layouts/application'
    end

    class << self


      # Setup authentication to be run as a before filter
      # This is run inside the controller instance so you can setup any authentication you need to
      #
      # By default, the authentication will run via warden if available
      # and will run the default.
      #
      # If you use devise, this will authenticate the same as _authenticate_user!_
      #
      # @example Devise admin
      #   Pistoncms.config do |config|
      #     config.authenticate_with do
      #       authenticate_admin!
      #     end
      #   end
      #
      # @example Custom Warden
      #   Pistoncms.config do |config|
      #     config.authenticate_with do
      #       warden.authenticate! :scope => :paranoid
      #     end
      #   end
      #
      # @see Pistoncms::Config::DEFAULT_AUTHENTICATION

      def authenticate_with(&blk)
        @authenticate = blk if blk
        @authenticate || DEFAULT_AUTHENTICATION
      end

      # Setup authorization to be run as a before filter
      # This is run inside the controller instance so you can setup any authorization you need to.
      #
      # By default, there is no authorization.
      #
      # @example Custom
      #   Pistoncms.config do |config|
      #     config.authorize_with do
      #       redirect_to root_path unless warden.user.is_admin?
      #     end
      #   end
      #
      # To use an authorization adapter, pass the name of the adapter. For example,
      # to use with CanCan[https://github.com/ryanb/cancan], pass it like this.
      #
      # @example CanCan
      #   Pistoncms.config do |config|
      #     config.authorize_with :cancan
      #   end
      #
      # See the wiki[https://github.com/sferik/rails_admin/wiki] for more on authorization.
      #
      # @see Pistoncms::Config::DEFAULT_AUTHORIZE

      def authorize_with(*args, &block)
        extension = args.shift
        if(extension)
          @authorize = Proc.new {
            @authorization_adapter = RailsAdmin::AUTHORIZATION_ADAPTERS[extension].new(*([self] + args).compact)
          }
        else
          @authorize = block if block
        end
        @authorize || DEFAULT_AUTHORIZE
      end

      # Setup a different method to determine the current user or admin logged in.
      # This is run inside the controller instance and made available as a helper.
      #
      # By default, _request.env["warden"].user_ or _current_user_ will be used.
      #
      # @example Custom
      #   Pistoncms.config do |config|
      #     config.current_user_method do
      #       current_admin
      #     end
      #   end
      #
      # @see Pistoncms::Config::DEFAULT_CURRENT_USER
      def current_user_method(&block)
        @current_user = block if block
        @current_user || DEFAULT_CURRENT_USER
      end

    end

  end
end