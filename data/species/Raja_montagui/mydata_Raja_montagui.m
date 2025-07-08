function [data, auxData, metaData, txtData, weights] = mydata_Raja_montagui

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Raja_montagui'; 
metaData.species_en = 'Spotted skate';

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2017 07 24];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 07 24]; 

%% set data
% zero-variate data;
data.ab = 5*30.5;units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';    
  temp.ab = C2K(12); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temps for all data are guessed; guess for ab based on Raja clavata';
data.tp = 1667;  units.tp = 'd';    label.tp = 'time since birth at puberty';         bibkey.tp = 'AnAge';
  temp.tp = C2K(12); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 23*365; units.am = 'd';    label.am = 'life span';             bibkey.am = 'AnAge';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 10;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'guess';
data.Lp  = 55;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'GallNola2004';
data.Li  = 75;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'GallNola2004';

data.Wwb = 5.3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on 0.0041*Lb^3.105, see F2';
data.Wwp = 1064; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'GallNola2004';
data.Wwi = 2788; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'GallNola2004';

data.Ri  = 60/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'one clutch per yr';
  
% uni-variate data at f
data.tL = [ ... % time since birth (yr), total length (cm)
0.	21.408
0.	20.604
0.	17.706
0.	17.062
0.	19.477
0.	18.672
1	35.252
1	34.125
1	33.159
1	32.193
1	31.549
1	25.272
1.	30.262
1.	28.008
1.	27.042
2	47.324
2	48.451
2	46.519
2	45.553
2	44.748
2	52.636
2	51.670
2	51.026
2	50.060
2	49.256
2	43.783
2	43.300
2	42.656
2	42.334
2	41.690
2	40.885
2	40.402
2	39.920
2	38.954
2	37.988
2	33.964
2	30.905
2	28.974
2.	36.378
2.	35.734
2.	35.252
3	59.235
3	58.592
3	61.006
3	50.382
3	49.738
3	48.934
3	37.344
3	35.734
3	57.626
3	56.821
3	56.016
3	55.694
3	54.889
3	53.924
3	52.958
3	52.636
3	51.992
3	51.187
3	48.129
3	47.646
3	45.231
3	44.588
3	43.944
3	43.461
3	42.012
3	41.207
3	47.163
3	46.519
3	45.714
3	42.817
3	40.241
3.	32.193
3.	38.632
3.	34.125
4	67.606
4	66.479
4	65.674
4	61.972
4	61.167
4	61.006
4	60.040
4	59.557
4	58.592
4	58.431
4	57.626
4	57.304
4	56.982
4	54.728
4	54.085
4	53.119
4	51.509
4	50.865
4	50.382
4	49.738
4	49.738
4	49.095
4	48.129
4	65.030
4	63.742
4	62.777
4	56.338
4	52.636
4	47.002
4	46.519
4	43.139
4	56.177
4	55.694
5	59.396
5	67.928
5	66.801
5	65.674
5	65.513
5	64.064
5	63.421
5	63.421
5	62.455
5	62.455
5	61.972
5	61.650
5	61.167
5	60.523
5	58.431
5	57.304
5	55.855
5	54.567
5	53.441
5	52.314
6	66.479
6	67.445
6	65.674
6	65.030
6	65.030
6	65.030
6	64.708
6	64.708
6	64.386
6	64.064
6	63.903
6	63.421
6	63.421
6	53.763
6	62.777
6	61.328
6	59.879
6	57.143
7	66.962];
data.tL(:,1) = 365 * (.5 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};
temp.tL = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GallNola2004';

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

%% Facts
F1 = 'Subtropical, preferred 12 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww (g) = 0.0042 (L in cm)^3.105';
metaData.bibkey.F2 = 'McCuScot2012'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '78RLW'; % Cat of Life
metaData.links.id_ITIS = '160883'; % ITIS
metaData.links.id_EoL = '46560551'; % Ency of Life
metaData.links.id_Wiki = 'Raja_montagui'; % Wikipedia
metaData.links.id_ADW = 'Raja_montagui'; % ADW
metaData.links.id_Taxo = '42071'; % Taxonomicon
metaData.links.id_WoRMS = '105887'; % WoRMS
metaData.links.id_fishbase = 'Raja-montagui'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Raja_(genus)}}';   
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
bibkey = 'GallNola2004'; type = 'Article'; bib = [ ...  
'author = {M. J. Gallagher and C. P. Nolan and F. Jeal}, ' ...
'year = {2004}, ' ...
'title  = {Age, Growth and Maturity of the Commercial Ray Species from the {I}rish {S}ea}, ' ...
'journal = {J. Northw. Atl. Fish. Sci.}, ' ...
'volume = {35}, ' ...
'pages = {47-66}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Raja_montagui}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Raja_montagui/}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sharktrust'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sharktrust.org/shared/downloads/factsheets/spotted_ray_st_factsheet.pdf}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McCuScot2012'; type = 'Article'; bib = [ ...  
'author = {McCully, S. R. and  Scott, F. and Ellis, J. R.}, ' ...
'year = {2012}, ' ...
'title  = {Lengths at maturity and conversion factors for skates ({R}ajidae) around the {B}ritish {I}sles, with an analysis of data in the literature}, ' ...
'journal = {ICES Journal of Marine Science}, ' ...
'volume = {69}, ' ...
'pages = {1812-1822}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
