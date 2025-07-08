function [data, auxData, metaData, txtData, weights] = mydata_Pseudorhombus_arsius
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Paralichthyidae';
metaData.species    = 'Pseudorhombus_arsius'; 
metaData.species_en = 'Largetooth flounder'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 03 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 17];

%% set data
% zero-variate data
data.ab = 2;      units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'guess';    
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';  
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 14;   units.Lp = 'cm';  label.Lp = 'total length at puberty';      bibkey.Lp = 'RamaNata1979';
data.Li = 45;  units.Li = 'cm';   label.Li = 'ultimate total length';         bibkey.Li = 'fishbase';

data.Wwb = 1.72e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'RamaNata1979';
  comment.Wwb = 'based on egg diameter of 0.69 mm: pi/6*0.069^3';
data.Wwp = 24.6;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00589*Lp^3.16, see F1';
data.Wwi = 987; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';  bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00589*Li^3.16, see F1';

% uni-variate data
% time-length        
data.tL_f = [ ... % age (yrs), total length (cm) 
0.840	15.647
1.248	20.202
1.443	18.268
1.569	18.938
1.693	20.988
1.750	20.632
1.852	22.678
1.959	22.402
2.028	23.137
2.094	21.912
2.211	27.009
2.250	25.272
2.354	26.520
2.446	26.460
2.519	29.156
2.571	27.565
2.696	28.671
2.754	31.583
2.833	27.745
2.942	29.502
3.006	25.954
3.085	28.941
3.188	30.406
3.338	26.433
3.431	29.567
3.505	31.319
3.589	31.694
3.674	31.705
3.766	35.202
3.829	28.168
4.016	30.299
4.091	35.535
4.207	30.469
4.425	31.079
4.518	34.140
4.597	37.127
4.686	35.034
4.838	37.232
5.097	34.943];
data.tL_f(:,1) = 365 * (0.2+data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f = C2K(27);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BawaAlBa1990'; 
%
data.tL_m = [ ... % age (yrs), total length (cm) 
0.834	15.138
1.006	17.339
1.174	18.450
1.389	20.729
1.531	23.797
1.599	17.999
1.804	21.801
1.935	20.149
2.009	22.119
2.183	23.303
2.276	23.098
2.370	25.361
2.426	21.956
2.598	24.956
2.787	25.707
2.893	25.866
2.928	22.604
3.050	25.088
3.132	26.479
3.199	24.745
3.333	24.981
3.424	25.791
3.597	27.629
3.905	29.195
4.015	27.612
4.081	26.169
4.452	28.106
4.521	29.277
4.913	27.732
5.986	29.036];
data.tL_m(:,1) = 365 * (0.2+data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m = C2K(27);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BawaAlBa1990'; 

% length-fecundity
data.LN = [ ... total length (cm), fecundity (#)
13.866	90858.543
14.733	126863.344
17.101	129353.783
17.390	153722.567
17.679	160699.991
17.736	169979.553
18.314	178137.345
18.834	188609.783
19.123	202543.751
19.469	209525.385
19.758	199111.568
19.874	210714.123
20.394	257128.603
21.895	352309.902
22.415	356985.237
22.704	398745.310
23.513	455615.486
24.090	488121.122];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(27);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'RamaNata1979';

% weight-fecundity
data.WN = [ ... % weight (g), fecundity (#)
30.204	94902.890
41.124	134479.759
47.444	156601.685
52.882	165984.912
52.919	183326.878
54.890	171815.015
62.634	192816.111
63.224	202079.297
66.938	205639.484
66.963	217200.795
71.230	212682.249
83.888	265018.916
100.233	308198.402
105.660	312957.147
114.046	367500.130
115.449	357130.289
131.804	404934.282
149.622	470115.560
157.675	502685.008];
units.WN = {'g', '#'}; label.WN = {'weight', 'fecundity'};  
temp.WN = C2K(27);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'RamaNata1979';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00589*(TL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4P9SS'; % Cat of Life
metaData.links.id_ITIS = '172837'; % ITIS
metaData.links.id_EoL = '46570545'; % Ency of Life
metaData.links.id_Wiki = 'Pseudorhombus_arsius'; % Wikipedia
metaData.links.id_ADW = 'Pseudorhombus_arsius'; % ADW
metaData.links.id_Taxo = '185301'; % Taxonomicon
metaData.links.id_WoRMS = '220051'; % WoRMS
metaData.links.id_fishbase = 'Pseudorhombus-arsius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudorhombus_arsius}}';
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
bibkey = 'BawaAlBa1990'; type = 'article'; bib = [ ...
'author = {A. S. Bawazeer and Ali F. Al-Baz}, ' ...
'year = {1990}, ' ...
'title = {Growth, mortality and yield per recruit of large toothed flounder, \emph{Pseudorhombus arsius} ({H}amilton and {B}uchanan) in {K}uwait waters}}, ' ... 
'journal = {Palistan J. Zool.}, ' ...
'volume = {22(2)}, ' ...
'pages = {193-202}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RamaNata1979'; type = 'article'; bib = [ ...
'author = {N. Ramanathan and R. Natarajan}, ' ...
'year = {1979}, ' ...
'title = {Breeding biology of \emph{Psettodes erumei} ({B}loch \& {S}chn.) and \emph{Pseudorhombus arsius} ({H}am. {B}uch) {P}isces: {P}leuronectiformes along {P}orto {N}ovo {C}oast ({S}. {I}ndia)}, ' ... 
'journal = {Aquaculture}, ' ...
'volume = {18}, ' ...
'pages = {269-282}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Pseudorhombus-arsius.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
