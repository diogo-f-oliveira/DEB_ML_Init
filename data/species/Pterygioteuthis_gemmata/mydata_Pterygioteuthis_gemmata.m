function [data, auxData, metaData, txtData, weights] = mydata_Pterygioteuthis_gemmata

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Pyroteuthidae';
metaData.species    = 'Pterygioteuthis_gemmata'; 
metaData.species_en = 'Roundear Enope Squid'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 18];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 28];

%% set data
% zero-variate data

data.am = 82;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'Arkh1997';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.2;  units.Lb  = 'cm'; label.Lb  = 'mantle length at birth';       bibkey.Lb  = 'guess';
data.Lp  = 2.2;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';       bibkey.Lp  = 'Arkh1997';
data.Lpm  = 2.1;  units.Lpm  = 'cm'; label.Lpm  = 'mantle length at puberty for males';       bibkey.Lpm  = 'Arkh1997';
data.Li  = 3.2;  units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'Arkh1997';
data.Lim  = 2.5;  units.Lim  = 'cm'; label.Lim  = 'mantle length at death for male'; bibkey.Lim  = 'Arkh1997';

data.Wwi  = 0.8;  units.Wwi  = 'g'; label.Wwi  = 'wet weight at death';       bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on size-corrected value for Cranchia_scabra: 26*(3.2/10.2)^3';
  
data.GSI  = 0.15; units.GSI  = '-';  label.GSI  = 'gonado somatic index';        bibkey.GSI  = 'guess';   
  temp.GSI = C2K(18);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
47.106	2.100
50.082	2.401
52.956	2.703
64.159	2.720
66.495	2.637
66.892	2.502
67.933	2.791
73.949	2.905
74.036	2.706
74.873	3.002
75.263	2.770
77.215	3.001];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Arkh1997';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
46.707	2.209
61.596	2.490
72.908	2.604];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Arkh1997';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 10 * weights.psd.p_M;
weights.psd.v = 3 * weights.psd.v;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4Q772'; % Cat of Life
metaData.links.id_ITIS = '556078'; % ITIS
metaData.links.id_EoL = '46986248'; % Ency of Life
metaData.links.id_Wiki = 'Pterygioteuthis_gemmata'; % Wikipedia
metaData.links.id_ADW = 'Pterygioteuthis_gemmata'; % ADW
metaData.links.id_Taxo = '158139'; % Taxonomicon
metaData.links.id_WoRMS = '342104'; % WoRMS
metaData.links.id_molluscabase = '342104'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pterygioteuthis_gemmata}}';
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
bibkey = 'Arkh1997'; type = 'article'; bib = [ ... 
'author = {Alexander Arkhipkin}, ' ... 
'year = {1997}, ' ...
'title = {Age of the micronektonic squid \emph{Pterygioteuthis gemmata} ({C}ephalopoda: {P}yroteuthidae) from the central-east {A}tlantic based on statolith growth increments}, ' ...
'journal = {J. Moll Stud.}, ' ...
'volume = {63}, ' ...
'pages = {287-290}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Pterygioteuthis-gemmata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

