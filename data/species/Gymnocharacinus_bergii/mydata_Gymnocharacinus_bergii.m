  function [data, auxData, metaData, txtData, weights] = mydata_DGymnocharacinus_bergii
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Characidae';
metaData.species    = 'Gymnocharacinus_bergii'; 
metaData.species_en = 'Naked characin'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};                             
metaData.date_subm  = [2022 07 13];                          
metaData.email      = {'bas.kooijman@vu.nl'};                 
metaData.address    = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc   = [2022 07 13]; 

%% set data
% zero-variate data
data.ab = 8;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'CussOrtu2002';   
  temp.ab = C2K(21); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'CussOrtu2002';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.5;    units.Lp = 'cm';   label.Lp = 'total length at puberty';  bibkey.Lp = 'fishbase';
data.Li = 7.5;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.4e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'CussOrtu2002';
  comment.Wwb = 'based on egg diameter of 1,4 mm: pi/6 *0.14^3';
data.Wwi = 4.4;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00724*Li^3.18, see F2';
  
data.Ri = 200/365; units.Ri = '#/d'; label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(21); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-length
data.tL = [ ... % time since birth (d), standard length (cm)
  0	0.52
  8	0.88
 20	1.20
 90 2.55
365	3.70];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};
temp.tL    = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CussOrtu2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
D2 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Preferred temp: 22-26 C';
metaData.bibkey.F1    = 'fishbase';
F2 = 'Weight (g) = 0.00724*(TL in cm)^3.18';
metaData.bibkey.F2    = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3HR32'; % Cat of Life
metaData.links.id_ITIS = '641002'; % ITIS
metaData.links.id_EoL = '212454'; % Ency of Life
metaData.links.id_Wiki = 'Gymnocharacinus_bergii'; % Wikipedia
metaData.links.id_ADW = 'Gymnocharacinus_bergii'; % ADW
metaData.links.id_Taxo = '175546'; % Taxonomicon
metaData.links.id_WoRMS = '1018689'; % WoRMS
metaData.links.id_fishbase = 'Gymnocharacinus-bergii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Gymnocharacinus_bergii}}';  
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
bibkey = 'CussOrtu2002'; type = 'Article'; bib = [ ...  
'author = {Victor Cussac and Silvia Ortubay}, ' ...
'year  = {2002}, ' ...
'title = {Gametogenesis and development of \emph{Gymnocharacinus bergi} ({P}isces, {C}haracidae): reproductive mode relative to environmental stability}, ' ...  
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {63}, ' ...
'pages = {289–297}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Gymnocharacinus-bergii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

