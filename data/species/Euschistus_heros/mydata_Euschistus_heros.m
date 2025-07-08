function [data, auxData, metaData, txtData, weights] = mydata_Euschistus_heros

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Hemiptera'; 
metaData.family     = 'Pentatomidae';
metaData.species    = 'Euschistus_heros'; 
metaData.species_en = 'Neotropical brown stink bug'; 

metaData.ecoCode.climate = {'A','C'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Thl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHe'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'astar'; 'Lb'; 'Wwb'; 'Wwp'; 'Ri'; 'JCp'}; 
metaData.data_1     = {'T-ab'; 'T-astar'; 't-L_f'; 't-Ww_f'; 't-N'; 't-S'}; 

metaData.COMPLETE = 3.2; % using criteria of LikaKear2011

metaData.author   = {'Evridiki Klagkou','Andre Gergs','Christian Baden','Dina Lika'};    
metaData.date_subm = [2024 01 18];              
metaData.email_mod_1    = {'lika@uoc.gr'};            
metaData.address_mod_1  = {'University of Crete, UoC'};    

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2024 01 26];

%% set data
% zero-variate data

data.ab = 6;          units.ab = 'd';      label.ab = 'age at birth';       bibkey.ab = 'GuilGome2015';   
   temp.ab = C2K(26); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 31.4;       units.ap = 'd';      label.ap = 'age at puberty';     bibkey.ap = 'GuilGome2015';
  temp.ap = C2K(26);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 120;        units.am = 'd';      label.am = 'life span as imago'; bibkey.am = 'MalaPani1999';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'longlivety of adults';  

data.Lhb  = 0.055; units.Lhb  = 'cm';  label.Lhb  = 'head length at birth';   bibkey.Lhb  = 'KlagGerg2024';
  comment.Lhb = 'Lhb = head length at first instar';
  
data.Wwb = 0.74/1000; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'MalaPani1999';
  comment.Wwb = ' wet weight at instar 1, soybean';
data.Wwp = 0.07285;   units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'MalaPani1999';
  comment.Wwp = ' wet weight at puberty, soybean';

data.Ri  = 105.8/25.6; units.Ri  = '#/d';   label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'MichMora2019';   
  temp.Ri = C2K(27);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Number of eggs/female = 105.8; Oviposition period = 25.6 days'; 

data.t1 = 3.1;       units.t1 = 'd';      label.t1 = 'duration of instar 1'; bibkey.t1 = 'GuilGome2015';   
  temp.t1 = C2K(26); units.temp.t1 = 'K'; label.temp.t1 = 'temperature'; 
data.t2 = 6;         units.t2 = 'd';      label.t2 = 'duration of instar 2'; bibkey.t2 = 'GuilGome2015';   
  temp.t2 = C2K(26); units.temp.t2 = 'K'; label.temp.t2 = 'temperature'; 
data.t3 = 3.5;       units.t3 = 'd';      label.t3 = 'duration of instar 3'; bibkey.t3 = 'GuilGome2015';   
  temp.t3 = C2K(26); units.temp.t3 = 'K'; label.temp.t3 = 'temperature'; 
data.t4 = 4.7;       units.t4 = 'd';      label.t4 = 'duration of instar 4'; bibkey.t4 = 'GuilGome2015';   
  temp.t4 = C2K(26); units.temp.t4 = 'K'; label.temp.t4 = 'temperature'; 
data.t5 = 8.1;       units.t5 = 'd';      label.t5 = 'duration of instar 5'; bibkey.t5 = 'GuilGome2015';   
  temp.t5 = C2K(26); units.temp.t5 = 'K'; label.temp.t5 = 'temperature'; 
  
