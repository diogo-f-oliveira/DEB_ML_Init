function [data, auxData, metaData, txtData, weights] = mydata_Columbina_talpacoti

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Columbiformes'; 
metaData.family     = 'Columbidae';
metaData.species    = 'Columbina_talpacoti'; 
metaData.species_en = 'Ruddy ground dove'; 

metaData.ecoCode.climate = {'A', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs', 'bxCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.63); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 25];

%% set data
% zero-variate data

data.ab = 12.5;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 9.5;     units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Have1953';   
  temp.tx = C2K(40.63);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'avibase gives 115 d';
data.tp = 28.5;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.63);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'avibase gives 115 d';
  comment.tp = '';
data.tR = 140;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(40.63);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 12775;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(40.63);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 3.6;    units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 3.5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Have1953';
data.Wwi = 36.3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';

data.Ri  = 2*2.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'avibase';   
temp.Ri = C2K(40.63);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch, 2.5 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (d), weight(g)
    0  4  3.0  4.0  3.5  4.0
    1  6  3.6  4.9  4.7  5.0
    2  9  6.5  8.0  6.9  7.3
    3 14  9.2 10.4 11.0 11.8
    4 19 12.4 12.7 12.1 13.5
    5 21 14.9 15.5 16.6 16.9
    6 23 17.3 20.0 20.5 20.0
    7 27 19.9 21.2 22.5 24.6
    8 27 21.5 22.5 27.2 24.5
    9 27 23.5 24.5 26.8 25.6
   10 NaN NaN NaN  26.5 NaN];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.63);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Have1953'; treat.tW = {1, {'ind 1/1', '2/2', '3/2', '4/2', '5/2'}};
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.Ww0 = 0 * weights.Ww0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = 'XCB3'; % Cat of Life
metaData.links.id_ITIS = '177156'; % ITIS
metaData.links.id_EoL = '45509411'; % Ency of Life
metaData.links.id_Wiki = 'Columbina_talpacoti'; % Wikipedia
metaData.links.id_ADW = 'Columbina_talpacoti'; % ADW
metaData.links.id_Taxo = '53989'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'ADD11A5FC7F58167'; % avibase
metaData.links.id_birdlife = 'ruddy-ground-dove-columbina-talpacoti'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Columbina_talpacoti}}';
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
bibkey = 'Have1953'; type = 'Article'; bib = [ ... 
'author = {Fr. Haverschidt}, ' ... 
'year = {1953}, ' ...
'title = {NOTES ON THE LIFE HISTORY OF \emph{Columbigallina talpacoti} IN {S}URINAM}, ' ...
'journal = {the Condor}, ' ...
'volume = {55}, ' ...
'pages = {21-25}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=ADD11A5FC7F58167&sec=lifehistory}}';
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

