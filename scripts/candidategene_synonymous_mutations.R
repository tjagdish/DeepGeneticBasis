#Tanush Jagdish
#January 6, 2019
#Examining whether mutations on candidate genes are synonymous 

#Annotated timecourse data from Good et al (2018)
library(readr)
m1 <- read_csv("m1_correct.csv")
m2 <- read_csv("m2_correct.csv")
m3 <- read_csv("m3_correct.csv")
m4 <- read_csv("m4_correct.csv")
m5 <- read_csv("m5_correct.csv")
m6 <- read_csv("m6_correct.csv")
p1 <- read_csv("p1_correct.csv")
p2 <- read_csv("p2_correct.csv")
p3 <- read_csv("p3_correct.csv")
p4 <- read_csv("p4_correct.csv")
p5 <- read_csv("p5_correct.csv")
p6 <- read_csv("p6_correct.csv")

#Candidate genes hit with mutations
genes <- read_csv("candidate_mutations.csv")

#Selecting only for mutations that reached fixation by 60,000 generations.
m1 <- m1[m1$AC.60000 >= 0.95, ]
m2 <- m2[m2$AC.60000 >= 0.95, ]
m3 <- m3[m3$AC.60000 >= 0.95, ]
m4 <- m4[m4$AC.60000 >= 0.95, ]
m5 <- m5[m5$AC.60000 >= 0.95, ]
m6 <- m6[m6$AC.60000 >= 0.95, ]
p1 <- p1[p1$AC.60000 >= 0.95, ]
p2 <- p2[p2$AC.60000 >= 0.95, ]
p3 <- p3[p3$AC.60000 >= 0.95, ]
p4 <- p4[p4$AC.60000 >= 0.95, ]
p5 <- p5[p5$AC.57500 >= 0.95, ]
p6 <- p6[p6$AC.60000 >= 0.95, ]


#Collecting all mutations on candidate genes with fixed mutations in Ara-1
m1_genes <- genes$m1
m1_mutations <- NULL
for (i in 1:length(m1_genes))
  {
  m1_mutations <- rbind(m1_mutations, subset(m1, Gene == m1_genes[i]))
  }
write.csv(m1_mutations, file = "m1_mutations.csv")

#Collecting all mutations on candidate genes with fixed mutations in Ara-2
m2_genes <- genes$m2
m2_mutations <- NULL
for (i in 1:length(m2_genes))
  {
  m2_mutations <- rbind(m2_mutations, subset(m2, Gene == m2_genes[i]))
  }
write.csv(m2_mutations, file = "m2_mutations.csv")


#Collecting all mutations on candidate genes with fixed mutations in Ara-3
m3_genes <- genes$m3
m3_mutations <- NULL
for (i in 1:length(m3_genes))
  {
  m3_mutations <- rbind(m3_mutations, subset(m3, Gene == m3_genes[i]))
  }
write.csv(m3_mutations, file = "m3_mutations.csv")

#Collecting all mutations on candidate genes with fixed mutations in Ara-4
m4_genes <- genes$m4
m4_mutations <- NULL
for (i in 1:length(m4_genes))
  {
  m4_mutations <- rbind(m4_mutations, subset(m4, Gene == m4_genes[i]))
  }
write.csv(m4_mutations, file = "m4_mutations.csv")


#Collecting all mutations on candidate genes with fixed mutations in Ara-5
m5_genes <- genes$m5
m5_mutations <- NULL
for (i in 1:length(m5_genes))
{
  m5_mutations <- rbind(m5_mutations, subset(m5, Gene == m5_genes[i]))
}
write.csv(m5_mutations, file = "m5_mutations.csv")


#Collecting all mutations on candidate genes with fixed mutations in Ara+2
p2_genes <- genes$p2
p2_mutations <- NULL
for (i in 1:length(p2_genes))
{
  p2_mutations <- rbind(p2_mutations, subset(p2, Gene == p2_genes[i]))
}
write.csv(p2_mutations, file = "p2_mutations.csv")


#Collecting all mutations on candidate genes with fixed mutations in Ara+3
p3_genes <- genes$p3
p3_mutations <- NULL
for (i in 1:length(p3_genes))
{
  p3_mutations <- rbind(p3_mutations, subset(p3, Gene == p3_genes[i]))
}
write.csv(p3_mutations, file = "p3_mutations.csv")


