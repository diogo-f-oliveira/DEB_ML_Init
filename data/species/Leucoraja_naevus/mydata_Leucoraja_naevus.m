function [data, auxData, metaData, txtData, weights] = mydata_Leucoraja_naevus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Leucoraja_naevus'; 
metaData.species_en = 'Cuckoo ray'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
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
data.ab = 4.5*30.5;  units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';    
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temps for all data are guessed; guess ab base on Raja clavata';
data.tp = 3285;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 14*365;    units.am = 'd';    label.am = 'life span';             bibkey.am = 'AnAge';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 11;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';     bibkey.Lb  = 'guess';
data.Lp  = 57;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';   bibkey.Lp  = 'GallNola2004';
data.Li  = 80;  units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'GallNola2004';

data.Wwb = 7.0;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on 0.0041*Lb^3.105, see F2';
data.Wwp = 1.161e3; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'GallNola2004';
  comment.Wwp = 'based on 0.0041*Lp^3.105, see F2';
data.Wwi = 3.326e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'GallNola2004';
  comment.Wwi = 'based on 0.0041*Li^3.105, see F2';

data.Ri  = 90/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data at f
data.tL = [ ... % time since birth (yr), total length (cm)
0	19.238
0	15.070
0	22.766
0	23.567
0	17.796
0	21.323
0	26.132
0	13.307
0	24.369
0	27.094
0	34.469
0	29.339
0	32.224
1	35.912
1	27.735
1	31.423
1	27.094
1	30.301
1	33.507
2	41.523
2	42.485
2	43.287
2	38.958
2	45.210
2	47.776
2	40.240
2	43.928
2	44.088
2	44.088
2	37.675
2	49.379
2	34.950
2	35.752
2	36.874
2	43.607
3	50.822
3	38.317
3	49.058
3	52.265
3	39.439
3	52.425
3	54.028
3	63.166
3	52.104
3	40.240
3	43.287
3	44.248
3	45.531
3	46.493
3	46.974
3	47.776
3	49.860
3	50.661
3	51.623
3	51.623
3	52.745
3	54.990
3	56.273
3	58.517
3	42.164
3	59.319
3	57.555
3	60.120
3	64.128
4	64.449
4	65.731
4	66.212
4	43.928
4	59.158
4	60.762
4	61.723
4	62.685
4	63.327
4	67.174
4	51.303
4.	51.784
4.	52.265
4.	52.906
4.	53.707
4.	54.509
4.	55.150
4.	55.631
4.	55.631
4.	56.273
4.	56.593
4.	56.914
4.	57.876
4.	57.876
4.	44.729
4.	45.691
4.	46.493
4.	47.615
4.	48.257
4.	49.058
4.	50.180
4.	58.677
5	59.639
5	60.120
5	50.180
5	62.365
5	63.006
5	68.457
5	60.601
5	61.242
5	52.745
5	58.998
5	60.120
5	63.808
5	64.128
5	65.251
5	66.052
5	66.533
5	67.174
5.	55.311
5.	56.273
5	57.555
5.	60.922
5.	54.349
6	67.174
6	68.457
6	70.060
6.	56.914
6.	58.036
6.	59.800
6.	61.082
6.	62.044
6.	63.327
6.	64.128
6.	64.609
6	64.609
6	65.090
6.	65.090
6.	65.892
6.	65.892
6.	68.938
6.	55.150
6.	56.112
8	67.014];
data.tL(:,1) = 365 * (.5 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};
temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
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
F1 = 'Subtropical, preferred 20 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww (g) = 0.0041 (L in cm)^3.105';
metaData.bibkey.F2 = 'McCuScot2012'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '725XK'; % Cat of Life
metaData.links.id_ITIS = '564143'; % ITIS
metaData.links.id_EoL = '46560522'; % Ency of Life
metaData.links.id_Wiki = 'Leucoraja_naevus'; % Wikipedia
metaData.links.id_ADW = 'Leucoraja_naevus'; % ADW
metaData.links.id_Taxo = '108270'; % Taxonomicon
metaData.links.id_WoRMS = '105876'; % WoRMS
metaData.links.id_fishbase = 'Leucoraja-naevus'; % fishbase


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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Leucoraja_naevus}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Leucoraja_naevus/}}'; 
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
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/4326}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
