require 'rake'

task :run do
  pids = [
    spawn("cd backend && rails s -p 3900"),
    spawn("cd frontend && ./node_modules/.bin/ember server --port=4900 --proxy-port=3900"),
  ]

  trap "INT" do
    Process.kill "INT", *pids
    exit 1
  end

  loop do
    sleep 1
  end
end

task :deploy do
  sh 'git checkout ember-compiled-index-production'
  sh 'git merge ember-compiled-index-rails -m "Merging master for deployment"'
  sh 'rm -rf backend/public'
  sh 'cd frontend && ember build production && mv dist ../backend/public && cd ..'

  unless `git status` =~ /nothing to commit, working directory clean/
    sh 'git add -A'
    sh 'git commit -m "Asset compilation for deployment"'
  end

  sh 'git subtree push -P backend eci master'

  release_output = `heroku releases -a ember-compiled-index`.split "\n"
  latest_release = "eci-#{release_output[1].match(/v\d+/).to_s}"

  tags = `git tag`

  unless tags.include? latest_release
    sh "git tag #{latest_release}"
  end

  sh 'git checkout -'
end
