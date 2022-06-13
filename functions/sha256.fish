function sha256
  echo -n "$argv[1]" | openssl dgst -sha256
end
