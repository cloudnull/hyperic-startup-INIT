Hyperic Startup Script - Ubuntu & Debian
########################################

This script is the start up script that I have devised to allow
Hyperic to run on startup with Ubuntu & Debian. The script does
need specific user information that must be entered for it to work
correctly. But this is an easy script to install and configure, so
that we admins don't have to work so hard.

I am assuming that you have installed the Hyperic Server in the
Ubuntu or Debian System and that it is up and running. I am also
assuming that you have ROOT access or SUDO access to complete the
steps listed.

For these processes I recommend that you use an SSH connection to
the server so that you have easy access to the server as well as
cut and paste. Though direct terminal access to the server more
than exceptable to complete all of these steps.

--------------

Setting up the Start-Up Script
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You will now have to configure the startup script such that it will
work with your specific Server installation.

To edit the script enter the fallowing commands:

.. code-block:: bash

    sudo nano ./hypericserver

You will see an area that looks like this:

.. code-block:: bash

    ### ----------------------------------------------
    ### CHANGE ONLY THE INFORMATION AFTER THE = SIGN
    ### THE NAME OF THE USB HARD DRIVE NEEDS TO GO
    ### DIRECTLY AFTER THE = SIGN
    ### ----------------------------------------------
    
    
    # What is the Name of this Script, and what are we starting
    PROGRAM="Hyperic Server"
    
    # What is the Directory to your server installation of HYPERIC
    AGENT_DIR="PATH/TO/HYPERIC"
    
    # Enter the User name for the USER that will Start and Stop HYPERIC
    # THIS CANNOT BE ROOT
    USER="REPLACE-THIS-USERNAME"

These areas are very self explanitory. You have to name the
application, tell the startup script where the files for Hyperic
are located, and you have to tell the script what user is going to
start and stop the Hyperic Server.

I have placed the program name and directory into the script for
you, should you be using the default locations. If you are not
using the default locations then you will have to change it to the
locations that you are using. If everything is installed per the
Default locations then the only thing that will need to be changed
is the username.

--------------

Making the Start-Up script, Start Up
------------------------------------

The first thing that must happen is to get the script into the **/etc/init.d/** directory. Make sure you are in the directory where you downloaded the script.

Now that you have varified that the you are in the same directory as the script copy the script to the **/etc/init.d/** directory.

.. code-block:: bash

    sudo cp ./hypericserver.sh /etc/init.d/hypericserver

Change the ownership of the script in the init.d directory so that it is onwed by \"ROOT\".

.. code-block:: bash

    sudo chown root:root /etc/init.d/hypericserver

Make the script Executable 

.. code-block:: bash

    sudo chmod +x /etc/init.d/hypericserver

Once the script is in the appropriate location and you have told the system that it is owned by \"ROOT\" and that it is executable, you will need to tell the  system to use it as a startup script. You can enter this command from any directory.

.. code-block:: bash

    sudo update-rc.d hypericscript defaults 

--------------

Words to the wise.
------------------

Hyperic is one of the few programs that does not want to be ran
under ROOT or SUDO for any reason at any time. You must be aware of
this. If you are going to start, stop, or restart the Hyperic
Server you have to do it as the user that you established earlier
in the setup process of this tutorial. For Example :

*If you wanted to stop Hyperic you would enter :*

.. code-block:: bash

    /etc/init.d/hypericserver stop

If you noticed that I omitted the ``SUDO`` command. This is because
the **``SUDO``** is not needed to start and stop the Hyperic
Server. If you are used to or would like to, you can run the script
as root or under **``SUDO``**, the programing for the script will
run the application with the correct user no matter how it is
initialized.