data.JC_p = 0.02870;   units.JC_p = 'ml CO2/h'; label.JC_p = 'respiration rate'; bibkey.JC_p = 'HaddMend2016';
  temp.JC_p = C2K(27); units.temp.JC_p = 'K';   label.temp.JC_p = 'temperature'; 
  weight.JC_p = 0.068; units.weight.JC_p = 'g'; label.weight.JC_p = 'weight'; 
  comment.JC_p = 'CO2 production was measured for 20 recently emerged female and male adults';
 
% uni variate data
% temperature-age at birth
data.Tab = [ ... % temperature (C),  age at birth (d)
    34  4
    32  4
    30  4
    28  5.4
    26  6.2
    24  8
    22  10.4
    20  12.8
    18  16.2];
units.Tab = {'C', 'd'}; label.Tab = {'temperature', 'age at birth'};
bibkey.Tab = 'KlagGerg2024';

% temperature-instar duration
data.Ttins = [ ... % temperature (C), duration of instars 2-5 (d)
    22  28.81
    24  26.9
    25  21.7
    26  22.3
    28  15.41
    31  13.51];
units.Ttins = {'C', 'd'}; label.Ttins= {'temperature', 'duration of instars 2-5'};
bibkey.Ttins = {'GuilGome2015', 'MalaPani1999', 'CostBorg1998', 'Frug2015'};
comment.Ttins = 'data from different papers, not same f probably';

% time-headlength
tL_fB = [... % time since birth (d), headlength (mm) for different feeding concentration (100%, 80%, 50% and 20%) of food sachets with nutrient solution were available
    0  0.63  0.63  0.63  0.63
    1  0.60  0.60  0.60  0.60
    7  0.74  0.74  0.74  0.75
    9  0.93  0.77  0.84  0.76
    14 1.26  1.05  1.03  0.90
    16 1.45  1.22  1.23  0.99
    21 1.73  1.40  1.37  1.16
    23 1.79  1.60  1.47  1.17
    28 1.81  1.77  1.56  1.19
    30 1.83  1.96  1.65  1.32
    35 1.92  1.90  1.48  1.41
    37 1.87  1.89  1.44  1.36]; 
tL_fB(:,1) = tL_fB(:,1) + 1; % age of insect at day 0 of the experiment is approx 1 day.
tL_fB(:,2:5) = tL_fB(:,2:5)/ 10; % convert mm to  cm
%
data.tL_fB1 = tL_fB(:,[1,2]);
units.tL_fB1 = {'d', 'cm'};  label.tL_fB1 = {'time since birth', 'head length','1.0'}; 
temp.tL_fB1 = C2K(24.5);  units.temp.tL_fB1 = 'K'; label.temp.tL_fB1 = 'temperature';  
bibkey.tL_fB1 = 'KlagGerg2024';
comment.tL_fB1  = 'Data for ad libitum: 100% of food sachets with nutrient solution were available';
%
data.tL_fB2 = tL_fB(:,[1,3]);
units.tL_fB2 = {'d', 'cm'};  label.tL_fB2 = {'time since birth', 'head length','0.8'};  
bibkey.tL_fB2 = 'KlagGerg2024';
comment.tL_fB2 = 'Data for diet1: 80% of food sachets with nutrient solution were available';
%
data.tL_fB3 = tL_fB(:,[1,4]);
units.tL_fB3 = {'d', 'cm'};  label.tL_fB3 = {'time since birth', 'head length','0.5'};  
bibkey.tL_fB3 = 'KlagGerg2024';
comment.tL_fB3 = 'Data for diet2: 50% of food sachets with nutrient solution were available';
%
data.tL_fB4 = tL_fB(:,[1,5]);
units.tL_fB4 = {'d', 'cm'};  label.tL_fB4 = {'time since birth', 'head length','0.2'};  
bibkey.tL_fB4 = 'KlagGerg2024';
comment.tL_fB4 = 'Data for diet3: 20% of food sachets with nutrient solution were available';

