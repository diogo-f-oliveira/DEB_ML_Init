function [data, auxData, metaData, txtData, weights] = mydata_Artemia_monica
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Artemiidae';
metaData.species    = 'Artemia_monica'; 
metaData.species_en = 'Brine shrimp'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iSl'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Wwb'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'tWd'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 24]; 

%% set data
% zero-variate data

data.tp = 7;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'EvjeOlse1999';
  temp.tp = C2K(27);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 90;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wdb  = 2.3e-6; units.Wdb  = 'g';  label.Wdb  = 'dry weight at birth';   bibkey.Wdb  = 'EvjeOlse1999';
data.Wdi  = 1.273e-3;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'OgatWurt2017';
data.Wdim = 0.547e-3;  units.Wdim  = 'g';  label.Wdim  = 'ultimate dry weight for males';   bibkey.Wdim  = 'OgatWurt2017';

data.Ri  = 186/7;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'OgatWurt2017';   
  temp.Ri = C2K(21);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '186 eggs per brood, probably 7 d per brood;  CastCast2023 give 16.5 eggs/d, but no temperature';
 
% uni-variate data

% time-dry weight
data.tWd = [ ... % time since birth (d), dry weight (mug)
 0	  2.334   2.278   2.297  2.334  2.315
 1	  2.189   2.103   2.054  1.957  1.989
 2	  2.448   2.371   2.315  2.172  2.070
 3	  3.740   3.565   3.509  3.063  2.738
 4	  5.995   6.091   5.150  4.389  3.987
 5	 16.286  15.773  12.213  6.091  5.900
 6	 47.924  51.090  32.650 12.115  7.931
 7	134.423 151.550  54.464 24.879  9.841
 8	195.734 182.145  76.198 35.652 13.019
 9	180.694 194.176  94.557 49.088 18.214
10	182.145 205.353 107.461 65.459 23.152
11	194.176 215.443 135.502 75.591 27.166
12	213.728 200.486 134.423 89.411 29.193];
units.tWd = {'d', 'mug'}; label.tWd = {'time since birth', 'dry weight'};  
temp.tWd = C2K(27); units.temp.tWd = 'K'; label.temp.tL = 'temperature';
bibkey.tWd = 'EvjeOlse1999'; treat.tWd = {1, {'20 mg C/l','10 mg C/l','7 mg C/l','5 mg C/l','3 mg C/l'}};
label.treat.tWd = 'food density'; 
comment.tWd = '1 mg C/l corresponds to 130e6 cells Isochrysis galbana/l; 34 ppt salinity';

%% set weights for all real data
weights = setweights(data, []);
weights.Wdb = 5 * weights.Wdb;
weights.Ri = 5 * weights.Ri;
weights.Wdi = 5 * weights.Wdi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';   
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Starts to ingest food at Instar II stage (metanauplius I) ';
metaData.bibkey.F1 = 'EvjeOlse1999'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'GVW7'; % Cat of Life
metaData.links.id_ITIS = '1123775'; % ITIS
metaData.links.id_EoL = '1042413'; % Ency of Life
metaData.links.id_Wiki = 'Artemia_monica'; % Wikipedia
metaData.links.id_ADW = 'Artemia_monica'; % ADW
metaData.links.id_Taxo = '743095'; % Taxonomicon
metaData.links.id_WoRMS = '740630'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Artemia_monica}}';
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
bibkey = 'EvjeOlse1999'; type = 'Article'; bib = [ ... 
'doi = {10.1016/s0022-0981(99)00104-5}, ' ...
'author = {Jan Ove Evjemo and Yngvar Olsen}, ' ... 
'year = {1999}, ' ...
'title = {Effect of food concentration on the growth and production rate of \emph{Artemia franciscana} feeding on algae (\emph{T. iso})}, ' ...
'journal = {J. Exp. Mar. Biol. Ecol.}, ' ...
'volume = {242(2)}, ' ...
'pages = {273–296}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CastCast2023'; type = 'Article'; bib = [ ... 
'doi = {10.22271/fish.2023.v11.i5c.2863}, ' ...
'author = {Castro, M. J. and Castro, M. G. and Flores, G. A. F. and Tinoco, L. P. I, and Salvat, N. K. A.}, ' ... 
'year = {2023}, ' ...
'title = {The reproductive potential of \emph{Artemia franciscana} fed with different concentrations mixed diet with \emph{Porphyridium cruentum} and \emph{Pinnularia sp.} in laboratory}, ' ...
'journal = {International Journal of Fisheries and Aquatic Studies}, ' ...
'volume = {11(5)}, ' ...
'pages = {197-202}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OgatWurt2017'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10750-016-2881-9}, ' ...
'author = {Ogata, Elizabeth M. and Wurtsbaugh, Wayne A. and Smith, Trinity N. and Durham, Susan L.}, ' ... 
'year = {2017}, ' ...
'title = {Bioassay analysis of nutrient and \emph{Artemia franciscana} effects on trophic interactions in the {G}reat {S}alt {L}ake, {USA}}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {788(1)}, ' ...
'pages = {1–16}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

