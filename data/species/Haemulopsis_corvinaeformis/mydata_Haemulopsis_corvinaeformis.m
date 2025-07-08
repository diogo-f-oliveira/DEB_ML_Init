function [data, auxData, metaData, txtData, weights] = mydata_Haemulopsis_corvinaeformis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Haemulidae';
metaData.species    = 'Haemulopsis_corvinaeformis'; 
metaData.species_en = 'Roughneck grunt'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2025 02 22]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 22];

%% set data
% zero-variate data

data.am = 15*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(26.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 11.88; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'EduaLira2019'; 
data.Li  = 29.3;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of Lutjanus stellatus: pi/6*0.085^3'; 
data.Wwp = 20.1;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = {'EduaLira2019','fishbase'};
  comment.Wwp = 'based on 0.01202*Lp^3.00, see F1';
data.Wwi = 302; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01202*Li^3.00, see F1; max. published weight: 329.80 g';

data.Ri  = 26862/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(26.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Stellifer_rastrifer';
  
% uni-variate data
% time-length
data.tL = [ ... % time (D), total length (cm)
0	 1.484
1	 9.359
2	16.135
3	20.879
4	24.084
5	25.970
6	27.252];
data.tL(:,1) = (data.tL(:,1) + 0.3)*365;  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(26.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'VazdRoss2019';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 15 * weights.tL;
weights.Wwi = 2 * weights.Wwi;
weights.Wwb = 2 * weights.Wwb;
weights.Wwp = 0 * weights.Wwp;
weights.Lp = 2 * weights.Lp;
weights.Li = 2 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01202*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3J986'; % Cat of Life
metaData.links.id_ITIS = '169092'; % ITIS
metaData.links.id_EoL = '46578450'; % Ency of Life
metaData.links.id_Wiki = 'Haemulopsis'; % Wikipedia
metaData.links.id_ADW = 'Pomadasys_corvinaeformis'; % ADW
metaData.links.id_Taxo = '5414709'; % Taxonomicon
metaData.links.id_WoRMS = '1020759'; % WoRMS
metaData.links.id_fishbase = 'Haemulopsis-corvinaeformis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Haemulopsis}}';
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
bibkey = 'VazdRoss2019'; type = 'techreport'; bib = [ ... 
'author = {Andr\''{e} Martins Vaz-dos-Santos and Carmen L\''{u}cia Del Bianco Rossi-Wongtschowski}, '...
'year = {2019}, ' ...
'title = {Growth in fisheries resources from the {S}outhwestern {A}tlantic}, ' ...
'institution = {Instituto Oceanogr\''{a}fico – USP S\~{a}o Paulo}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EduaLira2019'; type = 'article'; bib = [ ... 
'doi = {10.1590/1678-4766e2018007}, ' ...
'author = {Leandro N. Eduardo and Alex S. Lira and Thierry Fr\''{e}dou and Flavia Lucena Fr\''{e}dou}, '...
'year = {2019}, ' ...
'title = {Population structure and reproductive biology of \emph{Haemulopsis corvinaeformis} ({P}erciformes, {H}aemulidae) in the south coast of {P}ernambuco, northeastern {B}razil}, ' ...
'journa; = {Iheringia, Serie Zoologica}, ', ...
'volume = {108}, ' ...
'pages = {e2018007}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Haemulopsis-corvinaeformis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
