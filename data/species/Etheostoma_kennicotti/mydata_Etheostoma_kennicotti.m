  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_kennicotti
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_kennicotti'; 
metaData.species_en = 'Stripetail darter'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2020 09 24];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data
data.am = 3*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.4;  units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'Page1975'; 
  comment.Lp = 'based on LN data';
data.Li = 8.3;    units.Li = 'cm'; label.Li = 'ultimate total length';      bibkey.Li = 'fishbase';

data.Wwb = 4.8e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Page1975';
  comment.Wwb = 'based on egg diameter of 2.1 mm: pi/6*0.21^3';
data.Wwi = 3.94; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
   comment.Wwi = 'based on 0.00513*Li^3.14 (see F1)';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (mnth), std length (mm)
2.983	15.361
3.957	19.955
4.969	20.713
6.065	19.816
7.081	24.618
8.007	23.093
9.061	23.023
10.072	22.227
11.088	25.889
12.020	30.585
13.200	30.415
14.297	31.177
15.185	34.731
16.159	38.392
17.254	37.079
18.222	35.348
21.343	36.589
21.976	37.543
24.301	43.840
25.353	41.489];
data.tL_f(:,1) = 30.5 * (0 + data.tL_f(:,1));  % convert mnth to d
data.tL_f(:,2) = data.tL_f(:,2)/ 8.5; % convert SL in mm to TL in cm
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Page1975';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (mnth), std length (mm)
1.884	12.837
2.982	14.428
3.998	19.230
4.884	19.674
6.023	20.540
6.911	23.576
8.219	24.240
8.935	23.849
10.031	23.677
11.175	28.795
12.185	27.687
13.032	31.343
14.132	35.526
15.104	37.943
16.117	39.012
17.215	40.603
18.182	38.353
19.282	42.018
20.380	43.816
21.262	40.423
22.231	40.247
23.160	41.107
24.134	46.115
25.231	46.358];
data.tL_m(:,1) = 30.5 * (0 + data.tL_m(:,1));  % convert mnth to d
data.tL_m(:,2) = data.tL_m(:,2)/ 8.5; % convert SL in mm to TL in cm
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Page1975';
comment.tL_m = 'Data for males';

% length - fecundity
data.LN = [ ... % std length (cm), frecundity (#)
3.0 24
3.3 35
3.4 38
3.4 44
3.4 58
3.5 36
3.5 40
3.6 38
3.8 28
3.9 49
3.9 65
4.0 56
4.1 53
4.1 70
4.4 126
4.5 58
4.8 130];
data.LN(:,1) = data.LN(:,1)/ 0.86; % convert SL to TL
units.LN = {'cm', '#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Page1975';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  5 * weights.tL_f;
weights.tL_m =  5 * weights.tL_m;
weights.Li =  5 * weights.Li;
weights.Wwi =  5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v =  2 * weights.psd.v;
weights.psd.p_M =  3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00513 * (TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.85 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3BL4G'; % Cat of Life
metaData.links.id_ITIS = '168405'; % ITIS
metaData.links.id_EoL = '211785'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_kennicotti'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_kennicotti'; % ADW
metaData.links.id_Taxo = '174111'; % Taxonomicon
metaData.links.id_WoRMS = '1420103'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-kennicotti'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_kennicotti}}';  
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
bibkey = 'Page1975'; type = 'techreport'; bib = [ ...  
'author = {Lawrence M. Page}, ' ...
'year = {1975}, ' ...
'title = {The life history of the stripetail darter, \emph{Etheostoma kennicotti}, in Big Creek, Illinois}, ' ... 
'institution = {State of Illinois, Department of Registration and Education, NATURAL HISTORY SURVEY DIVISION}, ' ...
'volume = {93}, '...
'series = {ILLINOIS NATURAL HISTORY SURVEY, Biological Notes}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-kennicotti.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
