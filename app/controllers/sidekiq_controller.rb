class SidekiqController < ApplicationController
  def enqueue
    @jid = Sidekiq::Client.push('class' => TestJob, 'args' => ['prabhu', 10])
  end
end
