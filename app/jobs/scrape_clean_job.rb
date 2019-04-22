class ScrapeCleanJob
  include SuckerPunch::Job

  def perform
    Scrape.where("date < ?", (Time.now - 30.days)).destroy_all
    Job.where("date < ?", (Time.now - 30.days)).destroy_all
  end
end
