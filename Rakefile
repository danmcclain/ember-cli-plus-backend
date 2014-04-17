require 'rake'

task :deploy do
  sh 'git checkout rsh-production'
  sh 'git merge rails-served-html -m "Merging master for deployment"'
  sh 'rm -rf backend/public/assets'
  sh 'cd frontend && BROCCOLI_ENV=production broccoli build ../backend/public/assets && cd ..'

  unless `git status` =~ /nothing to commit, working directory clean/
    sh 'git add -A'
    sh 'git commit -m "Asset compilation for deployment"'
  end

  sh 'git subtree push -P backend heroku master'

  release_output = `heroku releases -a rails-html-ember-cli`.split "\n"
  latest_release = release_output[1].match(/v\d+/).to_s

  tags = `git tag`

  unless tags.include? latest_release
    sh "git tag #{latest_release}"
  end

  sh 'git checkout -'
end
