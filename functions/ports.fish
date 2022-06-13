function ports
  netstat -atp tcp | grep -i "listen"
end
