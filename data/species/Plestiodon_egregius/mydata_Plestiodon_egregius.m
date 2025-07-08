function [data, auxData, metaData, txtData, weights] = mydata_Plestiodon_egregius

%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Scincidae';
metaData.species    = 'Plestiodon_egregius';
metaData.species_en = 'Mole skink';

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iTh'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Ln'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data;
data.ab = 31;     units.ab = 'd'; label.ab = 'age at birth';               bibkey.ab = 'Moun1963';
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'for eggs laig on 13 june, 51 d for eggs laid on 4 april';
data.tp = 130;     units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'Moun1963';
  temp.tp = C2K(24);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on value for Plestiodon egregius';
data.am = 8*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'guess';
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on values for other scincidae as given in AnAge';

data.Lb  = 2.28; units.Lb  = 'cm';  label.Lb  = 'SVL at birth';  bibkey.Lb  = 'Moun1963';  
data.Lp  = 3.9;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';  bibkey.Lp  = 'Moun1963';  
  comment.Lp = '3.6-4.2 cm';
data.Lpm  = 3.6;   units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';  bibkey.Lpm  = 'Moun1963';
  comment.Lpm = '3.4-3.8 cm';
data.Li  = 6.5;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';    bibkey.Li  = 'Moun1963';
data.Lim  = 5.6; units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';    bibkey.Lim  = 'Moun1963';

data.Wwi = 5.84; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Li and LW of Oligosoma_zelandicum: (6.5/6.810)^3*6.712';

data.Ri  = 6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Moun1963';
temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6 eggs per clutch, 1 clutch per yr';

% univariate data
% time - length
data.tL_f = [ ... % time since birth (d), SVL (cm)
0.000	2.277
9.856	2.539
27.105	2.899
53.799	3.274
88.296	4.122
132.649	4.507
181.520	5.123];
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'females'};  
temp.tL_f   = C2K(24);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Moun1963'; comment.tL_f = 'Data from Highlands Co Flo';
%
data.tL_m = [ ... % time since birth (d), SVL (cm)
0.000	2.277
9.856	2.539
27.926	2.899
54.620	3.274
87.064	4.116
132.649	4.353
180.287	4.502];
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'males'};  
temp.tL_m   = C2K(24);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Moun1963'; comment.tL_m = 'Data from Highlands Co Flo';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are supposed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '782DV'; % Cat of Life
metaData.links.id_ITIS = '208885'; % ITIS
metaData.links.id_EoL = '47048074'; % Ency of Life
metaData.links.id_Wiki = 'Plestiodon_egregius'; % Wikipedia
metaData.links.id_ADW = 'Plestiodon_egregius'; % ADW
metaData.links.id_Taxo = '1685481'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Plestiodon&species=egregius'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Plestiodon_egregius}}';   
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
bibkey = 'Moun1963'; type = 'Article'; bib = [ ...
'author = {Robert H. Mount}, ' ...
'title = {The Natural History of the Red-Tailed Skink, \emph{Eumeces egregius} {B}aird}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {70(2)}, ' ...
'pages = {356-385}, ' ...
'year = {1963}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