% time-wet weight
tWw_fB = [... % time since birth (d), wet weight (mg) for different feeding
    0  0.455  0.455  0.455  0.455
    1  0.581  0.581  0.581  0.581
    7  2.583  2.164  2.098  0.857
    9  3.054  2.246  2.450  1.473
    14 8.926  7.013  7.114  2.338
    16 12.327 8.597  9.066  4.274
    21 26.482 18.091 17.698 7.226
    23 26.482 20.657 20.048 8.143
    28 51.995 50.866 23.526 7.667
    30 61.660 43.492 29.507 10.616
    35 65.871 48.232 24.312 13.721
    37 47.632 61.763 37.514 15.758];
tWw_fB(:,1) = tWw_fB(:,1) + 1; % age of insect at day 0 of the experiment is approx 1 day.
tWw_fB(:,2:5) = tWw_fB(:,2:5)/ 1000; % convert mg to  g
%
data.tWw_fB1 = tWw_fB(:,[1,2]);
units.tWw_fB1  = {'d', 'g'};  label.tWw_fB1 = {'time since birth', 'wet weight','1.0'};  
bibkey.tWw_fB1 = 'KlagGerg2024';
comment.tWw_fB1  = 'Data for ad libitum';
%
data.tWw_fB2 = tWw_fB(:,[1,3]);
units.tWw_fB2  = {'d', 'g'};  label.tWw_fB2 = {'time since birth', 'wet weight','0.8'};  
bibkey.tWw_fB2 = 'KlagGerg2024';
comment.tWw_fB2  = 'Data for diet1: 80% of food sachets with nutrient solution were available';
%
data.tWw_fB3 = tWw_fB(:,[1,4]);
units.tWw_fB3  = {'d', 'g'};  label.tWw_fB3 = {'time since birth', 'wet weight','0.5'};  
bibkey.tWw_fB3 = 'KlagGerg2024';
comment.tWw_fB3  = 'Data for diet2: 50% of food sachets with nutrient solution were available';
%
data.tWw_fB4 = tWw_fB(:,[1,5]);
units.tWw_fB4  = {'d', 'g'};  label.tWw_fB4 = {'time since birth', 'wet weight','0.2'};  
bibkey.tWw_fB4 = 'KlagGerg2024';
comment.tWw_fB4  = 'Data for diet3: 20% of food sachets with nutrient solution were available';

