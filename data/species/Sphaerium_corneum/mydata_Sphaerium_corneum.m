 function [data, auxData, metaData, txtData, weights] = mydata_Sphaerium_corneum

%% set metadata
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Sphaeriida'; 
metaData.family     = 'Sphaeriidae';
metaData.species    = 'Sphaerium_corneum'; 
metaData.species_en = 'European fingernail clam'; 

metaData.ecoCode.climate = {'C', 'D'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K. body temperature   
metaData.data_0     = {'ax'; 'ap'; 'am'; 'L0'; 'Lx'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Wd'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Kristin Katrin Weiss','Andre Gergs','Kim Rakel'};                            
metaData.date_subm = [2017 10 04];                              
metaData.email    = {'gergs@gaiac.rwth-aachen.de'};            
metaData.address  = {'gaiac - Research Institute for Ecosystem Analysis and Assessment, 52072 Aachen, Germany'};      

metaData.curator   = {'Bas Kooijman'};    
metaData.date_acc = [2017 10 04];              
metaData.email_cur    = {'bas.kooijman@vu.nl'};            

%% set data
% zero-variate data;
data.ax = 60;   units.ax = 'd';    label.ax = 'age at emergence';                bibkey.ax = 'Thie1928';   
  temp.ax = C2K(18); units.temp.ax = 'K'; label.temp.ax = 'temperature'; 
  comment.ax = 'temperature guessed; original data: duration of the embryonal development within the adults: less than 2-3 months';
data.tp = 90;   units.tp = 'd';    label.tp = 'time since emergence at puperty'; bibkey.tp = 'usgs';   
  temp.tp = C2K(18); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'temperature guessed, age at puperty: 3 months';
data.am = 1095;   units.am = 'd';    label.am = 'life span';                     bibkey.am = 'usgs';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'temperature guessed, life span: 3 years';
  
data.L0  = 0.00608;  units.L0  = 'cm';  label.L0  = 'initial egg length';        bibkey.L0  = 'Step1865';
data.Lx  = 0.2;  units.Lx  = 'cm';  label.Lx  = 'shell length at emergence';     bibkey.Lx  = 'Hear1977'; 
  comment.Lx = 'About half of the extra-marsupial larvae were longer than 2 mm, some as short as 1.13 mm';
data.Lp  = 0.5;     units.Lp  = 'cm';  label.Lp  = 'shell length at puberty';    bibkey.Lp  = 'HoloPent1993';
  comment.Lp = 'original unit mm';
data.Li  = 1.4;      units.Li  = 'cm';  label.Li  = 'ultimate shell length';     bibkey.Li  = 'usgs';
  comment.Li = 'original unit mm';
data.Ri  = 13.4/28;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';       bibkey.Ri  = 'Voel2015';
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'lab data, control group';

% univariate data
% time-length
data.tL = [  ... % time (d), shell length (cm)
0.0	    0.3874
31.0	0.3321
76.0	0.369
143.0	0.379
172.0	0.3992
207.0	0.5585
242.0	0.5652
270.0	0.6088
302.0	0.6289
336.0	0.6122
365.0	0.6105];
units.tL = {'d', 'cm'};  label.tL = {'time since start of experiment', 'shell length'};  
temp.tL    = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GallMore1988';
comment.tL = 'temperature guessed, length measured monthly from october 1965 to october 1966';

% length-dry weight
data.LW = [ ... % shell length (cm), dry weight (g)
0.48	0.0083
0.55	0.0119
0.49	0.0081
0.49	0.0089
0.58	0.0181
0.55	0.0136
0.65	0.0233
0.86	0.0408
0.62	0.0193
0.49	0.0076
0.54	0.0103
0.55	0.0144
0.50	0.0112
0.87	0.0316
0.53	0.011
0.58	0.0144
0.46	0.0069
0.52	0.0098
0.53	0.008
0.54	0.0108
0.41	0.0078
0.54	0.0114
0.49	0.0082
0.49	0.0092
0.60	0.0159
0.62	0.0146
0.55	0.0122
0.84	0.0343
0.67	0.0203
0.54	0.0105
0.55	0.0126
0.61	0.0173
0.51	0.011
0.59	0.0124
0.47	0.0078
0.62	0.0192
0.42	0.0057
0.56	0.0107
0.51	0.0115
0.84	0.0423
1.02	0.0459
0.53	0.0092
0.60    0.0118
0.50	0.0084
0.64	0.0157
0.57	0.0132
0.54	0.0111
0.52	0.0094
0.48	0.0081
0.60	0.0173
0.77	0.0309
0.49	0.0078
0.59	0.0154
0.46	0.0077
0.58	0.0135
0.82	0.0315
0.53	0.0107
0.52	0.0095
0.45	0.0062
0.42	0.0047
0.50	0.0101
0.42	0.0051
0.40	0.0056
0.39	0.0047
0.42	0.0033
0.42	0.0086
0.37	0.005
0.46	0.0065
0.49	0.009
0.63	0.017
0.54	0.0097
0.86	0.0427
0.70	0.0193
0.65	0.0196
0.48	0.0082
0.96	0.0448
0.62	0.0186
0.59	0.0189
0.52	0.0136
0.72	0.0272
0.50	0.0101
0.75	0.0366
0.51	0.0088
0.59	0.0178
0.70	0.0283
0.81	0.022
0.63	0.0201
0.54	0.0107
0.53	0.0107
0.51	0.0203
0.84	0.0372
0.76	0.0348
0.70	0.0286
0.61	0.0176
0.60	0.0186
0.56	0.0131
0.47	0.0069
0.52	0.01
0.46	0.0063
0.62	0.0148
0.58	0.0146
0.60	0.0163
0.58	0.0105
0.48	0.0066
0.61	0.0142
0.55	0.0115];
units.LW = {'cm', 'g'}; label.LW = {'shell length', 'dry weight'};  bibkey.LW = 'Data2017';


%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
  
%% Group plots

%% Discussion points
D1 = 'The ab-data of Thie1928 refers to the development of the juveniles inside the adults. Referring to Hear1977 the development from S. corneum takes place in brood sacs. Primary sacs contain embryos, secondary sacs fetal larvae, and tertiary sacs prodissoconch larvae. The young start feeding on epithelial cells within the brood sacs. (Blan1988) The extra-marsupial larvae remain for some time inside the adult and feed on algae.';
D2 = 'Hear1977 found that eggs and sperm in the extra-marsupial larvae in most species of Sphaerium. This leads to the assumption that maturity in Sphaerium corneum takes place before the young are released from the adult';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'no veliger stage; the neonate develops in the mantle cavity of the mother till age 60 d';
metaData.bibkey.F1 = 'Hear1977'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'This entry was financially supported by the CEFIC Long-range Research Initiative (project number ECO28)';

%% Links
metaData.links.id_CoL = '6YWBR'; % Cat of Life
metaData.links.id_ITIS = '81392'; % ITIS
metaData.links.id_EoL = '47025040'; % Ency of Life
metaData.links.id_Wiki = 'Sphaerium_corneum'; % Wikipedia
metaData.links.id_ADW = 'Sphaerium_corneum'; % ADW
metaData.links.id_Taxo = '39602'; % Taxonomicon
metaData.links.id_WoRMS = '181564'; % WoRMS
metaData.links.id_molluscabase = '181564'; % molluscabase


%% References
bibkey = 'usgs'; type = 'Misc'; bib = ...
'howpublished = {\url{https://nas.er.usgs.gov/queries/FactSheet.aspx?SpeciesID=131}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Data2017'; type = 'Misc'; bib = [ ...
'author = {Kristin Katrin Weiss}, ' ... 
'year = {2017}, ' ...
'note = {Own measurements}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'GallMore1988'; type = 'Article'; bib = [ ... 
'author = {LeGallo, J. - M. and Moretau, J. - C.}, ' ... 
'year = {1988}, ' ...
'title = {Croissance et productivite dune population du \emph{Sphaerium corneum} ({L}.) ({B}ivalvia: {P}isidiiae)}, ' ...
'journal = {Canadian Journal of Zoology}, ' ...
'volume = {66}, ' ...
'pages = {439--445}, '...
'doi = {10.1139/z88-063}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'HoloPent1993'; type = 'Article'; bib = [ ... 
'author = {Holopainen, I. J. and Penttinen, O. - P.}, ' ... 
'year = {1993}, ' ...
'title = {Normoxic and anoxic heat output of the freshwater bivalves \emph{Pisidium} and \emph{Sphaerium}}, ' ...
'journal = {Oecologia}, ' ...
'volume = {93}, ' ...
'pages = {215-223}, '...
'doi = {10.1007/BF00317674}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Voel2015'; type = 'Article'; bib = [ ... 
'author = {Voelker, C. and Kaempken, I. and Boedicker, C. and Oehlmann, J. and Oetken, M.}, ' ... 
'year = {2015}, ' ...
'title = {Toxicity of silver nanoparticles and ionic silver: {C}omparison of adverse effects and potential toxicity mechanisms in the freshwarwe clam \emph{Sphaerium corneum}}, ' ...
'journal = {Nanotoxicology}, ' ...
'volume = {9}, ' ...
'pages = {677-685}, '...
'doi = {10.3109/17435390.2014.963723}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Thie1928'; type = 'Article'; bib = [ ... 
'author = {Thiel, M. E.}, ' ... 
'year = {1928}, ' ...
'title = {Zur Biologie unserer S\"{u}{\ss}wasser-Muscheln.}, ' ...
'journal = {Zeitschrift f\"{u}r Morphologie und \"{O}kologie der Tiere}, ' ...
'volume = {13}, ' ...
'pages = {65-116}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Hear1977'; type = 'Article'; bib = [ ... 
'author = {Heard, W. H.}, ' ... 
'year = {1977}, ' ...
'title = {Reproduction of Fingernail Clams({S}phaeriidae: \emph{Sphaerium} and \emph{Musculium})}, ' ...
'journal = {Malacologia}, ' ...
'volume = {16(2)}, ' ...
'pages = {421--455}, '...
'howpublished = {\url{http://www.biodiversitylibrary.org/item/47323#page/446/mode/1up}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Blan1988'; type = 'Article'; bib = [ ... 
'author = {Blandel, K.}, ' ... 
'year = {1988}, ' ...
'title = {Stages in the ontogeny and a model of the evolution of bivalves ({M}ollusca)}, ' ...
'journal = {Pal\"{a}ontologische Zeitschrift}, ' ...
'volume = {62}, ' ...
'pages = {217--254}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Step1865'; type = 'Article'; bib = [ ... 
'author = {Stepanoff, P.}, ' ... 
'year = {1865}, ' ...
'title = {Ueber die {G}eschlechtsorgane und die {E}ntwickelung von {C}yclas}, ' ...
'journal = {Archiv f\"{u}r Naturgeschichte}, ' ...
'volume = {XXXI. Jahrgang, 1. Band}, ' ...
'pages = {1--32}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

