function [data, auxData, metaData, txtData, weights] = mydata_Argonauta_argo
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Argonautidae';
metaData.species    = 'Argonauta_argo'; 
metaData.species_en = 'Greater argonaut'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 04 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 04 07]; 

%% set data
% zero-variate data

data.am = 5*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'octolab gives 1 yr';
  
data.Lp  = 2.9;      units.Lp  = 'cm';  label.Lp  = 'mantle length at puberty';  bibkey.Lp  = 'LaptSalm2003';
  comment.Lp = 'based on size for Ni';
data.Lpm  = 0.8;      units.Lpm  = 'cm';  label.Lpm  = 'mantle length at puberty for males';  bibkey.Lpm  = 'Wiki';
data.Li  = 10;      units.Li  = 'cm';  label.Li  = 'ultimate mantle length';  bibkey.Li  = 'LaptSalm2003';
data.Lim  = 2.0;      units.Lim  = 'cm';  label.Lim  = 'ultimate mantle length for males';  bibkey.Lim  = 'Wiki';

data.Wwb = 9e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'LaptSalm2003';
data.Wwi = 501;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'LaptSalm2003';
  comment.Wwi = 'based on lenth-weight of individuals of Ni: (10/3.2)^3*16.7';
 
data.Ni = 77300; units.Ni = '#';  label.Ni = 'fecundity at ML 32 mm BW 16.7 g';  bibkey.Ni = 'LaptSalm2003';
  temp.Ni = C2K(21);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'the assumed accumulation time is 80 d';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only, while E_Hj is assumed to equal E_Hp';
D2 = 'Information about rates or times is hard to find';
D3 = 'Litter interval is assumed to be 40 d';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'iteroparous, but males die after loss of their hectocatylus at first copulation; females secretes a calcite shell, startin g at ML 6.5-7.0 mm) with their first dorsal armes to brood eggs in surface waters';
metaData.bibkey.F1 = {'thecephalopodpage','Wiki'}; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '67R4L'; % Cat of Life
metaData.links.id_ITIS = '82683'; % ITIS
metaData.links.id_EoL = '492812'; % Ency of Life
metaData.links.id_Wiki = 'Argonauta_argo'; % Wikipedia
metaData.links.id_ADW = 'Argonauta_argo'; % ADW
metaData.links.id_Taxo = '40360'; % Taxonomicon
metaData.links.id_WoRMS = '138803'; % WoRMS
metaData.links.id_molluscabase = '138803'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Argonauta_argo}}';
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
bibkey = 'LaptSalm2003'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00227-002-0959-6}, ' ...
'author = {V. Laptikhovsky and A. Salman}, ' ... 
'year = {2003}, ' ...
'title = {On reproductive strategies of the epipelagic octopods of the superfamily {A}rgonautoidea ({C}ephalopoda: {O}ctopoda)}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {142}, ' ...
'pages = {321-326}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Argonauta-argo.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'octolab'; type = 'Misc'; bib = ...
'howpublished = {\url{https://octolab.tv/species/argonaut-octopus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'thecephalopodpage'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.thecephalopodpage.org/MarineInvertebrateZoology/Argonautaargo.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

