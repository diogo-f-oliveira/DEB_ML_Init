function [data, auxData, metaData, txtData, weights] = mydata_Rhinolophus_ferrumequinum

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Rhinolophidae';
metaData.species    = 'Rhinolophus_ferrumequinum'; 
metaData.species_en = 'Greater horseshoe bat'; 

metaData.ecoCode.climate = {'BWk','BSk','BSh','Cwa','Csa','Cfb','Dfb'};
metaData.ecoCode.ecozone = {'THp','TPa'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 25];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 25]; 

%% set data
% zero-variate data

data.tg = 80;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'AnAgE';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';  
data.tx = 40;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'Sano2000';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '37-43 d';
data.tp = 730;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';   
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 30.5*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 5.8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';  bibkey.Wwb = 'AnAge';
data.Wwi = 30;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'Wiki';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = {'AnAge','Sano2000'};   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 1 litter per yr';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), forearm length (cm)
0.000	2.503
2.061	2.923
3.894	3.198
5.909	3.481
7.923	3.840
9.815	4.169
12.016	4.406
13.970	4.696
15.923	5.056
17.878	5.300
20.023	5.238
21.922	5.261
23.881	5.307
25.963	5.352
27.923	5.367
30.066	5.397
31.781	5.420
33.801	5.458
35.761	5.480
38.209	5.595
39.924	5.594
41.884	5.625];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'length of forearm','female'};  
temp.tL_f    = C2K(34.8);  units.temp.tL_f = 'C'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Sano2000';
temp.tL_f = [ ... % time since birth (d), body temp (C)
0.000	36.477
0.995	36.533
1.955	36.921
3.011	36.811
3.967	37.643
4.936	37.016
5.943	37.239
6.902	37.645
7.960	37.314
8.967	37.592
9.978	37.408
11.074	37.907
11.900	37.853
12.952	38.223
13.961	38.261
15.149	38.797
16.023	38.447
16.985	38.688
17.901	38.744
19.001	38.874
19.917	39.041
20.975	38.710
21.937	38.858
22.944	39.062
23.955	38.916
24.964	38.880
25.790	38.880
26.888	39.158];
%
data.tL_m = [ ... % time since birth (d), weight (g)
0.048	2.525
1.023	2.770
2.855	3.053
4.931	3.397
6.886	3.626
9.022	4.008
10.916	4.253
12.932	4.551
14.948	4.788
16.962	5.155
18.982	5.246
21.064	5.284
22.778	5.337
24.982	5.368
26.943	5.367
28.963	5.436
30.800	5.451
32.944	5.473
35.026	5.503
36.983	5.633
38.820	5.679
40.903	5.678
42.924	5.670];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'length of forearm','male'};  
temp.tL_m    = temp.tL_f;  units.temp.tL_m = 'C'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Sano2000';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Wwb = 0 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed not to differ from females';
D3 = 'Varying body temperature was measured and taken into account';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '4S97C'; % Cat of Life
metaData.links.id_ITIS = '631430'; % ITIS
metaData.links.id_EoL = '328771'; % Ency of Life
metaData.links.id_Wiki = 'Rhinolophus_ferrumequinum'; % Wikipedia
metaData.links.id_ADW = 'Rhinolophus_ferrumequinum'; % ADW
metaData.links.id_Taxo = '64121'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13800535'; % MSW3
metaData.links.id_AnAge = 'Rhinolophus_ferrumequinum'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhinolophus_ferrumequinum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sano2000'; type = 'Article'; bib = [ ... 
'author = {Sano, Akira}, ' ... 
'year = {2000}, ' ...
'title = {Postnatal growth and development of thermoregulative ability in the {J}apanese greater horseshoe bat, \emph{Rhinolophus ferrumequinum nippon}, related to maternal care}, ' ...
'journal = {Mammal Study}, ' ...
'volume = {25}, ' ...
'pages = {1-15}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MacDBarr1993'; type = 'Book'; bib = [ ...  
'author = {David MacDonald and Priscilla Barrett}, ' ...
'year = {1993}, ' ...
'title  = {Mammals of Britain and Europe}, ' ...
'publisher = {HarperCollins, London}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Rhinolophus_ferrumequinum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

