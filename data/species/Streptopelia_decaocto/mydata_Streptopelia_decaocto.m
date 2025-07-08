function [data, auxData, metaData, txtData, weights] = mydata_Streptopelia_decaocto

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Columbiformes'; 
metaData.family     = 'Columbidae';
metaData.species    = 'Streptopelia_decaocto'; 
metaData.species_en = 'Eurasian collared dove'; 

metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'THp', 'TPi'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.63); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 18];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 24];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 24];

%% set data
% zero-variate data

data.ab = 15;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(37.85); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 20;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Robe1988';   
  temp.tx = C2K(40.63); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 60;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.63); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(40.63); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 17.9*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.63); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 7;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Robe1988';
data.Wwi = 157.4;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: 125 to 240 g';

data.Ri  = 4.5*2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.63); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs/clutch, 4.5 clutches per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
     1 9.1
     2 14.2
     3 21.7
     4 30.1
     5 41.1
     6 51.0
     7 63.4
     8 74.5
     9 86.5
    10 95.0
    11 102.2
    12 106.0
    13 111.4
    14 114.1
    15 118.9
    16 118.5
    17 119.3
    18 121.3
    19 129.6
    20 133.8];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.63);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Robe1988';

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
D1 = 'Body temperature is guessed';
D2 = 'mod_1: v is reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '6ZXPP'; % Cat of Life
metaData.links.id_ITIS = '177139'; % ITIS
metaData.links.id_EoL = '45509392'; % Ency of Life
metaData.links.id_Wiki = 'Streptopelia_decaocto'; % Wikipedia
metaData.links.id_ADW = 'Streptopelia_decaocto'; % ADW
metaData.links.id_Taxo = '54033'; % Taxonomicon
metaData.links.id_WoRMS = '558586'; % WoRMS
metaData.links.id_avibase = '41FACE6330A2F073'; % avibase
metaData.links.id_birdlife = 'eurasian-collared-dove-streptopelia-decaocto'; % birdlife
metaData.links.id_AnAge = 'Streptopelia_decaocto'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Streptopelia_decaocto}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Streptopelia_decaocto}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Robe1988'; type = 'article'; bib = [ ...  
'doi = {10.1111/j.1474-919X.1988.tb00976.x}, ' ...
'title = {Interspecific variation in growth of {B}ritish pigeons {C}olumbidae}, ' ...
'journal = {Ibis}, ' ...
'year = {1988}, ' ...
'author = {H. A. Robertson}, ' ...
'volume = {130}, ' ...
'pages = {261--267}'];
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

