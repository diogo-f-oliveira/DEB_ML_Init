function [data, auxData, metaData, txtData, weights] = mydata_Leptonychotes_weddellii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Phocidae';
metaData.species    = 'Leptonychotes_weddellii'; 
metaData.species_en = 'Weddell seal'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb';  'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 12 07];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 304;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 40 ;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1365;    units.tp = 'd';    label.tp = 'time since birth at puberty (female)'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1642;    units.tpm = 'd';    label.tpm = 'time since birth at puberty (male)';bibkey.tpm  = 'AnAge';
  temp.tpm = C2K(37);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 25*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 120;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'BrydSmit1984';
  comment.Lb = 'for male, 118 cm for female';
data.Li  = 277;   units.Li  = 'cm';  label.Li  = 'total length fem.';   bibkey.Li  = 'BrydSmit1984';
  comment.Li = '110-140 cm';
data.Lim  = 263;   units.Lim  = 'cm';  label.Lim  = 'total length male';   bibkey.Lim  = 'BrydSmit1984';
   comment.Lim = '110-140 cm, males being slightly larger than females';
 
data.Wwb = 29e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BrydSmit1984';
data.Wwx = 115.9e3;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 348e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight fem.';     bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Wiki: 600 kg';
data.Wwim = 322e3;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight male';     bibkey.Wwim = 'Wiki';
  comment.Wwim = 'Wiki: 500 kg';

data.Ri  = 1/548;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter, 1 litter per 548 d';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), standard length (cm)
0       118
7/365   133
14/365  144
21/365  152
28/365  156
35/365  158
4   	239
5   	244
6   	256
7   	262
8    	256
9    	268];  
data.tL_f(:,1) = data.tL_f(:,1) * 365; % yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'standard length', 'female'};  
temp.tL_f    = C2K(37);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BrydSmit1984';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % time since birth (yr), standard length (cm)
0       120
7/365   128
14/365  134
21/365  140
28/365  145
35/365  148
1   	190
2    	213
3   	228
4   	236
5   	248
6   	248
7   	251
8   	262
9   	262];  
data.tL_m(:,1) = data.tL_m(:,1) * 365; % yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'standard length', 'male'};  
temp.tL_m    = C2K(37);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BrydSmit1984';
comment.tL_m = 'Data for males';

% time-weight
data.tWw_f = [ ... % time since birth (yr), weight (g)
0/365	 28109.871
7/365	 43768.333
14/365	 59631.749
21/365	 75891.170
28/365	 90556.650
35/365	105228.075
4       293000
5       208000
6       285000
7       265000
8       264000
9       322000];  
data.tWw_f(:,1) = data.tWw_f(:,1) * 365; % yr to d
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'weight', 'female'};  
temp.tWw_f    = C2K(37);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'BrydSmit1984';
comment.tWw_f = 'Data for females at Turtle Rock';
% 
data.tWw_m = [ ... % time since birth (yr), weight (g)
0/365	30895.802
7/365	37796.504
14/365	48884.036
21/365	60767.542
28/365	72251.080
35/365	76572.777
2       177000
3       218000
4       247000
5       251000
6       271000
7       288000
8       297000
9       294000];  
data.tWw_m(:,1) = data.tWw_m(:,1) * 365; % yr to d
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'weight', 'male'};  
temp.tWw_m    = C2K(37);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'BrydSmit1984';
comment.tWw_m = 'Data for males at Turtle Rock';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.tWw_f = 3 * weights.tWw_f;
weights.tWw_m = 3 * weights.tWw_m;
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f'; 'tL_m'}; subtitle1 = {'data for female, male'};
set2 = {'tWw_f'; 'tWw_m'}; subtitle2 = {'data for female, male at Turtle Rock'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '3TSK3'; % Cat of Life
metaData.links.id_ITIS = '933387'; % ITIS
metaData.links.id_EoL = '46559177'; % Ency of Life
metaData.links.id_Wiki = 'Leptonychotes_weddellii'; % Wikipedia
metaData.links.id_ADW = 'Leptonychotes_weddellii'; % ADW
metaData.links.id_Taxo = '107185'; % Taxonomicon
metaData.links.id_WoRMS = '195932'; % WoRMS
metaData.links.id_MSW3 = '14001044'; % MSW3
metaData.links.id_AnAge = 'Leptonychotes_weddellii'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Leptonychotes_weddellii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/Leptonychotes_weddellii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Leptonychotes_weddellii/}}';
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
bibkey = 'BrydSmit1984'; type = 'Article'; bib = [ ... 
'author = {M. M. Bryden and M. S. R. Smith and R. A. Tedman and D. W. Featherston}, ' ... 
'year = {1984}, ' ...
'title = {Growth of the Weddell Seal, \emph{Leptonychotes weddelli} ({P}innipedia)}, ' ...
 'journal = {Aust.  J. Zool.}, ' ...
'volume = {32}, ' ...
'pages = {33-41}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

