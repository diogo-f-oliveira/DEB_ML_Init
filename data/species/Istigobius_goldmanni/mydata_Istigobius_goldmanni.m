function [data, auxData, metaData, txtData, weights] = mydata_Istigobius_goldmanni

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Istigobius_goldmanni'; 
metaData.species_en = 'Goldman''s goby'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'biMr'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 21];

%% set data
% zero-variate data

data.ab = 6;   units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(27.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 400;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'HernMund2005';   
  temp.am = C2K(27.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'HernMund2005a'; 
data.Li  = 6.0;   units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.771e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 1.08 mm, width 0.7 mm of Pomatoschistus minutus: pi/6*0.108*0.07^2';
data.Wwp = 0.114;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00437*Lp^2.97, see F1';
data.Wwi = 0.895;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00437*Li^2.97, see F1';

data.Ri  = 1325/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.9';

% uni-variate data

% time-length
data.tL_f = [... %  time since birth (d), total length (cm)
161.261	3.902
162.162	2.966
168.468	3.555
172.973	3.762
182.883	3.172
192.793	3.206
204.505	3.240
206.306	3.482
209.910	4.036
209.910	4.937
211.712	3.482
216.216	3.724
218.919	3.412
221.622	3.689
221.622	4.763
224.324	4.139
227.027	3.862
227.928	4.312
231.532	3.341
232.432	3.723
234.234	4.138
243.243	3.929
246.847	4.449
254.955	3.755
259.459	3.997
267.568	4.482
269.369	4.759
270.270	4.274
279.279	4.654
299.099	5.380
321.622	4.824];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(27.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HernMund2005';
%
data.tL_m = [ ... %  time since birth (d), total length (cm)
45.045	1.070
52.252	1.347
55.856	1.867
59.459	1.450
63.063	1.623
69.369	1.831
72.973	2.350
76.577	2.350
76.577	1.899
79.279	2.142
79.279	1.761
90.991	2.522
90.991	2.245
90.991	1.967
98.198	2.798
100.901	2.348
108.108	3.387
108.108	2.486
123.423	2.762
134.234	3.038
138.739	3.315
153.153	3.314
156.757	3.972
158.559	3.209
167.568	2.966
167.568	3.208
181.982	3.865
185.586	3.172
187.387	3.484
192.793	3.657
197.297	3.552
200.901	4.141
203.604	3.794
207.207	4.452
217.117	4.729
232.432	5.005
236.937	4.311
236.937	3.965
245.946	4.345
248.649	5.211
252.252	4.171
254.955	4.864
256.757	5.314
258.559	4.552
260.360	5.695
263.063	5.141
264.865	4.240
266.667	5.522
272.072	4.793
272.973	5.244
276.577	5.382
280.180	4.793
283.784	5.589
288.288	4.931
293.694	4.445
295.496	4.791
299.099	5.068
336.036	5.238
336.937	5.689
339.640	5.654
368.469	5.894
371.171	6.171
376.577	6.240];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(27.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HernMund2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight in g = 0.01023*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6NBLD'; % Cat of Life
metaData.links.id_ITIS = '637527'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Istigobius'; % Wikipedia
metaData.links.id_ADW = 'Istigobius_goldmanni'; % ADW
metaData.links.id_Taxo = '177601'; % Taxonomicon
metaData.links.id_WoRMS = '278034'; % WoRMS
metaData.links.id_fishbase = 'Istigobius-goldmanni'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Istigobius}}';
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
bibkey = 'HernMund2005'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-011-9782-6}, ' ...
'author = {V. Hernaman and P. L. Munday}, ' ... 
'year = {2005}, ' ...
'title = {Life-history characteristics of coral reef gobies. {I}. {G}rowth and life-span}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {290}, ' ...
'pages = {207–221}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HernMund2005a'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-011-9782-6}, ' ...
'author = {V. Hernaman and P. L. Munday}, ' ... 
'year = {2005}, ' ...
'title = {Life-history characteristics of coral reef gobies. {I}{I}. Mortality rate, mating system and timing of maturation}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {290}, ' ...
'pages = {223–237}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [ ...
'author = {Anonymous}, ' ...
'year = {2015}, ' ...
'howpublished = {\url{https://www.fishbase.de/summary/Istigobius-goldmanni.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
