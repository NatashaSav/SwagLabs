# Project setup instructions

   1. Download the project from the repository


   2. Create virtual environment


   3. Install ChromeDriver



*    Determine your Chrome version

     Open Google Chrome, click on the three vertical dots on the top right -> Help -> About Google Chrome. Note down the version number.


*    Download the appropriate ChromeDriver

     Visit the ChromeDriver download page https://chromedriver.chromium.org/downloads and download the version that matches your Chrome version.


*    Extract and move ChromeDriver

     For Windows: Extract the downloaded ZIP file and move `chromedriver.exe` to a location in your system’s PATH or any directory.

     For Mac/Linux: Extract the downloaded ZIP/tar file:
      "unzip chromedriver_win32.zip" # For Windows
      "tar -xvf chromedriver_mac64.zip" # For Mac
      "tar -xvf chromedriver_linux64.tar.gz" # For Linux
      
     Move the `chromedriver` to `/usr/bin/` or any location in your system’s PATH: "sudo mv chromedriver /usr/bin/"


   4. Install next plugins: IntelliBot, Robot Framework Language Server


   5. Install required libraries using command "pip install -r requirements.txt"


   6. To run all robot tests in a single robot file you need to use command "robot path/to/<test_suite>.robot".

      For example, command "robot Tests/LoginPageTests.robot" will run all test cases in LoginPageTests.robot file.

      In order to execute test cases by test name in a specific file you need to use command:
      robot -t <test_case_name> <test_suite>.robot

      Example: robot -t "Successful login for standard user" Tests/LoginPageTests.robot



Notes: 
  Here you can find step-by-step instructions for installing the robot framework
  https://medium.com/geekculture/how-to-setup-robot-framework-for-test-automation-on-windows-2a9cc0da0763
