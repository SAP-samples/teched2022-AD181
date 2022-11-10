# Exercise 1 - Deploy a CAP Business Service to SAP Business Technology Platform

In this exercise, you will deploy your SAP Cloud Application Programming Model (CAP) project to SAP Business Technology Platform (BTP), Cloud Foundry environment using SAP HANA Cloud service.

- [Exercise 1 - Deploy a CAP Business Service to SAP Business Technology Platform](#exercise-1---deploy-a-cap-business-service-to-sap-business-technology-platform)
    - [Exercise 1.1 - Change the workspace to the projects folder](#exercise-11---change-the-workspace-to-the-projects-folder)
  - [Exercise 1.2 -  Deploy CAP project to SAP Business Technology Platform](#exercise-12----deploy-cap-project-to-sap-business-technology-platform)
  - [Summary](#summary)


### Exercise 1.1 - Change the workspace to the projects folder

Switch your workspace to the `projects` folder.

1. Click on the Explorer icon and click  **Open Folder**.

    ![MDK](images/1.1.1.png)

2. Select the `projects` folder if not already selected and click **OK**.

    ![MDK](images/1.1.2.png)

    The BAS page reloads in the browser and you will now see the PROJECTS folder is opened as the workspace.

    ![MDK](images/1.1.3.png)

## Exercise 1.2 -  Deploy CAP project to SAP Business Technology Platform

>Before you deploy the CAP project, please make sure that your HANA cloud instance is up and running.
>  ![BTP Cockpit](images/1.1.0.png)

1. Navigate to `Terminal` menu | `New Terminal`. 

    ![MDK](images/1.2.1.png)

2. Execute below command to create a Cloud Foundry session. After successful login select your org and space.

    ```shell
    cf login
    ```

    OR execute below command if your user is configured with multi factor authentication. Enter your temporary authentication code from the passcode link.  

    ```shell
    cf login --sso
    ```

    ![MDK](images/1.2.2.png)  

    >You can get API endpoint from your Cloud Foundry account
    ![MDK](images/1.2.3.png) 
   

3. Execute below command setting the current path to your CAP project.

    ```shell
    cd TechEd22-AD181/exercises/ex1/ESPM-main
    ```

4. Execute below script to deploy CAP project to SAP BTP.

    ```shell
    sh deployCFMTA.sh
    ```

    ![MDK](images/1.2.4.png) 

    Once deployment process is finished, you will see a message about `ESPM-srv` application availability. 

    ![MDK](images/1.2.5.png) 

    The highlighted URL in above screenshot is your service endpoint. Copy it and paste in a new tab in your browser. 

    ![MDK](images/1.2.6.png) 

    Service Endpoints list down various path to access information about e.g., service document, service metadata document and available entities.  
    
    In order to find the required destination for Mobile development, click on the `/service/ESPM` path. 

    ![MDK](images/1.2.7.png) 

    The resulted page displays list of Entity sets of your OData service. 

    ![MDK](images/1.2.8.png) 

    **Keep a note of this URL as you will configure this endpoint as a Destination in Mobile Services.**

    >If you see the output in Raw format, you may install any `JSON formatter` extension in your browser to get a parsed output in more structured way.

## Summary

You've now generated an OData service based on SAP Cloud Programming Model (CAP).

Continue to - [Exercise 2 - Create an application from the MDK template](../ex2/README.md)

