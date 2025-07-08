function [data, auxData, metaData, txtData, weights] = mydata_Euphlyctis_cyanophlyctis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Dicroglossidae';
metaData.species    = 'Euphlyctis_cyanophlyctis'; 
metaData.species_en = 'Indian skipper frog'; 

metaData.ecoCode.climate = {'Am', 'BSh', 'BWh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFp', 'jiFm'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 't-Ww_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 06 14];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 14]; 

%% set data
% zero-variate data

data.tp = 242; units.tp = 'd';    label.tp = 'time since metam at puberty for female at f_l';   bibkey.tp = 'GramShan2005';   
  temp.tp = C2K(26);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 91; units.tpm = 'd';    label.tpm = 'time since metam at puberty  for male at f_l'; bibkey.tpm = 'GramShan2005';   
  temp.tpm = C2K(26);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 5*365; units.am = 'd';    label.am = 'life span';                        bibkey.am = 'GramShan2005';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lj  = 2.5;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam';                      bibkey.Lj  = 'GramShan2005';
data.Lp  = 5.2;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for female';         bibkey.Lp  = 'GramShan2005';
  comment.Lp = 'based on tp = 2 yr and tL_f data';
data.Lpm  = 4;  units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for male';          bibkey.Lpm  = 'GramShan2005';
  comment.Lpm = 'based on tp = 2 yr and tL_m data';
data.Li  = 7;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';            bibkey.Li  = 'guess';
data.Lim  = 5.5; units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';           bibkey.Lim  = 'GramShan2005';

data.Wwb = 1.8e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwj = 1.4;  units.Wwj = 'g';  label.Wwj = 'wet weight at metam for female';     bibkey.Wwj = 'GramShan2005';
data.Wwjm = 1.2;  units.Wwjm = 'g';  label.Wwjm = 'wet weight at metam for male';    bibkey.Wwjm = 'GramShan2005';
data.Wwp = 12.8;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for female';  bibkey.Wwp = 'GramShan2005';
data.Wwpm = 6.1;  units.Wwpm = 'g';  label.Wwpm = 'wet weight at puberty for male';  bibkey.Wwpm = 'GramShan2005';
data.Wwi = 31; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'GramShan2005';
data.Wwim = 12.5; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'GramShan2005';

data.Ri  = 5e3/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';                bibkey.Ri  = 'guess';
  temp.Ri  = C2K(26);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Gram2009 gives 551 eggs per clutch for a SVL 5.7 cm female, but multiple clutches per yr exist.';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since metam (d), SVL (cm)
0.000	2.600
30.132	3.813
61.402	4.330
90.397	4.807
121.667	5.005];
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since metam', 'SVL', 'female'};  
temp.tL_f   = C2K(26);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GramShan2005';
comment.tL_f = 'data for females from nature';
%
data.tL_m = [ ... % time since metam (d), SVL (cm)
0.000	2.518
29.564	3.356
60.833	4.058
90.966	4.446
121.667	4.596];
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since metam', 'SVL', 'male'};  
temp.tL_m   = C2K(26);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GramShan2005';
comment.tL_m = 'data for males from nature';
%
data.tL_fl = [ ... % time since metam (d), SVL (cm)
0.000	2.518
30.132	3.295
60.833	4.031
90.966	4.371
122.235	4.487
152.368	4.555
182.500	4.753
212.064	5.032
243.333	5.230
274.034	5.380
303.030	5.496
334.299	5.693
365.569	5.802];
units.tL_fl  = {'d', 'cm'};  label.tL_fl = {'time since metam', 'SVL', 'female'};  
temp.tL_fl   = C2K(26);  units.temp.tL_fl = 'K'; label.temp.tL_fl = 'temperature';
bibkey.tL_fl = 'GramShan2005';
comment.tL_fl = 'data for females from laboratory';
%
data.tL_ml = [ ... % time since metam (d), SVL (cm)
0.000	2.484
30.701	3.254
60.833	3.915
90.966	4.092
121.667	4.194
152.368	4.242
183.069	4.283
213.201	4.440
242.765	4.549
275.171	4.658
303.598	4.685
334.299	4.705
365.000	4.739];
units.tL_ml  = {'d', 'cm'};  label.tL_ml = {'time since metam', 'SVL', 'male'};  
temp.tL_ml   = C2K(26);  units.temp.tL_ml = 'K'; label.temp.tL_ml = 'temperature';
bibkey.tL_ml = 'GramShan2005';
comment.tL_ml = 'data for males from laboratory';

