function [data, auxData, metaData, txtData, weights] = mydata_Decapterus_russelli

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Decapterus_russelli'; 
metaData.species_en = 'Indian scad'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN','MPSW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.2); % K, body temp
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
  temp.ab = C2K(23.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(23.2); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 16.1; units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 45;   units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'Scre1981';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwi = 819.3; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'fishbase: based on 0.01047*Li^2.96, see F1';

data.Ri  = 107640/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'fishbase';  
  temp.Ri = C2K(23.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
162.489	4.157
170.100	4.453
177.686	4.484
181.499	4.714
182.484	5.110
186.298	5.340
189.060	4.483
193.983	6.426
194.813	5.174
202.374	4.942
202.417	5.403
204.369	5.996
208.129	5.666
214.817	6.225
234.769	6.716
247.069	6.483
252.772	6.647
255.669	7.206
257.483	6.349
263.230	6.974
263.289	7.600
269.980	8.192
270.809	6.940
277.491	7.433
288.887	7.662
290.811	7.958
294.521	7.101
296.458	7.529
302.263	8.780
306.959	8.318
316.419	8.119
327.915	9.402
338.391	9.927
339.389	10.454
346.897	9.662
347.760	8.773
349.937	11.738
357.251	8.903
362.103	10.088
363.051	10.088
368.766	10.384
375.370	10.053
378.170	9.591
395.359	10.939
396.245	10.280
396.288	10.742
417.391	13.374
419.015	10.507
419.302	13.539
427.611	11.198
428.796	13.702
429.522	11.362
432.556	13.372
433.258	10.769
441.851	11.426
452.255	11.194
456.985	11.094
459.124	13.664
463.686	11.785
469.338	11.422
473.208	12.245
473.355	13.793
475.229	13.562
475.285	14.155
478.185	14.748
479.036	13.726
479.054	13.924
480.988	14.319
483.856	14.582
490.479	14.449
495.972	12.406
499.717	11.911
504.656	14.019
505.379	11.646
507.615	15.237
508.519	14.776
511.181	12.864
513.215	14.314
523.710	15.037
526.553	15.037
531.233	14.410
531.299	15.102
536.060	15.331
539.814	14.935
544.590	15.330
561.646	15.261
562.653	15.887
567.395	15.919
568.315	15.623
573.977	15.358
574.030	15.918
582.467	14.928
586.340	15.784
590.103	15.487
598.677	15.947
599.706	16.804
606.188	15.188
632.869	16.666
643.251	16.203
644.259	16.829
646.993	15.676
678.469	17.746
680.277	16.823
686.868	16.361
693.634	17.744
707.843	17.643
711.553	16.785
714.443	17.279
723.030	17.871
731.502	17.243
736.275	17.605
754.235	17.075
757.159	17.931
760.053	18.458];
data.tL(:,1) = data.tL(:,1)-40; % set origin at birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(23.2); units.temp.tL = 'K'; label.temp.tL = 'temperature';
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
D2 = 'I has to reduce estimate age in tL data with 40 d to arrive at a natural fit';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01047*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '8V7VP'; % Cat of Life
metaData.links.id_ITIS = '168730'; % ITIS
metaData.links.id_EoL = '46577989'; % Ency of Life
metaData.links.id_Wiki = 'Decapterus_russelli'; % Wikipedia
metaData.links.id_ADW = 'Decapterus_russelli'; % ADW
metaData.links.id_Taxo = '172952'; % Taxonomicon
metaData.links.id_WoRMS = '218427'; % WoRMS
metaData.links.id_fishbase = 'Decapterus-russelli'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Decapterus_russelli}}';  
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
bibkey = 'Scre1981'; type = 'article'; bib = [ ... 
'author = {P. V. Sreenvasan}, ' ...
'year = {1981}, ' ...
'title = {MATURITY AND SPAWNING IN \emph{Decapterus dayi} {W}AKIYA}, ' ... 
'journal = {J. mar. bio. Ass. India}, ' ...
'volume = {23(1/2)}, ' ...
'pages = {19-28}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Decapterus-russelli.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
