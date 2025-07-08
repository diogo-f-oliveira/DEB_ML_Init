function [data, auxData, metaData, txtData, weights] = mydata_Sciades_parkeri
%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ariidae';
metaData.species    = 'Sciades_parkeri'; 
metaData.species_en = 'Gillbacker sea catfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 14];

%% set data
% zero-variate data;

data.am = 4*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'fishbase';
  temp.am = C2K(27.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 6.25;  units.Lb  = 'cm';	label.Lb  = 'total length at birth';  bibkey.Lb  = 'fishbase';
  comment.Lb = '6.0-6.5 cm';
data.Lp  = 52.5;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 190;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase'; 

data.Wwb = 2.14; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess'; 
  comment.Wwb = 'based on Lb, suggesting egg diameter 16 mm: pi/6*1.6^3';
data.Wwp  = 1873; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = 'fishbase'; 
  comment.Wwp = 'based on 0.00871*Lp^3.10, see F1';
data.Wwi  = 101e3; units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase'; 
  comment.Wwi = 'based on 0.00871*Li^3.10, see F1; max published wight 50 kg';

data.Ri  = 1333/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of S. couma: 165*101e3/12.5e3';
 
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), std length (cm)
1.0	 44.282 43.284
1.5	 60.894 62.390
2.0	 75.843 71.351
2.5	 90.458 79.314
3.0	100.251 94.761
4.0	119.502 NaN];
data.tL_fm(:,1) = 365 * (data.tL_fm(:,1)- 0.4); % conver yr to d
data.tL_fm(:,2) = data.tL_fm(:,2)/0.9; % convert SL to TL
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(27.6);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'MeunRoja1994'; treat.tL_fm = {1 {'females','males'}};
comment.tL_fm = 'Data averaged over various locations';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Wwb = 3 * weights.Wwb;

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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00871*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.9*TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '4VGX3'; % Cat of Life
metaData.links.id_ITIS = '680783'; % ITIS
metaData.links.id_EoL = '61912078'; % Ency of Life
metaData.links.id_Wiki = 'Sciades_parkeri'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '1683230'; % Taxonomicon
metaData.links.id_WoRMS = '712442'; % WoRMS
metaData.links.id_fishbase = 'Sciades-parkeri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Sciades_parkeri}}';
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
bibkey = 'MeunRoja1994'; type = 'Article'; bib = [ ... 
'author = {Meunier, F.J. and R. Rojas-Beltran and T. Boujard and F. Lecomte},'...
'title = {Seasonal growth rhythms in some teleosts of {F}rench {G}uiana},'...
'journal = {Rev. Hydrobiol. Trop.}, '...
'volume = {27(4)}, '...
'year = {1994}, '...
'pages = {423-440}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Sciades-parkeri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

