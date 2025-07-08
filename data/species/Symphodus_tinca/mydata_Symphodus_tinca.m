function [data, auxData, metaData, txtData, weights] = mydata_Symphodus_tinca

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Symphodus_tinca'; 
metaData.species_en = 'East Atlantic peacock wrasse'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 02 09];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 02 09]; 

%% set data
% zero-variate data

data.am = 15*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(18.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 16;     units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase'; 
  comment.Lp = '12 to 15.2 cm SL, and SL=0.85*TL from photo: 13.5/0.85 cm';
data.Li  = 51.8;    units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';
  comment.Li = '44 cm SL, and SL=0.85*TL from photo: 44/0.85 cm';

data.Wwb = 6.1e-6;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'BougDerb2015';
  comment.Wwb = 'based on egg diameter of 0.227  mm for Labrus meruls: pi/6*0.0227^3';
data.Wwi = 1.8e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'fishbase','GordMoli2000'};
  comment.Wwi = 'based on 0.29*Li^2.795, see F1';

data.Ri  = 35e3;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'BougDerb2015';   
  temp.Ri = C2K(18.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
data.tL = [ ... % time since birth (yr), total length (cm) 
0.179	11.962
0.399	5.864
0.498	6.118
0.557	8.320
0.642	7.896
1.014	23.398
1.204	16.621
1.205	16.960
1.214	12.555
1.214	12.894
1.217	14.927
1.217	15.181
1.218	16.452
1.229	13.402
1.230	14.588
1.232	15.689
1.232	15.689
1.232	15.859
1.232	16.198
1.232	16.198
1.232	16.282
1.244	13.826
1.244	13.911
1.244	14.080
1.244	14.080
1.244	14.249
1.244	14.249
1.244	14.334
1.249	18.485
1.370	12.979
1.385	13.911
1.386	14.419
1.400	14.673
1.400	14.758
1.401	15.012
1.972	19.247
1.972	19.416
1.973	19.925
1.974	21.195
1.976	22.720
1.977	23.059
1.977	23.228
1.977	23.313
1.994	25.431
1.994	25.939
1.995	27.040
1.996	27.209
1.996	27.379
1.998	28.819
2.000	18.824
2.000	19.247
2.006	23.991
2.006	23.991
2.006	23.991
2.006	24.160
2.007	24.584
2.007	24.838
2.007	25.176
2.007	25.261
2.009	26.786
2.009	26.871
2.010	27.125
2.010	27.125
2.010	27.125
2.010	27.294
2.010	27.802
2.011	28.141
2.011	28.480
2.012	28.819
2.012	28.819
2.012	17.045
2.013	29.835
2.013	29.835
2.014	30.682
2.014	30.682
2.014	30.767
2.015	32.038
2.030	32.038
2.143	20.094
2.224	16.536
2.228	20.179
2.232	23.906
2.244	21.873
2.253	17.553
2.254	18.146
2.255	18.993
2.255	18.993
2.271	20.856
2.272	21.365
2.272	21.619
2.399	21.111
2.400	22.212
2.410	18.315
2.970	25.092
2.985	25.515
2.985	25.939
2.985	26.024
2.986	26.532
2.989	29.073
2.989	29.158
2.989	29.412
2.989	29.496
2.990	30.005
2.990	30.089
2.996	23.398
2.997	24.075
3.001	27.040
3.003	28.819
3.003	28.819
3.003	28.904
3.005	30.767
3.006	31.360
3.006	19.671
3.006	31.868
3.007	31.953
3.007	32.122
3.008	32.885
3.008	32.885
3.015	27.464
3.016	27.802
3.016	27.972
3.016	28.056
3.017	28.480
3.018	30.089
3.033	30.089
3.033	30.089
3.151	22.635
3.247	20.009
3.249	21.704
3.251	22.720
3.251	22.805
3.251	23.144
3.253	24.499
3.328	28.311
3.369	26.871
3.430	19.162
3.431	19.416
3.431	19.671
3.431	19.671
3.536	24.753
3.972	34.240
3.978	27.125
3.985	21.534
3.992	26.955
3.992	27.125
3.992	27.294
3.993	27.802
3.993	27.802
3.993	28.056
3.996	30.428
3.996	30.513
3.999	32.969
4.004	25.092
4.008	28.480
4.008	28.904
4.008	28.988
4.008	28.988
4.008	29.073
4.008	29.073
4.009	29.158
4.009	29.581
4.009	29.581
4.010	30.089
4.010	30.428
4.012	32.038
4.026	31.529
4.336	30.682
4.337	31.868
4.347	28.141
4.348	29.158
4.348	29.158
4.364	30.005
4.973	30.344
4.985	28.904
4.986	29.920
4.987	30.005
4.988	30.852
4.988	30.852
4.988	30.852
4.988	30.852
4.988	30.852
4.991	34.155
4.999	28.649
4.999	28.649
5.001	30.005
5.001	30.005
5.022	24.075
5.132	33.308
5.186	30.936
5.301	32.376
5.353	28.819
5.355	30.174
6.004	27.972
6.006	30.005
6.006	30.005
6.006	30.005
6.016	26.108
6.017	27.040
6.056	24.160
6.997	30.005
6.999	31.191
7.036	27.125
7.069	31.191
7.113	32.038
8.053	25.007];
data.tL(:,1) = 365 * (.5 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(18.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GordMoli2000';

  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures has been guessed on the basis of preferred temperature, as given in fishbase';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length weight: Ww in g = 0.29*(TL in cm)^2.795';
metaData.bibkey.F1 = 'GordMoli2000'; 
F2 = 'Protogynous hermaphrodite: females may change to males; all are born as female';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '53PKJ'; % Cat of Life
metaData.links.id_ITIS = '614243'; % ITIS
metaData.links.id_EoL = '46571686'; % Ency of Life
metaData.links.id_Wiki = 'Symphodus_tinca'; % Wikipedia
metaData.links.id_ADW = 'Symphodus_tinca'; % ADW
metaData.links.id_Taxo = '188440'; % Taxonomicon
metaData.links.id_WoRMS = '273575'; % WoRMS
metaData.links.id_fishbase = 'Symphodus-tinca'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Symphodus_tinca}}';
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
bibkey = 'GordMoli2000'; type = 'Article'; bib = [ ... 
'author = {Ana Gordoa and Balbina Mol\''{i} and Nuria Ravent\''{o}s}, ' ... 
'year = {2000}, ' ...
'title = {Growth performance of four wrasse species on the north-western {M}editerranean coast}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {45}, ' ...
'pages = {43-50}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BougDerb2015'; type = 'Article'; bib = [ ... 
'author = {Boughamou, Naima and Derbal, Farid and Kara, Hichem}, ' ... 
'year = {2015}, ' ...
'title = {Aspects of the reproductive biology of peacock wrasse \emph{Symphodus tinca} ({L}innaeus, 1758) ({L}abridae) off the coast of {N}orth-{E}astern {A}lgeria}, ' ...
'journal = {Cahiers de Biologie Marine}, ' ...
'volume = {56}, ' ...
'pages = {127-136}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Symphodus-tinca.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

