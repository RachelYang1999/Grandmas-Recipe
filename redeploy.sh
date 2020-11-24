git pull
sudo rm -rf /home/ubuntu/Backend/backend
sudo rm -rf /home/ubuntu/Frontend/frontend
sudo cp -r /home/ubuntu/project_100/backend /home/ubuntu/Backend/
sudo cp -r /home/ubuntu/project_100/frontend /home/ubuntu/Frontend/
sudo docker restart eaa914aecb91
sudo docker restart 85f8c9dea10f

