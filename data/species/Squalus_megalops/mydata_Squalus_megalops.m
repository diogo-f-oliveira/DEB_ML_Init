function [data, auxData, metaData, txtData, weights] = mydata_Squalus_megalops

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Squaliformes'; 
metaData.family     = 'Squalidae';
metaData.species    = 'Squalus_megalops'; 
metaData.species_en = 'Shortnose spurdog'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAm', 'MASE', 'MISE', 'MISW', 'MPE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi';  'Ri'};
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 02];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 2*365;units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'fishbase';    
  temp.ab = C2K(17); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 32*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'fishbase';   
  temp.am = C2K(17); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 22;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';        bibkey.Lb  = 'fishbase';
  comment.Lb = '20-24 cm';
data.Lp  = 49;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'fishbase';
data.Li  = 89;  units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'fishbase';
data.Lim  = 72;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length of males'; bibkey.Lim  = 'fishbase';

data.Wwi = 4.94e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00468*Li^3.09, see F1';

data.Ri  = 3/365/2; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-4 pups per litter, 1 ltter per 2 yr';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.940	31.541
1.916	28.980
2.076	33.938
2.898	31.376
2.899	32.060
3.003	33.256
3.832	37.190
3.932	34.541
3.979	29.328
3.982	33.174
4.805	31.210
4.914	36.510
4.914	37.108
4.963	34.459
5.013	32.407
5.844	39.247
5.846	40.786
5.889	32.324
5.893	36.085
5.998	38.479
6.101	37.795
6.927	39.507
6.928	40.704
6.975	36.003
7.025	34.123
7.027	36.516
7.028	37.114
7.028	37.541
7.029	38.054
7.030	38.909
7.905	38.484
7.954	35.322
7.958	38.997
8.062	39.937
8.062	40.792
8.934	36.094
8.935	37.205
8.936	37.974
8.936	38.487
8.938	39.598
8.938	40.196
8.939	40.709
8.939	41.478
8.994	44.726
9.151	46.522
9.867	40.883
9.867	41.396
9.868	41.908
9.917	39.772
9.918	40.199
10.018	37.379
10.020	39.088
10.077	44.473
10.799	45.415
10.800	46.099
10.850	44.646
10.852	46.783
10.897	40.544
10.898	41.228
10.900	42.852
10.900	43.535
10.943	34.732
10.951	42.424
11.937	49.094
11.980	41.060
11.982	42.427
11.982	43.111
11.983	43.709
12.036	44.735
12.036	45.248
12.037	45.761
12.037	46.359
12.038	46.786
12.038	47.299
12.039	48.068
12.910	42.515
12.914	46.533
12.915	47.302
12.917	49.866
13.013	43.114
13.016	45.935
13.019	48.157
13.019	48.584
13.020	49.097
13.066	43.883
13.067	45.251
13.846	51.065
13.941	43.031
13.941	43.373
13.946	48.159
13.947	48.672
13.948	49.271
13.948	49.954
13.949	50.467
13.996	46.023
13.996	46.365
13.997	46.792
13.997	47.390
14.046	44.826
14.054	52.262
14.929	51.581
14.975	46.026
14.976	46.880
14.977	47.393
14.977	48.162
14.979	49.786
14.981	52.094
14.982	52.436
14.983	53.632
14.984	55.000
15.906	48.934
15.907	50.387
15.908	50.900
15.952	43.892
15.958	49.875
15.960	51.840
15.961	52.439
15.963	53.806
16.008	47.567
16.052	40.644
16.944	55.860
16.945	56.715
16.990	50.219
16.991	51.501
16.992	52.185
17.040	49.108
17.095	52.527
17.096	53.468
17.920	52.530
17.921	53.213
17.970	51.333
18.020	49.795
18.026	55.778
18.076	53.983
19.002	52.276
19.003	52.704
19.006	55.610
19.056	54.755
19.058	56.208
19.059	57.148
19.107	54.157
19.832	57.321
19.833	58.005
19.879	52.877
19.880	53.646
19.934	55.783
19.985	55.185
19.989	59.117
20.082	49.373
20.083	50.826
20.084	51.168
20.966	57.239
20.966	57.667
20.967	58.436
21.011	51.171
21.012	51.855
21.116	52.539
21.117	53.735
21.943	54.421
21.946	57.327
21.946	57.840
22.047	55.789
22.095	52.798
22.974	55.279
23.028	57.331
23.076	54.168
23.082	59.467
23.083	60.322
23.127	53.314
23.952	53.658
24.059	56.992
24.059	57.761
24.060	58.359
24.112	59.214
24.887	60.755
25.041	59.644
25.041	60.157
25.089	56.909
25.091	58.277
26.021	60.416
26.022	61.100
26.067	54.775
26.071	58.621
28.083	60.422
28.085	62.473];
data.tL_f(:,1) = data.tL_f(:,1)*365; % % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};     label.tL_f = {'age', 'total length', 'female'};  
temp.tL_f = C2K(17);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BracGill2007';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (mm)
1.117	27.308
3.035	34.278
3.131	30.928
3.188	33.506
3.243	35.310
4.109	31.019
5.039	32.657
5.040	33.344
5.094	34.719
5.095	35.321
5.097	35.836
5.927	39.105
6.123	34.296
6.126	36.186
6.129	37.474
6.131	38.333
7.110	39.026
7.157	36.965
7.158	37.480
7.164	40.401
7.212	38.597
7.988	40.835
7.991	41.952
8.038	39.977
8.089	39.461
8.136	37.400
8.139	38.860
9.067	40.068
9.069	41.013
9.072	42.216
9.163	36.633
9.169	39.296
9.219	38.523
9.991	38.871
9.993	39.558
10.050	42.222
10.089	36.208
10.093	38.184
10.097	40.246
10.098	40.504
10.151	41.449
11.018	37.502
11.027	42.227
11.029	43.258
11.070	38.104
11.072	38.963
11.078	41.712
11.125	39.737
11.127	40.510
11.128	41.283
12.005	42.405
12.007	43.006
12.049	38.367
12.054	40.773
12.112	44.124
12.157	40.945
12.158	41.718
13.037	43.785
13.039	44.473
13.081	39.834
13.083	40.951
13.087	43.098
13.136	41.638
14.007	39.753
14.009	40.784
14.062	41.557
14.063	41.987
14.066	43.533
14.067	43.963
14.172	44.909
15.043	43.195
15.044	43.883
15.046	44.570
15.101	46.289
15.102	47.062
15.141	40.962];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};     label.tL_m = {'age', 'total length', 'male'};  
temp.tL_m = C2K(17);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BracGill2007';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 50 * weights.tL_f;
weights.tL_m = 50 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = ''; label.psd.k = 'maintenance ratio';

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
D2 = 'temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g = 0.00389*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Ovoviviparous. Depth around 50-149m, but have been found deeper than 700m.';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6ZFN4'; % Cat of Life
metaData.links.id_ITIS = '160628'; % ITIS
metaData.links.id_EoL = '46560203'; % Ency of Life
metaData.links.id_Wiki = 'Squalus_megalops'; % Wikipedia
metaData.links.id_ADW = 'Squalus_megalops'; % ADW
metaData.links.id_Taxo = '41843'; % Taxonomicon
metaData.links.id_WoRMS = '105925'; % WoRMS
metaData.links.id_fishbase = 'Squalus-megalops'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Squalus_megalops}}';  
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
bibkey = 'BracGill2007'; type = 'Article'; bib = [ ... 
'author = {J. Mat\''{i}as Braccini and Bronwyn M. Gillanders and Terence I. Walker and Javier Tovar-Avila}, ' ...
'year = {2007}, ' ...
'title  = {Comparison of deterministic growth models fitted to length-at-age data of the piked spurdog (\emph{Squalus megalops}) in south-eastern {A}ustralia}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {58}, ' ...
'pages = {24-33}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fishbase.org/summary/Squalus-megalops.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

