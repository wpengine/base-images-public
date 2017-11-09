#!groovy
@Library('wpshared') _

node('docker') {
    wpe.pipeline('Giant Meteor') {
      String  IMAGE_TAG = "${BUILD_NUMBER}.${GIT_COMMIT}"
      stage('Publish iptables') {
        def registries = ['development', 'production']
        docker.build("iptables:${IMAGE_TAG}","-f iptables/Dockerfile .")
        sh "docker tag iptables:${IMAGE_TAG} iptables:latest"
        for (registry in registries) {
          dockerRegistry.publishImage {
            environment = registry
            image = "iptables:latest"
          }
          dockerRegistry.publishImage {
            environment = registry
            image = "iptables:${IMAGE_TAG}"
          }
        }
      }
    }
}
