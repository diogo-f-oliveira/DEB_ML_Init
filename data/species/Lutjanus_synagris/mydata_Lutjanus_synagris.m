function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_synagris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_synagris'; 
metaData.species_en = 'Lane snapper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2019 01 20]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.ab = 2+23/24;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'fishbase';   
  temp.ab = C2K(26);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'hatch at 23 h, birth assumed 2 d post-hatch';
data.am = 20*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AschFrei2017';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 23.8; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'fishbase'; 
  comment.Lp = '16 to 21.5 cm, wich does ';
data.Li  = 60;  units.Li  = 'cm';  label.Li  = 'ultimate total length for females'; bibkey.Li  = 'fishbase';
data.Lim  = 60;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males'; bibkey.Lim  = 'fishbase';
  comment.Lim = 'based on tL data and Li';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of L. stellatus: 4/3*pi*0.0425^3'; 
data.Wwp = 183; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on length-weight of 0.01445*Lp^2.98, see F1';
data.Wwi = 2.9e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on length-weight of 0.01445*Li^2.98, see F1';

data.Ri  = 1e6/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Lutjanus_guttatus';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.018	12.019
1.019	14.595
1.019	15.945
1.041	16.681
1.042	17.785
1.967	17.412
2.012	20.233
2.034	21.951
2.057	23.914
2.168	26.367
2.939	25.626
2.962	28.326
3.007	30.166
3.074	33.478
3.974	24.148
3.976	29.546
3.976	31.510
4.021	33.473
4.021	34.331
4.022	35.313
4.025	43.411
4.046	41.939
4.067	37.276
4.089	38.994
4.906	43.160
4.994	44.510
4.995	45.614
5.015	41.074
5.035	35.798
5.039	46.841
5.040	49.540
5.059	39.847
5.080	37.392
5.080	37.638
5.080	38.374
5.080	38.988
5.173	51.870
5.982	34.074
5.984	39.105
5.984	40.577
5.984	41.068
6.007	41.804
6.029	42.172
6.029	43.644
6.030	45.239
6.979	52.105
7.022	49.160
7.040	36.767
7.040	37.626
7.041	39.589
7.043	44.497
7.043	46.460
7.047	56.153
8.014	50.012
8.033	42.037
8.056	44.491
8.057	46.945
9.025	44.730
9.027	48.411
9.028	50.988
9.028	52.583
9.046	40.436
10.015	41.779
10.082	44.724
11.011	52.816
13.038	55.626];
data.tL_f(:,1) = 365 * data.tL_f(:,1);  % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'AschFrei2017';
comment.tL_f = 'data for females';
% 
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.995	11.160
2.010	16.184
2.010	16.552
2.011	17.779
2.011	18.270
2.012	20.479
2.080	25.509
3.006	28.203
3.006	28.816
3.006	29.675
3.007	31.393
3.028	27.344
3.031	35.933
3.048	23.540
3.048	24.031
3.049	25.871
3.068	16.546
3.068	17.896
3.069	19.368
3.069	20.718
3.070	21.577
3.070	22.435
3.070	23.172
3.071	24.644
3.071	25.258
3.071	26.116
4.040	24.638
4.040	25.252
4.040	25.497
4.040	26.233
4.041	26.356
4.041	26.847
4.041	28.442
4.042	29.301
4.042	31.264
4.043	32.000
4.064	30.282
4.069	42.920
4.991	35.675
4.991	36.043
4.991	36.779
5.012	31.749
5.014	37.270
5.014	38.006
5.017	46.473
5.018	48.927
5.035	34.203
5.035	34.693
5.037	41.810
5.038	42.669
5.056	32.607
5.056	33.466
5.056	33.589
5.058	39.110
5.059	39.601
5.059	40.215
5.059	40.583
5.059	41.442
6.004	34.197
6.007	42.049
6.007	42.786
6.007	43.031
6.026	35.669
6.027	36.282
6.027	36.773
6.028	39.350
6.029	43.522
6.049	37.755
6.049	38.613
6.049	38.736
6.050	40.209
6.051	44.012
6.052	44.871
6.075	47.080
6.075	48.184
6.076	50.638
6.077	53.828
6.979	51.859
7.000	48.301
7.042	43.515
7.046	53.454
8.031	36.884
8.036	50.258
8.056	44.491
8.078	43.509
9.001	39.822
9.005	50.006
9.025	44.117
10.019	52.331
11.008	46.804
11.076	49.871
18.036	49.706];
data.tL_m(:,1) = 365 * data.tL_m(:,1);  % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'AschFrei2017';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 5 * weights.Li;
weights.Lim = 5 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

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
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01445 * (TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; reef-associated; depth range 10 - 400 m. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3WGD4'; % Cat of Life
metaData.links.id_ITIS = '168860'; % ITIS
metaData.links.id_EoL = '46580728'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus_synagris'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_synagris'; % ADW
metaData.links.id_Taxo = '106201'; % Taxonomicon
metaData.links.id_WoRMS = '159800'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-synagris'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus_synagris}}';
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
bibkey = 'AschFrei2017'; type = 'Article'; bib = [ ... 
'author = {Alexandre Aschenbrenner and Matheus Oliveira Freitas and Gecely Rodrigues Alves Rocha and Rodrigo Leao de Moura and Ronaldo Bastos Francini-Filho and Carolina Minte-Vera and Beatrice Padovani Ferreira}, ' ... 
'year = {2017}, ' ...
'title = {Age, growth parameters and fisheries indices for the lane snapper in the {A}brolhos {B}ank, {S}{W} {A}tlantic}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {194}, ' ...
'pages = {155-163}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lutjanus-synagris.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
