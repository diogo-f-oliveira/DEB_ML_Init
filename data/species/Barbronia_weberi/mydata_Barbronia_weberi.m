function [data, auxData, metaData, txtData, weights] = mydata_Barbronia_weberi

%% set metaData
metaData.phylum     = 'Annelida'; 
metaData.class      = 'Clitellata'; 
metaData.order      = 'Euhirudinea'; 
metaData.family     = 'Salifidae';
metaData.species    = 'Barbronia_weberi'; 
metaData.species_en = 'Asian Freshwater Leech'; 

metaData.ecoCode.climate = {'A', 'B'};
metaData.ecoCode.ecozone = {'TPi', 'TA'};
metaData.ecoCode.habitat = {'0iFm'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biTim', 'biCim'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Ab'; 'Ap'; 'Ai'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ae'; 't-A'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 09 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 18]; 

%% set data
% zero-variate data

data.ah = 2;    units.ah = 'd';    label.ah = 'age at hatch';                bibkey.ah = 'GoveBain2003';   
  temp.ah = C2K(21);  units.temp.ah = 'K'; label.temp.ah = 'temperature'; 
data.ab = 27;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'GoveBain2003';   
  temp.ab = C2K(21);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'leaving coccon';
data.tp = 107;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'GoveBain2003';   
  temp.tp = C2K(21);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 5*30.5;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'GoveBain2003';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.L2b  = 0.045;   units.L2b  = 'cm^2';  label.L2b  = 'surface at birth';    bibkey.L2b  = 'GoveBain2003';
  comment.L2b = '5.6 mm long, 0.7 mm wide';
data.L2p  = 0.477;   units.L2p  = 'cm^2';  label.L2p  = 'surface at puberty';    bibkey.L2p  = 'GoveBain2003';
  comment.L2p = '21.5 mm long, 2.3 mm wide';
data.L2i  = 0.479;   units.L2i  = 'cm^2';  label.L2i  = 'ultimate surface';    bibkey.L2i  = 'GoveBain2003';
 
data.Wwb = 1.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'GoveBain2003';
  comment.Wwb = 'based on egg diameter 1.3 mm: pi/6*0.13^3';
data.Wwp = 0.089;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'GoveBain2003';
  comment.Wwp = 'based on pi/4*0.23^2*2.15';
data.Wwi = 0.091;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'GoveBain2003';
  comment.Wwi = 'based on pi/4*0.23^2*2.15';
  
data.Ri  = 3/7; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'GoveBain2003';   
  temp.Ri = C2K(21);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'one cocoon per week, 1 till 5 eggs per cocoon, upto 75 cocoons per life time';
  
% uni-variate data

% time-surface
data.tL2 = [ ... % age (d), surface (cm^2)
2.000	0.002
4.158	0.002
7.069	0.006
9.011	0.012
9.981	0.011
11.228	0.012
11.368	0.016
17.050	0.017
17.052	0.025
17.053	0.032
20.104	0.040
20.106	0.052
20.241	0.032
20.933	0.027
20.934	0.035
20.936	0.043
23.289	0.029
23.291	0.040
23.293	0.047
23.843	0.026
24.123	0.037
24.257	0.015
25.923	0.032
27.032	0.032
28.142	0.040
28.145	0.056
29.818	0.106
30.920	0.069
30.941	0.177
33.013	0.140
33.014	0.146
34.257	0.126
37.039	0.174
37.047	0.217
55.094	0.365
55.383	0.424
57.169	0.346
70.063	0.374
70.079	0.450
70.086	0.490
83.098	0.411
83.248	0.467
83.253	0.490
92.145	0.604
92.249	0.429
92.254	0.456
92.378	0.379
99.166	0.363
99.317	0.427
108.020	0.284
108.180	0.393
108.188	0.432
110.282	0.511
110.287	0.536
115.260	0.450
122.203	0.518];
units.tL2   = {'d', 'cm^2'};  label.tL2 = {'age', 'surface'};  
temp.tL2    = C2K(21);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'GoveBain2003';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Energy conductance seems to make a jump upwards at birth, which is taken into account';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '382D'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '3139989'; % Ency of Life
metaData.links.id_Wiki = 'Barbronia_weberi'; % Wikipedia
metaData.links.id_ADW = 'Barbronia_weberi'; % ADW
metaData.links.id_Taxo = '103702'; % Taxonomicon
metaData.links.id_WoRMS = '1511662'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Erpobdelliformes}}';
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
bibkey = 'GoveBain2003'; type = 'Article'; bib = [ ... 
'author = {F. R. Govedich and B. A. Bain and M. Burd and R. W. Davies}, ' ... 
'year = {2003}, ' ...
'title = {Reproductive biology of the invasive {A}sian freshwater leech \emph{Barbronia weberi} ({B}lanchard, 1897)}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {510}, ' ...
'pages = {125-129}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
