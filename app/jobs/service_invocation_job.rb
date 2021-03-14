class ServiceInvocationJob < ApplicationJob
  queue_as :default

  def perform(service_name, args)
    service_name.constantize.call(*args)
  end
end
