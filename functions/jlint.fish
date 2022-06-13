function jlint
  if test -z $JENKINS_AUTH
    echo 'JENKINS_AUTH must be defined' 1>&2
    exit 1
  end

  set -l JENKINS_URL https://build.devops.jive.com
  set -l JENKINS_CRUMB (curl -s -u $JENKINS_AUTH $JENKINS_URL/crumbIssuer/api/xml\?xpath=concat\(//crumbRequestField,\":\",//crumb\))

  set -l jfile $argv[1]
  echo "Validating '$jfile'"
  curl -X POST -H $JENKINS_CRUMB -F "jenkinsfile=<$jfile" -u $JENKINS_AUTH $JENKINS_URL/pipeline-model-converter/validate
end