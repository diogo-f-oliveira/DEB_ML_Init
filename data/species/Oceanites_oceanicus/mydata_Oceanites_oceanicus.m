function [data, auxData, metaData, txtData, weights] = mydata_Oceanites_oceanicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Oceanitidae';
metaData.species    = 'Oceanites_oceanicus'; 
metaData.species_en = 'Wilson''s storm petrel'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC', 'ME'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2018 09 14];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 44;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'EoL';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '39 to 48 d';
data.tx = 43; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'QuilPete2000';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 129; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'QuilPete2000';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 30*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'guess';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'guess based on other storm petrel species';

data.Wwb = 6.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'QuilPete2000';
data.Wwi = 58; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'QuilPete2000';
  comment.Wwi = 'mean asymptotic mass of fledling, see D2';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'QuilPete2000';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.954	6.961
0.955	7.870
0.956	9.233
2.022	7.404
2.022	8.465
2.024	10.586
2.025	11.647
2.911	8.153
2.970	6.940
2.971	8.758
2.972	10.274
2.973	11.940
2.974	12.546
2.975	13.607
3.924	14.809
3.977	6.627
3.985	16.172
4.038	8.142
4.039	9.960
4.042	13.748
4.042	14.354
4.045	17.839
4.046	18.596
4.046	19.202
4.046	19.657
4.099	11.171
4.100	12.080
4.101	12.838
4.932	14.648
4.936	19.648
4.992	16.162
4.997	22.677
5.105	7.525
5.105	8.131
5.106	9.040
5.108	11.616
5.108	12.222
5.111	16.616
5.112	17.070
5.112	17.525
5.112	18.131
6.057	12.818
6.059	14.788
6.059	15.848
6.060	16.606
6.061	17.667
6.061	17.818
6.063	20.242
6.064	21.758
6.064	22.212
6.065	22.970
6.065	23.424
6.066	24.182
6.066	24.939
6.068	26.909
6.952	19.779
6.952	20.839
6.953	21.749
6.953	22.052
6.954	23.112
7.008	15.990
7.009	16.900
7.009	17.506
7.010	18.263
7.015	25.081
7.065	12.960
8.015	14.465
8.017	17.950
8.021	22.041
8.021	22.950
8.022	23.859
8.022	24.617
8.023	25.374
8.024	27.192
8.026	28.859
8.138	20.524
8.197	19.766
8.908	20.214
8.913	26.274
8.915	28.698
8.915	29.153
8.916	30.214
8.917	31.123
8.918	32.486
8.966	17.486
8.969	22.031
8.970	22.789
8.971	24.607
8.972	25.365
9.028	21.425
9.081	13.394
9.922	27.325
9.923	28.688
9.975	18.991
9.976	20.051
9.977	21.415
9.983	30.203
9.985	32.324
9.988	37.324
10.037	22.930
10.038	24.142
10.039	25.354
10.929	27.163
10.930	28.072
10.931	29.284
10.983	18.829
10.992	31.102
10.992	31.708
10.993	32.920
10.995	35.950
11.044	22.010
11.045	22.919
11.046	23.828
11.047	25.192
11.056	37.768
11.872	19.123
11.934	22.456
11.941	32.607
11.995	24.425
12.002	34.576
12.003	35.485
12.004	36.546
12.054	25.030
12.059	30.939
12.059	31.697
12.066	40.788
12.117	28.969
12.117	29.878
12.174	27.150
12.175	27.908
12.183	38.968
12.891	33.961
13.001	22.142
13.005	27.142
13.005	28.051
13.006	29.112
13.008	31.536
13.008	32.142
13.010	35.021
13.011	35.627
13.012	37.142
13.013	38.051
13.013	38.960
13.016	43.202
13.067	31.081
13.181	24.867
13.951	24.405
13.952	26.072
13.953	27.435
13.960	36.072
14.014	28.798
14.076	33.343
14.077	34.252
14.080	38.040
14.081	39.101
14.083	41.828
14.084	43.798
14.084	44.252
14.085	45.464
14.855	44.244
14.965	32.274
14.967	35.304
14.968	37.122
15.030	40.758
15.031	42.121
15.034	45.000
15.035	47.273
15.038	51.364
15.079	26.060
15.080	28.030
15.083	31.666
15.802	41.811
15.802	42.265
15.859	38.780
15.863	44.386
15.909	26.355
15.910	27.416
15.911	28.325
15.920	40.597
16.030	29.384
16.032	31.808
16.034	35.142
16.042	45.899
16.042	46.354
16.046	50.899
16.991	45.890
16.992	47.708
16.993	49.071
16.997	54.071
17.035	24.980
17.035	26.041
17.041	33.919
17.042	35.131
17.043	35.889
17.044	37.707
17.046	39.828
17.046	40.586
17.047	41.647
17.047	42.253
17.048	43.465
17.049	44.525
17.098	30.737
17.928	30.729
17.929	32.092
17.930	33.153
17.931	34.062
17.938	43.759
17.939	45.122
17.940	46.941
17.944	51.486
17.945	54.062
17.993	38.304
17.994	39.364
17.994	39.970
17.995	40.728
17.995	41.334
18.001	48.607
18.894	53.598
18.897	58.295
18.898	58.901
18.944	41.324
18.944	41.930
18.948	46.779
19.005	44.051
19.006	45.415
19.055	31.020
19.069	50.717
19.765	29.649
19.837	46.164
19.837	47.073
19.838	47.376
19.894	42.678
19.894	43.284
19.894	43.739
19.895	44.345
19.895	44.648
19.897	47.981
19.947	34.648
20.010	40.253
20.020	52.829
20.022	55.859
20.067	36.465
20.076	49.343
20.077	50.252
20.144	60.100
20.893	31.305
20.908	51.759
20.908	52.214
20.910	53.729
20.960	41.607
20.964	47.062
20.964	47.365
20.965	48.122
20.966	49.183
20.966	49.789
20.967	50.546
21.020	42.667
21.032	59.485
21.132	33.424
21.913	47.355
21.917	53.264
21.966	39.627
21.969	43.567
21.970	44.779
21.971	45.233
21.971	45.688
21.976	52.809
21.977	54.173
21.982	60.688
22.025	38.718
22.032	48.869
22.034	50.990
22.035	51.899
22.086	41.444
22.866	53.103
22.925	53.708
22.928	57.648
22.929	58.405
22.929	59.011
22.973	38.253
22.985	54.617
23.037	44.313
23.038	45.525
23.039	46.435
23.039	47.041
23.043	51.889
23.095	41.889
23.940	62.789
23.982	39.304
23.982	39.910
23.985	42.789
23.987	46.728
23.988	47.789
23.993	54.910
23.994	55.819
23.995	56.425
24.000	64.304
24.057	61.121
24.108	49.757
24.109	50.818
24.110	51.575
24.110	52.484
24.821	51.417
24.928	36.415
24.944	57.930
24.950	65.203
24.988	37.172
24.990	40.203
24.991	40.657
24.992	42.172
24.996	47.324
24.997	48.384
25.048	38.081
25.053	44.899
25.055	46.717
25.059	52.626
25.060	53.990
25.060	54.596
25.061	54.899
25.070	67.778
25.838	64.437
25.939	40.345
25.941	43.072
25.942	43.829
25.943	45.042
25.944	46.405
25.944	47.466
25.948	52.163
25.949	53.072
25.949	53.526
25.951	56.254
25.952	57.011
26.823	32.457
26.895	50.032
26.898	53.668
26.898	54.729
26.945	37.910
26.954	49.728
26.958	55.183
26.959	56.092
26.962	60.486
27.009	43.667
27.020	58.516
27.072	48.212
27.850	58.204
27.892	35.779
27.893	36.992
27.901	47.295
27.901	47.901
27.902	48.658
27.906	54.567
27.907	55.173
27.907	55.628
27.907	55.931
27.908	56.537
27.908	56.840
27.908	57.294
27.910	60.173
27.911	60.779
27.912	61.840
28.012	37.748
28.013	38.809
28.015	40.930
28.023	51.536
28.914	54.406
28.916	56.678
28.918	60.315
28.923	66.072
28.926	70.769
28.972	52.132
28.976	57.738
28.977	59.556
29.018	34.707
29.026	46.071
29.027	46.829
29.030	50.465
29.030	51.223
29.080	38.192
29.926	59.547
29.928	62.729
29.929	63.335
29.929	64.244
29.932	67.880
29.934	71.062
29.983	56.970
29.984	58.183
30.035	47.576
30.037	49.091
30.038	50.909
30.041	54.546
30.094	46.666
30.922	44.385
30.923	45.749
30.985	48.475
30.986	49.688
30.987	51.809
30.992	58.778
30.994	60.597
30.994	61.354
30.996	63.324
31.002	72.112
31.037	39.081
31.039	42.111
31.048	53.929
31.049	54.535
31.050	55.899
31.117	67.262
31.235	66.655
31.887	65.588
31.925	37.405
31.928	41.193
31.929	42.405
31.935	50.133
31.935	50.890
31.936	52.102
31.939	55.890
31.940	56.951
31.940	57.557
31.942	60.739
31.943	61.648
31.943	61.951
31.944	63.163
31.953	74.526
31.992	48.162
32.009	70.889
32.885	52.547
32.887	54.820
32.933	37.850
32.939	46.032
32.943	50.577
32.949	58.304
32.949	59.062
32.954	65.425
32.996	41.789
33.010	61.637
33.134	69.060
33.834	53.144
33.834	53.447
33.897	58.143
33.898	58.901
33.898	59.507
33.905	69.204
33.907	70.870
33.944	41.627
33.946	43.749
33.946	44.203
33.947	45.264
33.952	52.082
33.959	61.173
33.960	63.597
34.000	36.930
34.020	64.505
34.069	49.808
34.897	47.678
34.898	48.436
34.898	49.194
34.901	53.284
34.902	54.497
34.903	55.557
34.947	34.951
34.963	56.466
34.966	60.405
34.966	61.011
34.968	62.981
35.024	59.041
35.030	66.313
35.031	67.526
35.068	37.677
35.132	44.949
35.910	54.789
35.960	41.910
35.962	44.183
35.965	49.031
35.966	50.092
35.967	51.455
35.968	52.213
35.969	53.577
35.971	56.758
35.972	57.516
35.973	59.940
35.974	61.152
35.977	64.183
35.982	71.607
36.014	34.485
36.023	46.606
36.904	35.082
36.909	41.749
36.913	47.204
36.915	50.082
36.916	51.294
36.916	52.355
36.918	54.476
36.926	64.779
36.928	67.203
36.929	69.022
36.981	59.324
37.039	57.354
37.874	64.163
37.922	49.011
37.924	52.193
37.973	37.647
37.975	40.526
37.985	53.859
37.986	55.071
37.987	56.284
37.988	58.102
37.996	68.405
38.048	59.616
38.054	67.647
38.804	38.851
38.871	49.153
38.872	50.517
38.876	55.820
38.877	57.184
38.877	57.941
38.920	35.214
38.929	48.395
38.934	54.759
38.937	58.547
39.003	67.788
39.006	71.273
39.052	53.849
39.059	63.242
39.945	58.688
39.993	44.142
39.998	49.748
39.998	50.506
40.004	57.930
40.005	59.293
40.009	65.203
40.012	68.990
40.060	54.444
40.061	55.202
40.942	44.739
40.948	51.860
40.949	53.981
40.950	54.738
40.951	56.102
40.951	56.860
40.953	59.132
40.997	38.829
41.005	48.526
41.006	50.344
41.012	58.071
41.013	59.889
41.014	61.859
41.019	68.526
41.077	66.707
42.015	52.152
42.017	55.182
42.018	55.788
42.019	56.697
42.020	59.273
42.023	63.061
42.024	63.667
42.028	69.122
42.086	68.363
42.088	70.939
42.128	43.817
42.128	44.727];
n=size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1);data.tW(i,1)=data.tW(i-1,1)+1e-8;end;end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'QuilPete2000';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Mean adult mass 38.4 g (QuilPete2000) is smaller than asymptotic mass of fledling';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '48C3F'; % Cat of Life
metaData.links.id_ITIS = '174650'; % ITIS
metaData.links.id_EoL = '45509003'; % Ency of Life
metaData.links.id_Wiki = 'Oceanites_oceanicus'; % Wikipedia
metaData.links.id_ADW = 'Oceanites_oceanicus'; % ADW
metaData.links.id_Taxo = '51605'; % Taxonomicon
metaData.links.id_WoRMS = '137190'; % WoRMS
metaData.links.id_avibase = 'D295D249BDB7E046'; % avibase
metaData.links.id_birdlife = 'wilsons-storm-petrel-oceanites-oceanicus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Oceanites_oceanicus}}';
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
bibkey = 'QuilPete2000'; type = 'Article'; bib = [ ... 
'author = {P. Quillfeldt and H.-U. Peter}, ' ... 
'year = {2000}, ' ...
'title = {Provisioning and growth in chicks of Wilson''s storm-petrels (\emph{Oceanites oceanicus}) on {K}ing {G}eorge {I}sland, {S}outh {S}hetland {I}slands}, ' ...
'journal = {Polar Biol}, ' ...
'volume = {23}, ' ...
'pages = {817-824}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1048563/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

