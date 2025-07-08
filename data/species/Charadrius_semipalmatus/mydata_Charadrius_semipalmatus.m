function [data, auxData, metaData, txtData, weights] = mydata_Charadrius_semipalmatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Charadriidae';
metaData.species    = 'Charadrius_semipalmatus'; 
metaData.species_en = 'Semipalmated plover'; 

metaData.ecoCode.climate = {'Dfc', 'ET'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iTh', '0iFm'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 28];

%% set data
% zero-variate data

data.ab = 24;      units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'avibase';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '23 to 26 d';
data.tx = 25;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40.9); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '22-31';
data.tp = 75;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '22-31';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'avibase';
  temp.tR = C2K(40.9); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 20.8*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'avibase';   
  temp.am = C2K(40.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 10.15;    units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 6.51;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'avibase';
data.Wwi = 47.8;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'avibase';
data.Wwim = 46.1; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight of male'; bibkey.Wwim = 'avibase';
  
data.Ri  = 1.5*4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-4 eggs per clutch, 1.5 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
 0.000	 7.083
 0.001	 6.012
 0.002	 5.238
 0.003	 8.988
 0.004	 7.976
 0.005	 4.107
 1.000	 7.024
 1.001	 8.214
 1.002	 5.952
 1.003	 9.167
 1.004	 5.000
 2.000	 7.202
 2.001	 3.988
 3.000	 9.107
 3.001	 7.202
 3.002	 6.131
 4.000	 8.095
 4.001	10.060
 4.002	 9.107
 5.000	15.000
 5.001	12.024
 6.000	15.000
 6.001	 9.107
 7.000	15.000
 7.001	26.964
 7.002	12.024
 7.003	18.036
 8.000	15.060
 9.000	33.988
 9.001	33.095
 9.002	20.060
12.000	29.048
12.001	26.012
12.002	23.869
13.000	26.845];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'CorkNol2019';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
 
%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'scaled functional response turned out to vary, which has been implemented';
D2 = 'Males are assumed to differ from females by {p_Am} only';     
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = 'TMXL'; % Cat of Life
metaData.links.id_ITIS = '176506'; % ITIS
metaData.links.id_EoL = '45509156'; % Ency of Life
metaData.links.id_Wiki = 'Charadrius_semipalmatus'; % Wikipedia
metaData.links.id_ADW = 'Charadrius_semipalmatus'; % ADW
metaData.links.id_Taxo = '53606'; % Taxonomicon
metaData.links.id_WoRMS = '159126'; % WoRMS
metaData.links.id_avibase = '95E28A57CB50B0D7'; % avibase
metaData.links.id_birdlife = 'semipalmated-plover-charadrius-semipalmatus'; % birdlife
metaData.links.id_AnAge = 'Charadrius_semipalmatus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Charadrius_semipalmatus}}';
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
bibkey = 'CorkNol2019'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00300-019-02456-w}, ' ...
'author = {Corkery, C. A. and Nol, E. and Mckinnon, L.}, ' ... 
'year = {2019}, ' ...
'title = {No effects of asynchrony between hatching and peak food availability on chick growth in Semipalmated Plovers (\emph{Charadrius semipalmatus}) near {C}hurchill, {M}anitoa}, ' ...
'journal = {Polar Biology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=95E28A57CB50B0D7&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Charadrius_semipalmatus}}';
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

