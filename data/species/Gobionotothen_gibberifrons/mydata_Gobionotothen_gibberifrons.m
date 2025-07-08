  function [data, auxData, metaData, txtData, weights] = mydata_Gobionotothen_gibberifrons
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Nototheniidae';
metaData.species    = 'Gobionotothen_gibberifrons'; 
metaData.species_en = 'Humped rockcod'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-0.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 29];

%% set data
% zero-variate data
data.ab = 50;   units.ab = 'd';  label.ab = 'age at birth';                       bibkey.ab = 'fishbase';   
  temp.ab = C2K(-0.6); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 20*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'Barr1998';   
  temp.am = C2K(-0.6); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp = 37.5;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'fishbase'; 
data.Li = 55;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 0.0042;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwp = 512.2;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00407*Lp^3.24, see F1';
data.Wwi = 1.77e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00407*Li^3.24, see F1';

data.Ri = 106700/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(-0.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-length
data.tL_fm = [ ... % time(yr), total length (cm)
    3 22.9 21.5
    4 25.6 25.7
    5 29.1 29.5
    6 33.7 33.5
    7 36.4 35.9
    8 38.8 38.4
    9 41.4 40.6
   10 42.6 41.7
   11 43.6 43.1
   12 44.6 43.3
   13 44.9 44.4
   14 45.3 45.4
   15 46.3 46.1
   16 47.2 46.7
   17 48.4 47.5
   18 48.5 49.1];
data.tL_fm(:,1) = 365 * (0.4+data.tL_fm(:,1));  % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time', 'total length'};  
temp.tL_fm = C2K(-0.6);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Barr1998'; treat.tL_fm = {1 {'females','males'}};
comment.tL_fm = 'Data from South Geogia from Boronin & Frolkinqa 1976';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm =  5 * weights.tL_fm;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00407*(TL in cm)^3.24';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6KMVJ'; % Cat of Life
metaData.links.id_ITIS = '642852'; % ITIS
metaData.links.id_EoL = '46572990'; % Ency of Life
metaData.links.id_Wiki = 'Gobionotothen_gibberifrons'; % Wikipedia
metaData.links.id_ADW = 'Gobionotothen_gibberifrons'; % ADW
metaData.links.id_Taxo = '175318'; % Taxonomicon
metaData.links.id_WoRMS = '234704'; % WoRMS
metaData.links.id_fishbase = 'Gobionotothen-gibberifrons'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Gobionotothen_gibberifrons}}';  
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
bibkey = 'Barr1998'; type = 'Article'; bib = [ ... 
'author = {Esteban Barrera-Oro}, ' ...
'year = {1998}, ' ...
'title = {AGE DETERMINATION OF \emph{Notothenia gibberifrons} FROM THE {S}OUTH {S}HETLAND {I}SLANDS, {A}NTARCTIC {P}ENINSULA {S}UBAREA (SUBAREA 48.1)}, ' ... 
'journal = {SC-CAMLR Select Sci Pap 1988}, ' ...
'volume = {2}, ' ...
'pages = {143-160}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Gobionotothen-gibberifrons.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
