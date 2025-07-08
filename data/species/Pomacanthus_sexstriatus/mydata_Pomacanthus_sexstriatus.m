function [data, auxData, metaData, txtData, weights] = mydata_Pomacanthus_sexstriatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pomacanthiformes'; 
metaData.family     = 'Pomacanthidae';
metaData.species    = 'Pomacanthus_sexstriatus'; 
metaData.species_en = 'Sixbar angelfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi','biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 23];

%% set data
% zero-variate data

data.ab = 11;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(28.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 58*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Sapo2005';   
  temp.am = C2K(28.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 20.8;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Sapo2005'; 
  comment.Lp = 'FL 201-210 mm';
data.Lpm  = 22.5;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty'; bibkey.Lpm  = 'Sapo2005'; 
  comment.Lpm = 'FL 220-230 mm';
data.Lim  = 46;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length'; bibkey.Lim  = 'fishbase';

data.Wwb = 2.9e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 2.5 mm and egg diameter (guessed) 1.5 mm: pi/6*0.25*0.15^2';
data.Wwp = 224;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','Sapo2005'};
  comment.Wwp = 'based on Wwp = 0.03802*Lp^2.86, see F1';
data.Wwim = 2165;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';     bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on Wwim = 0.03802*Lim^2.86, see F1';

data.Ri  = 66; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.95';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time (d), standard length (cm)
5.307	14.002
5.398	14.675
5.476	21.547
6.126	18.177
6.394	22.218
7.140	17.367
7.143	15.885
7.869	20.868
8.048	22.889
8.327	21.811
9.156	21.001
10.071	23.559
10.155	27.196
10.166	21.807
11.274	19.919
12.188	22.881
12.191	21.264
14.307	20.991
15.872	20.583
18.073	23.678
22.128	20.032
24.055	22.050
27.272	23.526
29.210	20.423
31.048	20.958
33.154	26.074
41.165	21.747];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1));
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'standard length', 'females'};  
temp.tL_f    = C2K(28.1);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Sapo2005';
%
data.tL_m = [ ... % time (d), standard length (cm)
7.850	29.895
8.144	20.868
9.424	24.907
10.802	25.982
11.081	24.365
11.176	22.748
13.288	24.630
13.921	29.884
14.202	27.323
14.486	23.685
15.398	27.456
16.316	28.397
16.778	27.183
17.144	28.261
17.147	26.509
18.985	27.449
19.267	24.484
20.914	28.792
23.948	29.325
24.229	27.304
26.064	29.187
27.078	28.241
29.104	27.294
30.194	34.029
30.841	32.276
31.034	28.099
36.070	39.272
39.038	27.410
42.246	32.928
43.245	38.989
44.369	29.286
57.877	36.131];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'standard length', 'males'};  
temp.tL_m    = C2K(28.1);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Sapo2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;
weights.Ri = 0 * weights.Ri;
weights.ab = 0 * weights.ab;
weights.Lim = 5 * weights.Lim;
weights.Wwim = 5 * weights.Wwim;
weights.Wwp = 0 * weights.Wwp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Length-weight:  (Ww in g) = 0.03802*(TL in cm)^2.86';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4LQ6X'; % Cat of Life
metaData.links.id_ITIS = '610421'; % ITIS
metaData.links.id_EoL = '46581146'; % Ency of Life
metaData.links.id_Wiki = 'Pomacanthus_sexstriatus'; % Wikipedia
metaData.links.id_ADW = 'Pomacanthus_sexstriatus'; % ADW
metaData.links.id_Taxo = '184418'; % Taxonomicon
metaData.links.id_WoRMS = '276026'; % WoRMS
metaData.links.id_fishbase = 'Pomacanthus-sexstriatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pomacanthus_sexstriatus}}';
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
bibkey = 'Sapo2005'; type = 'phdthesis'; bib = [ ... 
'howpublished = {\url{https://eprints.jcu.edu.au/1280/}}, ' ...
'author = {Sapolu, Tebaua}, ' ... 
'year = {2005}, ' ...
'title = {Age-based demography and reproductive ontogeny of angelfishes belonging to the family {P}omacanthidae}, ' ...
'school = {James Cook University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Pomacanthus-sexstriatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
