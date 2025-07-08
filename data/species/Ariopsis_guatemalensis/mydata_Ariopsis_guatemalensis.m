function [data, auxData, metaData, txtData, weights] = mydata_Ariopsis_guatemalensis
%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ariidae';
metaData.species    = 'Ariopsis_guatemalensis'; 
metaData.species_en = 'Blue sea catfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 03];

%% set data
% zero-variate data;

data.am = 8*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'Warb1978';
  temp.am = C2K(28.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 18.5;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Warb1978';
data.Li  = 54;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase'; 

data.Wwb = 2.145; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'smithonian'; 
  comment.Wwb = 'based on egg diameter of 16 mm for Ariopsis_felis: pi/6*1.6^3';
data.Wwp  = 54.4; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = {'Warb1978','fishbase'}; 
  comment.Wwp = 'based on 0.00661*Lp^3.09, see F1';
data.Wwi  = 1.5e3; units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase'; 
  comment.Wwi = 'based on 0.00661*Li^3.09, see F1';

data.Ri  = 65/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Ariopsis_felis';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1.488	13.210
2.478	20.130
2.757	24.974
3.477	26.204
3.721	30.135
4.493	33.545
4.747	35.503];
data.tL(:,1) = 365 * (data.tL(:,1)-1);
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(28.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Warb1978';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'I had to subtract 1 yr from age-estimates in tL data to arrive at a reasonable fit';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.00661*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = 'GMXB'; % Cat of Life
metaData.links.id_ITIS = '680668'; % ITIS
metaData.links.id_EoL = '211429'; % Ency of Life
metaData.links.id_Wiki = 'Ariopsis_guatemalensis'; % Wikipedia
metaData.links.id_ADW = 'Ariopsis_guatemalensis'; % ADW
metaData.links.id_Taxo = '1683214'; % Taxonomicon
metaData.links.id_WoRMS = '293651'; % WoRMS
metaData.links.id_fishbase = 'Ariopsis-guatemalensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ariopsis_guatemalensis}}';
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
bibkey = 'Warb1978'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.1978.tb03451.x}, ' ...
'author = {Warburton, K.},'...
'title = {Age and growth determination in a marine catfish using an otolith check technique},'...
'journal = {Journal of Fish Biology}, '...
'volume = {13(4)}, '...
'year = {1978}, '...
'pages = {429–434}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Ariopsis-guatemalensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'smithonian'; type = 'Misc'; bib = ...
'howpublished = {\url{https://naturalhistory2.si.edu/smsfp/irlspec/Ariopsis_felis.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

