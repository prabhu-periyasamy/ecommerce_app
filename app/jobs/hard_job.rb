# https://github.com/sidekiq/sidekiq/wiki/Getting-Started
class HardJob
  include Sidekiq::Worker

  # https://github.com/sidekiq/sidekiq/wiki/Advanced-Options
  sidekiq_options queue: 'critical'

  def perform(complexity)
    # Do something
    case complexity
    when "super_hard"
      sleep 20
      puts "Very Hard job, taking 20 seconds to complete !!!"
    when "hard"
      sleep 10
      puts "Hard job, taking 10 seconds to complete !!!"
    when "easy"
      sleep 5
      puts "Easy job, taking 5 seconds to complete !!!"
    end
  end
end
