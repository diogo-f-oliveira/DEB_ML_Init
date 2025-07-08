function [data, auxData, metaData, txtData, weights] = mydata_Asplanchna_girodi

%% set metaData
metaData.phylum     = 'Rotifera'; 
metaData.class      = 'Monogononta'; 
metaData.order      = 'Ploimida'; 
metaData.family     = 'Asplanchnidae';
metaData.species    = 'Asplanchna_girodi'; 
metaData.species_en = 'Rotifer'; 

metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TH', 'TA', 'TN', 'TP'};
metaData.ecoCode.habitat = {'0iFl', '0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz', 'biCir'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'Vb'}; 
metaData.data_1     = {'t-V_f'; 'JX-ap'; 'JX-am'; 'JX-Vp'; 'JX-Vi'; 'JX-Ri'}; 

metaData.COMPLETE = 3.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2011 09 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 18];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 18]; 

%% set data
% zero-variate data

data.Vb  = 3;   units.Vb  = '10^6 mum^3';  label.Vb  = 'volume at birth';   bibkey.Vb  = 'RobeSalt1981';
 
% uni-variate data

% time - volume
data.tV_20 = [ ... % time since birth (d), volume 10^6 mum^3
1	4.325111
2	5.095273
2	5.510847
4	6.595690
5	7.247363
6	8.352072
7	8.314081
8	8.533286
9	8.771126];
units.tV_20  = {'d', '10^6 mum^3'};  label.tV_20 = {'time since birth', 'volume', '20 P/d'};  
temp.tV_20   = C2K(20);  units.temp.tV_20 = 'K'; label.temp.tV_20 = 'temperature';
bibkey.tV_20 = 'RobeSalt1981';
comment.tV_20 = 'food supply rate: 20 Paramecium tetraurelia/ rotifer/d';
%
data.tV_60 = [... % time since birth (d), volume 10^6 mum^3
1	5.113047
2	7.005163
3	8.444595
4	9.450856
5	9.885591
6	9.808925
7   10.539356];
units.tV_60  = {'d', '10^6 mum^3'};  label.tV_60 = {'time since birth', 'volume', '60 P/d'};  
temp.tV_60   = C2K(20);  units.temp.tV_60 = 'K'; label.temp.tV_60 = 'temperature';
bibkey.tV_60 = 'RobeSalt1981';
comment.tV_60 = 'food supply rate: 60 Paramecium tetraurelia/ rotifer/d';
%
data.tV_240 = [ ... % time since birth (d), volume 10^6 mum^3
1	6.589942
2	8.875674
3	11.024107
4	11.990637
5	12.603282
6	13.412119
7	13.512484];
units.tV_240  = {'d', '10^6 mum^3'};  label.tV_240 = {'time since birth', 'volume', '240 P/d'};  
temp.tV_240   = C2K(20);  units.temp.tV_240 = 'K'; label.temp.tV_240 = 'temperature';
bibkey.tV_240 = 'RobeSalt1981';
comment.tV_240 = 'food supply rate: 240 Paramecium tetraurelia/ rotifer/d';

% feeding rate - volume at puberty
data.JXVp = [ ... % par/d, Vp 10^6 mum^3
 20	 8.004656
 30	 8.501159
 60	 8.440729
120	 9.743028
240	10.182233];
units.JXVp  = {'paramecia/d', '10^6 mum^3'};  label.JXVp = {'feeding rate', 'volume'};  
temp.JXVp   = C2K(20);  units.temp.JXVp = 'K'; label.temp.JXVp = 'temperature';
bibkey.JXVp = 'RobeSalt1981';
comment.JXVp = 'Volume at puberty';

% feeding rate - ultimate volume 
data.JXVi = [ ... % par/d, Vi 10^6 mum^3
20	10.097236
30	11.154992
60	11.867937
120	13.586220
240	14.764100];
units.JXVi  = {'paramecia/d', '10^6 mum^3'};  label.JXVi = {'feeding rate', 'volume'};  
temp.JXVi   = C2K(20);  units.temp.JXVi = 'K'; label.temp.JXVi = 'temperature';
bibkey.JXVi = 'RobeSalt1981';
comment.JXVi = 'Ultimate volume';

% feeding rate - reproduction rate
data.JXRi = [... % par/d, Ri #/d
 20	2.135464
 30	2.774432
 60	4.669103
120	5.747394
240	6.221944];
units.JXRi  = {'paramecia/d', '#/d'};  label.JXRi = {'feeding rate', 'reproduction rate'};  
temp.JXRi   = C2K(20);  units.temp.JXRi = 'K'; label.temp.JXRi = 'temperature';
bibkey.JXRi = 'RobeSalt1981';

% feeding rate - time since birth at puberty
data.JXap = [... % par/d, age at birth of first young (d)
 20	6.399647
 30	3.260085
 60	2.592752
120	2.491189
240	2.464257];
units.JXap  = {'paramecia/d', 'd'};  label.JXap = {'feeding rate', 'time since birth'};  
temp.JXap   = C2K(20);  units.temp.JXap = 'K'; label.temp.JXap = 'temperature';
bibkey.JXap = 'RobeSalt1981';
comment.JXap = 'time since birth at puberty';

data.JXam = [... % par/d, age at death (d)
 20	137.873972
 30	 92.614844
 60	 65.288578
120	 55.041228
240	 20.883395];
units.JXam  = {'paramecia/d', 'd'};  label.JXam = {'feeding rate', 'time since birth'};  
temp.JXam   = C2K(20);  units.temp.JXam = 'K'; label.temp.JXam = 'temperature';
bibkey.JXam = 'RobeSalt1981';
comment.JXam = 'time since birth at death';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tV_240','tV_60','tV_20'}; subtitle1 = {'Data for feeding rates 240, 60, 20 paramecia/d.rotifer'};
set2 = {'JXVi','JXVp'}; subtitle2 = {'Data for ultimate, puberty'};
set3 = {'JXam','JXap'}; subtitle3 = {'Data for time since birth at death, puberty'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'This entry concerns parthenogenetic reproduction, so females only';
D2 = 'No density data available; d_V = 0.035 g/cm^3 is assumed because this species is very watery';
D3 = 'Effect of feeding on survival is probably due to NO2 in paramecia, which were fed with lettuce';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'This entry is discussed in Kooy2010, cf Fig 6.12';
metaData.bibkey.F1 = 'Kooy2010'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'HJPK'; % Cat of Life
metaData.links.id_ITIS = '59242'; % ITIS
metaData.links.id_EoL = '1062479'; % Ency of Life
metaData.links.id_Wiki = 'Asplanchna'; % Wikipedia
metaData.links.id_ADW = 'Asplanchna_girodi'; % ADW
metaData.links.id_Taxo = '114748'; % Taxonomicon
metaData.links.id_WoRMS = '391964'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Asplanchna_girodi}}';
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
bibkey = 'RobeSalt1981'; type = 'Article'; bib = [ ... 
'author = {Robertson, J. R. and Salt, G. W.}, ' ... 
'year = {1981}, ' ...
'title = {Responses in growth, mortality, and reproduction to variable food levels by the rotifer, \emph{Asplanchna girodi}}, ' ...
'journal = {Ecology}, ' ...
'volume = {62}, ' ...
'pages = {1585--1596}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

