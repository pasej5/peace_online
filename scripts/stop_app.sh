#!/bin/bash

# Find and kill the Gunicorn process
echo "Stopping Gunicorn process..."
pkill -f gunicorn

echo "Gunicorn process stopped."