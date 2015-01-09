FROM jupyter/minimal
USER root
RUN sudo apt-get install -y python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose
RUN sudo apt-get install -y libblas3gf libblas-doc libblas-dev liblapack3gf liblapack-dev
RUN sudo apt-get install -y gfortran
RUN pip install  https://github.com/YeoLab/flotilla/archive/master.zip 
VOLUME /home/jovyan/flotilla_projects
RUN chown -R joyvan /home/joyvan/flotilla_projects && chgrp -R joyvan /home/joyvan/flotilla_projects
USER jovyan
RUN cd /home/joyvan && git clone https://github.com/YeoLab/flotilla.git && cp -r flotilla/examples demo_and_examples

