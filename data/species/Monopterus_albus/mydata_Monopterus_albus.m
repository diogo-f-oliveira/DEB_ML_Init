function [data, auxData, metaData, txtData, weights] = mydata_Monopterus_albus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Synbranchiformes'; 
metaData.family     = 'Synbranchidae';
metaData.species    = 'Monopterus_albus'; 
metaData.species_en = 'Asian swamp eel'; 

metaData.ecoCode.climate = {'Am','Cfa'};
metaData.ecoCode.ecozone = {'TPi','THn'};
metaData.ecoCode.habitat = {'0iFm'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 09 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 18]; 

%% set data
% zero-variate data

data.ap = 4 * 365; units.ap = 'd';    label.ap = 'age at puberty';            bibkey.ap = 'YangXion2010';
  temp.ap = C2K(28); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 10 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'YangXion2010';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 41;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'YangXion2010'; 
data.Li  = 100;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.41e-2;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'SusaSety2018';
  comment.Wwb = 'based on egg diameter of 3 mm: pi/6*0.3^3';
data.Wwp = 60.3;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00065*Lp^3.08, see F1';
data.Wwi = 939;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00065*Li^3.08, see F1';

data.Ri  = 1000/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
data.tL = [ ...
0.000	17.415
0.000	21.723
0.018	18.539
0.053	19.289
0.053	20.225
0.959	29.980
0.995	22.116
0.995	28.670
1.012	23.989
1.012	25.861
1.012	26.798
1.012	27.734
1.989	33.745
1.989	34.681
2.007	27.753
2.007	29.251
2.007	30.374
2.007	35.618
2.007	36.741
2.007	37.303
2.007	39.550
2.025	31.686
3.002	38.071
3.002	39.382
3.055	44.064
3.055	45.001
3.055	45.750
3.055	47.061
3.073	42.005
3.073	42.567
3.996	48.015
4.014	42.210
4.014	52.697
4.032	48.952
4.032	50.262
4.032	53.820
4.032	55.506
5.009	55.150
5.009	57.397
5.009	58.520
5.027	60.019
5.027	61.142
5.027	64.326
5.986	69.213
5.986	71.647
6.004	67.715
6.004	70.337
6.004	73.333
6.021	66.217
6.963	76.347
6.963	77.471
6.980	74.662
8.011	79.363
8.046	81.049
8.046	81.798
9.005	84.813
9.023	86.498];
data.tL(:,1) = (1 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'YangXion2010';

% length - weight
data.LWw = [ ... % total length (log cm), wet weight (log g)
2.897	1.747
2.941	2.151
2.984	1.916
3.006	1.848
3.032	1.983
3.046	1.899
3.057	2.203
3.061	1.933
3.065	2.304
3.097	2.118
3.123	2.304
3.127	2.591
3.141	2.523
3.145	2.169
3.152	2.287
3.163	2.422
3.171	2.658
3.203	2.524
3.210	2.338
3.215	2.793
3.218	2.507
3.244	2.709
3.244	2.979
3.261	2.473
3.262	2.878
3.294	2.608
3.299	3.047
3.306	2.777
3.324	3.131
3.331	2.912
3.338	2.642
3.346	3.266
3.360	2.744
3.375	2.980
3.375	3.367
3.379	3.165
3.393	2.744
3.393	2.895
3.401	3.485
3.412	3.115
3.426	2.929
3.427	3.519
3.437	3.031
3.441	3.250
3.441	3.418
3.467	3.570
3.477	3.199
3.484	3.081
3.485	3.688
3.492	3.317
3.507	3.857
3.510	3.587
3.513	3.098
3.525	3.267
3.525	3.419
3.529	3.874
3.547	3.587
3.554	3.790
3.565	3.368
3.584	3.941
3.598	3.554
3.598	4.060
3.602	3.790
3.627	3.605
3.638	4.077
3.645	3.824
3.671	3.740
3.678	3.858
3.686	3.942
3.690	4.161
3.723	4.583
3.733	4.111
3.737	4.549
3.744	3.976
3.773	4.162
3.788	4.465
3.814	4.617
3.824	4.381
3.832	4.162
3.850	4.246
3.854	4.533
3.883	4.432
3.898	4.702
3.905	4.887
3.909	4.634
3.934	4.786
3.967	4.938
3.971	4.820
3.975	5.225
3.993	5.107
3.996	4.904
4.019	5.393
4.022	5.039
4.029	5.208
4.033	5.545
4.055	5.663
4.056	5.798
4.059	5.259
4.077	5.427
4.106	5.478
4.106	5.714
4.125	5.866
4.135	5.613
4.165	5.815
4.187	5.934
4.194	5.698
4.220	5.984
4.238	5.765
4.260	5.934
4.271	6.170
4.292	5.934
4.296	6.086
4.318	6.339
4.329	6.103
4.369	6.238
4.373	6.440
4.377	6.541
4.409	6.390
4.410	6.643
4.417	6.491
4.457	6.559
4.468	6.660];
data.LWw = exp(data.LWw); % remove log transform
units.LWw = {'cm', 'g'}; label.LWw = {'total length','wet weight'};  
bibkey.LWw = 'YangXion2010';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females, see F2';
D2 = 'Temperature varies from 8 to 25 C, mean is guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.00065*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
F2 = 'All individuals are born as females, some later convert to males';
metaData.bibkey.F2 = 'Wiki';
F3 = 'Males build a free floating bubble nest among vegetation and guards till independence';
metaData.bibkey.F3 = 'ADW';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3); 

