# Improvised-Octo-Journey
A set of files to run a small Hadoop/Spark cluster in Docker containers.

The scripts in the `bin` directory provide most of the functions to start and stop the cluster.

+ build.sh
  + Re-build the containers (if necessary)
+ cluster-init.sh
  + Initialise the HDFS store
+ cluster-clear.sh
  + Remove the HDFS volumes
+ cluster-start.sh
  + Start the cluster
+ cluster-stop.sh
  + Stop the cluster
+ cluster-edge-node.sh
  + Start an edge node on the same network as the cluster
  + You can run Hadoop commands or ssh into `ioj-master` for example

To launch Jupyter, run the following command:

```docker run -it --rm -p 8888:8888/tcp -v <notebooks>:/home/jovyan/work --network ioj jupyter/pyspark-notebook:python-3.9.10```
