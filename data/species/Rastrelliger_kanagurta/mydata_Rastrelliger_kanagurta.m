function [data, auxData, metaData, txtData, weights] = mydata_Rastrelliger_kanagurta

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Rastrelliger_kanagurta'; 
metaData.species_en = 'Indian mackerel'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN','MPSW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 21];

%% set data
% zero-variate data
data.ab = 4.5;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(27.3); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 4*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(27.3); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 19.9; units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 36;   units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 4.5e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'RenjSanj2017';
  comment.Wwb = 'based on egg diameter of  0.91 to 0.98 mm: pi/6*0.095^3';
data.Wwi = 522; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00871*Li^3.07, see F1';

data.Ri  = 170455/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'fishbase';  
  temp.Ri = C2K(27.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
98.849	4.529
139.888	5.152
145.103	4.813
150.351	5.054
169.553	5.197
198.398	6.160
251.809	9.486
271.843	8.953
292.071	11.752
299.923	11.751
299.934	11.944
300.846	12.621
306.010	11.412
306.063	12.330
310.406	11.991
313.864	11.460
316.572	13.005
321.854	13.826
322.628	12.135
322.662	12.715
330.499	12.472
335.742	12.616
340.062	11.891
354.138	13.919
354.943	12.759
359.322	13.048
393.442	14.687
410.904	14.926
434.445	14.682
434.551	16.518
437.940	14.778
456.336	16.080
462.370	14.823
471.136	15.547
471.969	14.871
483.426	16.850
488.688	17.332
494.753	16.607
524.451	17.231
527.972	17.762
538.421	17.423
543.711	18.388
555.010	17.662
575.993	18.433
580.364	18.577
600.463	19.155
618.763	18.814
621.411	19.345
623.184	19.828
633.605	19.006
633.679	20.262
638.924	20.454
662.490	20.645
663.292	19.437
670.269	19.388
672.906	19.725
684.284	20.352
694.761	20.496
698.203	19.674
719.149	19.817];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(27.3); units.temp.tL = 'K'; label.temp.tL = 'temperature';
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
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00871*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4RLTK'; % Cat of Life
metaData.links.id_ITIS = '172462'; % ITIS
metaData.links.id_EoL = '62688402'; % Ency of Life
metaData.links.id_Wiki = 'Rastrelliger_kanagurta'; % Wikipedia
metaData.links.id_ADW = 'Rastrelliger_kanagurta'; % ADW
metaData.links.id_Taxo = '46688'; % Taxonomicon
metaData.links.id_WoRMS = '127020'; % WoRMS
metaData.links.id_fishbase = 'Rastrelliger-kanagurta'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Rastrelliger_kanagurta}}';  
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
bibkey = 'RenjSanj2017'; type = 'article'; bib = [ ... 
'doi = {10.6024/jmbai.2016.58.2.1958A-11}, ' ...
'author = {G. Sree Renjima and V. N. Sanjeevan and B. R. Smitha and C. B. Lalithambika Devi and M. Sudhakar}, ' ...
'year = {2017}, ' ...
'title = {Early developmental stages of the {I}ndian mackerel \emph{Rastrelliger kanagurta} ({C}uvier) along the {K}erala - {M}angalore coast of southeastern {A}rabian {S}ea}, ' ... 
'journal = {J. Mar. Biol. Ass. India}, ' ...
'volume = {58(2)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Rastrelliger-kanagurta.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
