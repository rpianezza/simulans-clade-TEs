Repeat Mask Spoink Shellder Pelement
================
roko
9/8/2023

# Overview of assemblies

# Overview of sequences to RM

``` bash
# format sequences; all identical, reduce potential problems
[0,9482]rokofler%cat Shellder-consensus.fasta Spoink_consensus.fasta pelement.fasta|reader-fasta.py|fasta-formatter-fasta.py --upper| fasta-writter.py >ShelSpoiPele.fasta
[0,9483]rokofler%samtools faidx ShelSpoiPele.fasta
# size of the TEs
[0,9484]rokofler%cat ShelSpoiPele.fasta.fai
Shellder    6635    10  80  81
Spoink  5216    6736    80  81
PPI251  2907    12026   80  81
# which seqs
[0,9485]rokofler%cat ShelSpoiPele.fasta|grep '>'
>Shellder
>Spoink
>PPI251
# formatting
[0,9486]rokofler%head ShelSpoiPele.fasta
>Shellder
GCAACCAATTAAAGTCGCACAAACAAATAACATAATTGTACAAAAAGCCAAAGCTGGACAAACAAATAAGCTTATGCATG
GAAATGCTGATAACGACGAGATCAGCATAATCATGCAGAGGTACTTGAACCGAGATCAAATTTCAAAAGCATAAACAACG
GAAACGTCGCCGCCGCTTCCGTTGCAAATGTTCGATCAGCAATTTATGAAACAAACGAAATGGGCATTTGCATATGCCAA
AGCAAATTATATTTTCAGTCTTAAGATTCAATTGTAACCGGACAGAAGTTCCAGTCCTAAAAACTAATAAAGAAACCCAT
GATATCTAAAGATATCTGTTGTCATTTAATTCAACAAACTTAATCAAAATTTAAATCTAAATTTAAATAAATAAATAAAG
ATATCTAAAGATATCTAGCGAATAAAAATTCGTTCTTTCAACAAACATAATTGGCGCAGTCGAAATCGGACAAATACGTT
CAGAATTAACCAAAGTTAATCCGCGAGAAATTTTTTAATTAAAACTACAATGGAAGCAGAGATGGATAATTTAAAAACAA
TAGTGCTTCAACAAGAAGGAGAGTTGAACCTATTAAGGCAACAAAATCAACAACAACAACAACAACTACAACAGCAGCAA
CAACAACAACAACAACAACTACAACAGCAGCAGCAACAACAACAACAACAACCAATCCAGTGGCTGTCAAACAAAGATGT
```

# the files