#Collecting all mutations on candidate genes with fixed mutations in Ara+4
p4_genes <- genes$p4
p4_mutations <- NULL
for (i in 1:length(p4_genes))
{
  p4_mutations <- rbind(p4_mutations, subset(p4, Gene == p4_genes[i]))
}
write.csv(p4_mutations, file = "p4_mutations.csv")


#Collecting all mutations on candidate genes with fixed mutations in Ara+6
p6_genes <- genes$p6
p6_mutations <- NULL
for (i in 1:length(p6_genes))
{
  p6_mutations <- rbind(p6_mutations, subset(p6, Gene == p6_genes[i]))
}
write.csv(p6_mutations, file = "p6_mutations.csv")


#Cauculating number of synonymous/noncoding vs missense/indel mutations in each population

syn_m1 <- sum(m1_mutations$Annotation == "synonymous") + sum(m1_mutations$Annotation == "noncoding") 
syn_m2 <- sum(m2_mutations$Annotation == "synonymous") + sum(m2_mutations$Annotation == "noncoding") 
syn_m3 <- sum(m3_mutations$Annotation == "synonymous") + sum(m3_mutations$Annotation == "noncoding")
syn_m4 <- sum(m4_mutations$Annotation == "synonymous") + sum(m4_mutations$Annotation == "noncoding")
syn_m5 <- sum(m5_mutations$Annotation == "synonymous") + sum(m5_mutations$Annotation == "noncoding")
syn_p2 <- sum(p2_mutations$Annotation == "synonymous") + sum(p2_mutations$Annotation == "noncoding")
syn_p3 <- sum(p3_mutations$Annotation == "synonymous") + sum(p3_mutations$Annotation == "noncoding")
syn_p4 <- sum(p4_mutations$Annotation == "synonymous") + sum(p4_mutations$Annotation == "noncoding")
syn_p6 <- sum(p6_mutations$Annotation == "synonymous") + sum(p6_mutations$Annotation == "noncoding")


mis_m1 <- length(m1_mutations$Annotation) - syn_m1
mis_m2 <- length(m2_mutations$Annotation) - syn_m2
mis_m3 <- length(m3_mutations$Annotation) - syn_m3
mis_m4 <- length(m4_mutations$Annotation) - syn_m4
mis_m5 <- length(m5_mutations$Annotation) - syn_m5
mis_p2 <- length(p2_mutations$Annotation) - syn_p2
mis_p3 <- length(p3_mutations$Annotation) - syn_p3
mis_p4 <- length(p4_mutations$Annotation) - syn_p4
mis_p6 <- length(p6_mutations$Annotation) - syn_p6


#Putting distribution together in a dataframe
mutation_distribution <- data.frame(Population = c("Ara-1","Ara-2", "Ara-3", "Ara-4", "Ara-5",
                                                   "Ara+2", "Ara+3", "Ara+4", "Ara+6"), 
                                    Synonymous = c(syn_m1, syn_m2, syn_m3, syn_m4, syn_m5,
                                                   syn_p2, syn_p3, syn_p4, syn_p6), 
                                    Missense = c(mis_m1, mis_m2, mis_m3, mis_m4, mis_m5,
                                                 mis_p2, mis_p3, mis_p4, mis_p6))


#Metling dataframe
library(reshape2)
library(ggplot2)

distribution.m <- melt(mutation_distribution, id.vars='Population')
distribution.m


#Creating figure with distributions
mutation_distribution_figure <- ggplot(distribution.m, aes(Population, value)) + 
                                geom_bar(aes(fill = variable), 
                                width = 0.4, 
                                position = position_dodge(width=0.5), 
                                stat="identity")  + 
                                theme_bw() +
                                theme(legend.position="top", 
                                legend.title = element_blank(), 
                                axis.title.x=element_blank(),
                                axis.text.x = element_text(size = 11)) +
                                theme(
                                    panel.background = element_rect(fill = "transparent") # bg of the panel
                                  , plot.background = element_rect(fill = "transparent", color = NA) # bg of the plot
                                  , panel.grid.major = element_blank()  # get rid of major grid
                                  , panel.grid.minor = element_blank() # get rid of minor grid
                                  , legend.background = element_rect(fill = "transparent") # get rid of legend bg
                                  , legend.box.background = element_rect(fill = "transparent") # get rid of legend panel bg
                                     ) + 
                               labs(y = "Number of Mutations", size = 10) +
                               scale_y_continuous(limits = c(0,24), expand = expand_scale(mult = c(0, .1)))
  
mutation_distribution_figure







