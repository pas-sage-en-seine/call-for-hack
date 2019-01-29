threads_count = ENV.fetch('MAX_THREADS') { 5 }.to_i
threads threads_count, threads_count

env = ENV.fetch('RAILS_ENV') { 'development' }

environment env
workers     ENV.fetch('WEB_CONCURRENCY') { 2 }

if env == 'production'
    pidfile ENV.fetch('PID') { 'tmp/pids/puma.pid' }
    bind ENV.fetch('BIND') { 'unix://tmp/sockets/puma.sock' }
else
    port ENV.fetch('PORT') { 3000 }
end

preload_app!

on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

plugin :tmp_restart