``` bash
(base) [0,10374]fschwarz% ls *fa                                                                                                 /Volumes/Temp3/Robert/2024-DoubleTrouble/assemblies
A.communis.fa          D.crucigera.fa         D.jambulina.fa         D.mettleri.fa          D.picticornis.fa       D.stalkeri.fa          L.magnipectinata.fa
A.mariae.fa            D.cyrtoloma.fa         D.kambysellisi.fa      D.mimetica.fa          D.planitibia.fa        D.sturtevanti.fa       L.mommai.fa
A.minor.fa             D.demipolita.fa        D.kanekoi.fa           D.mimica.fa            D.prosaltans.fa        D.subobscura.fa        L.montana.fa
C.amoena.fa            D.differens.fa         D.kikkawai.fa          D.miranda.fa           D.prostipennis.fa      D.suboccidentalis.fa   L.stackelbergi.fa
C.caudatula.fa         D.dives.fa             D.kokeensis.fa         D.mojavensis.fa        D.pruinosa.fa          D.subpulchrella.fa     L.varia.fa
C.costata.fa           D.dunni.fa             D.kuntzei.fa           D.monieri.fa           D.pseuan.nigrens.fa    D.subquinaria.fa       S.caliginosa.fa
C.indagator.fa         D.elegans.fa           D.kurseongensis.fa     D.montana.fa           D.pseuan.pseuan..fa    D.subsilvestris.fa     S.cyrtandrae.fa
C.procnemis.fa         D.emarginata.fa        D.lacicola.fa          D.mulleri.fa           D.pseudoobscura.fa     D.sucinea.fa           S.graminum.fa
D.acutilabella.fa      D.engyochracea.fa      D.leonis.fa            D.multiciliata.fa      D.pseudotakahashii.fa  D.takahashii.fa        S.hsui.fa
D.aff.chauv..fa        D.eohydei.fa           D.littoralis.fa        D.murphyi.fa           D.pseudotalamancana.fa D.tanythrix.fa         S.latifasciaeformis.fa
D.affinis.fa           D.equinoxialis.fa      D.longiperda.fa        D.neocordata.fa        D.pullipes.fa          D.teissieri.273.3.fa   S.montana.fa
D.aldrichi.fa          D.ercepeae.fa          D.lutescens.fa         D.neotestacea.fa       D.putrida.fa           D.teissieri.ct02.fa    S.nigrithorax.fa
D.algonquin.fa         D.erecta.fa            D.macrospina.fa        D.neutralis.fa         D.quadrilineata.fa     D.testacea.fa          S.pallida.fa
D.ambigua.fa           D.eugracilis.fa        D.macrothrix.fa        D.nigricruria.fa       D.quasianomalipes.fa   D.triauraria.fa        S.parva.fa
D.americana.fa         D.ezoana.fa            D.maculinotata.fa      D.nigritarsus.fa       D.quinaria.fa          D.trichaetosa.fa       S.polygonia.fa
D.ananassae.fa         D.falleni.fa           D.mal.mal..fa          D.niveifrons.fa        D.recens.fa            D.tripunctata.fa       S.reducta.fa
D.anceps.fa            D.ficusphila.fa        D.mal.pallens.fa       D.nrfundita.fa         D.rellima.fa           D.tristis.fa           S.tumidula.fa
D.anomalata.fa         D.flavopinicola.fa     D.mau.01.fa            D.nrmedialis2.fa       D.repleta.fa           D.tropicalis.fa        Z.africanus.fa
D.anomalipes.fa        D.formosana.fa         D.mau.r31.fa           D.nrmedialis3.fa       D.repletoides.fa       D.ustulata.fa          Z.bogoriensis.fa
D.anomelani.fa         D.fulvimacula.fa       D.mau.r32.fa           D.nrperissopoda1.fa    D.rhopaloa.fa          D.vallismaia.fa        Z.camerounensis.fa
D.arawakana.fa         D.funebris.fa          D.mau.r39.fa           D.nrperissopoda5.fa    D.robusta.fa           D.varians.fa           Z.capensis.fa
D.atripex.fa           D.fungiperda.fa        D.mau.r61.fa           D.obscura.fa           D.rubida.fa            D.villosipedis.fa      Z.davidi.fa
D.atroscutellata.fa    D.fuyamai.fa           D.mayaguana.fa         D.ochracea.fa          D.rufa.fa              D.virilis.fa           Z.flavofinira.fa
D.austrosaltans.fa     D.gaucha.fa            D.mel.es.ten.fa        D.oshimai.fa           D.saltans.fa           D.willistoni.00.fa     Z.gabonicus.fa
D.basisetae.fa         D.glabriapex.fa        D.mel.iso1.fa          D.pallidosa.fa         D.sechellia.fa         D.willistoni.17.fa     Z.ghesquierei.fa
D.biarmipes.fa         D.grimshawi.fa         D.mel.pi2.fa           D.parabipectinata.fa   D.seclusa.fa           D.yakuba.fa            Z.indianus.bs02.fa
D.bipectinata.fa       D.gunungcola.fa        D.mel.ral176.fa        D.paracracens.fa       D.serrata.fa           D.yooni.fa             Z.indianus.d18.fa
D.birchii.fa           D.hamatofila.fa        D.mel.ral732.fa        D.paramelanica.fa      D.setosimentum.fa      H.alboralis.fa         Z.indianus.r04.fa
D.bocqueti.fa          D.hawaiiensis.fa       D.mel.ral737.fa        D.paranaensis.fa       D.siamana.fa           H.confusa.fa           Z.indianus.v01.fa
D.borealis.fa          D.helvetica.fa         D.mel.ral91.fa         D.parthenogenetica.fa  D.silvestris.fa        H.duncani.fa           Z.inermis.fa
D.bunnanda.fa          D.heteroneura.fa       D.mel.se.sto.fa        D.paucipuncta.fa       D.sim.006.fa           H.guttata.fa           Z.kolodkinae.fa
D.buzzatii.fa          D.histrio.fa           D.melanocephala.fa     D.paulistorum.06.fa    D.sim.sz129.fa         H.histrioides.fa       Z.lachaisei.fa
D.cardini.fa           D.immigrans.12.fa      D.melanogaster.fa      D.paulistorum.12.fa    D.sim.sz232.fa         H.trivittata.fa        Z.nigranus.fa
D.carrolli.fa          D.immigrans.k17.fa     D.melanosoma.fa        D.pegasa.fa            D.sordidapex.fa        L.aerea.fa             Z.ornatus.fa
D.cognata.fa           D.imparisetae.fa       D.mercatorum.fa        D.peninsularis.fa      D.sordidula.fa         L.andalusiaca.fa       Z.taronus.fa
D.colorata.fa          D.incognita.fa         D.meridiana.fa         D.percnosoma.fa        D.sp.14030-0761.01.fa  L.clarofinis.fa        Z.tsacasi.car7.fa
D.conformis.fa         D.infuscata.fa         D.meridionalis.fa      D.persimilis.fa        D.sp.st01m.fa          L.collinella.fa        Z.tsacasi.jd01t.fa
D.cracens.fa           D.insularis.fa         D.merina.fa            D.phalerata.fa         D.sproati.fa           L.maculata.fa          Z.vittiger.fa
```

