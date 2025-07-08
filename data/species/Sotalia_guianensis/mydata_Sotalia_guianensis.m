function [data, auxData, metaData, txtData, weights] = mydata_Sotalia_guianensis
%% set metadata 
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Delphinidae';
metaData.species    = 'Sotalia_guianensis'; 
metaData.species_en = 'Guiana dolphin'; 

metaData.ecoCode.climate = {'MA', 'A'};
metaData.ecoCode.ecozone = {'MAW', 'TN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.2); % K, body temperature
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2025 02 20]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 20];

%% set data
% zero-variate data
data.tg = 325;       units.tg = 'd';  label.tg = 'gestation time';         bibkey.tg = 'guess';    
  temp.tg = C2K(37.2); units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'based on Sotalia_fluviatilis; temp from bottlenose dolphin';
data.tx =  8.5*30.5;  units.tx = 'd';  label.tx = 'time since birth at weaning';  bibkey.tx = 'guess';    
  temp.tx = C2K(37.2); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'guess based on Pontporia';
data.tp =  6*365; units.tp = 'd'; label.tp = 'time since birth at puberty for female'; bibkey.tp = 'guess';
  temp.tp = C2K(37.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Sotalia_fluviatilis';
data.am =   40 * 365;  units.am = 'd';  label.am = 'life span';            bibkey.am = 'Wiki';   
  temp.am = C2K(37.2);units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 80;  units.Lb = 'cm'; label.Lb = 'length at birth';              bibkey.Lb = 'RosaBarr2003';
  comment.Lb = 'ADW: 71 to 106 cm';
data.Lp = 177;  units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'RosaBarr2003';
  comment.Lp = 'read from tL-curve at tp';
data.Li = 210;  units.Li = 'cm'; label.Li = 'ultimate length for female';  bibkey.Li = 'RosaBarr2003';

data.Wwi = 121000;  units.Wwi  = 'g'; label.Wwi  = 'ultimate wet weight';  bibkey.Wwi  = 'Wiki';

data.Ri = 0.5/365;   units.Ri = '#/d';label.Ri = 'maximum reprod rate';    bibkey.Ri  = 'guess';   
  temp.Ri = C2K(37.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on Pontporia';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), length (cm)
0.046	92.522
0.073	96.696
0.364	117.043
0.728	131.652
0.874	156.696
0.947	137.391
1.019	148.870
1.311	148.348
1.383	138.435
2.039	156.696
2.840	166.609
3.932	165.565
3.933	162.957
4.879	158.783
6.917	170.261
9.903	166.087
10.995	185.391
11.723	179.130
14.927	186.435
15.073	174.957
16.966	183.304
21.044	174.435
24.102	183.304
24.903	180.696
26.942	193.217
27.015	183.304
27.961	184.870
29.854	175.478];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'length', 'females'};  
temp.tL_f  = C2K(37.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'RosaBarr2003';
%
data.tL_m = [ ... % time since birth (yr), length (cm)
0.046	81.101
0.078	87.704
0.466	142.730
0.473	130.619
0.616	133.917
0.821	152.625
1.044	141.057
1.179	157.016
1.821	168.001
1.902	152.585
2.764	158.609
3.846	158.019
4.927	159.630
5.647	161.255
6.002	171.151
6.930	187.080
7.015	165.609
7.648	192.008
7.943	180.437
8.017	177.682
10.106	181.459
10.827	181.432
12.781	170.902
12.846	182.459
13.851	190.679
14.936	184.584
19.915	180.548
20.778	184.370
20.915	195.924
20.987	196.472
29.000	182.417];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'length', 'males'};  
temp.tL_m  = C2K(37.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'RosaBarr2003';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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

%% Links
metaData.links.id_CoL = '6YVS3'; % Cat of Life
metaData.links.id_ITIS = '180424'; % ITIS
metaData.links.id_EoL = '46559311'; % Ency of Life
metaData.links.id_Wiki = 'Sotalia_guianensis'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '68695'; % Taxonomicon
metaData.links.id_WoRMS = '344009'; % WoRMS
metaData.links.id_MSW3 = ''; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sotalia_guianensis}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'URL = {../../../bib/Kooy2010.html}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RosaBarr2003'; type = 'Article'; bib = [ ... 
'author = {Fernando C\''{e}sar Weber Rosas and Andr\''{e} Silva Barreto and Emygdio Leite de Araujo Monteiro-Filho}, ' ... 
'year = {2003}, ' ...
'volume = {101}, ' ...
'pages = {377–383}, ' ...
'title = {Age and growth of the estuarine dolphin (\emph{Sotalia guianensis}) ({C}etacea, {D}elphinidae) on the {P}aran\''{a} coast, southern {B}razil}, ' ...
'journal = {Fish. Bull.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

