function dfimage
  docker run -v /var/run/docker.sock:/var/run/docker.sock --rm alpine/dfimage $argv[1]
end