# RepeatMask

``` bash
for i in *.fa ; do RepeatMasker -pa 20 -no_is -s -nolow -dir ../rm -lib ../DoubleTrouble/sequences/ShelSpoiPele.fasta $i;done 
for i in *.ori.out; do cat $i|reader-rm.py|rm-cleanup.py > $i.clean; done
for i in *ori.out.clean; do awk '{print $0,FILENAME}' $i |perl -pe 's/\.fa\.ori\.out\.clean//'; done > merged.clean.sum
```

# Visualize

## Sort order

``` r
sortorder<-c("D.flavopinicola","D.maculinotata","S.hsui","S.polygonia","S.montana","S.graminum","S.caliginosa","S.parva","S.pallida","S.reducta","S.tumidula","S.cyrtandrae","D.setosimentum","D.quasianomalipes","D.anomalipes","D.cyrtoloma","D.melanocephala","D.differens","D.planitibia","D.silvestris","D.heteroneura","D.picticornis","D.basisetae","D.paucipuncta","D.glabriapex","D.macrothrix","D.hawaiiensis","D.crucigera","D.pullipes","D.grimshawi","D.engyochracea","D.villosipedis","D.ochracea","D.murphyi","D.sproati","D.dives","D.multiciliata","D.demipolita","D.longiperda","D.melanosoma","D.fungiperda","D.mimica","D.infuscata","D.kambysellisi","D.cognata","D.tanythrix","D.yooni","D.kokeensis","D.nrfundita","D.cracens","D.paracracens","D.nigritarsus","D.nrmedialis2","D.nrmedialis3","D.seclusa","D.nrperissopoda1","D.nrperissopoda5","D.atroscutellata","D.imparisetae","D.trichaetosa","D.percnosoma","D.neutralis","D.incognita","D.sordidapex","D.conformis","D.paramelanica","D.colorata","D.robusta","D.sordidula","D.borealis","D.montana","D.lacicola","D.americana","D.virilis","D.littoralis","D.ezoana","D.kanekoi","D.pseudotalamancana","D.gaucha","D.mettleri","D.eohydei","D.pegasa","D.nigricruria","D.fulvimacula","D.peninsularis","D.paranaensis","D.repleta","D.mercatorum","D.leonis","D.anceps","D.meridiana","D.meridionalis","D.stalkeri","D.buzzatii","D.hamatofila","D.mayaguana","D.mojavensis","D.aldrichi","D.mulleri","Z.flavofinira","H.trivittata","H.alboralis","H.confusa","H.histrioides","D.repletoides","H.guttata","L.aerea","Z.bogoriensis","Z.ghesquierei","Z.inermis","Z.kolodkinae","Z.tsacasi.jd01t","Z.tsacasi.car7","Z.ornatus","Z.africanus","Z.indianus.bs02","Z.indianus.d18","Z.gabonicus","Z.indianus.r04","Z.indianus.v01","Z.capensis","Z.taronus","Z.davidi","Z.camerounensis","Z.nigranus","Z.lachaisei","Z.vittiger","D.quadrilineata","D.pruinosa","D.niveifrons","D.rubida","D.siamana","D.immigrans.12","D.immigrans.k17","D.ustulata","D.formosana","D.tripunctata","D.cardini","D.parthenogenetica","D.acutilabella","D.arawakana","D.dunni","D.macrospina","D.funebris","D.putrida","D.neotestacea","D.testacea","D.histrio","D.kuntzei","D.sp.st01m","D.phalerata","D.falleni","D.rellima","D.quinaria","D.suboccidentalis","D.recens","D.subquinaria","S.latifasciaeformis","C.caudatula","C.procnemis","C.amoena","C.costata","S.nigrithorax","L.varia","L.montana","L.maculata","C.indagator","A.minor","A.mariae","A.communis","H.duncani","L.mommai","L.collinella","L.andalusiaca","L.magnipectinata","L.clarofinis","L.stackelbergi","D.sturtevanti","D.neocordata","D.emarginata","D.saltans","D.prosaltans","D.austrosaltans","D.sucinea","D.sp.14030-0761.01","D.insularis","D.tropicalis","D.willistoni.00","D.willistoni.17","D.equinoxialis","D.paulistorum.12","D.paulistorum.06","D.subobscura","D.subsilvestris","D.obscura","D.ambigua","D.tristis","D.miranda","D.persimilis","D.pseudoobscura","D.helvetica","D.algonquin","D.affinis","D.varians","D.vallismaia","D.merina","D.ercepeae","D.atripex","D.monieri","D.anomalata","D.ananassae","D.pallidosa","D.pseuan.pseuan.","D.pseuan.nigrens","D.mal.mal.","D.mal.pallens","D.parabipectinata","D.bipectinata","D.rufa","D.triauraria","D.kikkawai","D.jambulina","D.aff.chauv.","D.bocqueti","D.birchii","D.anomelani","D.serrata","D.bunnanda","D.oshimai","D.gunungcola","D.elegans","D.fuyamai","D.kurseongensis","D.rhopaloa","D.carrolli","D.ficusphila","D.biarmipes","D.subpulchrella","D.mimetica","D.lutescens","D.takahashii","D.pseudotakahashii","D.prostipennis","D.eugracilis","D.erecta","D.yakuba","D.teissieri.273.3","D.teissieri.ct02","D.mel.ral732","D.mel.ral737","D.mel.pi2","D.mel.ral176","D.mel.ral91","D.mel.se.sto","D.mel.es.ten","D.melanogaster","D.mel.iso1","D.sechellia","D.sim.006","D.sim.sz232","D.sim.sz129","D.mau.01","D.mau.r31","D.mau.r61","D.mau.r32","D.mau.r39")
```

