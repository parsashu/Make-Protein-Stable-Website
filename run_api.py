#!/usr/bin/env python3
"""
Simple script to run the Protein Stability API server.
Make sure you have installed the requirements first:
pip install -r requirements.txt
"""

import os
import sys

# Add the current directory to the Python path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

try:
    from api_server import app

    print("Starting Protein Stability API server...")
    print("Server will be available at: http://localhost:5000")
    print("Health check: http://localhost:5000/health")
    print("Press Ctrl+C to stop the server")
    app.run(debug=True, host="0.0.0.0", port=5000)
except ImportError as e:
    print(f"Error importing modules: {e}")
    print("Make sure you have installed the requirements:")
    print("pip install -r requirements.txt")
    sys.exit(1)
except Exception as e:
    print(f"Error starting server: {e}")
    sys.exit(1)
