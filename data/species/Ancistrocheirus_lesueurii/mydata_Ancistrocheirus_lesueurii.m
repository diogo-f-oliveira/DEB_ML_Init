function [data, auxData, metaData, txtData, weights] = mydata_Ancistrocheirus_lesueurii

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Ancistrocheiridae';
metaData.species    = 'Ancistrocheirus_lesueurii'; 
metaData.species_en = 'Sharpear enope squid'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 20];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 27];

%% set data
% zero-variate data

data.am = 650;   units.am = 'd';    label.am = 'life span for female';        bibkey.am = 'Arkh1997';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on ML 3.8 cm in 160d, and max ML 7 cm';

data.Lp  = 18;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';    bibkey.Lp  = 'Arkh1997';
data.Lpm  = 9.4;  units.Lpm  = 'cm'; label.Lpm  = 'mantle length at puberty for male'; bibkey.Lpm  = 'Arkh1997';
data.Li  = 35;  units.Li  = 'cm'; label.Li  = 'mantle length at death for female';     bibkey.Li  = 'Arkh1997';
data.Lim  = 15;  units.Lim  = 'cm'; label.Lim  = 'mantle length at death for male';    bibkey.Lim  = 'Arkh1997';

data.Wwb  = 3e-4;  units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';     bibkey.Wwb  = 'Lapt1999';

data.Ni  = 29e3; units.Ni  = '#';  label.Ni  = 'fecundity';    bibkey.Ni  = 'Lapt1999';   
  temp.Ni = C2K(21);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
90.271	3.999
102.397	4.134
137.533	7.723
184.976	7.335
190.374	9.989
198.106	9.725
203.720	7.472
212.421	10.259
280.615	14.518
304.956	12.799
312.606	14.393
314.853	13.465
321.471	13.466
324.709	15.059
365.301	19.975
380.689	21.172
389.349	24.887
390.967	13.216
405.059	18.790
422.431	25.027
459.744	29.279
481.009	22.255
502.840	27.432
537.958	31.419
567.667	33.017
606.939	42.840];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(21);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Arkh1997';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
91.438	2.540
111.220	4.136
159.609	7.330
173.900	8.394
182.689	9.192
185.041	5.876
204.864	6.544
204.917	5.350
230.161	8.141
237.841	9.071
242.212	10.000
243.408	7.879
249.967	9.206
259.783	11.729
262.082	9.607
277.500	10.141
286.335	9.878
295.100	11.206
299.447	12.666
299.465	12.268
307.285	10.015
343.675	10.156
360.214	10.292];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(21);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Arkh1997';
comment.tL_m = 'Data for males';

% time-weight
data.tWw_f = [ ... % time since birth (d), wet weight (g)
92.209	9.259
101.440	10.673
139.403	47.434
187.973	42.138
190.184	94.253
202.912	85.736
210.990	96.511
283.772	144.339
313.773	226.337
313.785	205.885
320.763	147.797
327.655	210.818
367.999	543.524
381.877	518.386
389.934	688.726
393.602	140.961
406.125	656.872
425.769	705.227
460.383	1215.718
481.296	530.806
504.332	1054.718
536.669	1368.506
569.030	1469.248
610.583	2473.524];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(21);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Arkh1997';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), wet weight (g)
92.313	4.043
111.842	10.928
162.560	35.703
176.382	53.396
183.286	69.281
189.156	34.051
198.294	81.770
206.541	23.872
207.641	37.434
211.064	53.396
215.626	87.790
233.048	46.324
238.757	81.770
243.449	47.434
249.209	55.985
261.836	113.908
261.878	81.770
281.522	87.790
281.540	76.164
289.624	81.770
296.536	98.823
302.290	122.294
312.703	113.908
343.944	92.047
362.441	92.047];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(21);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Arkh1997';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_m = weights.tWw_m * 0.1;
weights.tWw_f = weights.tWw_f * 0.1;
weights.Li = 8 * weights.Li;
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 2 * weights.psd.p_M;
weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables as females at b';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '66M4D'; % Cat of Life
metaData.links.id_ITIS = '556106'; % ITIS
metaData.links.id_EoL = '465691'; % Ency of Life
metaData.links.id_Wiki = 'Ancistrocheirus_lesueurii'; % Wikipedia
metaData.links.id_ADW = 'Ancistrocheirus_lesueurii'; % ADW
metaData.links.id_Taxo = '247711'; % Taxonomicon
metaData.links.id_WoRMS = '138747'; % WoRMS
metaData.links.id_molluscabase = '138747'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ancistrocheirus_lesueurii}}';
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
bibkey = 'Arkh1997'; type = 'article'; bib = [ ... 
'author = {A.I. Arkhipkin}, ' ... 
'year = {1997}, ' ...
'title = {Age and growth of the mesopelagic squid \emph{Ancistrocheirus lesueurii} ({O}egopsida: {A}ncistrocheiridae) from the central-east {A}tlantic based on statolith microstructure}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {129}, ' ...
'pages = {103-111}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lapt1999'; type = 'article'; bib = [ ... 
'author = {V. V. Laptikhovsky}, ' ... 
'year = {1999}, ' ...
'title = {Fecundity and spawning in squid of families {E}noploteuthidae and {A}ncistrocheiridae ({C}ephalopoda: {O}egopsida)}, ' ...
'journal = {SCI. MAR.}, ' ...
'volume = {63(1)}, ' ...
'pages = {1-7}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Ancistrocheirus-lesueurii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