``` r
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──

    ## ✔ ggplot2 3.3.6     ✔ purrr   0.3.4
    ## ✔ tibble  3.1.7     ✔ dplyr   1.0.9
    ## ✔ tidyr   1.2.0     ✔ stringr 1.4.0
    ## ✔ readr   2.1.2     ✔ forcats 0.5.1

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

``` r
theme_set(theme_bw())
h<-read.table("/Users/rokofler/analysis/2024-DoubleTrouble/2024-01-rm-266species/raw/merged.clean.sum.score",header=F)
names(h)<-c("te","species","score")
teorder<-c("Shellder","Spoink","PPI251")
t<-subset(h,species %in% sortorder)
t$species <- factor(t$species, levels=sortorder)
t$te <- factor(t$te, levels=teorder)

p<- ggplot(t,aes(y=score,x=species))+geom_bar(stat="identity")+facet_grid(te~.)+ylab("similarity")+
  theme(axis.title.x=element_blank(),axis.text.x = element_blank())
plot(p)
```

![](01-RM-SpoiShelPele_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

``` r
pdf(file="/Users/rokofler/analysis/2024-DoubleTrouble/2024-01-rm-266species/graph/Double-trouble-origin.pdf",width=7,height=3.5)
plot(p)
dev.off()
```

    ## quartz_off_screen 
    ##                 2

``` r
p<- ggplot(t,aes(x=score,y=species))+geom_bar(stat="identity")+facet_grid(.~te)+xlab("similarity")+
  theme(axis.title.y=element_blank(),axis.text.y = element_text(vjust = 0.5, hjust=1,size=4))
plot(p)
```

![](01-RM-SpoiShelPele_files/figure-gfm/unnamed-chunk-5-2.png)<!-- -->

``` r
pdf(file="/Users/rokofler/analysis/2024-DoubleTrouble/2024-01-rm-266species/graph/Double-trouble-origin-landscape.pdf",height=10,width=6)
plot(p)
dev.off()
```

    ## quartz_off_screen 
    ##                 2

``` r
t$nr<-as.factor(as.numeric(as.factor(t$species)))
p<- ggplot(t,aes(y=score,x=nr))+geom_bar(stat="identity")+facet_grid(te~.)+xlab("similarity")+
  theme(axis.title.x=element_blank(),axis.text.x = element_text(angle = 90,vjust = 0.5, hjust=1,size=4))
plot(p)
```

![](01-RM-SpoiShelPele_files/figure-gfm/unnamed-chunk-5-3.png)<!-- -->

``` r
pdf(file="/Users/rokofler/analysis/2024-DoubleTrouble/2024-01-rm-266species/graph/Double-trouble-origin-debug.pdf",height=6,width=15)
plot(p)
dev.off()
```

    ## quartz_off_screen 
    ##                 2
