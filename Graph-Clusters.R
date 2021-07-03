## Graph Cluster Analysis 

install.packages("GraphClusterAnalysis")

install.packages("igraph")
library(igraph)
install.packages("mstknnclust")
library(mstknnclust)

data(dslanguages)

results <- mst.knn(dslanguages)
results$cnumber

results$cluster  #mutual information 


igraph::V(results$network)$label.cex <- seq(0.6,0.6,length.out=2)

plot(results$network, vertex.size=8, 
     vertex.color=igraph::clusters(results$network)$membership, 
     layout=igraph::layout.fruchterman.reingold(results$network, niter=10000),
     main=paste("MST-kNN \n Clustering solution \n Number of clusters=",results$cnumber,sep="" ))
