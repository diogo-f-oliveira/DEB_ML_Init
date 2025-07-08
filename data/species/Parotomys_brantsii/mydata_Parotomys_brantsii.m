function [data, auxData, metaData, txtData, weights] = mydata_Parotomys_brantsii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Parotomys_brantsii'; 
metaData.species_en = 'Brants''s whistling rat'; 

metaData.ecoCode.climate = {'BWh', 'BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTg', '0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 30];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2018 10 30];              

%% set data
% zero-variate data

data.tg = 38;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'Jack2000';   
  temp.tg = C2K(36.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 40;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'Jack2000';   
  temp.tx = C2K(36.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 70;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'Jack2000';
  temp.tp = C2K(36.8); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(36.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 12;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Jack2000';
  comment.Wwb = 'based on back-extrapolation of tW-data';
data.Wwx = 80;  units.Wwx = 'g';  label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'Jack2000';
data.Wwi = 129.5;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'EoL';

data.Ri  = 3.5*4/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Jack2000';   
  temp.Ri = C2K(36.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 to 4 pups per litter; 4 litters per yr';
  
% univariate data
% time -weight
data.tW_f = [ ... % time since 1991/05/01 (d), wet weight (g)
11.652	30.621
17.710	46.450
25.625	56.843
25.629	60.990
26.652	60.993
26.921	48.295
28.692	52.447
28.697	58.927
29.715	52.450
30.553	54.008
33.906	58.166
33.916	71.384
34.842	66.204
35.767	59.468
36.795	65.432
36.896	76.059
37.642	78.394
38.006	68.287
39.788	85.917
40.805	78.664
41.644	80.740
42.843	67.266
42.849	74.782
44.711	77.639
47.690	79.723
47.971	82.574
48.714	81.540
48.816	92.167
51.785	83.105
51.793	93.213
54.675	90.112
54.774	98.925
55.418	89.078
56.719	87.527
56.809	84.158
57.002	92.971
61.467	92.726
62.502	106.984
62.582	91.175
68.820	97.415];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'female'};  
temp.tW_f    = C2K(36.8);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Jack2000';
comment.tW_f = 'data for females';
%
data.tW_m = [ ... % time since 1991/05/01 (d), wet weight (g)
16.783	50.076
18.919	45.418
19.478	46.715
20.595	47.497
20.597	49.570
20.598	50.866
22.000	59.942
22.730	41.802
23.844	38.954
24.136	55.543
24.782	48.547
24.786	53.730
25.711	46.736
25.717	55.029
26.830	50.886
26.847	72.398
27.764	55.036
30.834	55.823
31.872	75.524
32.787	55.052
32.892	70.085
32.981	65.938
34.002	63.091
34.003	64.387
35.115	58.688
35.776	71.390
35.871	73.723
36.800	71.394
37.823	71.656
38.848	74.510
39.874	77.624
40.897	76.590
41.839	91.885
42.751	69.339
42.835	57.158
43.784	80.747
44.893	71.679
46.866	96.567
49.913	67.289
50.389	82.064
50.480	79.472
51.978	92.177
52.632	95.808
55.136	85.189
55.517	97.113
56.522	73.272
57.752	99.971
58.782	108.268
59.602	87.018
62.778	103.616
62.873	105.690
63.801	103.101
69.851	108.304
69.853	110.896
71.249	110.900];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'weight', 'male'};  
temp.tW_m    = C2K(36.8);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Jack2000';
comment.tW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 10 * weights.tW_f;
weights.tW_m = 10 * weights.tW_m;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '4DSV5'; % Cat of Life
metaData.links.id_ITIS = '632804'; % ITIS
metaData.links.id_EoL = '1179582'; % Ency of Life
metaData.links.id_Wiki = 'Parotomys_brantsii'; % Wikipedia
metaData.links.id_ADW = 'Parotomys_brantsii'; % ADW
metaData.links.id_Taxo = '88886'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001910'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Parotomys_brantsii}}';
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
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1179582/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jack2000'; type = 'Article'; bib = [ ... 
'author = {T. P. Jackson}, ' ... 
'year = {2000}, ' ...
'title = {Female nesting behaviour, pup growth and ontogeny in {B}rants'' whistling rat (\emph{Parotomys brantsii})}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {251}, ' ...
'pages = {417-425}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

