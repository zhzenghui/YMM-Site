class HardWorker
  include Sidekiq::Worker

  def perform(name, count)
    puts 'Doing hard work'
    logger.info("test")
  end
end