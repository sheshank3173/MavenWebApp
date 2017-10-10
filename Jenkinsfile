node {
   def mvnHome
   def workspace="${JENKINS_HOME}\\workspace"
   def classpath="${JENKINS_HOME}\\workspace\\${SeleniumProject}\\bin;${JENKINS_HOME}\\Jars\\selenium\\*"
   def productionServer='D:\\eccat8.5'
   def TestServer='D:\\IMPC0989_D\\apache-tomcat-8.5.15'
   
   stage('Preparation') { 
      // Get some code from a GitHub repository
      echo 'Preparing Code...'
	  emailext from: "gopi.muruganantham@htcindia.com", 
		 to: "gopi.muruganantham@htcindia.com",
		 cc: "syooj.panakkal@htcindia.com",
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
           subject: "FAILURE: ${currentBuild.fullDisplayName}", 
           body: "Code Preparation failed :-${currentBuild.fullDisplayName}")
		throw e
	  }
	  // Get the Maven tool.
      // ** NOTE: This 'Maven' Maven tool must be configured
      // **       in the global configuration.           
      mvnHome = tool 'Maven'
      
   }
   stage("Liquibase"){
	echo 'Initiated Liquibase Scanning...'
		try{
		if (isUnix()) {
          sh "'${mvnHome}/bin/mvn' clean liquibase:update"
        } else {
          bat (/${mvnHome}\\bin\\mvn liquibase:update/)
		  }
		}
		catch(Exception e){
		mail(from: "gopi.muruganantham@htcindia.com", 
           to: "gopi.muruganantham@htcindia.com", 
           subject: "FAILURE: ${currentBuild.fullDisplayName}", 
           body: "Liquibase failed :-${currentBuild.fullDisplayName}")
		throw e
		}
		echo 'Completed SonarCube Scanning'
   }
   stage("SonarCube"){
      
	    echo 'Initiated SonarCube Scanning...'
		try{
		if (isUnix()) {
          sh "'${mvnHome}/bin/mvn' clean verify sonar:sonar"
        } else {
          bat (/${mvnHome}\\bin\\mvn clean verify sonar:sonar/)
		  }
		}
		catch(Exception e){
		mail(from: "gopi.muruganantham@htcindia.com", 
           to: "gopi.muruganantham@htcindia.com", 
           subject: "FAILURE: ${currentBuild.fullDisplayName}", 
           body: "SonarCube failed :-${currentBuild.fullDisplayName}")
		throw e
		}
		echo 'Completed SonarCube Scanning'
      
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
           subject: "FAILURE: ${currentBuild.fullDisplayName}", 
           body: "Project Build failed :-${currentBuild.fullDisplayName}")
		throw e
		}
	  echo 'Building Completed'
   }
   stage('UnitTesting') {
      // Run the maven Unit Testing
      echo 'Initiated Unit Testing...'
		try{
	 if (isUnix()) {
         sh "'${mvnHome}/bin/mvn' test"
      } else {
        bat(/${mvnHome}\bin\mvn clean test/)
         
      }
	  }
	  catch(Exception e){
		mail(from: "gopi.muruganantham@htcindia.com", 
           to: "gopi.muruganantham@htcindia.com", 
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
   stage('Deploy for Testing') {
       // Deploy the application 
     echo 'Deploying Application...'
      bat (/copy ${workspace}\\${BuildProject}\\target\\${BuildProject}.war ${TestServer}\\webapps\\*/)
	  echo 'Application Deployed'
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
           subject: "FAILURE: ${currentBuild.fullDisplayName}", 
           body: "Automation Test failed :-${currentBuild.fullDisplayName}")
		throw e
		}
		// Invoking external job
		//build job: 'MavenSpringMVCSelenium'
		
		echo 'Automation Test Completed'
        
	    }

   }
   stage('Production Deploy') {
       // Deploy the application 
     echo 'Deploying Application...'
      bat (/copy ${workspace}\\${BuildProject}\\target\\${BuildProject}.war ${productionServer}\\webapps\\*/)
	  echo 'Application Deployed'
   }
   stage("Result"){
      if(currentBuild.result!="FAILED"){
      emailext from: "gopi.muruganantham@htcindia.com", 
		 to: "gopi.muruganantham@htcindia.com",
		 recipientProviders: [[$class: "DevelopersRecipientProvider"]], 
		 subject: "Build success ${currentBuild.fullDisplayName}", 
		body: "Build Result ${currentBuild.fullDisplayName}: ${currentBuild.result}"
      }
      else{
      emailext from: "gopi.muruganantham@htcindia.com", 
		 to: "gopi.muruganantham@htcindia.com",
		 recipientProviders: [[$class: "DevelopersRecipientProvider"]], 
		 subject: "Build Failed ${currentBuild.fullDisplayName}", 
		body: "Build Result ${currentBuild.fullDisplayName}: ${currentBuild.result}"
    
     }
    }
  
}