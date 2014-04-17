require 'rake'

task :deploy do
  sh 'git checkout ember-compiled-index-production'
  sh 'git merge ember-compiled-index-rails -s theirs -m "Merging master for deployment"'
  sh 'rm -rf backend/public'
  sh 'cd frontend && ember build production && mv dist ../backend/public && cd ..'

  unless `git status` =~ /nothing to commit, working directory clean/
    sh 'git add -A'
    sh 'git commit -m "Asset compilation for deployment"'
  end

  sh 'git subtree push -P backend eci master'

  release_output = `heroku releases -a ember-compiled-index`.split "\n"
  latest_release = release_output[1].match(/v\d+/).to_s

  tags = `git tag`

  unless tags.include? latest_release
    sh "git tag eci-#{latest_release}"
  end

  sh 'git checkout -'
end
