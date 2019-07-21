class Loadavg
  def self.get
    loadavg = File.read('/proc/loadavg').split
    runnable_entities, existing_entities = loadavg[3].split('/', 2)
    {
      one_min_avg: loadavg[0].to_f,
      five_min_avg: loadavg[1].to_f,
      fifteen_min_avg: loadavg[2].to_f,
      runnable_entities: runnable_entities.to_i,
      existing_entities: existing_entities.to_i,
      last_pid: loadavg[4].to_i
    }
  end
end
