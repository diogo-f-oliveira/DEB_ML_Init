function [data, auxData, metaData, txtData, weights] = mydata_Phycis_blennoides
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Phycidae';
metaData.species    = 'Phycis_blennoides'; 
metaData.species_en = 'Greater forkbeard'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};           
metaData.date_subm = [2018 12 19]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data;

data.am = 20*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'fishbase';   
  temp.am = C2K(9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 33;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'fishbase';
data.Li  = 100;     units.Li  = 'cm';   label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb  = 2.7e-4;   units.Wwb  = 'g';   label.Wwb  = 'wet weight at birth';  bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwi  = 8.3e3;  units.Wwi  = 'g';   label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on 0.00479*Li^3.12, see F1';

data.Ri = 2e6/365;   units.Ri = '#/d';    label.Ri = 'max reproduction rate';     bibkey.Ri = 'guess';   
  temp.Ri = C2K(9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Pseudophycis bachus';

% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm) 
0.278	9.080
0.788	16.442
1.427	20.123
1.735	19.632
1.965	23.313
2.247	23.313
2.399	27.239
2.705	29.448
2.961	30.920
3.270	28.221
3.448	31.902
3.677	35.583
3.933	36.319
3.934	34.601
4.113	35.583
4.419	38.773
4.726	40.736
4.955	44.663
5.187	43.190
5.517	50.307
5.698	46.871
6.030	49.080
6.235	50.061
6.514	56.687
6.746	54.969
6.953	50.307
7.233	55.460
7.563	62.822
7.667	59.632
8.231	60.368
8.484	68.466
8.687	72.883
9.204	62.086
9.508	72.147
10.201	69.448
10.430	72.883
11.377	77.791
13.200	73.129
14.452	81.963];
data.tL_f(:,1) = (0.5 + data.tL_f(:,1)) * 365; % convert yr to d
units.tL_f = {'d', 'cm'};   label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CasaPine2000';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm) 
0.712	14.969
1.528	25.031
1.736	18.896
2.526	28.712
2.654	30.429
3.218	29.693
3.524	33.129
3.908	35.583
4.497	37.546
5.190	36.810
5.418	41.472
6.545	43.926];
data.tL_m(:,1) = (0.5 + data.tL_m(:,1)) * 365; % convert yr to d
units.tL_m = {'d', 'cm'};   label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CasaPine2000';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: wet weight in g = 0.00479*(TL in cm)^3.12 ';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '77DF3'; % Cat of Life
metaData.links.id_ITIS = '164751'; % ITIS
metaData.links.id_EoL = '46565095'; % Ency of Life
metaData.links.id_Wiki = 'Phycis_blennoides'; % Wikipedia
metaData.links.id_ADW = 'Phycis_blennoides'; % ADW
metaData.links.id_Taxo = '44347'; % Taxonomicon
metaData.links.id_WoRMS = '126501'; % WoRMS
metaData.links.id_fishbase = 'Phycis-blennoides'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib =  ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phycis}}';
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
bibkey = 'CasaPine2000'; type = 'Article'; bib = [ ... 
'author = {Jos\''{e}e Miguel Casas and Carmen Pineiro}, ' ... 
'year = {2000}, ' ...
'title = {Growth and age estimation of greater fork-beard (\emph{Phycis blennoides} Br\"{u}nnich, 1768) in the north and northwest of the {I}berian {P}eninsula ({I}{C}{E}{S} {D}ivision {V}{I}{I}{I}c and {I}{X}a)}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {47}, ' ...
'pages = {19-25}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib =  ...
'howpublished = {\url{http://www.fishbase.se/summary/Phycis-blennoides.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
