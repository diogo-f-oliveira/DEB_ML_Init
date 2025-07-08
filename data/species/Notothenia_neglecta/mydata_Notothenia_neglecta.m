function [data, auxData, metaData, txtData, weights] = mydata_Notothenia_neglecta
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Nototheniidae';
metaData.species    = 'Notothenia_neglecta'; 
metaData.species_en = 'Yellowbelly rockcod'; 

metaData.ecoCode.climate = {'EF'};
metaData.ecoCode.ecozone = {'MASW','MPSE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-1.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 07 25];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 25];

%% set data
% zero-variate data

data.ab = 89;  units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(-1.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'based on Notothenia coriiceps';
data.am = 18*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Ever1970';   
  temp.am = C2K(-1.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 30; units.Lp  = 'cm';  label.Lp  = 'total length'; bibkey.Lp  = 'fishbase'; 
data.Li  = 45; units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 9e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.3 mm: pi/6*0.12^3'; 
data.Wwp = 828; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00794*Lp^3.25, see F1';
data.Wwi = 1.87e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00794*Li^3.25, see F1';

data.Ri = 35e3/365;  units.Ri = '#/d';    label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(-1.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  
% uni-variate data
% time-weight 
data.tW_fm = [ ... % time since birth (yr), weight^(1/3) (g^(1/3))
2	 3.656  3.495
3	 4.759  4.597
4	 5.660  5.599
5	 6.259  6.280
6	 6.839  6.980
7	 7.479  7.559
8	 8.864  8.119
9	 8.759  8.658
10	 9.298  9.016
11	 9.716  9.313
12	 9.993  9.530
13	10.331 10.009
14	10.649 10.025
15	10.765 10.302
16	11.123 10.660
17	11.380 10.797
18	11.336 10.812];
data.tW_fm(:,1) = 365 * (0.9 + data.tW_fm(:,1));  % convert yr to d
data.tW_fm(:,2:3) = data.tW_fm(:,2:3).^3; % undo root transform
units.tW_fm   = {'d', 'g'};  label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm    = C2K(-1.7);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'Ever1970'; treat.tW_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tW_fm = 5 * weights.tW_fm;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.00794*(TL in cm)^3.25'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '47YZT'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46572976'; % Ency of Life
metaData.links.id_Wiki = 'Notothenia_neglecta'; % Wikipedia
metaData.links.id_ADW = 'Notothenia_neglecta'; % ADW
metaData.links.id_Taxo = '181462'; % Taxonomicon
metaData.links.id_WoRMS = '234740'; % WoRMS
metaData.links.id_fishbase = 'Notothenia-neglecta'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Notothenia_neglecta}}';
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
bibkey = 'Ever1970'; type = 'Article'; bib = [ ... 
'author = {Everson, I.}, ' ... 
'year = {1970}, ' ...
'title = {The population dynamics and energy budget of \emph{Notothenia neglecta} {N}ybelin at {S}igny {I}sland, {S}outh {O}rkney {I}slands}, ' ...
'journal = {Br. Antarct. Surv. Bull.}, ' ...
'volume = {23}, ' ...
'pages = {25-50}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Notothenia-neglecta.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
