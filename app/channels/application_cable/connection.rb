module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    rescue_from StandardError, with: :report_error

    def connect
      self.current_user = find_verified_user
    end

    private
      def find_verified_user
        if verified_user = User.find_by(id: cookies.encrypted["_myapp_session"]["warden.user.user.key"][0][0])
          verified_user
        else
          reject_unauthorized_connection
        end
      end

      def report_error(e)
        Rails.logger.error(e.message)
        Rails.logger.error(e.backtrace.join("\n"))
        raise e
      end
  end
end
