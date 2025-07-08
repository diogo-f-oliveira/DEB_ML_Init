function [data, auxData, metaData, txtData, weights] = mydata_Urocitellus_armatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Sciuridae';
metaData.species    = 'Urocitellus_armatus'; 
metaData.species_en = 'Uinta ground squirrel'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iTs'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiH', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';'t_Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2021 11 03];              

%% set data
% zero-variate data

data.tg = 24.5;    units.tg = 'd';     label.tg = 'gestation time';                bibkey.tg = 'ADW';   
  temp.tg = C2K(35.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '23 to 26 d';
data.tx = 39;    units.tx = 'd';     label.tx = 'time since birth at weaning';   bibkey.tx = 'ADW';   
  temp.tx = C2K(35.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'ADW';
  temp.tp = C2K(35.5); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '1-2 yr';
data.tpm = 2*365;   units.tpm = 'd';     label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(35.5); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 6*365;    units.am = 'd'; label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(35.5); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Data from Urocitellus_richardsonii and uncertain';
  
data.Wwb = 6;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'KoepHoff1981';
data.Wwi = 500;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'ADW';
  comment.Wwi = '201-635 d';

data.Ri  = 5.4/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(35.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5.4 pups per litter; 1 litter per yr';

% uni-variate data

% time-length data
data.tL = [ ... % time since birth (d), head+body length (g)
0.000	5.650
5.026	7.196
8.065	8.145
11.688	9.176
14.961	10.072
17.416	10.912
21.156	11.943
25.130	13.299
28.169	14.547
31.558	15.848
33.312	16.499
36.117	17.611
39.506	18.777
42.195	19.645
45.818	20.026
49.675	20.624
53.649	20.897
57.506	20.899
61.948	21.091
66.390	21.013
69.662	21.231
73.753	21.423
77.377	21.128
81.584	20.941];
units.tL  = {'d', 'cm'};  label.tL = {'time', 'head+body length'};  
temp.tL  = C2K(35.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KoepHoff1981';

% time-weight data
data.tWw = [ ... % time since birth (d), weight (g)
0.373	5.710
5.084	17.081
7.565	23.478
10.419	32.012
12.900	39.122
16.376	50.503
19.232	61.176
21.724	76.842
24.840	96.782
27.210	113.875
29.584	134.534
31.211	150.207
33.213	170.156
35.467	192.954
38.345	221.452
40.965	240.683
42.585	250.652
46.438	267.734
47.308	271.292
50.785	284.099
53.763	292.631
55.383	303.313
58.496	321.114
62.233	343.901
66.209	360.269
69.453	383.772
71.434	386.609
74.399	385.159];
units.tWw  = {'d', 'g'};  label.tWw = {'time', 'wet weight'};  
temp.tWw  = C2K(35.5);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'KoepHoff1981';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tWw = 5 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumend to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '7DTRN'; % Cat of Life
metaData.links.id_ITIS = '930314'; % ITIS
metaData.links.id_EoL = '327989'; % Ency of Life
metaData.links.id_Wiki = 'Urocitellus_armatus'; % Wikipedia
metaData.links.id_ADW = 'Urocitellus_armatus'; % ADW
metaData.links.id_Taxo = '5726066'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12400992'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Urocitellus_armatus}}';
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
bibkey = 'KoepHoff1981'; type = 'Article'; bib = [ ... 
'author = {J. W. Koeppl and R. S. Hoffmann}, ' ... 
'year = {1981}, ' ...
'title = {Comparative Postnatal Growth of Four Ground Squirrel Species}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {62(1)}, ' ...
'pages = {41-57}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Urocitellus_armatus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

