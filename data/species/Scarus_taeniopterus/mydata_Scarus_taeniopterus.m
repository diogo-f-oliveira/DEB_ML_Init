function [data, auxData, metaData, txtData, weights] = mydata_Scarus_taeniopterus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Scaridae';
metaData.species    = 'Scarus_taeniopterus'; 
metaData.species_en = 'Princess parrotfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 11 11];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 11];

%% set data
% zero-variate data

data.am = 11*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(27.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 11.9; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'LochWaki2017'; 
data.Li  = 35;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.75 mm of Chaetodon: 4/3*pi*0.038^3'; 
data.Wwp = 26.2; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01445*Lp^3.03, see F1';
data.Wwi = 689; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01445*Li^3.03, see F1';

data.Ri  = 1.8e6/365;   units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Leptoscarus_vaigiensis';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.339	5.235
0.377	5.726
0.378	5.017
0.415	6.053
0.984	9.163
1.021	10.254
1.023	7.637
1.041	8.619
1.874	16.309
1.894	13.965
1.970	15.056
1.987	18.599
1.990	12.603
2.026	16.746
2.045	15.656
2.084	13.802
2.106	9.332
2.122	14.457
2.143	11.295
2.180	12.603
2.996	15.824
3.013	19.913
3.015	16.642
3.035	14.952
3.052	17.514
3.073	13.970
3.088	22.203
3.127	20.295
3.167	16.588
3.168	14.898
3.186	16.370
3.205	17.406
3.222	19.641
3.262	15.988
3.278	22.367
3.943	22.697
3.945	19.971
3.946	17.463
4.020	22.152
4.042	16.428
4.060	18.554
4.079	17.628
4.117	17.519
4.151	24.770
4.192	19.863
4.267	22.317
4.895	20.793
5.029	19.976
5.063	27.391
5.066	22.321
6.073	22.434
6.130	22.707
7.005	22.111];
data.tL_f(:,1) = 365*(0.2+data.tL_f(:,1)); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(27.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LochWaki2017';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
2.937	19.367
2.992	22.747
2.993	21.602
3.014	18.931
3.015	18.495
3.034	17.078
3.071	18.332
3.072	18.223
3.088	21.221
3.089	20.676
3.108	19.804
3.146	20.785
3.166	19.095
3.202	21.494
3.222	20.786
3.223	18.605
3.242	17.951
3.906	21.170
3.961	24.387
3.999	25.532
4.000	23.188
4.001	21.553
4.002	20.680
4.037	24.606
4.039	21.989
4.040	20.081
4.057	23.733
4.058	20.844
4.059	19.372
4.060	18.772
4.077	22.534
4.096	21.989
4.114	23.952
4.115	21.117
4.116	19.427
4.132	25.042
4.133	23.134
4.135	20.408
4.153	21.117
4.171	24.443
4.189	25.860
4.209	23.516
4.210	22.208
4.248	21.608
4.249	20.082
4.267	22.753
4.950	25.809
4.951	25.537
4.969	25.155
4.970	23.901
4.971	21.884
4.988	24.446
5.008	23.302
5.025	26.682
5.026	24.774
5.027	23.574
5.063	26.355
5.085	21.503
5.103	24.065
5.104	22.975
5.122	23.738
5.139	26.573
5.140	26.028
5.141	24.992
5.142	22.048
5.143	20.740
5.158	25.592
5.159	25.429
5.199	21.722
5.217	24.393
5.255	23.466
5.881	26.413
5.939	25.541
5.941	20.962
5.957	27.558
5.976	26.904
5.977	24.833
5.995	27.177
5.996	26.087
6.033	26.414
6.035	23.579
6.053	24.833
6.054	24.397
6.055	24.397
6.056	24.070
6.072	25.814
6.091	24.942
6.167	25.324
6.184	29.249
6.185	27.723
6.186	27.014
6.204	26.196
6.205	25.924
6.206	23.580
6.223	26.633
6.260	29.740
6.299	27.396
6.852	25.109
6.966	24.892
7.003	26.418
7.004	25.709
7.021	27.672
7.022	27.018
7.023	25.437
7.043	22.330
7.059	29.090
7.060	26.037
7.097	28.109
7.116	28.545
7.117	27.182
7.137	24.783
7.173	28.327
7.174	26.692
7.192	28.763
7.193	27.564
7.194	26.201
7.249	29.527
7.858	28.548
7.895	29.802
7.934	28.221
7.971	29.203
7.973	26.532
7.989	31.384
8.029	28.658
8.030	28.331
8.031	24.787
8.047	30.294
8.086	28.931
8.087	27.622
8.088	27.459
8.105	28.059
8.143	29.422
8.181	28.986
8.199	29.913
8.238	28.386
8.961	27.245
8.978	30.189
8.979	29.698
9.036	30.353
9.037	28.008
9.171	27.300
9.208	28.009
9.264	30.245
9.265	29.918
10.008	26.595
10.025	30.030
10.026	27.849
10.976	29.380
10.996	27.527];
data.tL_m(:,1) = 365*(0.2+data.tL_m(:,1)); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(27.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LochWaki2017';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 15 * weights.tL_f;
weights.tL_m = 15 * weights.tL_m;

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

%% Facts
F1 = 'weight-length relationship: W in g = 0.01445*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Sleeps in a mucus cocoon';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4V3NW'; % Cat of Life
metaData.links.id_ITIS = '170815'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Scarus_taeniopterus'; % Wikipedia
metaData.links.id_ADW = 'Scarus_taeniopterus'; % ADW
metaData.links.id_Taxo = '46376'; % Taxonomicon
metaData.links.id_WoRMS = '276062'; % WoRMS
metaData.links.id_fishbase = 'Scarus-taeniopterus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scarus_taeniopterus}}';
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
bibkey = 'LochWaki2017'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-021-01097-5}, ' ...
'author = {David Delane Jones and Jes\''{u}s M. Rivera Hern\''{a}ndez and Virginia R. Shervette}, ' ... 
'year = {2021}, ' ...
'title = {Princess parrotfish \emph{Scarus taeniopterus} age, growth, maturity, and transition}, ' ...
'journal = {Environ Biol Fish}, ' ...
'volume = {104}, ' ...
'pages = {581–595}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Scarus-taeniopterus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

