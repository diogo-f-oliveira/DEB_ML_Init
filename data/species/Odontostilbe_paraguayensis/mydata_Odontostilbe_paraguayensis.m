  function [data, auxData, metaData, txtData, weights] = mydata_Odontostilbe_paraguayensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Characidae';
metaData.species    = 'Odontostilbe_paraguayensis'; 
metaData.species_en = 'Tetra'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 12];

%% set data
% zero-variate data
data.ab = 6;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 2.3*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'SantVice2019';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 2.76;    units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'SantVice2019';
data.Lpm = 2.41;    units.Lpm = 'cm';   label.Lpm = 'standard length at puberty for males';  bibkey.Lpm = 'SantVice2019';
data.Li = 3.67;    units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'SantVice2019';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*.1^3';
data.Wwp = 0.259;  units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'SantVice2019','fishbase'};
  comment.Wwp = 'based on 0.01230*Lp^3.00, see F1';
data.Wwi = 0.608;  units.Wwi = 'g';    label.Wwi = 'max wet weight';    bibkey.Wwi = {'SantVice2019','fishbase'};
  comment.Wwi = 'based on 0.01230*Li^3.00, see F1';
  
data.Ri = 3*420/365; units.Ri = '#/d'; label.Ri = 'reprod rate'; bibkey.Ri = 'SantVice2019';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 spawnings per yr assumed';

% univariate data
% time-length
data.tL = [ ... % time since 1 jan(d), standard length (0.1 mm)
195.161	1.465
225.749	1.606
257.217	1.929
286.923	1.913
317.503	2.126
365+12.300	2.677
365+44.253	2.685
365+72.579	2.937
365+103.195	2.827
365+133.367	2.669
365+165.760	2.772
365+193.214	2.772
365+227.856	2.882];
data.tL(:,1) = data.tL(:,1) - 30; % set origin at hatch
units.tL   = {'d', 'cm'};  label.tL = {'time since hatch', 'standard length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SantVice2019';
comment.tL = 'data based on length frequency data';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;
weights.Ri = 5 * weights.Ri;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females by E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Weight (g) = 0.01230*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '48RN6'; % Cat of Life
metaData.links.id_ITIS = '641503'; % ITIS
metaData.links.id_EoL = '220195'; % Ency of Life
metaData.links.id_Wiki = 'Odontostilbe'; % Wikipedia
metaData.links.id_ADW = 'Odontostilbe_paraguayensis'; % ADW
metaData.links.id_Taxo = '181678'; % Taxonomicon
metaData.links.id_WoRMS = '1018670'; % WoRMS
metaData.links.id_fishbase = 'Odontostilbe-paraguayensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Odontostilbe}}';  
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
bibkey = 'SantVice2019'; type = 'Article'; bib = [ ...  
'doi = {0.4257/oeco.2019.2304.24}, ' ...
'author = {Bruna Karina Machado dos Santos and Wagner Vicentin and Yzel Rondon S\''{u}arez and Karina Keyla Tondato}, ' ...
'year  = {2019}, ' ...
'title = {POPULATION ASPECTS AND RECRUITMENT OF \emph{Odontostilbe paraguayensis} ({C}HARACIFORMES: {C}HARACIDAE) IN THE {P}ARAGUAY {R}IVER, {P}ANTANAL, {B}RAZIL}, ' ...  
'journal = {Oecologia Australis}, ' ...
'volume  = {23(4)}, ' ...
'pages = {1012-1026}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Odontostilbe-paraguayensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

