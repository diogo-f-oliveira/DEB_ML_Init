function [data, auxData, metaData, txtData, weights] = mydata_Amblema_plicata
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Amblema_plicata'; 
metaData.species_en = 'Threeridge'; 

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

metaData.COMPLETE = 2.5; 

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
data.am = 53*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'HaagRype2011';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = .02;   units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'unio';  
data.Lj  = .03;   units.Lj  = 'cm';  label.Lj  = 'shell length at settlement';   bibkey.Lj  = 'unio';  
data.Lp  = 5;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 11.5;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'HaagRype2011';

data.Wwi  = 54.7; units.Wwi  = 'g';  label.Wwi  = 'ultimate dry weight';  bibkey.Wwi  = 'guess';
 comment.Wwi = 'based on size-corrected value for Unio_tumidus: 14*(11.5/7.3)^3';

data.Ri = 325709/365;    units.Ri = '#/d';    label.Ri = 'reproduction rate for SL 7.85 cm'; bibkey.Ri = 'Haag2013';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
 
% uni-variate data
  
% time-length
data.tL1 = [ ... % time since settlement (yr), shell length (cm)
0.804	1.267
0.912	0.669
0.912	0.704
0.914	0.915
1.146	1.513
1.956	3.343
2.062	2.604
2.169	1.971
2.287	2.463
2.630	2.780
2.648	4.751
2.857	2.850
2.863	3.554
2.865	3.730
3.086	3.167
3.086	3.202
3.092	3.836
3.096	4.223
3.103	4.962
3.439	4.540
3.558	5.138
3.666	4.680
3.907	6.158
4.136	6.475
4.240	5.490
4.582	5.736
4.586	6.158
4.686	4.751
4.929	6.545
4.932	6.827
4.936	7.214
5.380	6.264
5.500	7.038
5.501	7.179
5.611	6.792
5.621	7.883
5.831	6.158
5.838	6.897
6.299	7.707
6.407	7.214
6.530	8.199
6.627	6.475
6.748	7.355
6.753	7.883
7.096	8.164
7.780	8.692
9.372	9.466
10.277	9.431
10.499	8.974
11.416	10.100
17.302	10.100];
data.tL1(:,1) = 365 * (0 + data.tL1(:,1));
units.tL1 = {'d', 'cm'}; label.tL1 = {'time', 'shell length', 'L. Tallahatchie R., MS'};  
temp.tL1 = C2K(21);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'HaagRype2011';
comment.tL1 = 'Data from L. Tallahatchie R., MS; mean temperature is guessed';
%
data.tL2 = [ ... % time since settlement (yr), shell length (cm)
1.027	0.880
1.833	2.323
1.837	2.710
1.839	2.991
1.942	1.865
2.052	1.513
3.082	2.780
3.192	2.428
3.302	2.076
3.991	3.097
4.101	2.745
4.102	2.850
4.107	3.343
5.020	4.152
5.128	3.625
5.236	3.062
5.237	3.202
5.239	3.378
5.933	4.962
6.043	4.645
6.151	4.082
6.154	4.399
6.951	4.821
7.181	5.208
7.296	5.455
7.862	5.384
7.979	5.842
10.131	5.877
11.151	6.018
12.062	6.651
16.036	7.812
19.099	8.481
25.099	8.516
43.002	10.240
44.133	10.100
52.858	10.944
53.881	11.472];
data.tL2(:,1) = 365 * (0 + data.tL2(:,1));
units.tL2 = {'d', 'cm'}; label.tL2 = {'time', 'shell length', 'Sibsey R., AL'};  
temp.tL2 = C2K(12);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'HaagRype2011';
comment.tL2 = 'Data from Sibsey R., AL; mean temperature is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL1 = 10 * weights.tL1;
weights.tL2 = 10 * weights.tL2;
weights.Li = 3 * weights.Li;
weights.Lj = 0 * weights.Lj;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL1','tL2'}; subtitle1 = {'Data from L. Tallahatchie R., Sipsey R.'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = 'CL96'; % Cat of Life
metaData.links.id_ITIS = '80035'; % ITIS
metaData.links.id_EoL = '449591'; % Ency of Life
metaData.links.id_Wiki = 'Amblema_plicata'; % Wikipedia
metaData.links.id_ADW = 'Amblema_plicata'; % ADW
metaData.links.id_Taxo = '243379'; % Taxonomicon
metaData.links.id_WoRMS = '857254'; % WoRMS
metaData.links.id_molluscabase = '857254'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Amblema_plicata}}';
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
'author = {Wendell R. Haag and Andrew L. Rypel}, ' ... 
'year = {2011}, ' ...
'title = {Growth and longevity in freshwater mussels: evolutionary and conservation implications}, ' ...
'journal = {Biol. Rev.}, ' ...
'volume = {86}, ' ...
'pages = {225-247}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Haag2013'; type = 'Article'; bib = [ ...
'doi = {10.1111/brv.12028}, ' ...
'author = {Wendell R. Haag}, ' ... 
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

