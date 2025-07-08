function [data, auxData, metaData, txtData, weights] = mydata_Lissotriton_boscai

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Lissotriton_boscai'; 
metaData.species_en = 'Bosca''s newt'; 

metaData.ecoCode.climate = {'Cs'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTg'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_Tf'}; 

metaData.COMPLETE = 1.9; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 22];

%% set data
% zero-variate data;
data.ab = 25;      units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';    
  temp.ab = C2K(12); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 365;     units.tj = 'd';    label.tj = 'time since birth at metam';   bibkey.tj = 'guess';
  temp.tj = C2K(12); units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 3*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'amphibiaweb';
  temp.tp = C2K(12);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 8*365;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lj = 1.65;     units.Lj  = 'cm'; label.Lj  = 'SVL at metem';    bibkey.Lj = 'amphibiaweb';
  temp.Lj = C2K(12);  units.temp.Lj = 'K'; label.temp.Lj = 'temperature';
  comment.Lj = 'TL 4.5 cm before, 3-3.5 cm after metam., converted to SVL using F1';
data.Lp  = 3.1;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'guess';
data.Li = 4.7;   units.Li  = 'cm';label.Li  = 'ultimate SVL';    bibkey.Li = 'amphibiaweb';
  temp.Li = C2K(12); units.temp.Li = 'K'; label.temp.Li = 'temperature';
  comment.Li = 'TL = 9.4 cm, converted to SVL using F1';
data.Lim = 3.7;   units.Lim  = 'cm';label.Lim  = 'ultimate SVL for males';    bibkey.Lim = 'amphibiaweb';
  temp.Lim = C2K(12); units.temp.Lim = 'K'; label.temp.Lim = 'temperature';
  comment.Lim = 'TL = 7.5 cm, converted to SVL using F1';

data.Wwb = 4.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'estimated from egg diameter of 2 mm: pi/6*0.2^3'; 
data.Wwp = 0.385;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'guess';
  comment.Wwp = 'estimated from 2.75 * (5.4/10.4)^3';
data.Wwi = 2.75;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'wildpro';
  comment.Wwi = 'for female';

data.Ri  = 170/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '100-240 eggs per season';
 
% univariate data
% time-length
data.tL_NAfm = [ ... % time  since birth (d), SVL (cm): female, male
0	1.493 1.500
1	2.002 1.806
2	2.601 2.092
3	3.765 3.221
4	3.730 3.283
5	3.959 3.262
6	3.924 3.198
7	4.516 3.539];
data.tL_NAfm(:,1) = (data.tL_NAfm(:,1)+0.9) * 365; % convert yr to d
units.tL_NAfm   = {'d', 'cm'};  label.tL_NAfm = {'time since birth', 'SVL'}; 
treat.tL_NAfm = {1,{'female', 'male'}};  label.treat.tL_NAfm = 'gender';
temp.tL_NAfm = C2K(12); units.temp.tL_NAfm = 'K'; label.temp.tL_NAfm = 'temperature';
bibkey.tL_NAfm = 'CaetLecl1999'; comment.tL_NAfm = 'Data for North Altitude Peneda Geres National Park, Portugal';
%
data.tL_NPfm = [ ... % time  since birth (d), SVL (cm): female, male
0	1.443 1.506
1	1.994 2.000
2	2.656 2.398
3	3.604 3.102
4	3.757 3.268
5	3.798 3.316
6	3.909 3.351
7	4.020 3.441];
data.tL_NPfm(:,1) = (data.tL_NPfm(:,1)+0.9) * 365; % convert yr to d
units.tL_NPfm   = {'d', 'cm'};  label.tL_NPfm = {'time since birth', 'SVL'}; 
treat.tL_NPfm = {1,{'female', 'male'}};  label.treat.tL_NPfm = 'gender';
temp.tL_NPfm = C2K(12); units.temp.tL_NPfm = 'K'; label.temp.tL_NPfm = 'temperature';
bibkey.tL_NPfm = 'CaetLecl1999'; comment.tL_NPfm = 'Data for North Plaine Peneda Geres National Park, Portugal';
%
data.tL_Cfm = [ ... % time  since birth (d), SVL (cm): female, male
0	1.626 1.430
1	2.240 2.240
2	2.756 2.533
3	3.600 3.119
4	3.628 3.084
5	3.670 3.133
6	3.823 3.153
7	3.907 3.112
8	3.956 3.460];
data.tL_Cfm(:,1) = (data.tL_Cfm(:,1)+0.9) * 365; % convert yr to d
units.tL_Cfm   = {'d', 'cm'};  label.tL_Cfm = {'time since birth', 'SVL'}; 
treat.tL_Cfm = {1,{'female', 'male'}};  label.treat.tL_Cfm = 'gender';
temp.tL_Cfm = C2K(12); units.temp.tL_Cfm = 'K'; label.temp.tL_Cfm = 'temperature';
bibkey.tL_Cfm = 'CaetLecl1999'; comment.tL_Cfm = 'Data for Portalegre (Serra de Sao Mamed), Portugsl';

%% set weights for all real data
weights = setweights(data, []);
weights.Lj = 3 * weights.Lj;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'TL = 2 * SVL';
metaData.bibkey.F1 = 'amphibiaweb'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3VGGW'; % Cat of Life
metaData.links.id_ITIS = '775918'; % ITIS
metaData.links.id_EoL = '332576'; % Ency of Life
metaData.links.id_Wiki = 'Lissotriton_boscai'; % Wikipedia
metaData.links.id_ADW = 'Lissotriton_boscai'; % ADW
metaData.links.id_Taxo = '985974'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Lissotriton+boscai'; % AmphibiaWeb
metaData.links.id_AnAge = 'Lissotriton_boscai'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lissotriton_boscai}}';   
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
bibkey = 'CaetLecl1999'; type = 'Article'; bib = [ ... 
'author = {Maria Helena Caetano and Raymond Leclair}, ' ... 
'year = {1999}, ' ...
'title = {Comparative Phenology and Demography of \emph{Triturus boscai} from {P}ortugal}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {33(2)}, ' ...
'pages = {192-202}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Lissotriton+boscai}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  