function [data, auxData, metaData, txtData, weights] = mydata_Scarus_rivulatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Scaridae';
metaData.species    = 'Scarus_rivulatus'; 
metaData.species_en = 'Rivulated parrotfish'; 
metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2019 03 09]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 09]; 

%% set data
% zero-variate data

data.am = 20*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 10.3; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'guess based on same relative length, compared to Scarus coeruleus at given in fishbase: 31/120*40 cm';
data.Li  = 40;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.75 mm of Chaetodon: 4/3*pi*0.038^3'; 
data.Wwp = 19.5; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01514*Lp^3.07, see F1';
data.Wwi = 1254; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01514*Li^3.07, see F1';

data.Ri  = 1.2e6/365;   units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.9';

% uni-variate data
% time-length data 
data.tL = [ ... % time since birth (d), total length (cm)
103 2.03
128 3.00
141 3.55
153 3.60
164 4.11
172 4.62
183 4.34
191 5.08
207 5.73
214 5.90
230 6.70
244 7.83
254 8.74
264 9.44
271 9.80];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Lou1993';

% time-weight data 
data.tW = [ ... % time since birth (d), wet weight (g)
118.022	0.476
127.483	0.667
139.652	1.333
139.652	1.333
158.118	1.048
159.924	1.619
163.989	2.762
164.882	1.905
166.241	2.762
169.378	0.952
170.287	1.905
173.006	3.714
178.862	3.714
179.737	0.762
182.446	1.524
204.551	5.143
205.889	3.714
208.184	8.381
210.388	3.048
210.854	4.762
214.046	9.143
218.517	5.333
228.923	10.476
230.715	9.333
230.720	9.905
239.740	11.143
243.352	12.095
245.220	19.429
248.804	17.238
249.333	26.000
250.132	14.667
250.139	15.429
250.144	16.000
250.148	16.476
254.237	20.286
256.945	20.857
257.424	24.095
258.741	20.286
260.101	21.238
260.187	30.762
261.531	29.905
265.105	26.667
267.465	38.667
270.133	34.762
270.547	30.762];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(28.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Lou1993';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: W in g = 0.01514*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4V3MX'; % Cat of Life
metaData.links.id_ITIS = '170840'; % ITIS
metaData.links.id_EoL = '46572675'; % Ency of Life
metaData.links.id_Wiki = 'Scarus'; % Wikipedia
metaData.links.id_ADW = 'Scarus_rivulatus'; % ADW
metaData.links.id_Taxo = '186707'; % Taxonomicon
metaData.links.id_WoRMS = '127045'; % WoRMS
metaData.links.id_fishbase = 'Scarus-rivulatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scarus}}';
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
bibkey = 'Lou1993'; type = 'Article'; bib = [ ... 
'author = {D. C. Lou}, ' ... 
'year = {1993}, ' ...
'title = {Growth in juvenile \emph{Scarus rivulatus} and \emph{Ctnechaetus binotatus}: a comparison of families {S}caridae and {A}canthuridae}, ' ...
'journal = {Journal of fish Biology}, ' ...
'volume = {42}, ' ...
'pages = {15--23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Scarus-rivulatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

