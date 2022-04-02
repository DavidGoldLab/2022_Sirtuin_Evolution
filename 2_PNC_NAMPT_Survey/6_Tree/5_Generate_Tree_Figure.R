# load libraries
library(phytools)
# make sure phytools is updated to 0.7.80
packageVersion("phytools")

# load tree
tree<-read.tree("4_Taxa.Mesquite_Modified_Tree_No_Nodes.tree")
# load data
data<-read.table("4_Trait_Data.txt",header=TRUE,row.names=1,stringsAsFactors=TRUE)
head(data)

h<-max(nodeHeights(tree))
plotTree(tree,ftype="off",lwd=1,xlim=c(0,1.05*h))
Trait<-setNames(data$Trait,rownames(data))
levels(Trait)<-c("Both","NAMPT_Only","PNC1_Only")
pp<-get("last_plot.phylo",envir=.PlotPhyloEnv)
cols<-setNames(c("red","paleturquoise1","palegoldenrod",palette()[2]),levels(Trait))[Trait[tree$tip.label]]
for(i in 1:Ntip(tree))
    polygon(c(h,1.05*h,1.05*h,h),
        rep(pp$yy[i],4)+c(-0.5,-0.5,0.5,0.5),
        border=FALSE,col=cols[i])
legend("topleft",levels(Trait),pch=15,
    col=c("red","paleturquoise1","palegoldenrod",pt.cex=1.5,
    cex=0.8,bty="n"))