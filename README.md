# PathFollowingWithObstacleAvoidanceInSimulinkExample

Path Following with Obstacle Avoidance in Simulink
This project features an integrated system for mobile robot navigation using Simulink and ROS. It includes a custom MATLAB GUI that serves as a central control hub to manage the simulation environment, ROS nodes, and the path-following algorithm.

🚀 Key Features
Path Following: Implementation of a Pure Pursuit or similar controller to track predefined waypoints.

Obstacle Avoidance: Integrated sensor logic to detect and bypass obstacles in real-time.

Unified GUI Control:

Simulink Management: Open the model and start/stop simulations directly from the interface.

ROS Integration: Buttons to initialize (rosinit) and shut down (rosshutdown) the ROS network.

Visualizer: Launch the robot simulator environment to see the robot move in a 2D/3D space.

🛠 Prerequisites
Before running the project, ensure you have the following installed:

MATLAB (R2021a or later recommended)

Simulink

Robotics System Toolbox

ROS Toolbox

(Optional) Navigation Toolbox for advanced path planners.

📂 Project Structure
GUI.m: The MATLAB Guide file for the controller.

PathFollowingModel.slx: The main Simulink model.

scripts/: Helper functions for initializing parameters.

maps/: Environment files or occupancy grids.

🖥 Using the GUI
The GUI is designed to be the "Command Center" for the simulation.

Initialize ROS: Click the "Open ROS" button to start the global ROS node.

Launch Simulator: Click "Open Robot Simulator" to bring up the visualization window.

Load Simulink: Use the "Open Simulink" button to load the model into memory.

Control Loop: * Press "Start Simulation" to begin the path-following routine.

Press "Stop Simulation" to halt the robot immediately.

Cleanup: Click "Close ROS" to safely terminate the ROS network.

🚦 Getting Started
Clone this repository:

Bash

git clone https://github.com/yourusername/PathFollowingWithObstacleAvoidance.git
Open MATLAB and navigate to the project folder.

Run the GUI by typing:

Matlab

Gui
Follow the steps in the Using the GUI section above.
Note:extract the 2 files 
1 - +bus_conv_fcns
2- slprj

🧠 How it Works
The system uses a feedback loop where the robot senses its position and nearby obstacles via ROS topics. The Simulink model processes these inputs and calculates the required linear and angular velocities, which are then sent back to the robot simulator.
