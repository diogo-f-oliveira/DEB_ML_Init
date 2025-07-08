function [data, auxData, metaData, txtData, weights] = mydata_Certhilauda_chuana
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Alaudidae';
metaData.species    = 'Certhilauda_chuana'; 
metaData.species_en = 'Short-clawed lark'; 

metaData.ecoCode.climate = {'BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTs', '0iTg'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'xiHs', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 09 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 08];

%% set data
% zero-variate data

data.ab = 15;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Enge2005';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '14-16 d';
data.tx = 49;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Enge2005';   
  temp.tx = C2K(41.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '6-8 wk';
data.tp = 147;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '6-8 wk';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 3.98;      units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Enge2005';
data.Wwi = 30.4;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'Enge2005';
data.Wwim = 38.1;     units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'Enge2005';

data.Ri  = 2.72/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Enge2005';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.75 eggs per clutch (western pop, 2.27 in eastern pop, 1 clutch per yr (western pop, upto 5 clutches in eastern pop)';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1	3.967
3	7.681
5	13.643
7	17.083
9	21.235];
data.tW(:,1) = data.tW(:,1) - 1; % set origin at hatch
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Enge2005';


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
D1 = 'body temperature is guessed';
D2 = 'males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '69MX2'; % Cat of Life
metaData.links.id_ITIS = '559147'; % ITIS
metaData.links.id_EoL = '45515296'; % Ency of Life
metaData.links.id_Wiki = 'Certhilauda_chuana'; % Wikipedia
metaData.links.id_ADW = 'Certhilauda_chuana'; % ADW
metaData.links.id_Taxo = '80785'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '3244C2049F4C836E'; % avibase
metaData.links.id_birdlife = 'short-clawed-lark-certhilauda-chuana'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Certhilauda_chuana}}';
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
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=3244C2049F4C836E&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Enge2005'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00306525.1988.9633924}, ' ...
'author = {Derek Engelbrech}, ' ... 
'year = {2005}, ' ...
'title = {Breeding biology of the eastern population of the Short-clawed Lark in {S}outh {A}frica}, ' ...
'journal = {Ostrich}, ' ...
'volume = {76(3/4): 1}, ' ...
'pages = {54–161}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

