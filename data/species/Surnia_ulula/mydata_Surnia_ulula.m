function [data, auxData, metaData, txtData, weights] = mydata_Surnia_ulula
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Strigiformes'; 
metaData.family     = 'Strigidae';
metaData.species    = 'Surnia_ulula'; 
metaData.species_en = 'Northern hawk-owl'; 

metaData.ecoCode.climate = {'Dfc','Dfd'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTh', '0iTi', '0iTf'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.2); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'Ww-Ww'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 04];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 04];

%% set data
% zero-variate data

data.ab = 27.5;        units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'avibase';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '25-30 d';
data.tx = 30;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40.2); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '25-25 d';
data.tp = 90;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '25-25 d';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';bibkey.tR = 'avibase';
  temp.tR = C2K(40.2); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 16*365;    units.am = 'd';    label.am = 'life span';                    bibkey.am = 'avibase';   
  temp.am = C2K(40.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Ww0 = 21.8;  units.Ww0 = 'g';   label.Ww0 = 'initial weight';           bibkey.Ww0 = 'avibase';
data.Wwb = 18;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'avibase';
data.Wwi = 332;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'avibase';
data.Wwim = 291.5;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'avibase';

data.Ri  = 7/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-9 eggs per clutch, 1 clutch per yr'; 
  
% uni-variate data
% weight-weight
data.WW = [ ... % initial weight (g), weight after 10 d(g)
      18 108
      59 180 
      72 186
      90 206
     114 214
     135 228];  
units.WW   = {'g', 'g'};  label.WW = {'initial weight', 'weight after 10 d'};  
temp.WW    = C2K(40.2);  units.temp.WW = 'K'; label.temp.WW = 'temperature';
bibkey.WW = 'DuncDunc2020'; 

%% set weights for all real data
weights = setweights(data, []);
weights.WW = weights.WW * 2;

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
D2 = 'Body temperature is guessed';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '53HF9'; % Cat of Life
metaData.links.id_ITIS = '177898'; % ITIS
metaData.links.id_EoL = '45510737'; % Ency of Life
metaData.links.id_Wiki = 'Surnia_ulula'; % Wikipedia
metaData.links.id_ADW = 'Surnia_ulula'; % ADW
metaData.links.id_Taxo = '54752'; % Taxonomicon
metaData.links.id_WoRMS = '1484602'; % WoRMS
metaData.links.id_avibase = 'C2018A5DD8CDB5F5'; % avibase
metaData.links.id_birdlife = 'northern-hawk-owl-surnia-ulula'; % birdlife
metaData.links.id_AnAge = 'Surnia_ulula'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Surnia_ulula}}';
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
bibkey = 'DuncDunc2020'; type = 'Misc'; bib = [ ... 
'doi = {10.2173/bow.nohowl.01}, ' ...
'author = {Duncan, J. R. and P. A. Duncan}, ' ... 
'year = {2020}, ' ...
'title = {Northern Hawk Owl (\emph{Surnia ulula}), version 1.0. In Birds of the World (S. M. Billerman, Editor). Cornell Lab of Ornithology, Ithaca, NY, USA}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=89F8B6F5598E0C65&sec=lifehistory}}';
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

