function [data, auxData, metaData, txtData, weights] = mydata_Lagopus_lagopus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Phasianidae';
metaData.species    = 'Lagopus_lagopus'; 
metaData.species_en = 'Willow ptarmigan'; 

metaData.ecoCode.climate = {'Df', 'Dw'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2018 11 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 21];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 21];

%% set data
% zero-variate data

data.ab = 21;        units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(34);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 12;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'AnAge';   
  temp.tx = metaData.T_typical; units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 36;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = metaData.T_typical; units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '';
data.tR = 365;         units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = metaData.T_typical; units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 9*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = metaData.T_typical; units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Seems VERY short for ageing';
  
data.Wwb = 8.8;         units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ParkRobe2001';
data.Wwi = 596;        units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: 430 to 810 g';

data.Ri  = 6/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = metaData.T_typical; units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0       8.8
1.011	8.895
2.021	7.127
2.954	8.992
3.887	11.912
4.936	11.549
5.928	15.054
6.919	18.793
7.910	23.002
8.862	26.156
9.951	35.519];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = metaData.T_typical;  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'ParkRobe2001';

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
D1 = 'Feeding is reduced directly after hatch';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '3RXR6'; % Cat of Life
metaData.links.id_ITIS = '175376'; % ITIS
metaData.links.id_EoL = '45510637'; % Ency of Life
metaData.links.id_Wiki = 'Lagopus_lagopus'; % Wikipedia
metaData.links.id_ADW = 'Lagopus_lagopus'; % ADW
metaData.links.id_Taxo = '52946'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '6CCEAF5D74B10547'; % avibase
metaData.links.id_birdlife = 'willow-grouse-lagopus-lagopus'; % birdlife
metaData.links.id_AnAge = 'Lagopus_lagopus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tetrastes_bonasia}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Tetrastes_bonasia}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ParkRobe2001'; type = 'Article'; bib = [ ...  
'title = {The role of invertebrates in the diet, growth and survival of red grouse (\emph{Lagopus lagopus scoticus}) chicks}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'year = {2001}, ' ...
'author = {K. J. Park and P. A. Robertson and S. T. Campbell and R. Foster and Z. M. Russell and D. Newborn and P. J. Hudson}, ' ...
'volume = {254}, ' ...
'pages = {137-145}'];
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

