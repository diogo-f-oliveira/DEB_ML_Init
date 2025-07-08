function [data, auxData, metaData, txtData, weights] = mydata_Thalassarche_cauta

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Diomedeidae';
metaData.species    = 'Thalassarche_cauta'; 
metaData.species_en = 'Shy albatross'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MIS'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCic', 'biCik', 'biCit', 'biSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.6); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2018 09 17];                          
metaData.email    = {'bas.kooijman@vu.nl'};     
metaData.address  = {'VU University Amsterdam'};

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 01];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 71;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'EoL';   
  temp.ab = C2K(35.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '68 to 75 d';
data.tx = 127;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'HeddGale1975';   
  temp.tx = C2K(39.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 127*3;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'HeddGale1975';
  temp.tR = C2K(39.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 40*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'EoL';   
  temp.am = C2K(39.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 187; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'HeddGale1975';
data.Wwi = 3663.75;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'avibase';
data.Wwim = 4306.25; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';    bibkey.Wwim = 'avibase';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'HeddGale1975';   
  temp.Ri = C2K(39.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
    0 187
11.209	1903.187
23.120	2406.290
34.580	3215.071
46.045	3862.889
58.396	4382.240
69.650	4691.956
81.123	5017.846
93.479	5376.233
104.957	5573.350
116.657	5673.966
127.919	5693.947
140.277	5971.851];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'HeddGale1975';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_1: food availability taken variable in tW data';
D2 = 'mod_1: v is reduced';
D3 = 'mod_1: Males are assumed to differ from females by {p_Am} only';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '55ZC9'; % Cat of Life
metaData.links.id_ITIS = '554451'; % ITIS
metaData.links.id_EoL = '45511274'; % Ency of Life
metaData.links.id_Wiki = 'Thalassarche_cauta'; % Wikipedia
metaData.links.id_ADW = 'Thalassarche_cauta'; % ADW
metaData.links.id_Taxo = '101910'; % Taxonomicon
metaData.links.id_WoRMS = '225902'; % WoRMS
metaData.links.id_avibase = '3B6E922E40E7D3A4'; % avibase
metaData.links.id_birdlife = 'shy-albatross-thalassarche-cauta'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Thalassarche_cauta}}';
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
bibkey = 'HeddGale1975'; type = 'Article'; bib = [ ... 
'author = {A. Hedd and R. Gales and N. Brother}, ' ... 
'year = {1975}, ' ...
'title = {PROVISIONING AND GROWTH RATES OF SHY ALBATROSSES AT {A}LBATROSS {I}SLAND, {T}ASMANIA}, ' ...
'journal = {The Condor}, ' ...
'volume = {104}, ' ...
'pages = {12-29}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1178554/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=87797B4724F5DC9E&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