% time-weight
data.tW_f = [ ... % time since metam (d), weight (g)
0.000	1.390
30.370	4.706
61.302	6.631
90.547	9.127
122.042	9.875];
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since metam', 'wet weight', 'female'};  
temp.tW_f   = C2K(26);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'GramShan2005';
comment.tW_f = 'data for females from nature';
%
data.tW_m = [ ... % time since metam (d), weight (g)
0.000	1.248
29.807	2.923
61.302	5.419
90.547	7.415
122.042	7.558];
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since metam', 'wet weight', 'male'};  
temp.tW_m   = C2K(26);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'GramShan2005';
comment.tW_m = 'data for males from nature';
%
data.tW_fl = [ ... % time since metam (d), weight (g)
0.000	1.426
29.807	3.102
60.740	5.989
90.547	7.594
122.042	7.914
151.287	8.449
182.781	9.519
212.589	11.087
243.521	12.834
272.766	13.797
304.260	14.260
333.505	15.401
364.438	16.684];
units.tW_fl  = {'d', 'g'};  label.tW_fl = {'time since metam', 'wet weight', 'female'};  
temp.tW_fl   = C2K(26);  units.temp.tW_fl = 'K'; label.temp.tW_fl = 'temperature';
bibkey.tW_fl = 'GramShan2005';
comment.tW_fl = 'data for females from laboratory';
%
data.tW_ml = [ ... % time since metam (d), weight (g)
0.000	1.283
29.807	3.030
61.864	5.134
91.109	6.061
122.042	6.417
151.849	6.524
182.781	6.738
213.713	7.237
242.958	8.414
272.766	8.984
303.698	9.376
334.068	9.269
365.000	9.412];
units.tW_ml  = {'d', 'g'};  label.tW_ml = {'time since metam', 'wet weight', 'male'};  
temp.tW_ml   = C2K(26);  units.temp.tW_ml = 'K'; label.temp.tW_ml = 'temperature';
bibkey.tW_ml = 'GramShan2005';
comment.tW_ml = 'data for males from laboratory';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;
weights.Lj = 5 * weights.Lj;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males from nature'};
set2 = {'tL_fl','tL_ml'}; subtitle2 = {'Data for females, males from laboratory'};
set3 = {'tW_f','tW_m'}; subtitle3 = {'Data for females, males from nature'};
set4 = {'tW_fl','tW_ml'}; subtitle4 = {'Data for females, males from laboratory'};
metaData.grp.sets = {set1,set2,set3,set4};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '3CMH4'; % Cat of Life
metaData.links.id_ITIS = '664947'; % ITIS
metaData.links.id_EoL = '1025205'; % Ency of Life
metaData.links.id_Wiki = 'Euphlyctis_cyanophlyctis'; % Wikipedia
metaData.links.id_ADW = 'Euphlyctis_cyanophlyctis'; % ADW
metaData.links.id_Taxo = '143433'; % Taxonomicon
metaData.links.id_WoRMS = '1359448'; % WoRMS
metaData.links.id_amphweb = 'Euphlyctis+cyanophlyctis'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Euphlyctis_cyanophlyctis}}';
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
bibkey = 'GramShan2005'; type = 'Article'; bib = [ ... 
'author = {Narahari P. Gramapurohit and Bhagyashri A. Shanbhag and Srinivas K. Saidapur}, ' ... 
'year = {2005}, ' ...
'title = {POST-METAMORPHIC GROWTH, SEXUAL MATURATION AND BODY SIZE DIMORPHISM IN THE SKIPPER FROG, \emph{Euphlyctis cyanophlyctis} ({S}CHNEIDER)}, ' ...
'journal = {Herpetological Journal}, ' ...
'volume = {15}, ' ...
'pages = {113-119}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gram2009'; type = 'Article'; bib = [ ... 
'author = {Narahari P. Gramapurohit}, ' ... 
'year = {2009}, ' ...
'title = {Catch-up growth during juvenile life can compensate for the small metamorphic size in \emph{Euphlyctis cyanophlyctis}}, ' ...
'journal = {Current Science}, ' ...
'volume = {97(8)}, ' ...
'pages = {1243-1246}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Euphlyctis+cyanophlyctis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

