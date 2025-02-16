# The ServiceResponse class is a simple class that encapsulates the response of a service. It has four attributes: success, content, error, and code. The success attribute is a boolean that indicates whether the service was successful or not. The content attribute contains the content of the response, if any. The error attribute contains the error message, if any. The code attribute contains the error code, if any. The success? method returns true if the service was successful, and false otherwise.
class ServiceResponse
  attr_reader :success, :content, :error, :code

  def initialize(success:, content: nil, error: nil, code: nil)
    @success = success
    @content = content
    @error = error
    @code = code
  end

  def success?
    success
  end
end