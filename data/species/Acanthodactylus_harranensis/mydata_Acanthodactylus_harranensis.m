function [data, auxData, metaData, txtData, weights] = mydata_Acanthodactylus_harranensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Acanthodactylus_harranensis'; 
metaData.species_en = 'Harran fringe-toed lizard'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTd', '0iTa'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCvr', 'biCvm', 'biSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O', 'Apa'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Eei'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 05];

%% set data
% zero-variate data

data.ab = 129;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(15);    units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'BeseIlga2019';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.9;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth'; bibkey.Lb  = 'guess'; 
  comment.Lb = 'based on Acanthodactylus_erythrurus';
data.Lp  = 5.5;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'guess'; 
data.Li  = 8.98;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'BeseIlga2019';
data.Lim  = 8.87;   units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'BeseIlga2019';

data.Wwi = 8.7;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Lacerta_agilis:  12*(8.98/10)^3';
data.Wwim = 8.4;    units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'guess';
  comment.Wwim = 'based on Lacerta_agilis: 12*(8.87/10)^3';
 
data.Ri  = 2*5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(15);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-7 eggs per clutch, 2 clutches per yr';

% uni-variate data
% time-length
data.tL_fm = [ ... % LAG (#), SVL (cm): females, males
6	7.148 NaN
6	7.249 NaN
7	6.896 7.404
7	7.377 NaN
7	7.624 NaN
8	7.029 7.655
8	7.918 7.893
8	8.247 7.904
8	8.270 8.452
8	7.885 NaN
9	8.985 8.213
9   NaN   8.790
9   NaN   8.320
10  NaN   8.861];
data.tL_fm(:,1) = (data.tL_fm(:,1)+0.0) * 365; % convert LAG to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'age', 'SVL'};  
temp.tL_fm   = C2K(15);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'BeseIlga2019'; treat.tL_fm = {1, {'females','males'}};
comment.tL_fm = 'data for females, males from Harran Plain in southeastern Anatolia';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Li = 3 * weights.Li;
weights.Lp = 3 * weights.Lp;

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
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '8VSM'; % Cat of Life
metaData.links.id_ITIS = '1155471'; % ITIS
metaData.links.id_EoL = '8829097'; % Ency of Life
metaData.links.id_Wiki = 'Acanthodactylus_harranensis'; % Wikipedia
metaData.links.id_ADW = 'Acanthodactylus_harranensis'; % ADW
metaData.links.id_Taxo = '1685244'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Acanthodactylus&species=harranensis'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthodactylus_harranensis}}';
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
bibkey = 'BeseIlga2019'; type = 'Article'; bib = [ ... 
'doi = {10.3906/zoo-1307-1}, ' ...
'author = {Nurettin Be\c{s}er and \c{C}etin Ilgaz and Yusuf Kumluta\c{s} and Aziz Avc\i and Kamil Candan and Nazan \"{U}z\"{u}m}, ' ... 
'year = {2019}, ' ...
'title = {Age structure and body size of a critically endangered species, \emph{Acanthodactylus harranensis} ({S}quamata: {L}acertidae) and its demography}, ' ...
'journal = {Animal Biology}, ' ...
'volume = {69}, ' ...
'pages = {421–431}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

