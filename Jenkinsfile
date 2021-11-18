node{
    stage('clone repo')
    {
        checkout scm
    }
    stage('build docker image')
    {
        sh "docker build -t build-$CurrentBuild.number --build-arg BRANCH=$env.BRANCH_NAME ."
    }
}