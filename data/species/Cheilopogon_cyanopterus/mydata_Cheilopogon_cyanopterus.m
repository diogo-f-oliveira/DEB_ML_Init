function [data, auxData, metaData, txtData, weights] = mydata_Cheilopogon_cyanopterus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beloniformes'; 
metaData.family     = 'Exocoetidae';
metaData.species    = 'Cheilopogon_cyanopterus'; 
metaData.species_en = 'Margined flyingfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 11];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 11];

%% set data
% zero-variate data

data.ab = 4;      units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(28.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 1.5*365;     units.am = 'd';    label.am = 'life span';             bibkey.am = 'guess';   
  temp.am = C2K(28.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 28;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty';  bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on same relative length compared to Hirundichthys_affinis: 40*20.9/30';
data.Li  = 40.0;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki_t';
  comment.Wwb = 'based on egg diameter of 0.5-0.8 mm for tobiko: pi/6*0.07^3';
data.Wwp = 164; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.00631*Lp^3.05, see F1';
data.Wwi = 486; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00631*Li^3.05, see F1';

data.Ri = 22500/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';   
temp.Ri = C2K(28.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Hirundichthys_affinis: 1.5e4*486/324';
 
% uni-variate data
% time-length
data.tL = [... % time since birth (d), fork length (cm)
348.386	14.115
365+14.529	14.584
365+47.085	15.632
365+74.198	16.648
365+107.285	17.414
365+134.946	18.005
365+166.566	18.619
365+198.151	19.519
365+257.874	21.155];
data.tL(:,1) = data.tL(:,1) - 26; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(28.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CorpSaeg1985';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Li = 3 * weights.Li;
weights.Ri = 3 * weights.Ri;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Grouped plots
% set1 = {'LWw_f','LWw_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to not differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00631*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5Y3JL'; % Cat of Life
metaData.links.id_ITIS = '616680'; % ITIS
metaData.links.id_EoL = '46566921'; % Ency of Life
metaData.links.id_Wiki = 'Cheilopogon_cyanopterus'; % Wikipedia
metaData.links.id_ADW = 'Cheilopogon_cyanopterus'; % ADW
metaData.links.id_Taxo = '170681'; % Taxonomicon
metaData.links.id_WoRMS = '217862'; % WoRMS
metaData.links.id_fishbase = 'Cheilopogon-cyanopterus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cheilopogon_cyanopterus}}'];
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
bibkey = 'CorpSaeg1985'; type = 'techreport'; bib = [ ... 
'author = {Corpuz, A. and J. Saeger and V. Sambilay}, ' ...
'year = {1985}, ' ...
'title = {Population parameters of commercially important fishes in {P}hilippine waters}, ' ... 
'institution = {Tech. Rep. Dep. Mar. Fish. Univ. Philipp. Visayas.}, ' ...
'volume = {6}, ' ...
'pages = {1-99},' ...
'howpublished = {\url{https://digitalarchive.worldfishcenter.org/server/api/core/bitstreams/9211bb8d-9bb9-4343-966b-649ff18d9b5b/content}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.fishbase.org/summary/Cheilopogon-cyanopterus.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki_t'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Tobiko}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

