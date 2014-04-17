namespace :qunit do
  task :ci do
    pid = Process.spawn('JS=true rails s -e test')

    sleep 5

    runner_pid = Process.spawn('phantomjs runner.js http://127.0.0.1:3000/tests')

    puts runner_pid
    Process.waitpid runner_pid

    runner_status = $?

    Process.kill(:QUIT, pid)

    Process.wait

    if runner_status.to_i != 0
      puts rails_r.read
      raise
    else
      exit
    end
  end
end
