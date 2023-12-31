pipeline {
    agent {
        label 'master'
    }

    parameters {
        string(name: 'USERNAME', defaultValue: '', description: 'Enter username')
        string(name: 'PASSWORD', defaultValue: '', description: 'Enter password')
        string(name: 'EMAIL', defaultValue: '', description: 'Enter email')
        string(name: 'FIRSTNAME', defaultValue: '', description: 'Enter first name')
        string(name: 'LASTNAME', defaultValue: '', description: 'Enter last name')

        choice(
            name: 'ACCOUNT_MANAGEMENT',
            choices: ['', 'add_user', 'delete_user', 'lock_user', 'unlock_user'],
            description: ''
        )
    }

    stages {
        stage ('Checkout1-0') {
            steps {
                dir("${WORKSPACE}/jenkins-classes") {
                    checkout([
                        $class: 'GitSCM',
                        branches: [[name: "*/main"]],
                        doGenerateSubmoduleConfigurations: false,
                        extensions: [[$class: 'LocalBranch']],
                        submoduleCfg: [],
                        userRemoteConfigs: [[
                        url: 'https://github.com/clovisbernard/jenkins-classes.git',
                        credentialsId: 'github-auth'
                        ]]
                    ])
                }
            }
        }

        stage('Sanity Check') {
            steps {
                script{
                   sanity_check() 
                }
            }
        }
        stage('Collect Information') {
            steps {
                script {
                    collect_information()
                }
            }
        }
        stage('Manage user account') {
            steps {
                script {
                    manage_user_account()
                }
            }
        }
    }
}

def sanity_check() {
    if (params.USERNAME.isEmpty()){
       echo "The parameter USERNAME is not set"
       sh 'exit 2'
   } 
   if (params.PASSWORD.isEmpty()){
       echo "The parameter PASSWORD is not set"
       sh 'exit 2'
   }
   if (params.EMAIL.isEmpty()){
       echo "The parameter EMAIL is not set"
       sh 'exit 2'
   }
   if (params.FIRSTNAME.isEmpty()){
       echo "The parameter FIRSTNAME is not set"
       sh 'exit 2'
   }
   if (params.LASTNAME.isEmpty()){
       echo "The parameter LASTNAME is not set"
       sh 'exit 2'
   }
}

def collect_information() {
    sh """
        echo "Username: ${params.USERNAME}"
        echo "Password : ${params.PASSWORD}"
        echo "Email: ${params.EMAIL}"
        echo "First Name: ${params.FIRSTNAME}"
        echo "Last Name: ${params.LASTNAME}"
    """
}

def manage_user_account() {
    if (params.ACCOUNT_MANAGEMENT == 'add_user')
    sh """
        if ! grep -q "^${params.USERNAME}:" /etc/passwd; then
        sudo useradd -m ${params.USERNAME}
        sudo echo "${params.USERNAME}:${params.PASSWORD}" | sudo -S chpasswd
        sudo usermod -c "${params.FIRSTNAME} ${params.LASTNAME}" ${params.USERNAME}
        sudo cat /etc/passwd | grep ${params.USERNAME}
        sudo cat /etc/shadow | grep ${params.USERNAME}
        ls /home
        else
        echo "user ${params.USERNAME} already exists"  
        fi
    """
    if (params.ACCOUNT_MANAGEMENT == 'delete_user')
    sh """
        if ! grep -q "^${params.USERNAME}:" /etc/passwd; then
        echo "user ${params.USERNAME} does not exist"
        else
        sudo userdel -r ${params.USERNAME}
        sudo echo "The user ${params.USERNAME} with password ${params.PASSWORD} has been deleted"
        sudo cat /etc/passwd | grep ${params.USERNAME} || true
        sudo cat /etc/shadow | grep ${params.USERNAME} || true
        fi
    """
    if (params.ACCOUNT_MANAGEMENT == 'lock_user')
    sh """
        if ! grep -q "^${params.USERNAME}:" /etc/passwd; then
        echo "user ${params.USERNAME} does not exist"
        else
        sudo passwd -l ${params.USERNAME}
        sudo echo "The user ${params.USERNAME} with password ${params.PASSWORD} has been locked"
        sudo cat /etc/shadow | grep ${params.USERNAME}
        fi
    """
    if (params.ACCOUNT_MANAGEMENT == 'unlock_user')
    sh """
        if ! grep -q "^${params.USERNAME}:" /etc/passwd; then
        echo "user ${params.USERNAME} does not exist"
        else
        sudo passwd -u ${params.USERNAME}
        sudo echo "The user ${params.USERNAME} with password ${params.PASSWORD} has been unlocked"
        sudo cat /etc/passwd | grep ${params.USERNAME}
        fi
    """
}