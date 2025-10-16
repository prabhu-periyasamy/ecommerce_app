# https://github.com/sidekiq/sidekiq/wiki/Getting-Started
class TestJob
  include Sidekiq::Worker

  # https://github.com/sidekiq/sidekiq/wiki/Advanced-Options
  sidekiq_options queue: 'critical'

  def perform(name, delay_in_seconds)
    # Do something
    puts "Job started !!!"
    puts "Will take #{delay_in_seconds} seconds to complete ..."
    sleep delay_in_seconds
    puts "Hi #{name}, Job completed !!!"
  end
end
