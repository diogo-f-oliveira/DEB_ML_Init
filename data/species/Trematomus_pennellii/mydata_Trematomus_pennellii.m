  function [data, auxData, metaData, txtData, weights] = mydata_Trematomus_pennellii
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Nototheniidae';
metaData.species    = 'Trematomus_pennellii'; 
metaData.species_en = 'Sharp-spined rockcod'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-1.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 27];

%% set data
% zero-variate data
data.ab = 95;   units.ab = 'd';  label.ab = 'age at birth';                       bibkey.ab = 'guess';   
  temp.ab = C2K(0); units.temp.ab = 'K'; label.temp.ab = 'temperature';
    comment.ab = 'based on Trematomus_bernacchii';
data.am = 17*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'Ekau1988';   
  temp.am = C2K(-1.7); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp = 16.2;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'guess'; 
  comment.Lp = 'based on Trematomus_bernacchii: 18*29.7/33 cm';
data.Li = 29.7;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 0.0042;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Ekau1988';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwp = 49.3;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00562*Lp^3.26, see F1';
data.Wwi = 363; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00562*Li^3.26, see F1';

data.Ri = 6600/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(-1.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-length
data.tL = [ ... % time(yr), std length (cm)
0.785	1.438
1.761	3.662
2.736	5.624
3.737	7.192
4.711	8.891
5.793	10.261
6.739	11.632
7.765	12.608
8.713	14.176
9.846	15.021
10.847	16.326
11.818	17.040
12.711	18.215
13.763	18.797
14.815	19.249
15.705	19.833
16.921	21.136];
data.tL(:,1) = 365 * data.tL(:,1);  % convert yr to d
data.tL(:,2) = data.tL(:,2)*1.16; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time', 'total length'};  
temp.tL = C2K(-1.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Ekau1988';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL =  3 * weights.tL;
weights.Wwi =  5 * weights.Wwi;
weights.Wwb =  5 * weights.Wwb;
weights.Ri =  5 * weights.Ri;
weights.ab =  0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'LW_f', 'LW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to not differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00562*(TL in cm)^3.26';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'from photo: TL = 1.16*SL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5838Q'; % Cat of Life
metaData.links.id_ITIS = '643043'; % ITIS
metaData.links.id_EoL = '46573017'; % Ency of Life
metaData.links.id_Wiki = 'Trematomus'; % Wikipedia
metaData.links.id_ADW = 'Trematomus_pennellii'; % ADW
metaData.links.id_Taxo = '189305'; % Taxonomicon
metaData.links.id_WoRMS = '234709'; % WoRMS
metaData.links.id_fishbase = 'Trematomus_pennellii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Trematomus}}';  
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
bibkey = 'Ekau1988'; type = 'Article'; bib = [ ... 
'author = {Ekau, W.}, ' ...
'year = {1988}, ' ...
'title = {Okomorphologie nototheniider {F}ische aus dem {W}eddellmeer, {A}ntarktis}, ' ... 
'journal = {Ber. Polar Meeresforsch}, ' ...
'volume = {51}, ' ...
'pages = {1-140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Trematomus-pennellii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
