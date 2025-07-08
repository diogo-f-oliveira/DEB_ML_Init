function [data, auxData, metaData, txtData, weights] = mydata_Cololabis_saira

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beloniformes'; 
metaData.family     = 'Scomberesocidae';
metaData.species    = 'Cololabis_saira'; 
metaData.species_en = 'Pacific saury';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'biMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 13];

%% set data
% zero-variate data

data.ab = 5.5;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 4*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 23.8; units.Lp  = 'cm'; label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 40;     units.Li  = 'cm'; label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 3.1e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.8 mm: pi/6*0.18^3';
data.Wwi = 267;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
 comment.Wwi = 'max published weight 180 g; based on 0.00240*Li^3.15, see F1, gives 267 g';
 
data.Ri  = 159*data.Wwi/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight data
data.tW = [ ... % time since hatch (d), weight (g) 
13.510	1.030
21.230	1.609
25.090	1.998
29.916	1.078
32.811	1.086
37.636	1.631
40.048	1.169
49.216	1.402
50.181	1.196
58.866	4.411
60.314	1.437
69.481	4.439
70.446	1.782
78.166	0.739
78.649	8.719
79.131	3.933
88.782	1.831
89.747	4.493
90.712	8.219
90.712	13.006
98.432	11.963
99.397	7.178
99.879	1.860
108.082	0.818
109.047	10.927
109.530	6.141
109.530	17.311
110.495	14.654
117.732	24.780
118.697	21.059
119.180	13.082
119.180	8.826
120.627	17.341
120.627	6.171
128.347	9.383
128.830	24.278
128.830	26.937
129.312	14.172
129.312	30.662
129.312	33.321
129.795	21.089
137.033	44.512
138.963	28.028
139.445	23.242
139.928	39.733
139.928	35.477
139.928	21.116
140.410	32.287
140.410	16.862
148.613	25.394
148.613	29.649
149.095	32.310
150.060	15.291
150.060	21.142
150.060	37.632
158.745	42.974
159.228	32.869
159.710	35.530
159.710	25.423
160.193	28.616
166.948	21.719
168.878	42.469
169.843	50.450
170.808	37.687
178.046	29.728
178.528	36.112
178.528	24.410
179.011	16.964
179.493	59.519
179.493	46.221
179.493	40.902
179.493	33.987
189.144	48.374
189.626	65.929
189.626	59.014
189.626	52.631
189.626	40.929
190.109	35.079
197.829	45.206
199.276	31.912
199.759	60.104
199.759	57.977
199.759	50.530
200.241	68.084
200.241	62.233
200.241	40.957
200.724	79.256
201.206	53.193
218.094	52.174
218.094	49.515
219.542	64.412
219.542	60.689
219.542	44.200
220.024	87.286
220.024	78.243
220.507	40.479
238.842	106.485
239.324	75.103
239.324	58.614
239.807	77.764
239.807	49.573
240.290	89.468
240.290	69.787
258.625	85.793
258.625	59.729
259.107	100.156
259.107	88.454
259.107	65.050
259.590	119.838
261.037	93.778
306.876	98.687
308.806	63.054
309.288	109.332
310.736	124.761
312.666	93.383
314.113	96.047
315.078	119.986
315.561	135.412
316.043	159.350
316.526	164.670
316.526	139.138
316.526	133.287
317.973	100.844
325.211	146.076
334.379	162.058];
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'weight'};  
temp.tW  = C2K(18); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'AqueBrop2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 3 * weights.tW;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ for females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00240*(TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4VTVV'; % Cat of Life
metaData.links.id_ITIS = '165612'; % ITIS
metaData.links.id_EoL = '993264'; % Ency of Life
metaData.links.id_Wiki = 'Scomberesox_saurus'; % Wikipedia
metaData.links.id_ADW = 'Scomberesox_saurus'; % ADW
metaData.links.id_Taxo = '44428'; % Taxonomicon
metaData.links.id_WoRMS = '126392'; % WoRMS
metaData.links.id_fishbase = 'Scomberesox-saurus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scomberesox_saurus}}';
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
bibkey = 'AqueBrop2012'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s12562-009-0179-9}, ' ...
'author = {Mitsuhiro Nakaya and Taizo Morioka and Kyouhei Fukunaga and Naoto Murakami and Takashi Ichikawa and Sachio Sekiya and Satoshi Suyama}, ' ... 
'year = {2010}, ' ...
'title = {Growth and maturation of Pacific saury \emph{Cololabis saira} under laboratory conditions}, ' ...
'journal = {Fish Sci}, ' ...
'volume = {76}, ' ...
'pages = {45–53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Scomberesox-saurus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
