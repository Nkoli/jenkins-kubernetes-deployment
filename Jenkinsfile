/**
 * This pipeline will run a Docker image build
 */

def label = "docker-${UUID.randomUUID().toString()}"

podTemplate(label: label, containers: [
    containerTemplate(
        name: 'docker',
        image: 'docker',
        command: 'cat',
        ttyEnabled: true
    )
    containerTemplate(
        name: 'kubectl',
        image: 'lachlanevenson/k8s-kubectl',
        command: 'cat',
        ttyEnabled: true
    )],
    volumes: [
        hostPathVolume(
            mountPath: '/var/run/docker.sock',
            hostPath: '/var/run/docker.sock',
        )
    ]
) {
    registry = "ivelia/jenkinskubernetesdeployment"
    registryCredential = "dockerhub"
    dockerImage = ''
    node(label) {
        stage('Build Docker image and push to docker registry') {
            git 'https://github.com/Nkoli/jenkins-kubernetes-deployment.git'
            container('docker') {
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
