echo ''
echo '--------------------------------------------------'
echo '		Installing essential stuff 		'
echo '--------------------------------------------------'

sudo apt-get -y upgrade
sudo apt-get -y update
sudo apt-get -y install git unzip zip nano openssh-server

echo ''
echo '--------------------------------------------------'
echo '		Installing Python stuff 		'
echo '--------------------------------------------------'

sudo apt-get -y install python-pip
sudo apt-get -y install build-essential python-dev python-setuptools \
                     python-numpy python-scipy \
                     libatlas-dev libatlas3gf-base python-matplotlib

pip install --upgrade pip
pip install -U numpy scipy scikit-learn flask nltk networkx jupyter gensim

export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.9.0-cp27-none-linux_x86_64.whl

sudo pip install --upgrade $TF_BINARY_URL

echo ''
echo '--------------------------------------------------'
echo '		Downloading NLTK stuff 			'
echo '--------------------------------------------------'

sudo bash -c 'echo "import nltk" > nltk_download.py'
sudo bash -c 'echo "nltk.download(\"averaged_perceptron_tagger\")" >> nltk_download.py'
sudo bash -c 'echo "nltk.download(\"stopwords\")" >> nltk_download.py'
python nltk_download.py

echo ''
echo '--------------------------------------------------'
echo '		Configuring stuff 			'
echo '--------------------------------------------------'

jupyter notebook --generate-config -y
sudo bash -c 'echo "c.NotebookApp.ip = \"*\"" > ./.jupyter/jupyter_notebook_config.py'
sudo bash -c 'echo "c.NotebookApp.open_browser = False" >> ./.jupyter/jupyter_notebook_config.py'


sudo bash -c 'echo "start on startup" > ./.config/upstart/jupyter_task.conf'
sudo bash -c 'echo "task" >> ./.config/upstart/jupyter_task.conf'
sudo bash -c 'echo "exec jupyter notebook" >> ./.config/upstart/jupyter_task.conf'


start jupyter_task

echo ''
echo ''
echo '--------------------------------------------------'
echo '		Everything is FANTASTICSH!!!		' 			
echo '--------------------------------------------------'





