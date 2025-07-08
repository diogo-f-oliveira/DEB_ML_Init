function [data, auxData, metaData, txtData, weights] = mydata_Pterois_volitans
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Scorpaenidae';
metaData.species    = 'Pterois_volitans'; 
metaData.species_en = 'Red lionfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW', 'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 07 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 29];

%% set data
% zero-variate data

data.ab = 3.5;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(27.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;     units.am = 'd';    label.am = 'life span';            bibkey.am = 'fishbase';   
  temp.am = C2K(27.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 16;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishbase'; 
data.Li  = 45.7;     units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.7e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'FoggBrow2017';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 41.57;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00813*Lp^3.08, see F1';
data.Wwi = 1.05e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.08, see F1';
 
% uni-variate data
% time-length
data.tL_f = [ ... %  year class (yr), total length(cm)
0.963	22.227
0.975	19.136
0.977	24.390
0.988	17.978
0.990	20.914
0.990	23.231
0.991	23.772
0.992	26.013
1.005	26.245
1.006	28.331
1.961	22.551
1.976	24.560
1.977	26.801
1.977	27.805
1.977	28.423
1.978	30.587
1.981	36.536
1.990	25.874
1.991	28.887
1.992	31.359
1.993	31.978
2.003	24.329
2.004	25.333
2.007	34.605
2.016	21.779
2.018	27.419
2.019	29.660
2.020	32.905
2.031	26.183
2.034	33.369
2.962	27.434
2.978	34.079
2.990	28.903
2.990	30.216
3.003	28.285
3.004	29.521
3.018	30.835
3.018	31.684
3.019	32.225
3.030	26.817
3.033	32.921
3.033	33.153
3.042	23.109
3.510	29.374
3.978	37.262
3.988	27.836
3.989	30.772
3.990	31.777
3.990	32.240
4.002	28.532
4.003	30.000
4.015	26.600
4.016	29.073
4.018	34.018
4.030	30.155
4.045	33.168
4.047	38.190
4.988	30.788
5.001	29.629
5.001	30.170
5.003	35.115
5.016	33.029
5.041	26.462
5.055	26.076
5.057	31.948
5.059	37.511
5.973	32.039
6.000	31.344
6.001	31.576
6.001	32.967
6.001	33.508
6.001	33.739
6.002	35.671
6.016	35.285
6.027	29.954
6.028	32.581
6.029	34.744
6.055	30.727
6.056	34.513
6.057	36.367
6.059	41.003
7.015	37.155
7.015	37.386
7.026	29.892
7.026	30.510
7.028	36.382
7.040	31.824
7.041	32.751
7.043	37.928
7.054	32.210
8.000	36.629
8.012	33.384
8.013	34.698
8.013	35.547
8.024	29.289
8.025	31.762
8.026	33.925
8.027	36.243
8.038	30.217
8.042	39.720
8.053	32.303
8.067	32.844
9.010	31.082
9.024	31.545
9.024	32.241
9.025	34.868
9.026	37.958];
data.tL_f(:,1) = (data.tL_f(:,1) + 0.75) * 365; % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-8;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f = C2K(27.9); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'EddyPitt2019'; 
%
data.tL_m = [ ... %  year class (yr), total length(cm)
0.981	33.430
1.006	27.558
1.035	33.044
1.953	37.076
1.989	23.788
1.995	38.699
2.009	38.159
2.010	42.408
2.021	34.219
2.035	35.919
2.965	35.933
2.967	39.255
2.980	38.947
2.982	42.732
2.982	43.351
2.993	35.470
2.993	36.552
2.994	40.183
3.007	38.483
3.008	40.569
3.021	38.097
3.487	39.495
3.964	35.948
3.991	35.408
3.992	36.644
3.994	43.057
4.020	38.731
4.020	39.194
4.020	39.581
4.020	39.967
4.021	40.740
4.021	41.280
4.021	41.667
4.035	42.285
4.992	39.905
5.003	34.497
5.005	40.600
5.006	42.146
5.018	36.506
5.020	41.528
5.020	42.455
5.020	43.459
5.061	42.765
5.977	42.392
6.005	42.625
6.017	37.834
6.017	38.221
6.018	40.616
6.045	39.766
6.047	44.093
7.003	40.786
7.003	41.790
7.003	42.331
7.014	33.446
7.030	39.936
7.043	38.932
7.044	41.404
7.058	42.950
8.014	38.793
8.015	40.570
8.016	41.960
8.016	42.501
9.042	43.830
9.055	42.208
9.056	44.372
10.038	37.047];
data.tL_m(:,1) = (data.tL_m(:,1) + 0.75) * 365; % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-8;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m = C2K(27.9); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'EddyPitt2019'; 

% length-fecundity
data.LN = [ ... length (cm), fecundity (#)
22.250	7444.735
22.672	12387.037
24.038	15450.467
24.135	18077.747
26.411	35438.364
26.573	12541.254
26.834	28405.877
26.866	11704.606
26.964	32083.986
28.036	16866.417
28.134	17602.940
29.792	34220.478
30.345	48513.159
30.345	36118.201
30.995	35391.102
31.255	29301.944
31.580	39705.201];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(27.9); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'EddyPitt2019'; 
comment.LN = 'assumed 4 batches per yr, see FoggBrow2017';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.ab = 0 * weights.ab;
weights.Wwb = 3 * weights.Wwb;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00813*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4PWVH'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46568062'; % Ency of Life
metaData.links.id_Wiki = 'Pterois_volitans'; % Wikipedia
metaData.links.id_ADW = 'Pterois_volitans'; % ADW
metaData.links.id_Taxo = '44911'; % Taxonomicon
metaData.links.id_WoRMS = '159559'; % WoRMS
metaData.links.id_fishbase = 'Pterois-volitans'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pterois_volitans}}';
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
bibkey = 'EddyPitt2019'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-019-00877-4}, ' ...
'author = {Corey Eddy and Joanna Pitt and Ken Oliveira and James A. Morris and Jennifer Potts and Diego Bernal}, ' ... 
'year = {2019}, ' ...
'title = {The life history characteristics of invasive lionfish (\emph{Pterois volitans} and \emph{P. miles}) in {B}ermuda}, ' ...
'journal = {Environ Biol Fish}, ' ...
'volume = {102}, ' ...
'pages = {887–900}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FoggBrow2017'; type = 'Article'; bib = [ ... 
'doi = {10.5343/bms.2016.1095}, ' ...
'author = {Alexander Q. Fogg and Nancy J. Brown-Peterson and Mark S. Peterson}, ' ... 
'year = {2017}, ' ...
'title = {Reproductive life history characteristics of invasive red lionfish (\emph{Pterois volitans}) in the northern Gulf of {M}exico}, ' ...
'journal = {Bull Mar Sci.}, ' ...
'volume = {93(3)}, ' ...
'pages = {791–813}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Pterois-volitans.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

