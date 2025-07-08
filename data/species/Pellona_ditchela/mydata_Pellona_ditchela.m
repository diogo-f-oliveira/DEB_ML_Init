  function [data, auxData, metaData, txtData, weights] = mydata_Pellona_ditchela
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Pristigasteridae';
metaData.species    = 'Pellona_ditchela'; 
metaData.species_en = 'Indian pellona'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN','MPSW'};
metaData.ecoCode.habitat = {'0iFr','0iMc'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 20];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 20];

%% set data
% zero-variate data
data.ab = 4.5;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(28.3); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28.3); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 13.5; units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 16;   units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 2.68e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwi = 37.4; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'guess';
  comment.Wwi = 'fishbase: based on 0.00692*Li^3.10, see F1, gives 1.7 g';

data.Ri  = 22e3/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';  
  temp.Ri = C2K(28.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Sauvagella_robusta: fecundity 2000*(16/7)^3';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
216.092	6.776
228.876	7.598
234.320	7.188
249.848	8.284
250.732	7.692
258.042	8.285
262.599	8.377
264.405	8.059
271.716	8.652
278.083	8.516
283.550	8.608
305.456	9.796
331.026	11.485
334.634	10.757
360.175	11.809
363.817	11.809
369.286	11.947
376.566	11.857
391.157	12.360
392.100	13.089
398.432	12.179
401.197	12.908
407.541	12.272
411.245	13.639
413.025	12.728
413.047	13.229
415.741	12.410
415.785	13.366
434.007	13.642
434.934	14.007
440.380	13.643
442.239	14.464
449.514	14.283
453.183	14.875
455.890	14.329
478.689	15.153
485.998	15.700
486.873	14.926
487.802	15.336
489.577	14.334
499.613	14.791
511.483	15.522
522.396	15.250
527.875	15.616
547.935	16.256
552.475	15.984
558.856	16.167];
data.tL(:,1) = data.tL(:,1)-50; % set origin at birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(28.3); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SousGjos1987';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'I has to reduce estimate age in tL data with 50 d to arrive at a natural fit';
D3 = 'estimate f_tL is larger than 1 because Li equals the lagest length, while growth is still substantial';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00692*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '9WR8P'; % Cat of Life
metaData.links.id_ITIS = '551324'; % ITIS
metaData.links.id_EoL = '46562716'; % Ency of Life
metaData.links.id_Wiki = 'Pellona_ditchela'; % Wikipedia
metaData.links.id_ADW = 'Pellona_ditchela'; % ADW
metaData.links.id_Taxo = '183366'; % Taxonomicon
metaData.links.id_WoRMS = '212279'; % WoRMS
metaData.links.id_fishbase = 'Pellona-ditchela'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pellona_ditchela}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%Pellona_ditchela
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SousGjos1987'; type = 'article'; bib = [ ... 
'author = {Sousa, M.I. and Gj{\o}saeter, J.}, ' ...
'year = {1987}, ' ...
'title = {A revision of growth parameters of some commercially exploited fishes from {M}ozambique}, ' ... 
'journal = {Revista de Investigagao Pesqueira Maputo}, ' ...
'volume = {16}, ' ...
'pages = {19-40},' ...
'howpublished = {\url{https://aquadocs.org/handle/1834/32668}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pellona-ditchela.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
