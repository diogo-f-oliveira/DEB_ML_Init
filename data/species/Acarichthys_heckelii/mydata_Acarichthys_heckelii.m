  function [data, auxData, metaData, txtData, weights] = mydata_Acarichthys_heckelii
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Acarichthys_heckelii'; 
metaData.species_en = 'Threadfin acara'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 22];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 22];

%% set data
% zero-variate data
data.ab = 3; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(24.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2.5*365; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'seriouslyfish';   
  temp.tp = C2K(24.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(24.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 12;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 20;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 47;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.03020*Lp^2.96, see F1';
data.Wwi = 276;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.03020*Li^2.96, see F1';

data.Ri = 34782/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'guess';
  temp.Ri = C2K(24.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tW = [ ... % time since hatch (d), weight (g)
12.563	0.097
25.425	0.262
36.428	0.425
40.152	0.294
45.875	0.286
55.808	0.426
58.784	0.729
71.534	0.566
75.351	0.350
81.070	1.362
84.770	0.970
96.567	0.600
99.216	1.527
108.149	1.917
111.107	0.844
117.129	2.273
124.226	1.666
126.086	2.774
134.252	2.213
140.321	5.635
145.325	3.292
151.119	2.941
163.191	5.186
164.728	3.205
166.331	7.286
168.634	7.084
174.474	5.980
176.451	8.642
179.730	10.245
180.104	6.513
182.020	0.639
190.630	0.298
192.200	11.164
194.069	1.160
194.653	0.571
198.204	7.730
201.624	7.732
206.581	4.780
207.576	22.685
218.397	11.509
221.004	7.744
232.315	2.168
234.613	8.440
248.919	15.752
251.620	9.465
251.947	6.368
261.670	12.222
263.996	11.551
280.535	22.819
289.053	11.907
308.129	17.231
316.039	18.771
319.131	27.907
347.421	36.088
347.795	22.943];
units.tW = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
  temp.tW = C2K(24.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature'; 
bibkey.tW = 'Bayl1988';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 3;
weights.tp = weights.tp * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females, but males are more slender';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.03020*(TL in cm)^2.96'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '8V69Q'; % Cat of Life
metaData.links.id_ITIS = '648230'; % ITIS
metaData.links.id_EoL = '357055'; % Ency of Life
metaData.links.id_Wiki = 'Acarichthys_heckelii'; % Wikipedia
metaData.links.id_ADW = 'Acarichthys_heckelii'; % ADW
metaData.links.id_Taxo = '91704'; % Taxonomicon
metaData.links.id_WoRMS = '1020157'; % WoRMS
metaData.links.id_fishbase = 'Acarichthys-heckelii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Acarichthys_heckelii}}';  
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
bibkey = 'Bayl1988'; type = 'Article'; bib = [ ...
'doi = {10.1007/bf00004848}, ' ...
'author = {Peter B. Bayley}, ' ...
'year = {1988}, ' ...
'title = {Factors affecting growth rates of young tropical floodplain fishes: seasonality and density-dependence}, ' ... 
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {21(2)}, '...
'pages = {127–142}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Acarichthys-heckelii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'seriouslyfish'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.seriouslyfish.com/species/acarichthys-heckelii/?utm_content=cmp-true}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  