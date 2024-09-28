#!/bin/bash

# Function to install Node.js and npm
install_node() {
    # Update package list
    echo "Updating package list..."
    sudo apt update

    # Install Node.js and npm
    echo "Installing Node.js and npm..."
    sudo apt install -y nodejs npm

    # Verify the installation
    echo "Node.js version:"
    node -v

    echo "npm version:"
    npm -v
}

# Function to install Vue CLI globally
install_vue_cli() {
    echo "Installing Vue CLI globally..."
    sudo npm install -g @vue/cli
}

# Function to install project dependencies
install_dependencies() {
    # Navigate to the project directory
    echo "Navigating to project directory..."
    cd "$(dirname "$0")"

    # Install npm dependencies
    echo "Installing project dependencies..."
    sudo npm install
}

# Function to run the Vue.js development server
run_project() {
    echo "Starting Vue.js development server..."
    npm run serve
}

# Main script execution
echo "Starting full setup and run process..."

# Check if Node.js is installed
if ! command -v node &> /dev/null
then
    echo "Node.js could not be found, installing now..."
    install_node
else
    echo "Node.js is already installed."
fi

# Check if npm is installed
if ! command -v npm &> /dev/null
then
    echo "npm could not be found, installing now..."
    install_node
else
    echo "npm is already installed."
fi

# Install Vue CLI globally
install_vue_cli

# Install project dependencies
install_dependencies

# Run the project
run_project
