function [data, auxData, metaData, txtData, weights] = mydata_Antigone_antigone

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Gruiformes'; 
metaData.family     = 'Gruidae';
metaData.species    = 'Antigone_antigone'; 
metaData.species_en = 'Sarus crane'; 

metaData.ecoCode.climate = {'Aw', 'BSh'};
metaData.ecoCode.ecozone = {'TPi', 'TA'};
metaData.ecoCode.habitat = {'0iTg', 'xiFm'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 01 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 05];              
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

data.ab = 31.8;    units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'RickBrun1986';   
  temp.ab = C2K(36.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 109;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'wildpro';   
  temp.tx = C2K(40.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 109*3;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.tR = 2.5*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'Wiki';
  temp.tR = C2K(40.4);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 41.8*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(40.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 138.5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'avibase';
data.Wwi = 8786; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
data.Wwim = 8786;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'avibase';
  
data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'wildpro';   
  temp.Ri = C2K(40.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ...
 1  125
 2  119
 3  122
 4  128
 5  132
 6  146
 7  166
 8  180
10  217
15  357
20  541
25  780
30 1081];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(40.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'RickBrun1986';

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

%% Discussion points
D1 = 'mod_1: food availability taken variable in tW data';
D2 = 'mod_1: males are assumed to differ from females by {p_Am} only ';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Parameter t_R is added, replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '3HFDC'; % Cat of Life
metaData.links.id_ITIS = '708142'; % ITIS
metaData.links.id_EoL = '47364073'; % Ency of Life
metaData.links.id_Wiki = 'Grus_antigone'; % Wikipedia
metaData.links.id_ADW = 'Grus_antigone'; % ADW
metaData.links.id_Taxo = '2711414'; % Taxonomicon
metaData.links.id_WoRMS = '1459975'; % WoRMS
metaData.links.id_avibase = '8D891DB7520688E0'; % Avibase
metaData.links.id_birdlife = 'sarus-crane-antigone-antigone'; % Birdlife
metaData.links.id_AnAge = 'Grus_antigone'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Grus_antigone}}';
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
bibkey = 'RickBrun1986'; type = 'Article'; bib = [ ... 
'author = {R. E. Ricklefs and D. F. Bruning and G. W. Archibald}, ' ... 
'year = {1986}, ' ...
'title = {Growth rates of cranes reared in captivity}, ' ...
'journal = {The Auk}, ' ...
'volume = {103}, ' ...
'pages = {125--134}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Grus_antigone}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=8D891DB7520688E0}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'wildpro'; type = 'Misc'; bib = ...
'howpublished = {\url{http://wildpro.twycrosszoo.org/S/0AvGruif/gruidae/grus/Grus_antigone/Grus_antigone.htm}}';
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

