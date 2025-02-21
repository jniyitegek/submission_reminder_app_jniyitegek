# Submission Reminder App: INSTRUCTIONS OF USE

## First, Read the Following Instructions Please:

To use this app, first clone the repository in your terminal.  

1. Copy the URL of this repository (found at the top of the webpage).  
2. Open your terminal on **Linux**, **Mac OS**, or **Webterm**.  
3. Type the following command, replacing `<repository-url>` with the actual URL:  

   ```bash
   git clone <repository-url>
4. Use cd to navigate into the cloned main directory
   ```bash
   cd submission_reminder_app_jniyitegek
## The App Startup and Running Instructions

To start the app in your terminal, run the following command:

```bash
./create_environment.sh
```
* That command will start the script which will help in creating the environment for the app to run smoothly. 

* Upon running ``` ./create_environment.sh ```, you will be prompted to type the name under which the environment directories will be created.

* **Type your name**, for example, Lucas_Nshuti

* After the environment has been created successfully, you will be asked to choose whether you want to run the app automatically or through command. Choose accordingly: **y(Yes) to start to app right away or n(No) to run the app manually.** Details will be provided.

* If you choose **Yes**, the app will automatically start, and you will receive the details about:
  1. **The assignment title and its due date.**
  2. **The names of the students who didn't submit yet.**
  3. **The titles of assignments they didn't submit.*
     
Suppose you choose **No** in the previous step. You will be given a command that will navigate to your environment (remember, we created it in step one). Also, you will be given the command to type in to start the app manually (**./startup.sh**). Don't worry; all the commands will be provided, and you have to copy and paste them.

* You will then get the same details as the one in the previous step but one:
 1. **The assignment title and its due date.**
 2. **The names of the students who didn't submit yet.** 
 3. **The titles of assignments they didn't submit.**

