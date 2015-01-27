Apex Google Drive API Framework
===============================

<a href="https://githubsfdeploy.herokuapp.com?owner=financialforcedev&repo=ffhttp-googledrive">
    <img alt="Deploy to Salesforce"
        src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/src/main/webapp/resources/img/deploy.png">
</a>

Overview
--------

An Apex framework has been created to provide functionality for Google Drive API callouts. 

This library extends the [Core](https://github.com/financialforcedev/ffhttp-core) library to provide access to Google Drive API calls found at https://developers.google.com/drive/v2/reference/.

Key Features
------------

+ Apex Google Drive API


Sample Code
-----------

Using the Google Drive library is straightforward once the connector between Salesforce and Google Drive has been set up. 

To transfer a file between Salesforce and Google Drive the following example code can be used. In this example, a file is created in Google Drive with the name *'Test  File'* and the contents *'Test document contents'*. 

    //Create the credentials and Google Drive client
    //Note that 'Sample_Token' needs replacing with the access token provided from the OAuth authenication process.
    ffhttp_Client.Credentials credentials = new ffhttp_Client.Credentials('Bearer', 'Sample_Token');
    ffhttp_GoogleDrive client = new ffhttp_GoogleDrive(credentials);

    //Create a file containing the metadata required.
    ffhttp_GoogleDriveModelFile file = new ffhttp_GoogleDriveModelFile();
    file.setTitle('Test File.txt');
    file.setMimeType('text/plain');

    //Create the example file contents
    Blob fileContents = Blob.valueOf('Test document contents');

    //Create an insert request to insert the file meta data
    ffhttp_GoogleDriveFiles files = client.files();
    ffhttp_GoogleDriveFiles.InsertRequest insertRequest = files.insertRequest(file, null);
    file  = (ffhttp_GoogleDriveModelFile)insertRequest.execute();

    //Create an update request to upload the file data
    ffhttp_GoogleDriveFiles.UpdateRequest updateRequest = files.updateRequest(file, fileContents);
    file  = (ffhttp_GoogleDriveModelFile)updateRequest.execute();

    //This will insert a new file into Google Drive called 'Test File.txt' with the contents 'Test document contents'.

Configuration
-------------

This section explains how to create a connection between Salesforce and Google Drive using the packages described above.

Make sure that the [Core](https://githubsfdeploy.herokuapp.com?owner=financialforcedev&repo=ffhttp-core) and [Google Drive](https://githubsfdeploy.herokuapp.com?owner=financialforcedev&repo=ffhttp-googledrive) packages have been deployed to your Saleforce organisation.

###Create an app in Google

1. Log in to your Google account.
2. Go to https://console.developers.google.com/project and select **Create Project**.
3. Enter a project name and ok the dialog.
4. Select the hyperlink for the project name that you just created.
5. Expand the **APIs & auth** section.
6. Select **APIs**.
7. Enter **Drive API** in the **Browse APIs** section.
8. Turn the **Drive API** on.
9. Select **Credentials**.
10. Select **Create new Client ID**.
11. Select **Web application**.
12. Set the **Authorized Javascript Origins** url to the URL of the Salesforce organisation e.g. https://eu3.salesforce.com.
13. Set the **Authorized Redirect URIs** to the same as above with *apex/connector* appended: e.g. https://eu3.salesforce.com/apex/connector.
14. Make sure you know the **Client Id** and **Client Secret** as they will be needed later.
15. Select the **Consent screen**.
16. Enter a **Product Name** and save.

###Create a Connector in Salesforce

This requires the [OAuth Sample App](https://githubsfdeploy.herokuapp.com?owner=financialforcedev&repo=ffhttp-core-samples) to be deployed.

1. Log in to your Salesforce organisation.
2. Select the **OAuth Sample App**.
3. Select **Connector Types** then **New**.
4. Enter a **Connector Type Name** e.g. Google Drive.
5. Set the **Authorization Endpoint** to https://accounts.google.com/o/oauth2/auth. 
6. Set the **Token Endpoint** to https://accounts.google.com/o/oauth2/token.
7. Set the **Client ID** to the client ID obtained earlier.
8. Set the **Client Secret** to the client secret obtained earlier.
9. Set the **Redirect URI** to the same URL as you set in step 12 in the Create an app in Google section.
10. Make sure that **Scope Required** is checked.
11. For full access to Google Drive add https://www.googleapis.com/auth/drive as the scope. Otherwise, if you want to limit access to Google Drive choose one of the scopes defined below.
12. Set the **Extra Url Parameters** to **access_type=offline**. Setting **access_type** to offline means that Google Drive supplies a refresh token with the access token which is required if you do not wish to reautheniticate with Google Drive every time the access token expires.
13. **Save** the Connector Type.
14. Select **New Connector**.
15. Set the **Connector Name** and save. 
16. Select the Connector and then **Activate**. You will be directed to another Salesforce page that activates your connector.
17. Select **Authorize**. This will prompt you to log in to your Google account (if you are not already logged in) and then authenticate the scope provided earlier. Select **Accept** to authorize. 
18. Select **Save**. The connector is now ready for use.

Note that authorization can be revoked at any point by either deleting the connector in Salesforce or  revoking access to the app in Google (Select your profile then Account > Security > Account Permissions > Apps and website (View All), choose the app created and then select **Revoke Access**).

###Google Drive Scopes

To limit access to the Google Drive functionality the following [scopes](https://developers.google.com/drive/web/scopes) can be used.

+ https://www.googleapis.com/auth/drive	
Full, permissive scope to access all of a user's files. 

+ https://www.googleapis.com/auth/drive.file	
Per-file access to files created or opened by the app

+ https://www.googleapis.com/auth/drive.apps.readonly	
Allows apps read-only access to the list of Drive apps a user has installed.

+ https://www.googleapis.com/auth/drive.readonly	
Allows read-only access to file metadata and file content

+ https://www.googleapis.com/auth/drive.readonly.metadata
Allows read-only access to file metadata, but does not allow any access to read or download file content

+ https://www.googleapis.com/auth/drive.install	
Special scope used to let users approve installation of an app

+ https://www.googleapis.com/auth/drive.appfolder	
Allows access to the Application Data folder

+ https://www.googleapis.com/auth/drive.scripts	
Allows access to Apps Script files

Reporting Issues & Enhancements
-------------------------------

Please report any issues using the github [issues](https://github.com/financialforcedev/ffhttp-googledrive/issues) feature. Suggestions / bug reports are welcome as are extensions containing additional functionality.
