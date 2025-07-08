function [data, auxData, metaData, txtData, weights] = mydata_Crex_crex

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Gruiformes'; 
metaData.family     = 'Rallidae';
metaData.species    = 'Crex_crex'; 
metaData.species_en = 'Corn crake'; 

metaData.ecoCode.climate = {'BWk', 'BSk', 'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author         = {'Bas Kooijman'};    
metaData.date_subm      = [2018 10 05];              
metaData.email          = {'bas.kooijman@vu.nl'};            
metaData.address        = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 25];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 25];

%% set data
% zero-variate data

data.ab = 19.5;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(35);    units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temps from DawsWhit1999';
data.tx = 36;     units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(39.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '34 to 38 d';
data.tp = 108;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'Wiki';
  temp.tR = C2K(39.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 15*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(39.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Wiki: 5 to 7 yrs in the wild';

data.Wwb = 9.7;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'TyleGree2004';
data.Wwi = 145;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'Wiki';
data.Wwim = 165;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'Wiki';

data.Ri  = 10/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '8 to 12 eggs per clutch, 1 or 2 clutches per yr';
 
% uni-variate data
% time-weight
data.tW = [ ...
0.003	9.706
1.974	11.471
2.985	14.412
5.969	26.471
9.008	52.353
9.008	53.529
9.052	34.706
9.053	36.471
9.054	39.118
9.056	45.882
10.015	45.588
10.016	47.941
10.017	51.176
10.018	54.118
11.079	55.294
11.936	49.706
11.940	61.471
14.113	64.412
17.046	76.471
17.958	85.882
20.893	103.529
21.947	82.353
22.061	121.176
23.927	113.529
31.107	137.647];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'TyleGree2004';
comment.tW = 'In view of Wwi, this is probably a male';
  
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
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: v is reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = 'ZFFP'; % Cat of Life
metaData.links.id_ITIS = '176277'; % ITIS
metaData.links.id_EoL = '45509103'; % Ency of Life
metaData.links.id_Wiki = 'Crex_crex'; % Wikipedia
metaData.links.id_ADW = 'Crex_crex'; % ADW
metaData.links.id_Taxo = '53351'; % Taxonomicon
metaData.links.id_WoRMS = '416690'; % WoRMS
metaData.links.id_avibase = '7E2572426E200D08'; % avibase
metaData.links.id_birdlife = 'corncrake-crex-crex'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Crex_crex}}';
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
bibkey = 'TyleGree2004'; type = 'Article'; bib = [ ... 
'author = {G. A. Tyler and R. E. Green}, ' ... 
'year = {2004}, ' ...
'title = {Effects of weather on the survival and growth of Corncrake \emph{Crex crex} chicks}, ' ...
'journal = {Ibis}, ' ...
'volume = {146}, ' ...
'pages = {69--76}'];
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

