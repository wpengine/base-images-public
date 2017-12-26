#!groovy
import wpe.k8s.EnvironmentInfo
@Library('wpshared') _

node('docker') {
    wpe.pipeline('Giant Meteor') {

        for (env in EnvironmentInfo.environments) {
            echo env
        }
        def helmVersion = readFile("gcloud/helm/VERSION").trim()
        stage('Helm docker build'){
            helmImage = docker.build(
                "helm:${helmVersion}",
                "-f gcloud/helm/Dockerfile --build-arg helm_version=${helmVersion} ."
            )
        }

        stage('Deploy Tiller to farm-integration') {
            withCredentials([
            [$class: 'FileBinding', credentialsId: 'kubectl_config_all', variable: 'KUBE_CONFIG'],
            [$class: 'FileBinding', credentialsId: 'gcp-k8s', variable: 'GCP_SERVICE_ACCOUNT']
            ]) {
                helmImage.inside("-u root -v ${KUBE_CONFIG}:/root/.kube/config -v ${GCP_SERVICE_ACCOUNT}:/service-account.json") {
                    sh "gcloud auth activate-service-account --key-file=/service-account.json"
                    sh "kubectl config use-context gke_wp-engine-development_us-east1-b_us-east1-farm-01"
                    sh "helm init --upgrade"
                }
                // Give the new tiller pod some time to come up
                sleep(30)
            }
        }
        stage('Helm acceptance tests') {
            try {
                helm.deploy {
                    wpeEnv = 'farm-integration'
                    releaseName = 'jenkins-library-canary'
                    chart = 'stable/redis'
                    timeout = '130'
                    values = ['persistence.enabled': 'false']
                }
                helm.status {
                    wpeEnv = 'farm-integration'
                    releaseName = 'jenkins-library-canary'
                    tillerNamespace = 'kube-system'
                }
                helm.delete {
                    wpeEnv = 'farm-integration'
                    releaseName = 'jenkins-library-canary'
                    debug = true
                }
            } catch (e) {
            // Try and roll back to the latest helm version
                withCredentials([
                [$class: 'FileBinding', credentialsId: 'kubectl_config_all', variable: 'KUBE_CONFIG'],
                [$class: 'FileBinding', credentialsId: 'gcp-k8s', variable: 'GCP_SERVICE_ACCOUNT']
                ]) {
                    docker.image('us.gcr.io/wp-engine-development/helm:latest').inside("-u root -v ${KUBE_CONFIG}:/root/.kube/config -v ${GCP_SERVICE_ACCOUNT}:/service-account.json") {
                        sh "gcloud auth activate-service-account --key-file=/service-account.json"
                        sh "kubectl config use-context gke_wp-engine-development_us-east1-b_us-east1-farm-01"
                        sh "helm init --upgrade"
                    }
                }
            }
        }

        stage('Publish Helm docker image') {
            dockerRegistry.publishImage {
                environment = 'development'
                image = helmImage.id
            }
            helmImage.tag('latest')
            dockerRegistry.publishImage {
                environment = 'development'
                image = 'helm:latest'
            }
        }

        if (env.BRANCH_NAME == 'master') {
            stage('Upgrade tiller accross environments') {
                for (env in EnvironmentInfo.environments) {
                    echo env
                }
            }
        }

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
