  function [data, auxData, metaData, txtData, weights] = mydata_Schizodon_intermedius
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Anostomidae';
metaData.species    = 'Schizodon_intermedius'; 
metaData.species_en = 'Piava'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 30];

%% set data
% zero-variate data
data.ab = 11; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'OrsiShib1999';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 13;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 28.7;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 26.3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.01000*Lp^3.07, see F1';
data.Wwi = 299;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.07, see F1';

data.GSI = 0.3; units.GSI = 'g/g';  label.GSI = 'gonado somatic index for female';   bibkey.GSI = 'OrsiShib1999';
  temp.GSI = C2K(25);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    1  7.80  6.14
    2 13.26 10.67
    3 17.36 13.43
    4 21.07 15.86
    5 24.43 18.08
    6 27.46 19.90
    7 30.19 21.56
    8 32.66 23.03];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
  temp.tL_fm = C2K(25);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
  treat.tL_fm = {1, {'female','male'}};
bibkey.tL_fm = 'OrsiShib1999';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 2;
% weights.GSI = weights.GSI * 3;
% weights.Wwb = weights.Wwb * 3;
% weights.Wwi = weights.Wwi * 3;
% weights.Li = weights.Li * 3;
%weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = weights.psd.v * 10;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01000*(TL in cm)^3.07'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6Y8W7'; % Cat of Life
metaData.links.id_ITIS = '641706'; % ITIS
metaData.links.id_EoL = '216250'; % Ency of Life
metaData.links.id_Wiki = 'Schizodon_intermedius'; % Wikipedia
metaData.links.id_ADW = 'Schizodon_intermedius'; % ADW
metaData.links.id_Taxo = '153062'; % Taxonomicon
metaData.links.id_WoRMS = '281103'; % WoRMS
metaData.links.id_fishbase = 'Schizodon-intermedius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Schizodon_intermedius}}';  
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
bibkey = 'OrsiShib1999'; type = 'Article'; bib = [ ...
'author = {M\''{a}rio Luís Orsi and Oscar Akio Shibatta}, ' ...
'year = {1999}, ' ...
'title = {Crescimento de \emph{Schizodon intermedius} {G}eiravello \& {B}ritski ({O}stheichthyes, {A}nostomidae) do {R}io {T}ibagi (Sertan\''{o}polis, Paran\''{a})}, ' ... 
'journal = { Revta bras. Zool.}, ' ...
'volume = {16(3}, '...
'pages = {701-710}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Schizodon-intermedius.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

