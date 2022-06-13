function ttunnel
	set -l pod_name "$argv[1]"
	set -l dc "$argv[2]"
	set -l remote_port "$argv[3]"
  if test (count $argv) -gt 3
	  set local_port "$argv[4]"
  else
    set local_port "$argv[3]"
  end

	set -l tugresults (tug ps -c "$dc" "$pod_name" | grep Running | head -n 1)

	if test -z $tugresults;
		echo "No services matching [$pod_name] in DC [$dc] were found."
  		return 1
	end

	set -l selected_pod (echo $tugresults | awk '{print $2}')
	set -l selected_network (echo $tugresults | awk '{print $4}')
	set -l selected_ip (echo "$selected_network" | cut -d ':' -f 2)

	echo "Tunneling to $selected_pod to port $remote_port with local port $local_port"


	ssh -f -N -q -L $local_port:$selected_ip:$remote_port -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no bastion
end
