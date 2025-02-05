library(tidyverse)
library(ggpubr)
theme_set(theme_bw())

df <- read.table("/Users/ascarpa/Downloads/Double_trouble_local/piRNAs/fastq/bam/noadapt.ERR1821669-graph-on-TE.forR")
names(df) <- c("Run", "te","pos","pirna")

df_Shellder <- subset(df, te=="Shellder")
df_TABOR <- subset(df, te=="TABOR")
df_Spoink <- subset(df, te=="Spoink")
df_Opus <- subset(df, te=="OPUS")


ylow=min(df_Spoink$pirna)
yhigh=max(df_Spoink$pirna)

g_Spoink <- ggplot(df_Spoink,aes(x=pos,y=pirna))+
  geom_segment(aes(xend=pos),yend=0)+
  ylim(ylow,yhigh)+
  ggtitle("Spoink")+
  ylab("piRNA abundance [pmp]")+
  xlab("position of piRNA (5' end)")+
  theme(text = element_text(size=24))

plot(g_Spoink)


ylow=min(df_Shellder$pirna)
yhigh=max(df_Shellder$pirna)

g_Shellder <- ggplot(df_Shellder,aes(x=pos,y=pirna))+
  geom_segment(aes(xend=pos),yend=0)+
  ylim(ylow,yhigh)+
  ggtitle("Shellder")+
  ylab("piRNA abundance [pmp]")+
  xlab("position of piRNA (5' end)")+
  theme(text = element_text(size=24))

plot(g_Shellder)


ggarrange(g_Shellder+ theme(strip.text = element_text(size = 36))+ xlab(""), g_Spoink+ theme(strip.text = element_text(size = 36)),
          ncol = 1, nrow = 2, align = ("v"),
          labels = c("A", "B"), heights = c(2,2), widths = c(2,2)
)



ylow=min(df_TABOR$pirna)
yhigh=max(df_TABOR$pirna)

g_TABOR <- ggplot(df_TABOR,aes(x=pos,y=pirna))+
  geom_segment(aes(xend=pos),yend=0)+
  ylim(ylow,yhigh)+
  ggtitle("Tabor")+
  ylab("piRNA abundance [pmp]")+
  xlab("position of piRNA (5' end)")+
  theme(text = element_text(size=24))

plot(g_TABOR)


ylow=min(df_Opus$pirna)
yhigh=max(df_Opus$pirna)

g_Opus <- ggplot(df_Opus,aes(x=pos,y=pirna))+
  geom_segment(aes(xend=pos),yend=0)+
  ylim(ylow,yhigh)+
  ggtitle("Opus")+
  ylab("piRNA abundance [pmp]")+
  xlab("position of piRNA (5' end)")+
  theme(text = element_text(size=24))

plot(g_Opus)



#ping-pong
df_pingpong <- read.table("/Users/ascarpa/Downloads/Double_trouble_local/piRNAs/fastq/bam/noadapt.ERR1821669.pps")
names(df_pingpong) <- c("Run", "te", "sense", "pos", "frequency")
df_Spoink_pingpong <- subset(df_pingpong, te=="Spoink")
df_Shellder_pingpong <- subset(df_pingpong, te=="Shellder")
df_TABOR_pingpong <- subset(df_pingpong, te=="TABOR")
df_Opus_pingpong <- subset(df_pingpong, te=="OPUS")



df_s_Spoink <- subset(df_Spoink_pingpong, sense == "s")
df_as_Spoink <- subset(df_Spoink_pingpong, sense == "as")

df_s_Shellder <- subset(df_Shellder_pingpong, sense == "s")
df_as_Shellder <- subset(df_Shellder_pingpong, sense == "as")

df_as_TABOR <- subset(df_TABOR_pingpong, sense == "as")
df_as_Opus <- subset(df_Opus_pingpong, sense == "as")


df_as_Spoink$color <- ifelse(df_as_Spoink$pos == 10, "#DC143C", "grey")
g_pingpong_Spoink <- ggplot(df_as_Spoink,aes(x=pos,y=frequency, fill = color))+
  geom_col()+
  ggtitle("Antisense piRNAs Spoink")+
  ylab("ping-pong signature")+
  xlab("overlap")+
  scale_fill_identity() +
  theme(text = element_text(size=24))

plot(g_pingpong_Spoink)

df_as_Shellder$color <- ifelse(df_as_Shellder$pos == 10, "#02367B", "grey")
g_pingpong_Shellder <- ggplot(df_as_Shellder,aes(x=pos,y=frequency, fill = color))+
  geom_col()+
  ggtitle("Antisense piRNAs Shellder")+
  ylab("ping-pong signature")+
  xlab("overlap")+
  scale_fill_identity() +
  theme(text = element_text(size=24))

plot(g_pingpong_Shellder)

df_as_TABOR$color <- ifelse(df_as_TABOR$pos == 10, "#02367B", "grey")
g_pingpong_TABOR <- ggplot(df_as_TABOR,aes(x=pos,y=frequency, fill = color))+
  geom_col()+
  ggtitle("Antisense piRNAs Tabor")+
  ylab("ping-pong signature")+
  xlab("overlap")+
  scale_fill_identity() +
  theme(text = element_text(size=24))

plot(g_pingpong_TABOR)

df_as_Opus$color <- ifelse(df_as_Opus$pos == 10, "#DC143C", "grey")
g_pingpong_Opus <- ggplot(df_as_Opus,aes(x=pos,y=frequency, fill = color))+
  geom_col()+
  ggtitle("Antisense piRNAs Opus")+
  ylab("ping-pong signature")+
  xlab("overlap")+
  scale_fill_identity() +
  theme(text = element_text(size=24))

plot(g_pingpong_Opus)



ggarrange(g_TABOR + theme(strip.text = element_text(size = 36)),
          g_Shellder + theme(strip.text = element_text(size = 36)) + ylab(""),
          g_Spoink + theme(strip.text = element_text(size = 36)) + ylab(""),
          g_Opus + theme(strip.text = element_text(size = 36)) + ylab(""),
          g_pingpong_TABOR + theme(strip.text = element_text(size = 36)) + ggtitle(" "),
          g_pingpong_Shellder + theme(strip.text = element_text(size = 36)) + ggtitle(" ")+ ylab(""),
          g_pingpong_Spoink + theme(strip.text = element_text(size = 36)) + ggtitle(" ") + ylab(""),
          g_pingpong_Opus + theme(strip.text = element_text(size = 36)) + ggtitle(" ") + ylab(""),
          ncol = 4, nrow = 2, align = ("v"),
          labels = c("", "", "", "", "", "", "", ""),
          heights = c(2,2), widths = c(2,2)
          )
