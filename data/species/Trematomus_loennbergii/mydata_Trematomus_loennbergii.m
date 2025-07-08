  function [data, auxData, metaData, txtData, weights] = mydata_Trematomus_loennbergii
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Nototheniidae';
metaData.species    = 'Trematomus_loennbergii'; 
metaData.species_en = 'Scaly rockcod'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-0.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 28];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 28];

%% set data
% zero-variate data
data.ab = 66;   units.ab = 'd';  label.ab = 'age at birth';                       bibkey.ab = 'guess';   
  temp.ab = C2K(0); units.temp.ab = 'K'; label.temp.ab = 'temperature';
    comment.ab = 'based on Trematomus_bernacchii';
data.am = 19*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'Ekau1988';   
  temp.am = C2K(-0.9); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp = 19.1;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'guess'; 
  comment.Lp= 'based on Trematomus_eulepidotus: 22*30/34.5 cm';
data.Li = 30;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 0.0031;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Ekau1988';
  comment.Wwb = 'based on egg diameter of 1.8 mm: pi/6*0.18^3';
data.Wwp = 62.2;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00427*Lp^3.25, see F1';
data.Wwi = 270; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00427*Li^3.25, see F1';

data.Ri = 13200/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(-0.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-length
data.tL = [ ... % time(yr), std length (cm)
 0.8	 1.685  1.559
 1.8	 4.803  4.225
 2.8	 7.335  6.439
 3.8	 9.670  8.400
 4.8	11.742 10.362
 5.8	13.426 11.720
 6.8	14.915 13.179
 7.8	16.794 14.537
 8.8	17.631 15.845
 9.8	18.858 16.700
10.8	20.216 NaN
11.8	21.182 NaN
12.8	22.084 NaN
13.8	22.921 NaN
14.8	24.017 NaN
15.8	24.658 NaN
16.8	25.234 NaN
17.8	25.810 NaN
18.8	26.451 NaN];
data.tL(:,1) = 365 * data.tL(:,1);  % convert yr to d
data.tL(:,2:3) = data.tL(:,2:3) * 1.19; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time', 'total length'};  
temp.tL = C2K(-0.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Ekau1988'; treat.tL = {1, {'females','males'}};
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL =  10 * weights.tL;
weights.Wwi =  5 * weights.Wwi;
weights.Wwb =  5 * weights.Wwb;
weights.Ri =  5 * weights.Ri;
weights.ab =  0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00427*(TL in cm)^3.25';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'from photo: TL = 1.19*SL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5838L'; % Cat of Life
metaData.links.id_ITIS = '643040'; % ITIS
metaData.links.id_EoL = '46573022'; % Ency of Life
metaData.links.id_Wiki = 'Trematomus'; % Wikipedia
metaData.links.id_ADW = 'Trematomus_loennbergii'; % ADW
metaData.links.id_Taxo = '189302'; % Taxonomicon
metaData.links.id_WoRMS = '234828'; % WoRMS
metaData.links.id_fishbase = 'Trematomus-loennbergii'; % fishbase

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
'howpublished = {\url{https://www.fishbase.se/summary/Trematomus-loennbergii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
