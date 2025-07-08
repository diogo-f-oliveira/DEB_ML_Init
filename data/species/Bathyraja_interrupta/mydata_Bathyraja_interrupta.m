function [data, auxData, metaData, txtData, weights] = mydata_Bathyraja_interrupta

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Arhynchobatidae';
metaData.species    = 'Bathyraja_interrupta'; 
metaData.species_en = 'Sandpaper skate'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};                             
metaData.date_subm = [2019 01 12];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 12]; 

%% set data
% zero-variate data;
data.tp = 12*365;  units.tp = 'd';    label.tp = 'time since birth at puberty';         bibkey.tp = 'AinsEber2014';
  temp.tp = C2K(2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on interpolation of Lp in tL data';
data.am = 20*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'AinsEber2014';   
  temp.am = C2K(2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 20;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'AinsEber2011';
data.Lp  = 70;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'AinsEber2011';
  comment.Lp = '69 cm for males, 71 cm for females';
data.Li  = 86;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwi = 3.7e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'besed on 0.00447*Li^3.06, see F1';

data.Ri  = 6/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6 tot 9 pups per litter';

% uni-variate data at f
data.tL = [ ... % time since birth (yr), total length (cm)
0.006	18.333
0.006	19.445
0.007	20.370
0.037	15.741
0.039	21.482
0.039	21.852
0.040	25.001
0.041	25.927
0.041	26.482
0.041	27.778
0.072	22.408
0.072	22.779
0.072	23.334
0.105	23.890
0.944	20.199
0.977	21.311
1.009	18.163
1.010	22.237
1.010	22.608
1.010	22.978
1.010	22.978
1.010	23.533
1.011	24.459
1.011	24.645
1.011	25.015
1.011	25.756
1.011	26.311
1.011	26.867
1.012	27.608
1.012	29.274
1.043	24.275
1.044	27.423
1.044	27.978
1.044	28.349
1.046	34.645
1.915	22.065
1.949	25.955
1.949	27.066
1.951	31.881
1.951	32.621
1.951	33.362
1.952	34.103
1.982	27.622
2.014	28.363
2.015	28.919
2.015	29.474
2.015	30.030
2.015	30.585
2.015	30.956
2.045	23.549
2.049	35.586
2.953	29.118
2.955	38.192
2.984	27.452
2.985	30.970
2.987	34.489
3.018	32.822
3.019	33.193
3.019	33.563
3.019	33.934
3.019	34.860
3.019	35.230
3.020	36.341
3.050	31.897
3.051	32.453
3.956	32.651
3.958	37.651
3.958	38.022
3.958	38.577
3.959	39.688
3.959	40.614
3.988	30.985
3.988	31.726
3.990	36.170
3.990	36.726
3.992	43.022
3.993	45.244
4.022	35.245
4.085	29.135
4.959	32.666
4.959	34.518
4.960	36.370
4.960	36.740
4.960	37.296
4.961	37.851
4.961	38.222
4.961	39.148
4.961	39.333
4.961	39.518
4.963	44.333
4.994	41.555
4.995	42.852
4.995	43.778
4.995	43.963
5.026	40.815
5.933	45.643
5.965	43.792
5.996	39.163
5.997	41.570
5.998	46.941
5.999	47.496
5.999	47.496
5.999	48.793
6.001	53.978
6.002	56.941
6.935	42.881
6.967	40.844
6.968	45.103
6.968	46.400
6.969	47.511
6.969	48.437
6.969	48.992
6.970	49.918
6.970	50.474
6.971	53.437
6.971	55.474
6.974	63.622
6.977	71.214
7.003	52.511
7.003	52.882
7.031	38.623
7.067	51.401
7.067	52.512
7.905	41.969
7.908	51.599
7.908	52.154
7.911	59.747
7.940	50.303
7.940	51.229
7.941	52.710
7.941	52.895
7.941	54.192
7.944	63.081
7.945	64.377
7.976	61.229
8.003	45.304
8.004	47.526
8.975	51.985
8.976	54.392
8.976	54.948
8.977	55.503
8.977	56.059
8.977	57.911
8.978	59.392
8.978	59.948
8.978	60.503
8.978	60.874
8.978	61.244
8.979	62.726
9.006	44.948
9.010	59.208
9.045	66.986
9.047	74.393
9.944	48.110
9.980	56.629
9.980	58.666
9.980	58.666
9.980	59.407
9.981	59.963
9.981	60.889
9.982	63.111
9.982	64.778
9.983	65.889
9.983	66.629
9.983	67.555
9.983	68.296
9.983	68.296
9.984	69.222
9.984	70.889
9.985	74.222
9.986	75.333
10.011	53.852
10.044	55.334
10.950	56.459
10.951	60.162
10.956	74.792
10.956	76.088
10.981	53.126
10.984	63.126
10.985	64.052
10.985	65.348
10.985	66.459
10.986	67.385
10.986	67.941
10.986	68.311
10.986	69.422
10.987	71.274
10.989	77.200
11.019	70.163
11.955	65.362
11.955	66.103
11.956	66.473
11.989	70.178
11.989	70.363
11.989	70.733
11.989	71.104
12.018	60.178
12.019	61.660
12.019	63.882
12.021	68.326
12.021	68.882
12.022	72.030
12.023	73.511
12.023	75.734
12.024	78.697
12.024	79.252
12.024	79.437
12.025	80.178
12.025	81.845
12.056	76.845
12.056	78.142
12.113	53.698
12.929	75.006
12.929	75.377
12.929	75.747
12.929	75.747
12.929	76.673
12.929	76.858
12.961	73.896
12.963	80.933
12.992	72.044
12.994	77.970
13.022	62.600
13.022	63.156
13.022	63.526
13.022	64.637
13.023	65.563
13.023	67.600
13.024	70.008
13.027	79.082
13.027	79.452
13.858	49.094
13.895	64.650
13.928	66.688
13.931	75.206
13.931	75.577
13.931	75.947
13.958	57.059
13.962	71.133
13.962	71.503
13.962	71.688
13.963	72.244
13.963	73.355
13.963	73.911
13.964	77.244
13.965	78.540
13.994	70.393
13.997	79.652
14.026	67.615
14.967	77.444
14.967	78.925
14.994	61.889
14.995	64.111
14.995	64.852
14.996	66.889
14.998	74.111
14.999	78.000
15.000	79.296
15.029	68.556
15.029	69.667
15.029	70.223
15.030	72.630
15.030	73.186
15.031	74.482
15.031	74.852
15.031	76.149
15.031	76.519
15.032	80.038
15.033	80.963
15.033	82.445
15.034	86.149
15.062	71.334
15.062	71.890
15.904	75.791
15.905	76.717
15.905	77.273
15.905	78.569
15.905	79.310
15.935	69.866
15.935	71.347
15.935	72.273
15.936	72.829
15.936	73.569
15.936	74.495
15.936	74.866
15.965	62.459
15.966	66.903
15.967	69.125
15.970	80.051
16.003	81.163
16.003	82.089
16.907	76.362
16.938	70.992
16.938	72.844
16.939	73.955
16.939	74.325
16.939	75.066
16.939	75.807
16.940	77.103
16.941	80.251
16.970	72.103
17.001	67.104
17.941	73.784
17.942	75.081
17.942	76.562
17.971	66.933
17.972	69.711
17.973	71.377
17.973	71.933
17.976	81.748
18.008	79.156
18.976	73.244
19.011	81.393
19.075	78.616
19.075	79.171
19.946	73.999
19.979	75.852
21.081	81.609];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(2); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AinsEber2014';
comment.tL = 'pooled sexes';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.00447*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '5WDZ9'; % Cat of Life
metaData.links.id_ITIS = '160937'; % ITIS
metaData.links.id_EoL = '46560763'; % Ency of Life
metaData.links.id_Wiki = 'Bathyraja'; % Wikipedia
metaData.links.id_ADW = 'Bathyraja_interrupta'; % ADW
metaData.links.id_Taxo = '163712'; % Taxonomicon
metaData.links.id_WoRMS = '271515'; % WoRMS
metaData.links.id_fishbase = 'Bathyraja-interrupta'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bathyraja}}'; 
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
bibkey = 'AinsEber2014'; type = 'Article'; bib = [ ... 
'author = {Shaara M. Ainsley and David A. Ebert and Lisa J. Natanson and Gregor M. Cailliet}, ' ...
'year = {2014}, ' ...
'title  = {A comparison of age and growth of the {B}ering skate, \emph{Bathyraja interrupta} ({G}ill and {T}ownsend,1897), from two {A}laskan large marine ecosystems}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {154}, ' ...
'pages = {17-25}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AinsEber2011'; type = 'Article'; bib = [ ... 
'author = {Shaara M. Ainsley and David A. Ebert and Gregor M. Cailliet}, ' ...
'year = {2011}, ' ...
'title  = {A comparison of reproductive parameters of the {B}ering skate, \emph{Bathyraja interrupta}, from two {A}laskan large marine ecosystems}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {62}, ' ...
'pages = {557-566}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Bathyraja-interrupta.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