% time-cum number eggs
data.tN = [ ... % time since emergence (d), eggs/female (#)
    1.7  1.9
    3.5  12.9
    5.3  12.2
    9.7  17.2
    13.8 8.6
    18.2 6.8
    19.6 10.7
    21.9 8.7
    24   5.6
    25.7 8.2
    27.4 4.3
    29.9 8.2
    32.1 1.7
    33.6 9.8
    36   6.9
    37.8 9.5
    39.9 3.6
    41.8 5.5
    44   0.2
    45.7 2];
data.tN(:,2) = cumsum(data.tN(:,2));
units.tN = {'d', '#'};  label.tN = {'oviposition period', 'cumulative number of eggs'};  
temp.tN = C2K(27);  units.temp.tN = 'K'; label.temp.tN = 'temperature';
bibkey.tN = 'HaddMend2016';

% time-survival
data.tS = [ .... % time after emergence(d), survival rate (%)
    0     1
    18.5  0.742
    37.2  0.601
    58    0.492
    78.3  0.324
    97.9  0.199
    118.1 0.078];
units.tS  = {'d', '-'};  label.tS = {'time after emergence', 'surviving fraction'};  
temp.tS  = C2K(26);  units.temp.tS = 'K'; label.temp.tS = 'temperature'; 
bibkey.tS = 'MalaPani1999';
comment.tS  = 'Survival rates female, soybean';
%
data.tSN = [.... % time after birth(d), survival rate (%) for different food
    8.2    0.8  
    11.9   0.75 
    16.9   0.75 
    24.1   0.65 ];
units.tSN  = {'d', '-'};  label.tSN = {'time after birth', 'nymphal surviving fraction'};  
temp.tSN  = C2K(26);  units.temp.tSN = 'K'; label.temp.tSN = 'temperature';  
bibkey.tSN = 'MalaPani1999';
comment.tSN  = 'Survival rates nymph, the times are from the instar durations in the zero-variate data';         
 
%% set weights for all real data
weights = setweights(data, []);
weights.tN = 3 * weights.tN;
weights.Ttins = 3 * weights.Ttins;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.99; weights.psd.k = 0.1; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 
weights.psd.kap_G = 5;
weights.psd.k_J = 0 * weights.psd.k_J;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.weight = weight;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_fB1', 'tL_fB2', 'tL_fB3', 'tL_fB4'}; subtitle1 ={'KlagGerg2024 different diets'};
set2 = {'tWw_fB1', 'tWw_fB2', 'tWw_fB3', 'tWw_fB4'}; subtitle2 ={'KlagGerg2024 different diets'};
metaData.grp.sets = {set1,set2};  
metaData.grp.subtitle = {subtitle1,subtitle2};
txtData.label.sets = {'food fraction','food fraction'};

%% Discussion points
D1 = 'abp model also works well for this species';
D2 = 'Biological observations show that length at which stage transitions occur does not change much across different levels of food availability for many insect species.';
D3 = 'The selection of the mainenance ratio k=0.99 as pseudo-data, is based on the implied property of the model that when k=1, stage transitions occur at fixed structural length. This property aligns with observationsin D2';
D4 = 'First instar nymphs do not eat, they are modeled as non-feeding juvenile instead of embryo. This makes sbp model more general as not all insects have a non-feeding first instar.';
metaData.bibkey.D2 = {'JuckErba2017','BawaSong2020'};
metaData.bibkey.D4 = {'KlagGerg2024'};
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'During the first instar the nymph does not feed';
metaData.bibkey.F1 = {'PaniMene1989', 'PaniOliv1998'}; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'Version 2024/01/18 of this entry was financially supported by Bayer.';

%% Links
metaData.links.id_CoL = '4H4M'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '3685396'; % Ency of Life
metaData.links.id_Wiki = 'Euschistus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '222535'; % Taxonomicon

%% References
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{http://www.bio.vu.nl/thb/research/bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GuilGome2015'; type = 'Article'; bib = [ ... 
'author = {Guilherme Pinto Oliveira, D. and Dudczak, A. C. and Alves, L. F. A. and Sosa-Gomez, D. R.}, ' ... 
'year = {2015}, ' ...
'title = {Biological Parameters of (\emph{Euschistus heros}) ({F}.) ({H}eteroptera: {P}entatomidae) and its Susceptibility to Entomopathogenic Fungi When Fed on Different Diets}, ' ...
'journal = {Brazilian Archives of Biology and Technology}, ' ...
'doi = {10.1590/1678-4324-2016150141}, ' ...
'volume = {59}, ' ...
'pages = {e16150141}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MalaPani1999'; type = 'Article'; bib = [ ... 
'author = {Malaguido, A. B. and Panizzi, A. R.}, ' ... 
'year = {1999}, ' ...
'title = {Nymph and adult biology of  (\emph{Euschistus heros})({H}eteroptera: {P}entatomidae) and its abundance related to planting date and phenological stages of sunflower}, ' ...
'journal = {Annals of the Entomological Society of America}, ' ...
'doi = {10.1093/aesa/92.3.424}, ' ...
'volume = {92}, ' ...
'pages = {424-429}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MichMora2019'; type = 'Article'; bib = [ ... 
'author = {Michereff, M. F. F. and Borges, M. and Laumann, R. A. and Daniel, D. and Lucio do Lago, C. and Blassioli-Moraes, M. C.}, ' ... 
'year = {1999}, ' ...
'title = {The influence of resistant soybean cultivars on the biological development of  (\emph{Euschistus heros})({H}eteroptera: {P}entatomidae)}, ' ...
'journal = {Journal of Plant Interactions}, ' ...
'doi = {10.1080/17429145.2019.1662498}, ' ...
'volume = {14}, ' ...
'pages = {544-551}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KlagGerg2024'; type = 'Article'; bib = [ ... 
'author = {Klagkou, E. and Gergs, A. and Baden, C.U. and Lika, K.}, ' ... 
'year = {2024}, ' ...
'title = {Dynamic Energy Budget approach for modeling growth and reproduction of Neotropical stink bugs}, ' ...
'journal = {Ecol. Model.}, '...
'volume = { }, ' ...
'pages = { }'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HaddMend2016'; type = 'Article'; bib = [ ... 
'doi = {10.1371/journal.pone.0156616}, ' ...
'author = {Haddi, K. and Mendes, M.V. and Barcellos, M.S. and Lino-Neto, J. and Freitas,H.L. and  Guedes,R.N.C. and Oliveiran E.E.}, ' ... 
'year = {2016}, ' ...
'title = {Sexual Success after Stress? {I}midacloprid-Induced Hormesis in Males of the Neotropical Stink Bug \emph{Euschistus heros}}, ' ...
'journal = {PLOS one}, ' ...
'volume = {11}, ' ...
'pages = {e0156616}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CostBorg1998'; type = 'Article'; bib = [ ... 
'author = {Costa, M.L.M. and Borges, M. and Vilela, E.F.}, ' ... 
'year = {1998}, ' ...
'title = {Biologia Reprodutiva de \emph{Euschistus heros} ({F}.) ({H}eteroptera: {P}entatomidae)}, ' ...
'journal = {An. Soc. Entomol. Brasil}, ' ...
'volume = {27}, '...
'pages = {559-568}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BawaSong2020'; type = 'Article'; bib = [ ... 
'author = {Bawa, M. and Songsermpong, S. and Kaewtapee, C. and Chanput W.},'...
'title = {Effect of Diet on the Growth Performance, Feed Conversion, and Nutrient Content of the House Cricket},'...
'journal = {J. Insect Sci.},'...
'year = {2020}, '...
'volume = {20}, '...
'pages = {1-10}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JuckErba2017'; type = 'Article'; bib = [ ... 
'author = {Jucker, C. and Erba, D. and Leonardi, M. G. and Lupi, D. and Savoldelli, S.}, '...
'title = {Assessment of Vegetable and Fruit Substrates as Potential Rearing Media for \emph{Hermetia illucens} ({D}iptera: {S}tratiomyidae) Larvae}, '...
'journal = {Environ. Entomol.}, '...
'year = {2017}, '...
'volume = {46}, '...
'pages = {1415–1423}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Frug2015'; type = 'phdthesis'; bib = [ ... 
'author = {Frugeri, A. P.}, ' ... 
'year = {2015}, ' ...
'title = {Temperatures of constant and floating influence on the biological characteristics of \emph{Euschistus heros} ({F}abricius) ({H}emiptera: {P}entatomidae) in successive generations}, ' ...
'school = {Faculty of Agricultural Sciences, Paulista State University}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PaniMene1989'; type = 'Article'; bib = [ ... 
'author = {Panizzi, A. and Meneguim, M.},'...
'title = {Performance of nymphal and adult \emph{Nezara viridula} on selected alternate host plants},'...
'journal = {Entomol. exp. appl.},'...
'year = {1989},'...
'volume = {50},'...
'pages = {215-223}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PaniOliv1998'; type = 'Article'; bib = [ ... 
'author = {Panizzi, A. and Oliveira, E.},'...
'title = {Performance and seasonal abundance of the {N}eotropical brown stink bug, \textit{Euschistus heros} nymphs and adults on a novel food plant (pigeonpea) and soybean},'...
'journal = {Entomol. Exp. Appl.},'...
'year = {1998},'...
'volume = {88},'...
'pages = {169-175}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