%% Links
metaData.links.id_CoL = '4495D'; % Cat of Life
metaData.links.id_ITIS = '166697'; % ITIS
metaData.links.id_EoL = '46582178'; % Ency of Life
metaData.links.id_Wiki = 'Monopterus_albus'; % Wikipedia
metaData.links.id_ADW = 'Monopterus_albus'; % ADW
metaData.links.id_Taxo = '180328'; % Taxonomicon
metaData.links.id_WoRMS = '281590'; % WoRMS
metaData.links.id_fishbase = 'Monopterus-albus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Monopterus_albus}}';
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
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Monopterus_albus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Monopterus-albus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HeraNugr2018'; type = 'Article'; bib = [ ... 
'doi = {10.1080/10498850.2018.1483990}, ' ...
'author = {Vivi Endar Herawati and Ristiawan Agung Nugroho and Pinandoyo, Johannes Hutabarat and Budi Prayitno and Ocky Karnaradjasa}, ' ... 
'year = {2018}, ' ...
'title = {The Growth Performance and Nutrient Quality of {A}sian Swamp Eel \emph{Monopterus albus} in {C}entral {J}ava {I}ndonesia in a Freshwater Aquaculture System with Different Feeds}, ' ...
'journal = {Journal of Aquatic Food Product Technology}, ' ...
'volume = {27(6)}, ' ...
'pages = {658-666}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'YangXion2010'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1439-0426.2009.01358.x}, ' ...
'author = {M. S. Yang and B. X. Xiong}, ' ... 
'year = {2010}, ' ...
'title = {Age and growth of \emph{Monopterus albus} {Z}uiew, 1793 ({S}ynbranchidae)}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {26}, ' ...
'pages = {488-490}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SusaSety2018'; type = 'Article'; bib = [ ... 
'doi = {10.11594/jtls.08.02.12}, ' ...
'author = {Priyo Susatyo and Nuning Setyaningrum and Elly Tuti Winarni and Titi Chasanah, Atang}, ' ... 
'year = {2018}, ' ...
'title = {Reproduction Characteristics of Rice Field Eel (\emph{Monopterus albus} {Z}uieuw) on Several Functionally Changed Lands in {B}anyumas {R}egency}, ' ...
'journal = {The Journal of Tropical Life Science}, ' ...
'volume = {8(2)}, ' ...
'pages = {177-186}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

