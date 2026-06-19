# Transcriptonomics-
Reuma casus Transcriptonomics

## Inhoud
- `Assests`- Afbeeldingen ter ondersteuning van de resultaten
  uit wetenschappelijke bronnen. 
- `Bronnen`- gebruikte bronnen. 
- `Data`- gebruikte data voor de analyses. 
- `Scripts`- scripts voor verschillende analyses 
- `Resultaten`- de visualisaties van significante resultaten. 
- `README.md`- het document waarin de tekst staat gegenereerd. 
- `data_stewardship`- 

## Inleiding
Reumatische arthritis (RA) is een autoimmuun ziekte waarvan het immuunsysteem, het synovium of het slijmvlies van het gewrichtskapsel in het hele lichaam aanvalt. Het veroorzaakt ontsteking van de gewrichten en kan in ernstige gevallen leiden tot blijvende gewrichtsschade en invaliditeit. Daarnaast kan RA ook andere organen aantasten. 

RA komt wereldwijd voor bij ongeveer 1 op de 200 volwassenen en treft vrouwen 2 tot 3 keer vaker dan mannen. De ziekte kan op elke leeftijd ontstaan, maar komt het vaaktst voor tussen de 50 en 59 jaar (Smith & Berman, 2022).

Door een verlies van immuuntolerantie ontstaan auto-antistoffen, zoals ACPA en reumafactor (RF), die een ontstekingsreactie op gang brengen (Mauri & Ehrenstein, 2007). Hierbij worden T-cellen, B-cellen en macrofagen geactiveerd(Tran et al., 2005), die ontstekingsstoffen (cytokinen) zoals TNF-α, IL-6 en IL-1 produceren (McInnes & Schett, 2007). Deze chronische ontsteking van het synovium (de gewrichtsbekleding) leidt uiteindelijk tot beschadiging van kraakbeen en bot, wat pijn, stijfheid en functieverlies van de gewrichten veroorzaakt (Amaya-Amaya et al., 2013). 

Het doel van dit onderzoek is om met behulp van genexpressieanalyse, GO-analyse en KEGG-pathwayanalyse inzicht te krijgen in welke biologische processen en signaalroutes een grote rol spelen bij reumatoïde artritis (RA) in vergelijking met gezonde controles.
Welke genen komen significant verschillend tot expressie tussen reumapatiënten en gezonde controles?
Welke biologische processen en immuunfuncties zijn het meest verrijkt?
Welke KEGG-pathway is betrokken bij de gevonden verschillen in genexpressie?
Welke rol spelen de meest opvallende genen binnen dit pathway bij reumatoïde artritis?

## Methode
RNA-seq data afkomstig van vier gezonde controles en vier patiënten met established reumatoïde artritis afkomstig uit (Platzer et al., 2019) werden geanalyseerd in R. Sequencing reads werden gemapt op het humane referentiegenoom (GRCh38) ((Accession GCF_000001405.40), gedownload uit de NCBI Genome Database)(Schneider et al., 2017) met behulp van het Rsubread-pakket versie 2.24.0 (Liao et al., 2019). Vervolgens werd het aantal reads per gen bepaald met featureCounts, waarna een count matrix werd opgesteld. Differentiële genexpressie tussen de RA- en controlegroep werd bepaald met DESeq2 package versie 1.50.2 (Love et al., 2014). Significante verschillen in genexpressie werden gevisualiseerd met een volcano plot (EnhancedVolcano) met package versie 1.28.2 (Blighe et al., 2026). Vervolgens werd een Gene Ontology-analyse uitgevoerd met goseq package versie 1.62.0 (Young et al., 2010) om betrokken biologische processen te identificeren. Ten slotte werd een KEGG pathway-analyse uitgevoerd met behulp van KEGGREST package versie 1.50.0 (Kanehisa & Goto, 2000), en pathview versie 1.50.0 (Luo & Brouwer, 2013) om relevante signaalroutes in kaart te brengen.

<p align="center">
  <img src="Data/SamplesRA.png" alt="Samples RA" width="600"/>
</p>


## Resultaten
Om de genen die differentieel tot expressie kwamen te visualiseren is gebruik gemaakt van een vulcanoplot. Daarna is de GO-analyse gedaan om in kaart te brengen welke biologische processen, moleculaire functies of cellulaire componenten betrokken zijn bij de genen die in de gebruikte dataset een veranderde expressie lieten zien. Ook was er een KEGG-analyse gedaan van een pahtway die betrekking had tot de uitkomst van de GO-analyse. 

De [vulcanoplot](Resultaten/VulcanoplotRA.png) liet zien dat er veel genen waren waarvan de expressie het meest verschillend was tussen reumapatiënten en gezonde controles (rode punten). Zowel aan de linger als rechterkant bevinden zich significante genen, wat betekent dat sommige genen verhoogd en andere verlaagd tot expressie kwamen bij RA-patienten.

De [Gene Ontology (GO)- analyse](Resultaten/GO-analyseplot.png) liet zien dat de differentieel geëxpresseerde genen voornamelijk betrokken waren bij imuungerelateerde processen. De meest significante GO-termen waren onder andere immune system process, immune response, lymphocyte mediated immunity en adaptive immune respons. Deze resultaten lieten zien dat veranderingen in de expressie van genen tussen reumapatienten en gezonde controles vooral te maken hadden met activatie van het immuunsysteem. 

DE KEGG-analyse van de cytokine-cytokine receptor interactie pahtway [(hsa04060)](Resultaten/hsa04060.pathview.2png.png) liet zien dat er meerdere types cytokinen zowel sterk verlaagd als verhoogd tot expressie kwmamen, met name vele type chemokines waaronder CXCL1, CXCL5, CXCL6, CXCL8 en CXCL13 waren sterk verhoogd tot expressie gekomen. Daarnaast werden verhoogde expressieniveaus waargenomen voor verschillende cytokinen, waaronder IL6, IL1A en IL1B. Bij slechte weergave is hier de [pathway](Resultaten/hsa04060.pathview.png) beter zichtbaar zonder bijschrift. De functies van de cytokines in RA staan beschreven in deze tabel. 

<p align="center">
  <img src="Data/SamplesRA.png" alt="Samples RA" width="600"/>
</p>

## Conclusie

Het doel van het onderzoek was om met behulp van genexpressieanalyse, GO-analyse en KEGG-pathwayanalyse inzicht te krijgen in welke biologische processen en signaalroutes een grote rol spelen bij reumatoïde artritis (RA) in vergelijking met gezonde controles. 
Op basis van de GO-analyse en KEGG-analyse kan worden geconcludeerd dat immuun- en ontstekingsgerelateerde processen een belangrijke rol spelen bij reumatoïde artritis. Deze bevindingen werden ondersteund door de KEGG-analyse van de pathway Cytokine-cytokine receptor interaction (hsa04060). Binnen deze pathway werden meerdere cytokinen en chemokinen zowel verhoog als verlaagd tot expressie gebracht. Dit suggereert dat ontregeling van cytokine- en chemokinesignalering bijdraagt aan de ontstekingsreacties die kenmerkend zijn voor reumatoïde artritis.



## Data Stewardship

Hier leg je uit hoe je je data hebt beheerd.
