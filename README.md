# Improvised-Octo-Journey
A set of files to run a small Hadoop/Spark cluster in Docker containers.

The scripts in the `bin` directory provide most of the functions to start and stop the cluster.

+ build.sh
  + Build the containers (if necessary)
+ rebuild.sh
  + Force a re-build of the containers
+ cluster-init.sh
  + Initialise the HDFS store
+ cluster-clear.sh
  + Remove the HDFS volumes
  + Requires cluster-init to be re-run afterwards if the cluster is to be used again
+ cluster-start.sh
  + Start the cluster
  + Requires the HDFS store to have been previously initialized
+ cluster-stop.sh
  + Stop the cluster
+ cluster-edge-node.sh
  + Start an edge node on the same network as the cluster
  + You can run Hadoop commands or ssh into `ioj-master` for example
+ cluster-jupyter.sh
  + Launch Jupyter with pyspark on a new cluster edge node
  + A volume `jupyter` is attached to /home/jovyan/work to save any notebooks