  function [data, auxData, metaData, txtData, weights] = mydata_Girella_punctata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Girellidae';
metaData.species    = 'Girella_punctata'; 
metaData.species_en = 'Largescale blackfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 15];

%% set data
% zero-variate data
data.am = 13*365;        units.am = 'd';  label.am = 'time since birth at death'; bibkey.am = 'LeeChan1981';
  temp.am = C2K(22.4); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp = 39;     units.Lp = 'cm';     label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 50;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 9e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'LeeChan1981';   
  comment.Wwb = 'based on egg diameter of 1.2 mm: pi/6*0.12^3';
data.Wwp = 1.46e3;  units.Wwp = 'g'; label.Wwp = 'wet weight at piberty'; bibkey.Wwp = 'fishbase'; 
  comment.Wwp = 'based on 0.01585*Lp^3.12, see F1';
data.Wwi = 3.17e3;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.01585*Li^3.12, see F1';

data.Ri = 336158/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'LeeChan1981';   
  temp.Ri = C2K(22.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time - length
data.tL_fm = [ ... % year class (yr), fork length (cm)
 1	10.727 11.145
 2	16.090 16.749
 3	19.998 21.143
 4	23.546 24.691
 5	26.317 27.764
 6	28.776 29.562
 7	30.212 31.663
 8	31.838 32.735
 9	32.910 34.417
10	34.049 35.431
11	34.579 35.903
12	35.356 36.680
13	35.826 37.277];
data.tL_fm(:,1) = 365 * (0 + data.tL_fm(:,1));
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'fork length'};  
temp.tL_fm = C2K(22.4);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'LeeChan1981'; treat.tL_fm = {1 {'females','males'}};

% length-weight
data.LW = [ ... % folrk length (cm), weight (g)
15.057	47.160
16.846	97.826
17.401	119.898
17.586	126.215
18.206	107.753
18.698	142.279
19.068	154.913
19.316	139.416
19.686	155.170
19.997	136.579
20.115	199.030
20.119	158.470
20.610	192.996
20.675	168.062
21.103	221.282
21.292	180.799
21.412	215.171
22.028	243.508
22.095	187.374
22.153	231.079
22.398	256.143
22.403	209.342
22.467	187.528
22.586	234.380
22.645	268.725
23.076	281.386
23.197	312.637
23.504	343.966
23.507	312.766
23.694	291.003
24.124	319.263
24.129	266.223
24.433	328.752
24.621	300.749
25.050	341.489
25.352	425.858
25.363	304.178
25.604	372.921
25.785	419.798
26.099	376.247
26.276	466.804
26.836	426.476
27.015	498.313
27.203	470.310
27.333	401.721
27.759	483.022
28.193	470.722
28.252	501.947
28.561	502.076
28.618	552.022
28.864	573.965
29.242	502.359
29.362	536.731
29.853	577.496
30.344	618.262
30.474	549.674
30.951	740.200
31.208	643.583
31.464	553.206
32.070	684.503
32.674	837.641
32.870	725.398
33.119	706.781
33.369	688.163
33.609	766.266
33.904	916.155
33.913	816.315
33.972	853.781
34.338	903.856
34.588	878.998
34.589	866.518
34.778	826.035
34.893	925.927
35.007	1025.819
35.012	979.019
35.084	866.724
35.320	994.747
35.448	938.639
35.575	910.610
35.692	976.182
35.865	1110.419
36.244	1032.573
37.234	1023.625
37.721	1114.311
37.896	1226.708
39.924	1367.958
43.110	1693.776
44.942	1953.509];
units.LW = {'cm', 'g'}; label.LW = {'fork length','weight'};  
temp.LW = C2K(22.4);  units.temp.LW = 'K'; label.temp.LW = 'temperature';
bibkey.LW = 'LeeChan1981';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
               
%% Discussion
D1 = 'males as supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01585*(TL in cm)^3.12'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3G3R6'; % Cat of Life
metaData.links.id_ITIS = '169516'; % ITIS
metaData.links.id_EoL = '46578601'; % Ency of Life
metaData.links.id_Wiki = 'Girella'; % Wikipedia
metaData.links.id_ADW = 'Girella_punctata'; % ADW
metaData.links.id_Taxo = '174989'; % Taxonomicon
metaData.links.id_WoRMS = '280866'; % WoRMS
metaData.links.id_fishbase = 'Girella-punctata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Girella}}';
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
bibkey = 'LeeChan1981'; type = 'Article'; bib = [ ... 
'author = {Lee, S.-C. and J.-T. Chang}, ' ...
'year = {1981}, ' ...
'title = {Age and growth of \emph{Girella melanichthys} ({R}ichardson) ({P}ercoidei: {K}yphosidae) from northern {T}aiwan}, ' ... 
'journal = {Bull. Inst. Zool. Academia Sinica}, ' ...
'volume = {20(2)}, ' ...
'pages = {21-27}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Girella-punctata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

