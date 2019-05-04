def force_sh(cmd)
  begin
    sh cmd
  rescue => e
    puts e.message
  end
end

desc "run server(rebuild)"
task :run_and_build do
  cmd = <<-EOS
    docker-compose build
    docker-compose down
    docker-compose up -d
  EOS
  sh cmd
end

desc "run server"
task :run do
  cmd = <<-EOS
    docker-compose down
    docker-compose up -d
  EOS
  sh cmd
end

desc "prune images"
task :prune do
  if /darwin/ =~ RUBY_PLATFORM # macos
    force_sh 'docker volume prune -f > /dev/null 2>&1'
    force_sh 'docker rmi -f $(docker images -f "dangling=true" -q) > /dev/null 2>&1'
  else
    force_sh 'docker volume prune -f'
    force_sh 'docker rmi -f $(docker images -f "dangling=true" -q)'
  end
end

desc "create docker network"
task :create_network do
  force_sh 'docker network create --driver bridge variable-request-reverse-proxy'
end

task :default => [:create_network, :run, :prune]
