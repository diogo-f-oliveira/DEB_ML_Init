function [data, auxData, metaData, txtData, weights] = mydata_Alloteuthis_africana
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Myopsida'; 
metaData.family     = 'Loliginidae';
metaData.species    = 'Alloteuthis_africana'; 
metaData.species_en = 'African squid'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASE'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 13];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 22];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 22];

%% set data
% zero-variate data

data.am = 250;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'ArkhNeklu1993';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.28;  units.Lb  = 'cm'; label.Lb  = 'mantle length at birth';       bibkey.Lb  = 'HastPier2015';
  comment.Lb = '2.5-3.2 mm for Alloteuthis_subulata';
data.Lp  = 7.7;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';       bibkey.Lp  = 'HastPier2015';
  comment.Lp = 'value for Alloteuthis_subulata';
data.Lpm  = 7.2;  units.Lpm  = 'cm'; label.Lpm  = 'mantle length at puberty for males';       bibkey.Lpm  = 'HastPier2015';
  comment.Lpm = 'value for Alloteuthis_subulata';
data.Li  = 18;  units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'ArkhNeklu1993';
data.Lim = 22; units.Lim = 'cm';label.Lim  = 'mantle length at death for male'; bibkey.Lim  = 'ArkhNeklu1993';

data.Wwi  = 33.1; units.Wwi  = 'g'; label.Wwi  = 'wet weight at death'; bibkey.Wwi  = 'HastPier2015';
  comment.Wwi = 'based on 0.167*Li^1.83, see F1';

data.Ni  = 3e4; units.Ni  = '#';      label.Ni  = 'cum reprod at death at ML 12 cm';  bibkey.Ni  = 'guess';   
  temp.Ni = C2K(24); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'based on size-corrected value for Alloteuthis_subulata';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
111.661	5.076
116.121	7.625
117.370	4.907
122.173	5.740
145.059	8.489
145.401	6.691
153.085	15.550
153.431	14.004
166.713	15.168
175.019	16.251
176.142	17.379
178.499	14.828
186.992	16.036];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(24);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ArkhNeklu1993';
comment.tL_f = 'Data for females, hathed in autumn'; 
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
102.461	5.833
112.399	5.118
115.735	6.454
123.155	9.879
123.334	9.544
126.989	7.494
127.209	9.961
127.562	8.873
130.320	8.496
133.793	6.655
139.166	8.701
140.062	6.986
142.179	13.089
144.328	8.949
144.808	16.474
145.648	10.955
148.738	8.153
149.899	11.873
153.776	12.415
154.492	10.993
155.566	8.902
159.678	12.872
161.489	10.739
163.538	12.243
164.320	15.294
165.416	14.667
165.618	15.879
166.147	14.248
166.470	11.196
168.706	12.868
168.927	15.418
169.181	20.100
169.330	17.717
169.859	16.128
173.638	10.023
174.346	20.557
174.748	10.356
175.723	13.951
176.597	10.774
178.384	19.552
179.275	17.503
194.364	16.242
207.135	20.208];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(24);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ArkhNeklu1993';
comment.tL_m = 'Data for males, hathed in autumn'; 

%% set weights for all real data
weights = setweights(data, []);
% weights.tL_f = 5 * weights.tL_f; 
% weights.tL_m = 5 * weights.tL_m; 
% weights.Li = 3 * weights.Li; 
% weights.Lim = 3 * weights.Lim; 

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Males are longer than females, but weigh less';
D3 = 'mod_1: males equal to females upto b';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight for Alloteuthis_subulata: Ww in g = 0.167*(ML in cm)^1.83 for females';
metaData.bibkey.F1 = 'HastPier2015'; 
F2 = 'Programmed death, not by ageing';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'BZNZ'; % Cat of Life
metaData.links.id_ITIS = '555976'; % ITIS
metaData.links.id_EoL = '491916'; % Ency of Life
metaData.links.id_Wiki = 'Alloteuthis_africana'; % Wikipedia
metaData.links.id_ADW = 'Alloteuthis_africana'; % ADW
metaData.links.id_Taxo = '242036'; % Taxonomicon
metaData.links.id_WoRMS = '225555'; % WoRMS
metaData.links.id_molluscabase = '225555'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Alloteuthis_africana}}';
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
bibkey = 'ArkhNeklu1993'; type = 'article'; bib = [ ... 
'doi = {10.1017/S0025315400034822}, ' ...
'author = {Alexander Arkhipkin and Nataly Nekludova}, ' ... 
'year = {1993}, ' ...
'title = {AGE, GROWTH AND MATURATION OF THE LOLIGINID SQUIDS \emph{\emph{Alloteuthis africana}}  AND \emph{A. subulata} ON THE {W}EST {A}FRICAN SHELF}, ' ...
'journal = {Mar. biol. Ass. U.K.}, ' ...
'volume = {73}, ' ...
'pages = {949-961}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HastPier2015'; type = 'incollection'; bib = [ ... 
'author = {Lee C. Hastie and Graham J. Pierce and Ana Moreno and Patrizia Jereb and Evgenia Lefkaditou and Daniel Oesterwind and Manuel Garcia Tasende and Uwe Piatkowski and A. Louise Allcock}, ' ... 
'year = {2015}, ' ...
'title = {\emph{Alloteuthis subulata} ({L}amarck, 1798)}, ' ...
'booktitle = {Cephalopod biology and fisheries in Europe: II. Species Accounts}, ' ...
'editor = {Patrizia Jereb and A. Louise Allcock and Evgenia Lefkaditou and Uwe Piatkowski and Lee C. Hastie and Graham J. Pierce}, ' ...
'publisher = {ICES Cooperative Research Report}, ' ...
'number = {325}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Alloteuthis-subulata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

