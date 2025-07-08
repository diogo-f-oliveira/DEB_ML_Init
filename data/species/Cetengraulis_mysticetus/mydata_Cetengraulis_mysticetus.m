  function [data, auxData, metaData, txtData, weights] = mydata_Cetengraulis_mysticetus
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Cetengraulis_mysticetus'; 
metaData.species_en = 'Pacific anchoveta'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'piMpe', '0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 18];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 18];

%% set data
% zero-variate data
data.ab = 3; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(25.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 3*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(25.9);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 12.9;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 22;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 21.4;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00513*Lp^3.26, see F1';
data.Wwi = 122.0;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on  0.00513*Li^3.26, see F1';

data.Ri  = 71750/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';    bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(25.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_A = [ ... % time since hatch (d), total length (cm)
88.171	9.129
95.647	9.100
123.304	10.023
124.348	10.919
124.561	11.815
152.796	11.674
152.890	12.066
154.373	11.310
179.475	11.981
182.049	12.317
183.553	11.645
186.985	12.093
212.074	12.708
213.690	12.512
216.856	11.840
216.916	12.092
244.466	12.567
244.506	12.735
274.451	12.789
276.100	12.733
276.147	12.929
299.460	13.069
304.489	13.236
453.441	13.763
460.903	13.678
487.582	13.985
488.380	13.845
490.955	14.181
517.607	14.376
519.336	14.656
545.090	14.571
551.762	14.655
576.578	14.122
579.126	14.346
580.702	13.982
580.822	14.486
609.090	14.485
614.897	14.428
640.665	14.399
640.758	14.791
641.430	14.119
641.642	15.015
670.609	14.454
670.683	14.762
671.361	14.118];
data.tL_A(:,1) = data.tL_A(:,1) + 60; % set origin at birth
units.tL_A = {'d', 'cm'};  label.tL_A = {'time since birth', 'total length'};  
  temp.tL_A = C2K(25.9);  units.temp.tL_A = 'K'; label.temp.tL_A = 'temperature'; 
bibkey.tL_A = 'BarrHowa1961';
comment.tL_A = 'Data from Ahome point';
%
data.tL_E = [ ... % time since hatch (d), total length (cm)
46.545	7.775
77.225	6.488
78.261	7.042
81.558	6.810
105.294	9.529
110.681	10.227
111.911	8.832
144.431	10.997
204.517	10.283
250.171	12.054
294.925	11.895
324.403	11.734
356.033	11.878
419.234	12.756
449.794	12.685
618.783	14.138
698.441	14.122
730.083	14.141
791.198	14.053];
data.tL_E(:,1) = data.tL_E(:,1) + 60; % set origin at birth
units.tL_E = {'d', 'cm'};  label.tL_E = {'time since birth', 'total length'};  
  temp.tL_E = C2K(25.9);  units.temp.tL_E = 'K'; label.temp.tL_E = 'temperature'; 
bibkey.tL_E = 'BarrHowa1961';
comment.tL_E = 'Data from coast Equador-Peru';
%
data.tL_G = [ ... % time since hatch (d), total length (cm)
24.551	5.739
30.232	5.765
89.497	5.875
90.013	8.612
90.916	7.770
118.277	10.061
119.114	9.824
119.772	11.246
148.161	11.537
149.008	11.221
149.879	10.669
149.908	10.406
150.033	9.248
175.006	11.092
178.924	12.408
179.710	12.645
180.570	12.197
180.602	11.908
183.126	11.092
206.498	12.725
206.577	11.989
210.580	12.515
210.609	12.252
216.250	12.647
216.319	12.016
237.525	11.149
238.972	12.780
239.001	12.517
240.659	12.202
269.025	12.704
269.091	12.098
270.672	12.493
299.092	12.495
303.152	12.496
329.108	12.761
329.128	12.576
355.904	12.763
366.466	12.711
480.871	13.535
483.284	13.745
486.555	13.535
514.154	13.616
515.750	13.879
540.925	13.855
542.483	14.460
543.327	14.171
545.825	13.592
546.580	14.118
549.860	13.829
571.784	13.831
572.576	14.015
573.357	14.305
577.385	14.594
579.061	14.121
580.719	13.805
581.474	14.331
605.068	13.912
606.672	14.096
634.274	14.151
634.300	13.914
635.061	14.388
696.731	14.787
700.044	14.182
725.236	14.000
735.781	14.106];
data.tL_G(:,1) = data.tL_G(:,1) + 20; % set origin at birth
units.tL_G = {'d', 'cm'};  label.tL_G = {'time since birth', 'total length'};  
  temp.tL_G = C2K(25.9);  units.temp.tL_G = 'K'; label.temp.tL_G = 'temperature'; 
bibkey.tL_G = 'BarrHowa1961';
comment.tL_G = 'Data from Guaymas';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_A = weights.tL_A * 3;
weights.tL_E = weights.tL_E * 3;
weights.Wwb = weights.Wwb * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_A','tL_E','tL_G'}; subtitle1 = {'Data from Ahome Point, coast Equador-Peru, Guaymas'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00513*(TL in cm)^3.26'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'T5ZW'; % Cat of Life
metaData.links.id_ITIS = '161862'; % ITIS
metaData.links.id_EoL = '46562687'; % Ency of Life
metaData.links.id_Wiki = 'Cetengraulis_mysticetus'; % Wikipedia
metaData.links.id_ADW = 'Cetengraulis_mysticetus'; % ADW
metaData.links.id_Taxo = '170284'; % Taxonomicon
metaData.links.id_WoRMS = '280092'; % WoRMS
metaData.links.id_fishbase = 'Cetengraulis-mysticetus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Cetengraulis_mysticetus}}';  
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
bibkey = 'BarrHowa1961'; type = 'Article'; bib = [ ... 
'author = {Izadore Barrett and Gerald V. Howard}, ' ...
'year = {1961}, ' ...
'title = {Studies of the age, growth, sexual maturity and spawning of populations of anchoveta (\emph{Cetengraulis mysticetus}) of the coast of the Eastern Tropical {P}acific {O}cean}, ' ... 
'journal = {INTER - AMERICAN TROPICAL TUNA COMMISSION}, ' ...
'volume = {5(2)}, '...
'pages = {115-216}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cetengraulis-mysticetus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  