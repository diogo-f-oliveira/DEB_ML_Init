function [data, auxData, metaData, txtData, weights] = mydata_Alona_iheringula
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Chydoridae';
metaData.species    = 'Alona_iheringula'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-R'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 14]; 

%% set data
% zero-variate data

data.ab = 1.59;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'SilvAbre2014';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 3.24;    units.tp = 'd';    label.tp = 'time since birth at at puberty'; bibkey.tp = 'SilvAbre2014';   
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 54;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'SilvAbre2014';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.0288; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'SilvAbre2014';
data.Lp  = 0.0413; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'SilvAbre2014';
data.Li  = 0.0510;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'SilvAbre2014';

data.Wwi  = 1.72e-5;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on length 0.051 cm, height 0.043 cm, width 0.0100 cm ; pi/4*0.051*0.043*0.01'; 

data.Ri = 47.6/(46-3.24);    units.Ri = '#/d';    label.Ri = 'max reprod rate';  bibkey.Ri = 'SilvAbre2014';   
  temp.Ri = C2K(17.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 47.6 neonates per mean life time of 46 d, minus tp';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), length (mm)
0.000	0.291
1.008	0.339
2.016	0.386
2.868	0.429
3.953	0.442
5.116	0.452
5.969	0.469
6.977	0.475
8.062	0.483
9.225	0.494
10.155	0.502
11.008	0.505
12.016	0.510
13.023	0.510
14.031	0.510
14.961	0.510
16.124	0.510
17.054	0.511
17.984	0.512
19.147	0.511
20.000	0.510
21.008	0.511
22.016	0.510
22.946	0.509
24.264	0.510
24.961	0.510
25.814	0.510
27.054	0.510
27.829	0.510
28.915	0.510
30.000	0.511
31.085	0.511
31.938	0.512
33.023	0.510
34.031	0.510
35.116	0.511
35.969	0.510
36.899	0.510
37.984	0.510
38.837	0.509
39.922	0.510
40.930	0.511
42.016	0.511
43.023	0.510
44.031	0.510
44.961	0.510
45.969	0.508
46.899	0.508
47.907	0.507
48.992	0.506
50.078	0.505
51.085	0.505
51.938	0.506
53.023	0.503
53.953	0.502
54.884	0.499];
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SilvAbre2014'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'',''}; subtitle1 = {'Data for 5, 2 C'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '65WGZ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '42628618'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5240332'; % Taxonomicon
metaData.links.id_WoRMS = '1302230'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SilvAbre2014'; type = 'Article'; bib = [ ... 
'doi = {10.1371/journal.pne.0097050}, ' ...
'author = {Erika dos Santos Silva and  C\''{i}nthia Bruno de Abreu and Tereza Cristina Orlando and C\''{e}lio Wisniewski and Maria Jos\''{e} dos Santos-Wisniewski}, ' ... 
'year = {2014}, ' ...
'title = {\emph{Alona iheringula} {S}inev \& {K}otov, 2004 ({C}rustacea, {A}nomopoda, {C}hydoridae, {A}loninae): {L}ife Cycle and DNA Barcode with Implications for the Taxonomy of the {A}loninae Subfamily}, ' ...
'journal = {PLoS ONE}, ' ...
'volume = {9(5)}, ' ...
'pages = {1e97050}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
