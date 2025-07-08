function [data, auxData, metaData, txtData, weights] = mydata_Tritogonia_verrucosa
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Tritogonia_verrucosa'; 
metaData.species_en = 'Pistolgrip'; 

metaData.ecoCode.climate = {'Cfb','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li';  'Wwi'; 'Ri'};
metaData.data_1     = {'t-L_fT'}; 

metaData.COMPLETE = 2.4; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};                             
metaData.email_cur  = {'sta@akvaplan.niva.no'};                 
metaData.date_acc   = [2021 02 04];      


%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'unio';   
  temp.ab = C2K(16);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 12*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'HaagRype2011';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Baue1987 gives 93 yrs is typical in natural populations';

data.Lb  = .02;   units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'unio';  
data.Lj  = .03;   units.Lj  = 'cm';  label.Lj  = 'shell length at settlement';   bibkey.Lj  = 'unio';  
data.Lp  = 6;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on tp 20 yr and tL data';
data.Li  = 11.7;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'HaagRype2011';

data.Wwi  = 57.6; units.Wwi  = 'g';  label.Wwi  = 'ultimate dry weight';  bibkey.Wwi  = 'guess';
 comment.Wwi = 'based on size-corrected value for Unio_tumidus : 14*(11.7/7.3)^3';

data.Ri = 115000/365;    units.Ri = '#/d';    label.Ri = 'reproduction rate for SL 9.15'; bibkey.Ri = 'Haag2013';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'value for Quadrula cylindrica';
 
% uni-variate data
  
% time-length
data.tL_f = [ ... % time settlement birth (yr), shell length (cm)
1.336	0.992
2.039	1.716
2.179	1.336
2.320	2.097
3.304	3.050
4.218	4.535
4.359	3.965
4.429	3.660
4.991	5.221
5.764	5.641
5.975	8.229
6.257	7.012
6.960	7.165
8.014	6.787
9.982	9.606
11.880	8.506
11.881	10.142
22.144	11.721];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1));
units.tL_f = {'d', 'cm'}; label.tL_f = {'time', 'shell length', 'female'};  
temp.tL_f = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HaagRype2011';
comment.tL_f = 'Data for females from Sipsey River, AL; mean temperature is guessed';
%
data.tL_m = [ ... % time since settlement (yr), shell length (cm)
1.265	1.334
2.179	2.591
2.250	2.097
2.320	2.287
3.023	4.038
3.093	2.479
3.163	3.620
3.234	3.240
3.235	3.506
3.726	3.811
4.077	5.029
4.078	5.296
4.288	4.345
5.132	4.347
5.133	4.537
5.134	4.917
5.202	5.146
5.203	5.374
5.204	5.564
5.205	5.792
5.206	5.983
5.207	6.477
6.046	7.125
6.047	7.011
6.048	6.517
6.049	6.250
6.050	5.946
6.116	5.794
6.117	5.071
6.326	7.506
6.327	5.680
6.328	5.186
6.397	5.452
6.398	5.224
7.170	5.834
7.171	6.024
7.172	8.079
7.241	7.356
7.311	6.443
7.381	6.976
7.873	7.205
7.944	7.015
8.014	7.434
8.084	7.928
8.085	8.233
8.086	6.445
9.069	7.550
9.209	8.311
9.350	7.056
10.053	7.704
10.123	8.084
12.302	8.887
13.146	8.280
14.060	9.309
14.061	8.282
15.044	9.311
17.083	9.467
22.917	10.163
23.972	9.937
24.042	10.584
24.956	10.738
25.026	10.053
25.729	10.359
26.924	9.828
29.807	10.595
31.986	10.561
37.891	10.610];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));
units.tL_m = {'d', 'cm'}; label.tL_m = {'time', 'shell length', 'male'};  
temp.tL_m = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HaagRype2011';
comment.tL_m = 'Data for males from Sipsey River, AL; mean temperature is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Lj = 0 * weights.Lj;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data from females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '594MV'; % Cat of Life
metaData.links.id_ITIS = '80293'; % ITIS
metaData.links.id_EoL = '47369413'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = 'Tritogonia_verrucosa'; % ADW
metaData.links.id_Taxo = '622823'; % Taxonomicon
metaData.links.id_WoRMS = '857490'; % WoRMS
metaData.links.id_molluscabase = '857490'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Quadrula}}';
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
bibkey = 'HaagRype2011'; type = 'Article'; bib = [ ...
'doi = {10.1111/j.1469-185X.2010.00146.x}, ' ...
'author = {Wendell R. Haag and Andrew L. Rypel1}, ' ... 
'year = {2011}, ' ...
'title = {Growth and longevity in freshwater mussels: evolutionary and conservation implications}, ' ...
'journal = {Biol. Rev.}, ' ...
'volume = {86}, ' ...
'pages = {225-247}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Haag2013'; type = 'Article'; bib = [ ...
'doi = {10.1111/brv.12028}, ' ...
'author = {Wendell R. Haag }, ' ... 
'year = {2013}, ' ...
'title = {The role of fecundity and reproductive effort in defining life-history strategies of {N}orth {A}merican freshwater mussels}, ' ...
'journal = {Biol. Rev.}, ' ...
'volume = {88}, ' ...
'pages = {745-766}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'unio'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.unio.lu/freshwater-mussel/biology/reproduction-cycle/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

