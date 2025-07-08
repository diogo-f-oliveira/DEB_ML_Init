  function [data, auxData, metaData, txtData, weights] = mydata_Lepidocephalichthys_guntea

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cobitidae';
metaData.species    = 'Lepidocephalichthys_guntea'; 
metaData.species_en = 'Guntea loach'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 09 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 23];

%% set data
% zero-variate data
data.am = 5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'guess';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'guess'; 
data.Li = 15;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'Robo1981';
  comment.Wwb = 'Based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 1.9;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'Based on 0.00741*Lp^3.10, see F1';
data.Wwi = 32.8; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';                  bibkey.Wwi = 'fishbase';
  comment.Wwi = 'Based on 0.00741*Li^3.10, see F1';

data.Ri = 1e3/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size';        bibkey.Ri = 'guess';
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Cobitis taenia';

% univariate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
5.190	-0.051
22.488	0.306
41.517	1.019
60.545	1.732
72.654	2.701
84.763	3.312
100.332	4.127
124.550	4.790
145.308	5.350
167.796	5.809
198.934	6.064
219.692	6.268
249.100	6.369
273.318	6.369
304.455	6.522
339.052	6.930
366.730	7.439
392.678	7.898
422.085	8.255
442.844	8.713
470.521	9.274
493.009	9.885
518.957	10.344
548.365	10.854
576.043	11.312
608.910	11.822
646.967	12.076
678.104	12.127
709.242	12.178
742.109	12.433
769.787	12.688
802.654	12.790
835.521	12.841
866.659	12.790
902.986	12.841
925.474	13.045
958.341	13.146
979.100	13.299];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Graa2003';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f1970', 'tL_m1970'}; subtitle1 = {'Data for 1970-cohort females, males'};
% set2 = {'tL_f1971', 'tL_m1971'}; subtitle2 = {'Data for 1971-cohort females, males'};
% set3 = {'tL_f1972', 'tL_m1972'}; subtitle3 = {'Data for 1972-cohort females, males'};
% set4 = {'tL_f1973', 'tL_m1973'}; subtitle4 = {'Data for 1973-cohort females, males'};
% set5 = {'tW_f1972', 'tW_m1972'}; subtitle5 = {'Data for 1972-cohort females, males'};
% set6 = {'tW_f1973', 'tW_m1973'}; subtitle6 = {'Data for 1973-cohort females, males'};
% metaData.grp.sets = {set1,set2,set3,set4,set5,set6};
% metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5,subtitle6};

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'temperature (C) in tL data is assumed to vary as T(t)=20+10*sin(2*pi(t-t_0)/365)';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00741*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6PB8D'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '218175'; % Ency of Life
metaData.links.id_Wiki = 'Lepidocephalichthys_guntea'; % Wikipedia
metaData.links.id_ADW = 'Lepidocephalichthys_guntea'; % ADW
metaData.links.id_Taxo = '43977'; % Taxonomicon
metaData.links.id_WoRMS = '154373'; % WoRMS
metaData.links.id_fishbase = 'Lepidocephalichthys-guntea'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Lepidocephalichthys_guntea}}';  
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
bibkey = 'Graa2003'; type = 'article'; bib = [ ... 
'doi = {10.1046/j.1365-2400.2003.00341.x}, ' ...
'author = {G. de Graaf}, ' ...
'year = {2003}, ' ...
'title = {The ﬂood pulse and growth of ﬂoodplain ﬁsh in {B}angladesh}, ' ... 
'journal = {Fisheries Management and Ecology}, ' ...
'volume = {10}, '...
'pages = {241–247}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lepidocephalichthys-guntea.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
