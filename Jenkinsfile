#!groovy
@Library('wpshared') _

node('docker') {
    String  IMAGE_TAG = "${BUILD_NUMBER}.${GIT_COMMIT}"

    wpe.pipeline('Giant Meteor') {
      docker.build('iptables:latest','-f iptables/Dockerfile')
      dockerRegistry.publishImage {
        environment = 'development'
        image = 'iptables:latest'
      }
      dockerRegistry.publishImage {
        environment = 'production'
        image = 'iptables:latest'
      }
    }
}
