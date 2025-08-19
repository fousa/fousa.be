# Threads: allow separate MIN/MAX, defaulting to your previous 5
max_threads_count = Integer(ENV.fetch("PUMA_MAX_THREADS", ENV.fetch("THREAD_COUNT", 5)))
min_threads_count = Integer(ENV.fetch("PUMA_MIN_THREADS", max_threads_count))
threads min_threads_count, max_threads_count

# Port / env like before
port ENV.fetch("PORT", 3000)
environment ENV.fetch("RACK_ENV", "development")

# Clustered mode (same default as your snippet)
workers Integer(ENV.fetch("WEB_CONCURRENCY", 2))

# Preload for copy-on-write memory savings
preload_app!

# Explicitly point to the rackup file (DefaultRackup is deprecated/removed)
rackup ENV.fetch("RACKUP", "config.ru")

# Helpful in dev so the worker won't be killed during long debugging sessions
if ENV.fetch("RACK_ENV", "development") == "development"
  worker_timeout 3600
end

# Re-establish connections per worker if you add DBs/etc.
on_worker_boot do
  # Example:
  # ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

# Enable `pumactl phased-restart` / `rails restart`-style tmp restarts (harmless for Sinatra)
plugin :tmp_restart
