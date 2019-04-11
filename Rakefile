def force_sh(cmd)
  begin
    sh cmd
  rescue => e
    puts e.message
  end
end

desc "run server"
task :run do
  cmd = <<-EOS
    docker-compose build
    docker-compose down
    docker-compose up -d
  EOS
  sh cmd
end

desc "prune images"
task :prune do
  force_sh 'docker volume prune -f > /dev/null 2>&1'
  force_sh 'docker rmi -f $(docker images -f "dangling=true" -q) > /dev/null 2>&1'
end

desc "create docker network"
task :create_network do
  force_sh 'docker network create --driver bridge restapi_proxy_server'
end

desc "タスク一括実行"
task :default => [:create_network, :run, :prune]
