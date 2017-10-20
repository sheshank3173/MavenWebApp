/*
 * FileName: MavenJenkinsFile
 * Author  : Gopi Muruganantham
 * Date    : 10-10-2017
 * Version : 1.0
 * Copyright 2017-2018 HTC Global Services, Inc.
*/

/*
 * Hint:
 * 1) Please note the below script will work only if you create a parameterized job with the following param names
 * BuildProject    => project name from GitHub repository 
 * BuildBranch     => GitHub repository branch for BuildProject
 * SeleniumProject => project name from GitHub repository
 * TestBranch      => GitHub repository branch for SeleniumProject
 * 2) Required Jar files are placed inside [{JENKINS_HOME}\Jars\] directory
 * 3) CredentialsId for GitHub is user defined when configuring GitHub credentials 
*/



node {
   def mvnHome
   def workspace="${JENKINS_HOME}\\workspace"
   def classpath="${JENKINS_HOME}\\workspace\\${SeleniumProject}\\bin;${JENKINS_HOME}\\Jars\\selenium\\*"
   def testServer='D:\\apache-tomcat-8.5.14'
   
   
   stage('Preparation') { 
      // Get some code from a GitHub repository
      echo 'Preparing Code...'
	  emailext from: "gopi.muruganantham@htcindia.com", 
		 to: "gopi.muruganantham@htcindia.com",
		 cc: "sayooj.panakkal@htcindia.com",
		 recipientProviders: [[$class: "DevelopersRecipientProvider"]], 
		 subject: "Build Initiated ${currentBuild.fullDisplayName}", 
		body: "Automated Build started... ${currentBuild.fullDisplayName}"
	  try{
	  	  git branch: "${BuildBranch}", 
            credentialsId: 'GH123', 
            url: "https://github.com/HTCTraining/${BuildProject}.git"
      }
	  catch(Exception e){
		mail(from: "gopi.muruganantham@htcindia.com", 
           to: "gopi.muruganantham@htcindia.com", 
           cc: "sayooj.panakkal@htcindia.com",
           subject: "FAILURE: ${currentBuild.fullDisplayName}", 
           body: "Code Preparation failed :-${currentBuild.fullDisplayName}")
		throw e
	  }
	  // Get the Maven tool.
      // ** NOTE: This 'Maven' Maven tool must be configured
      // **       in the global configuration.           
      mvnHome = tool 'Maven'
      
   }
	stage('Build') {
      // Run the maven build
      echo 'Building Application...'
      try{
	  if (isUnix()) {
         sh "'${mvnHome}/bin/mvn' clean install -DskipTests"
      } else {
         
        bat(/${mvnHome}\bin\mvn clean install -DskipTests/)
         
      }
	  }
	  catch(Exception e){
		mail(from: "gopi.muruganantham@htcindia.com", 
           to: "gopi.muruganantham@htcindia.com", 
           cc: "sayooj.panakkal@htcindia.com",
           subject: "FAILURE: ${currentBuild.fullDisplayName}", 
           body: "Project Build failed :-${currentBuild.fullDisplayName}")
		throw e
		}
	  echo 'Building Completed'
   }
	stage('Deploy for Testing') {
       // Deploy the application 
     echo 'Deploying Application...'
      bat (/copy ${workspace}\\${JOB_NAME}\\target\\${BuildProject}.war ${testServer}\\webapps\\*/)
	  echo 'Application Deployed'
   }
   
   
   stage("Liquibase"){
	echo 'Initiated Liquibase Scanning...'
		try{
		if (isUnix()) {
          sh "'${mvnHome}/bin/mvn' liquibase:update"
        } else {
          bat (/${mvnHome}\\bin\\mvn liquibase:update/)
		  }
		}
		catch(Exception e){
		mail(from: "gopi.muruganantham@htcindia.com", 
           to: "gopi.muruganantham@htcindia.com", 
           cc: "sayooj.panakkal@htcindia.com",
           subject: "FAILURE: ${currentBuild.fullDisplayName}", 
           body: "Liquibase failed :-${currentBuild.fullDisplayName}")
		throw e
		}
		echo 'Completed SonarCube Scanning'
   }
   
   stage('UnitTesting') {
      // Run the maven Unit Testing
      echo 'Initiated Unit Testing...'
		try{
	 if (isUnix()) {
         sh "'${mvnHome}/bin/mvn' test"
      } else {
        bat(/${mvnHome}\bin\mvn test/)
         
      }
	  }
	  catch(Exception e){
		mail(from: "gopi.muruganantham@htcindia.com", 
           to: "gopi.muruganantham@htcindia.com", 
           cc: "sayooj.panakkal@htcindia.com",
           subject: "FAILURE: ${currentBuild.fullDisplayName}", 
           body: "UnitTesting failed :-${currentBuild.fullDisplayName}")
		throw e
		}
	  echo 'Unit Testing completed'
   }
   stage('JUnit Results') {
       // Prepare JUnit Test Results
	  echo 'Archiving Test results...'
      junit '**/target/surefire-reports/TEST-*.xml'
      archive 'target/*.war'
	  echo 'Test Result recorded'
   }
   
   stage('Automation Testing') {
       // Initiate Automation Testing
	   echo 'Preparing Code for Automation Testing...'
	   try{
	   checkout([$class: 'GitSCM', 
		branches: [[name: "*/${TestBranch}"]], 
		doGenerateSubmoduleConfigurations: false, 
		extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: "${JENKINS_HOME}\\workspace\\${SeleniumProject}"]], 
		submoduleCfg: [], 
		userRemoteConfigs: [[credentialsId: 'GH123', url: "https://github.com/HTCTraining/${SeleniumProject}.git"]]])
	   }
	   catch(Exception e){
		mail(from: "gopi.muruganantham@htcindia.com", 
           to: "gopi.muruganantham@htcindia.com", 
           cc: "sayooj.panakkal@htcindia.com",
           subject: "FAILURE: ${currentBuild.fullDisplayName}", 
           body: "Unable to locate Automation Script :-${currentBuild.fullDisplayName}")
		throw e
		}
      withEnv(["classpath=${classpath}"]) {
       		
		// without 'withEnv' block
		//bat (/set classpath=${classpath}/)
        
		echo 'Initiated Automation Testing...'
		try{
		if (isUnix()) {
          sh "java org.testng.TestNG ${JENKINS_HOME}/workspace/${SeleniumProject}/testing.xml"
        } else {
		   bat (/java org.testng.TestNG ${JENKINS_HOME}\\workspace\\${SeleniumProject}\\testing.xml/)
		  }
		}
		catch(Exception e){
		mail(from: "gopi.muruganantham@htcindia.com", 
           to: "gopi.muruganantham@htcindia.com", 
           cc: "sayooj.panakkal@htcindia.com",
           subject: "FAILURE: ${currentBuild.fullDisplayName}", 
           body: "Automation Test failed :-${currentBuild.fullDisplayName}")
		throw e
		}
		// Invoking external job
		//build job: 'MavenSpringMVCSelenium'
		
		echo 'Automation Test Completed'
        
	    }

   }
   
   stage("SonarCube"){
      
	    echo 'Initiated SonarCube Scanning...'
		try{
		if (isUnix()) {
          sh "'${mvnHome}/bin/mvn' clean sonar:sonar"
        } else {
          bat (/${mvnHome}\\bin\\mvn clean sonar:sonar/)
		  }
		}
		catch(Exception e){
		mail(from: "gopi.muruganantham@htcindia.com", 
           to: "gopi.muruganantham@htcindia.com", 
           cc: "sayooj.panakkal@htcindia.com",
           subject: "FAILURE: ${currentBuild.fullDisplayName}", 
           body: "SonarCube failed :-${currentBuild.fullDisplayName}")
		throw e
		}
		echo 'Completed SonarCube Scanning'
      
    }
     
   stage("Result"){
      if(currentBuild.result!="FAILED"){
      emailext from: "gopi.muruganantham@htcindia.com", 
		 to: "gopi.muruganantham@htcindia.com",
		 cc: "sayooj.panakkal@htcindia.com",
		 recipientProviders: [[$class: "DevelopersRecipientProvider"]], 
		 subject: "Build success ${currentBuild.fullDisplayName}", 
		body: "Build Result ${currentBuild.fullDisplayName}: ${currentBuild.result}"
      }
      else{
      emailext from: "gopi.muruganantham@htcindia.com", 
		 to: "gopi.muruganantham@htcindia.com",
		 cc: "sayooj.panakkal@htcindia.com",
		 recipientProviders: [[$class: "DevelopersRecipientProvider"]], 
		 subject: "Build Failed ${currentBuild.fullDisplayName}", 
		body: "Build Result ${currentBuild.fullDisplayName}: ${currentBuild.result}"
    
     }
    }
  
}