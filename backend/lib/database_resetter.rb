require 'active_record/fixtures'

class DatabaseResetter
  def self.reset
    DatabaseCleaner.clean

    fixtures_path = File.join Rails.root, 'test', 'fixtures'
    ActiveRecord::FixtureSet.reset_cache
    Dir["#{fixtures_path}/**/*.yml"].map {|f| f[(fixtures_path.size + 1)..-5] }.each { |f_name| ActiveRecord::FixtureSet.create_fixtures(fixtures_path, f_name) }
  end
end
