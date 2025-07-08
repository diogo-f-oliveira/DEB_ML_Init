function [data, auxData, metaData, txtData, weights] = mydata_Peprilus_burti
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Stromateidae';
metaData.species    = 'Peprilus_burti'; 
metaData.species_en = 'Gulf butterfish';

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0pMp', 'piMcb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwi'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 20];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 20];

%% set data
% zero-variate data

data.am = 3 * 365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'fishbase';   
  temp.am = C2K(18.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'rarely lives past 2 yrs';

data.Lp  = 13;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 25;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.75 mm: pi/6*0.075^3'; 
data.Wwp = 31;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01380*Lp^3.01, see F1';
data.Wwi = 222.7;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01380*Li^3.01, see F1';

data.Ri  = 1.1e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(18.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Pampus_argenteus: 221894*222.7/4.27e3';

% uni-variate data

% time-length
data.tL = [... % time (d), total length (cm)
58.190	5.320
68.493	4.511
81.769	4.850
92.236	5.426
128.263	6.298
160.690	8.696
184.545	10.566
213.932	11.244
227.207	11.583
231.119	12.683
242.447	12.543
263.381	13.696
276.696	14.369
292.531	12.368
308.750	13.615
354.979	12.818
395.099	16.317
419.482	14.653
431.795	14.848
463.067	15.479]; 
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(18.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MurpChit1990';
comment.tL = 'data from winter 1979';

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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight (in g) = 0.01380*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '76S73'; % Cat of Life
metaData.links.id_ITIS = '172568'; % ITIS
metaData.links.id_EoL = '46577488'; % Ency of Life
metaData.links.id_Wiki = 'Peprilus_burti'; % Wikipedia
metaData.links.id_ADW = 'Peprilus_burti'; % ADW
metaData.links.id_Taxo = '183446'; % Taxonomicon
metaData.links.id_WoRMS = '276560'; % WoRMS
metaData.links.id_fishbase = 'Peprilus-burti'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Peprilus_burti}}';
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
bibkey = 'MurpChit1990'; type = 'article'; bib = [ ... 
'author = {Murphy, M.D. and M.E. Chittenden}, ' ... 
'year = {1990}, ' ...
'title = {Reproduction, age and growth, and movements of the gulf butterfish \emph{Peprilus burti}}, ' ...
'journal = {J. Appl. Fish. Bull}, ' ...
'volume = {89}, ' ...
'pages = {101-116}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Peprilus-burti}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
