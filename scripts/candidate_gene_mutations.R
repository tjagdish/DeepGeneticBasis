#Tanush Jagdish
#January 6, 2019
#Finding candidate genes hit by mutations across all LTEE populations


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

#List of candidate genes from this study.
candidates <- read_csv("candidates.csv")
confirmed <- candidates$Genes

#Keeping mutations that reached fixation by 60,000 generations.
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
p5 <- p5[p5$AC.60000 >= 0.95, ]
p6 <- p6[p6$AC.60000 >= 0.95, ]

#Genes with mutations picked up in annotated timecourse data 
#that overlap with list of candidate genes.
m1_confirmed <- intersect(confirmed, m1$Gene)
m2_confirmed <- intersect(confirmed, m2$Gene)
m3_confirmed <- intersect(confirmed, m3$Gene)
m4_confirmed <- intersect(confirmed, m4$Gene)
m5_confirmed <- intersect(confirmed, m5$Gene)
m6_confirmed <- intersect(confirmed, m6$Gene)
p1_confirmed <- intersect(confirmed, p1$Gene)
p2_confirmed <- intersect(confirmed, p2$Gene)
p3_confirmed <- intersect(confirmed, p3$Gene)
p4_confirmed <- intersect(confirmed, p4$Gene)
p5_confirmed <- intersect(confirmed, p5$Gene)
p6_confirmed <- intersect(confirmed, p6$Gene)


